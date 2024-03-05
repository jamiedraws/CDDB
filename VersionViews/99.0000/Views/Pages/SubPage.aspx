<%@ Page Language="C#" MasterPageFile="~/VersionViews/99.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="section">
    <div class="section__in">

        <% 
            var title = Model.UpsellTitle ?? string.Empty;
            var text = Model.UpsellText ?? string.Empty;
            var hasTitle = !String.IsNullOrEmpty(title);
            var hasText = !String.IsNullOrEmpty(text);
            var isMobile = DtmContext.IsMobile;

            if (hasTitle)
            {
                %>
                <h1 id="main-title"><%= title %></h1>
                <%
            } else
            {
                %>
                <% Html.RenderSnippet("SUBPAGE-TITLE-" + DtmContext.PageCode); %>
                <%
            }

            if (hasText)
            {
                %>
                <%= text %>
                <%
            } else
            {
                Html.RenderSubPageContent(DtmContext.PageCode);
            }
        %>

    </div>
</div>

</asp:Content>