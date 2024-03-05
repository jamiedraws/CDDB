<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<!--<script type="module" src="/js/1.0000/app.js"></script>-->
<script defer src="/js/1.0000/app.es5.js"></script>

<%
    var isIndex = DtmContext.PageCode == "Index";
    var isOrderPage = DtmContext.PageCode == "OrderNow"; 
    var isReferPage = DtmContext.PageCode == "ReferAFriend";
    var isConfirmation = DtmContext.PageCode == "Confirmation";
    var isLandingPage = DtmContext.Page.IsStartPageType;

    var pagesRequireAppExpando = new string[] { "OrderNow", "ReferAFriend", "Confirmation" };
    var requiresAppExpando = pagesRequireAppExpando.Contains(DtmContext.PageCode);

    if (requiresAppExpando)
    {
        %>
        <script defer src="/js/app.expando.js"></script>
        <%
    }

    if (isOrderPage)
    {
        %>
        <script defer src="/js/dtm.js"></script>
        <script defer src="/js/express-checkout.js"></script>

        <% 
            var lightboxScript = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.Lightbox.Script"];
            var lightboxStylesheet = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.Lightbox.Stylesheet"];

            if (!string.IsNullOrEmpty(lightboxScript))
            {
                %>
                <script defer src="<%= lightboxScript %>"></script>
                <%
            }

            if (!string.IsNullOrEmpty(lightboxStylesheet))
            {
                %>
                <link rel="stylesheet" href="<%= lightboxStylesheet %>"  media="print" onload="this.media='all'; this.onload=null;"/>
                <%
            }
        %>
        <%
    }

    if (isReferPage || isConfirmation)
    {
        %>
        <script src="/js/refer-friend.js" defer></script>
        <%
    }
%>