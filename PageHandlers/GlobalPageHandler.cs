using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models;
using Dtm.Framework.Models.Ecommerce;
using Dtm.Framework.Services.DtmApi;
using CDDB.Navigation;

namespace CDDB.PageHandlers
{
    public class GlobalPageHandler : PageHandler
    {

        #region " Overrides... "
        //public override void OnProcessCustomPromoCode(PromoCodeRule promoCodeAction, SafeDictionary postData)
        //{
        //    if (promoCodeAction.ProductCode == "FREE" && DtmContext.OfferCode == "CDDV")
        //    {
        //        OrderManager.SetProductQuantity("FREE", 1);
        //    }
        //}
        public override void BeginRequest(HttpRequestBase request, HttpResponseBase response, ref string pageCode)
        {
            ViewData["Sitemap"] = new Sitemap().SitemapList;
        }

        public override void PostValidate(ModelStateDictionary modelState)
        {
            if (DtmContext.Page.IsStartPageType)
            {
                var oosProducts = new List<string>() { "R", "V", "R2", "V2", "R3", "V3" };
                var hasOOSProduct = DtmContext.ShoppingCart.Any(p => oosProducts.Contains(p.ProductCode));

                if (hasOOSProduct)
                {
                    modelState.AddModelError("Form", "Sorry, Wild Violet and Rose Quartz are sold out. Please select another color.");
                }

                var promoCode = Form["param_PromoCode"] ?? string.Empty;
                ViewData["param_PromoCode"] = promoCode;

                var bundleSelected = Form["bundle"] ?? "";
                var promoCodes = new List<string>() { "FREESHIMMER" };
                var anythingTotal = ActionItems.Where(data => data.Key.EndsWith("3") && !promoCodes.Contains(data.Key)).Sum(d => d.Value);
                var liveTotal = ActionItems.Where(data => data.Key.EndsWith("2") && !promoCodes.Contains(data.Key)).Sum(d => d.Value);
                var glowTotal = ActionItems.Where(data => !data.Key.EndsWith("3") && !data.Key.EndsWith("2") && !promoCodes.Contains(data.Key)).Sum(d => d.Value);
                var terms = Form["Terms"] ?? string.Empty;


                if (bundleSelected == "anything" && anythingTotal != 3)
                {
                    modelState.AddModelError("Form", "Please ensure all 3 products are selected.");
                }
                else if (bundleSelected == "live" && liveTotal != 2)
                {
                    modelState.AddModelError("Form", "Please ensure that 2 products are selected.");
                }
                else
                {
                    if (bundleSelected == "glow" && glowTotal == 0)
                    {
                        modelState.AddModelError("Form", "Please ensure a product is selected.");
                    }
                }

                if (DtmContext.Version == 1 && String.IsNullOrEmpty(terms))
                {
                    modelState.AddModelError("Terms", "Terms is required.");
                }

                ViewData["colorSelectedGlow"] = Form["colorSelectedGlow"] ?? "0";
                ViewData["liveColorSelected1"] = Form["liveColorSelected1"] ?? "0";
                ViewData["liveColorSelected2"] = Form["liveColorSelected2"] ?? "0";
                ViewData["anythingColorSelected1"] = Form["anythingColorSelected1"] ?? "0";
                ViewData["anythingColorSelected2"] = Form["anythingColorSelected2"] ?? "0";
                ViewData["anythingColorSelected3"] = Form["anythingColorSelected3"] ?? "0";
                ViewData["bundle"] = Form["bundle"] ?? string.Empty;
            }
        }
        public override bool OnValidatePromoCodeAction(PromoCodeRule promoCodeAction)
        {
            if (promoCodeAction.PromoCode == "FREESHIMMER")
            {
                var approvedProducts = new List<string>() { "S3", "R3", "V3", "T3" };
                var hasApprovedProduct = DtmContext.ShoppingCart.Any(p => approvedProducts.Contains(p.ProductCode));
                return hasApprovedProduct;
            }
            return true;
        }

        public override void PostProcessPageActions()
        {
            var promoProducts = new List<string>() { "S3", "R3", "V3", "T3" };
            var singleProducts = new List<string>() { "T", "S"};
            var doubleProducts = new List<string>() { "T2", "S2" };

            if (DtmContext.Page.IsStartPageType)
            {
                if (DtmContext.ShoppingCart.Where(sc => promoProducts.Contains(sc.ProductCode)).Sum(sc => sc.Quantity) == 3)
                {
                    OrderManager.SetProductQuantity("FREE", 1);
                    Order.AddOrderCode("FREESHIMMER", "PROMOCODE");
                }
                else if (DtmContext.ShoppingCart.Where(sc => singleProducts.Contains(sc.ProductCode)).Any())
                {
                    OrderManager.SetProductQuantity("FREE1", 1);

                }
                else if (DtmContext.ShoppingCart.Where(sc => doubleProducts.Contains(sc.ProductCode)).Any())
                {
                    OrderManager.SetProductQuantity("FREE2", 1);

                }
                else
                {
                    OrderManager.SetProductQuantity("FREE", 0);
                    OrderManager.SetProductQuantity("FREE1", 0);
                    OrderManager.SetProductQuantity("FREE2", 0);
                }
            }
          

        }

        #endregion
    }
}
