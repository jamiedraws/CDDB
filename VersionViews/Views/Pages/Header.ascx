<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDB.Navigation" %>
<%@ Import Namespace="CDDB.Models" %>
<% 
    var productName = SettingsManager.ContextSettings["Label.ProductName"];
    var isStartPage = DtmContext.Page.IsStartPageType;
    var isIndex = DtmContext.PageCode == "Index";

    var skipLink = "#main";

    if (DtmContext.Page.PageType.Equals("upsell", StringComparison.InvariantCultureIgnoreCase))
    {
        skipLink = "#upsellTxt";
    } else if (!DtmContext.Page.IsStartPageType)
    {
        skipLink = "#content_top";
    }

    var sitemap = ViewData["Sitemap"] as NavigationList ?? new Sitemap().SitemapList;

    Func<string> renderPromoCode = (() =>
    {
        return @"
        <div class=""banner banner--promo-code"">
            <strong class=""banner__promo"">FREE Stardust Shimmer With 3 Bottle Purchase!</strong> Use Code: <strong class=""banner__code"">FREESHIMMER</strong>
        </div>
        ";
    });
%>

<% if (isIndex) { %>
<div data-nav-fixate="pixel"></div>
<header class="view header header--is-fixed section">
    <%= renderPromoCode() %>

    <div id="nav" class="view nav nav--is-fixed section">
        <span class="skip-link">
            <a href="<%= skipLink %>" class="skip-link__button" id="skip-link"><span>Skip To Main Content?</span></a>
        </span>
 
	    <div class="view__in nav__in">
            <div class="nav__group">
                <button class="nav__label" aria-label="Toggle Menu">
                    <span></span>
                </button>

                <div class="nav__underlay nav__underlay--for-drawer" role="presentation"></div>

                <nav aria-label="Website page links" class="nav__pane">
                    <div class="nav__group">
                        <div class="nav__list nav__tier-first">
                            <div class="nav__logo header header--logo-title">
                                <% var home = sitemap.GetItemById("home"); %>
                                <a href="<%= home.Page %>" class="header__logo contain contain--logo">
                                    <svg aria-label="Batiste"><use href="#icon-logo"></use></svg>
                                </a>
                                <div class="header__title">
                                    1-Day Express Hair Color
                                </div>
                            </div>
                            <%
                                var links = sitemap.GetItemsByIdRange(new List<string> { "home", "instructions", "faq", "influencers", "order-now" });
                
                                foreach (var link in links)
                                {
                                    var id = string.Format("nav-{0}", link.Id);
                                    var attributes = string.Format(@"id=""{0}"" href=""{1}""", id, link.Page);

                                    if (link.IsExternal)
                                    {
                                        attributes = string.Format(@"{0} target=""_blank""", attributes);
                                    }
                                    %>
                                    <a class="nav__link" <%= attributes %>><span><%= link.Name %></span></a>
                                    <%
                                }
                            %>
                        </div>
                    </div>
                </nav>
                <div class="nav__logo header header--logo-title">
                    <a href="<%= home.Page %>" class="header__logo contain contain--logo">
                        <svg aria-label="Batiste"><use href="#icon-logo"></use></svg>
                    </a>
                    <div class="header__title">
                        1-Day Express Hair Color
                    </div>
                </div>
            </div>
	    </div>
    </div>
</header>
<% } %>

<% if (!isIndex) { %>
<div class="view header header--is-fixed section @print-only-hide">
    <%= renderPromoCode() %>
</div>

<header class="view hero hero--banner hero--wave section bg bg--rainbow-inverse @print-only-hide">
    <div id="nav" class="view__anchor"></div>
    <div class="view__in hero__in">
        <div class="hero__logo header header--logo-title">
            <% if (isStartPage) { %>
                <% var home = sitemap.GetItemById("home"); %>
                <a href="<%= home.Page %>" class="header__logo-title">
                    <div class="header__logo contain contain--logo">
                        <svg aria-label="Batiste"><use href="#icon-logo"></use></svg>
                    </div>
                    <div class="header__title">
                        1-Day Express Hair Color
                    </div>
                    <span class="header__link">Return Home</span>
                </a>
            <% } else { %>
                <div class="header__logo-title">
                    <div class="header__logo contain contain--logo">
                        <svg aria-label="Batiste"><use href="#icon-logo"></use></svg>
                    </div>
                    <div class="header__title">
                        1-Day Express Hair Color
                    </div>
                </div>
            <% } %>
        </div>
    </div>
    <div class="hero__wave-top contain contain--wave-top">
        <svg><use href="#graphic-wave-top"></use></svg>
    </div>
</header>
<% } %>