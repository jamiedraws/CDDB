<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDB.Navigation" %>
<%@ Import Namespace="CDDB.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<main aria-labelledby="main-title" class="view content section">
    <div id="main" class="view__anchor"></div>
    <article class="view__in section__in">
        <div class="section__block content__block">
        <% 
            var title = Model.UpsellTitle ?? string.Empty;
            var text = Model.UpsellText ?? string.Empty;
            var hasTitle = !String.IsNullOrEmpty(title);
            var hasText = !String.IsNullOrEmpty(text);

            %>
            <div class="content__header">
            <%
            if (hasTitle)
            {
                %>
                <h1 id="main-title" class="content__title"><%= title %></h1>
                <%
            } else
            {
                Html.RenderSnippet("SUBPAGE-TITLE-" + DtmContext.PageCode);
            }
            %>
            </div>
            <div class="content__text">
            <%
            if (hasText)
            {
                var sitemap = ViewData["Sitemap"] as NavigationList ?? new Sitemap().SitemapList;

                text = text.Replace("[#optout#]", DtmContext.OptOutLink);
                text = text.Replace("[#support#]", DtmContext.SupportEmail);
                text = text.Replace("[#ext#]", DtmContext.ApplicationExtension);

                var privacy = sitemap.GetItemById("privacy-policy");
                text = text.Replace("[#PrivacyPolicy#]", String.Format(@"<a href=""{0}"" target=""_blank"">{1}</a>", privacy.Page, privacy.Name));
                %>
                <%= text %>
                <%
            } else
            {
                Html.RenderSubPageContent(DtmContext.PageCode);
            }
            %>
            </div>
            <%
        %>
    </article>
</main>

</asp:Content>