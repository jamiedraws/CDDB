using Dtm.Framework.Base.Configuration;
using Dtm.Framework.Base.Controllers;
using Dtm.Framework.ClientSites;
using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.ClientSites.Web.ModelValidation;
using Dtm.Framework.Models.Ecommerce;
using Dtm.Framework.Models.Ecommerce.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Xsl;

namespace CDDB.Controllers
{
    public class ReferAFriendController : DtmContextController
    {
        private readonly OrderRepository _orderRepository;
        private readonly AdditionalLeadsRepository _additionalLeadsRepository;

        public ReferAFriendController()
        {
            _orderRepository = new OrderRepository(Context);
            _additionalLeadsRepository = new AdditionalLeadsRepository(Context); 
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult SendReferral(FormCollection formCollection)
        {
            bool success = false;
            string message = "A server error has occurred. Please try submitting again.";

            try
            {
                var emails = formCollection["Emails"];
                
                if (!string.IsNullOrWhiteSpace(emails))
                {
                    var emailList = emails.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);

                    int orderId;
                    Order order;
                    var oid = formCollection["oid"];
                    var visitorSessionId = DtmContext.VisitorSessionId;
                    var fromDomain = DtmContext.CampaignDomains
                        .Where(d => d.DomainId == DtmContext.DomainId)
                        .Select(d => d.Domain)
                        .FirstOrDefault();

                    if (int.TryParse(oid, out orderId))
                    {
                        order = this._orderRepository.GetByOrderId(orderId);

                        if (order == null)
                        {
                            message = "We could not locate your order number. Please refer to your email confirmation and try again.";
                        }

                        visitorSessionId = order.VisitorSessionId;
                    }
                    else
                    {
                        message = "We could not locate your order number. Please refer to your email confirmation and try again.";
                        return Json(new { Success = false, Message = message });
                    }

                    foreach (var email in emailList)
                    {
                        var lead = new VersionLead
                        {
                            VersionLeadId = Guid.NewGuid(),
                            FirstName = "NA",
                            LastName = "NA",
                            Email = email,
                            CampaignOfferVersionID = DtmContext.VersionId,
                            VisitorSessionId = visitorSessionId,
                            ReferredTo = "https://www.batistehaircolor.com",
                            FromAddress = "noreply@" + fromDomain,
                            AddDate = DateTime.Now,
                            AddUser = FrameworkCommon.APPLICATION_NAME,
                            ChangeDate = DateTime.Now,
                            ChangeUser = FrameworkCommon.APPLICATION_NAME
                        };
                        var validator = new SiteLeadValidator();
                        validator.IsValid = validator.Validate(lead).IsValid;

                        if (validator.IsValid)
                        {

                            this._additionalLeadsRepository.Add(lead);
                            this._additionalLeadsRepository.Save();
                            SendMail(lead, string.Format("{0} thought you maybe interested in the Batiste 1-Day Express Hair Color!", order.BillingFirstName ?? string.Empty));
                            ViewData["Result"] = LabelsManager.Labels["SeminarEmailSent"];
                            success = true;
                            message = string.Format("Thank you! An email has been sent to {0}.", email);
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                SiteExceptionHandler.HandleException(ex);
                success = false;
            }
            

            return Json(new { Success = success, Message = message });
        }

        private void SendMail(VersionLead lead, string subject)
        {
            bool emailSent;
            var xsl = new XslCompiledTransform();

            Guid emailTemplateId =
                Guid.TryParse(SettingsManager.ContextSettings["AdditionLead.EmailTemplateId"], out emailTemplateId)
                ? emailTemplateId : Guid.Empty;
            if (emailTemplateId != Guid.Empty)
            {
                var emailTemplate = Context.EmailTemplates
                 .Where(et => et.EmailTemplateId == emailTemplateId)
                 .Select(et => et.EmailBody)
                 .FirstOrDefault();
                if (emailTemplate != null)
                {
                    xsl.Load(new XmlTextReader(new StringReader(emailTemplate)));
                }
            }

            var message = new MailMessage { From = new MailAddress(lead.FromAddress) };
            message.To.Add(new MailAddress(lead.Email));
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            message.Subject = subject;
            message.Body = GetFormattedBody(CreateXml(lead), xsl);

            var client = new SmtpClient { Host = ConfigurationManager.AppSettings["SMTPServer"] };
            try
            {
                client.Send(message);
                emailSent = true;
            }
            catch (SmtpFailedRecipientException ex)
            {
                SiteExceptionHandler.HandleException(ex);
                emailSent = false;
            }

            if (emailSent)
            {
                lead.EmailSentDate = DateTime.Now;
                this._additionalLeadsRepository.Save();
            }
        }

        private XDocument CreateXml(VersionLead lead)
        {
            var referredTo = lead.ReferredTo;
            var referUrl = string.Format("<a href='{0}'>Click Here </a>", referredTo);

            var doc = new XDocument(new XElement("Order"));
            return doc;
        }

        private string GetFormattedBody(XNode xml, XslCompiledTransform xsl)
        {
            var sb = new StringBuilder();
            var writer = XmlWriter.Create(sb, xsl.OutputSettings);
            if (writer == null)
            {
                throw new Exception("Failed to create writer. \n" + xml);
            }

            xsl.Transform(xml.CreateReader(), writer);
            writer.Close();
            return sb.ToString();
        }

    }
}