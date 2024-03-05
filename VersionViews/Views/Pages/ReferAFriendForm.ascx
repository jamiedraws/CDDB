<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<% 
    string orderId = DtmContext.OrderId.ToString();
    if(Request.QueryString.AllKeys.Contains("oid"))
    {
        orderId = Request.QueryString["oid"];
    }

%>
<form id="leadForm" class="form form--lead message @print-only-hide">
    <fieldset class="form__fieldset">
        <h2 class="form__title">Tell your friends about us!</h2>
        <div class="form__desc">Send this amazing offer to your friends and family.</div>
        <div class="form__frame">
            <div class="form__field-label form__field-label-button">
                <label for="LeadEmails" class="message__label">
                    <span class="form__error">* </span>Email
                </label>
                <input type="email" name="LeadEmails" id="LeadEmails" placeholder="Email" data-required="true" required class="form__field dtm__restyle">
                <input type="hidden" name="LeadOrderId" id="LeadOrderId" value="<%=orderId %>" />
                <button type="button" class="button button--color-extra" id="referSubmit">
                    <span>Refer My Friend</span>
                </button>
                <span class="message__group" role="alert">
                    <span class="message__invalid">
                        Please enter a valid email address.
                    </span>
                </span>
            </div>
        </div>
    </fieldset>
</form>