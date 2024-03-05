<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDB.Navigation" %>
<%@ Import Namespace="CDDB.Models" %>

<%
    var productName = SettingsManager.ContextSettings["Label.ProductName"];
    var ext = DtmContext.ApplicationExtension;

    var renderFooter = false;
    var renderFooterValue = ViewData["renderFooter"] as string ?? "True";
    Boolean.TryParse(renderFooterValue, out renderFooter);
    var labelCategory = ViewData["labelCategory"] as string ?? "Footer";
    var labelId = labelCategory.Replace(" ", "-").ToLower();

    var sitemap = ViewData["Sitemap"] as NavigationList ?? new Sitemap().SitemapList;
%>

<% if (DtmContext.Page.IsStartPageType) { %>
<div class="footer__sitemap">
    <nav aria-label="<%= String.Format("{0} {1}", labelCategory, "Offer information") %>" class="list list--sitemap">
        <div class="list__group">
            <div class="list list__item">
                <div>Need Help?</div>
                <%
                    var linksA = sitemap.GetItemsByIdRange(new List<string> { "instructions", "contact-us" });
                
                    foreach (var link in linksA)
                    {
                        var id = string.Format("{0}-{1}", labelId, link.Id);
                        var attributes = string.Format(@"id=""{0}"" href=""{1}""", id, link.Page);

                        if (link.IsExternal)
                        {
                            attributes = string.Format(@"{0} target=""_blank""", attributes);
                        }
                        %>
                        <a <%= attributes %>><%= link.Name %></a>
                        <%
                    }
                %>       
            </div>
            <div class="list list__item">
                <%
                    var linksB = sitemap.GetItemsByIdRange(new List<string> { "faq", "terms", "shipping-return-policy", "influencers" });
                
                    foreach (var link in linksB)
                    {
                        var id = string.Format("{0}-{1}", labelId, link.Id);
                        var attributes = string.Format(@"id=""{0}"" href=""{1}""", id, link.Page);

                        if (link.IsExternal)
                        {
                            attributes = string.Format(@"{0} target=""_blank""", attributes);
                        }
                        %>
                        <a <%= attributes %>><%= link.Name %></a>
                        <%
                    }
                %> 
            </div>
            <div class="list list__item">
                <% var privacy = sitemap.GetItemById("privacy-policy"); %>
                <a href="<%= privacy.Page %>" target="_blank"><%= privacy.Name %></a>
                <span class="onetrust-privacy"></span>
            </div>
        </div>
    </nav>
</div>
<% } %>

<% if (renderFooter) { %>
<div class="footer__trademark">
    <address class="u-pad--vert">&copy;<%= DateTime.Now.ToString("yyyy") %> <%= productName %>. All Rights Reserved.</address>

    <p><% Html.RenderSnippet("COMMON-FOOTER"); %></p>
</div>
<% } %>