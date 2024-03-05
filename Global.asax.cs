using System.Web.Routing;
using System.Web.Mvc;
using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models;

namespace CDDB
{
    public class MvcApplication : ClientSiteApplication
    {
        protected override void OnAppStart()
        {

            DtmContext.PromoCodeRules.Add(new Dtm.Framework.Models.PromoCodeRule("FREESHIMMER", Dtm.Framework.Models.PromoCodeRuleType.Add, "FREE", 1));
            base.OnAppStart();
        }
        protected override void ConfigureAdditionalRoutes(RouteCollection routes)
        {
            routes.MapRoute("ReferAFriend", "Refer", new { controller = "ReferAFriend", action = "SendReferral" });

            base.ConfigureAdditionalRoutes(routes);
        }
    }
}