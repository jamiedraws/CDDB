<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>

<link rel="stylesheet" href="https://use.typekit.net/wce1qpi.css">
<link rel="stylesheet" href="/css/99.0000/splash.css">
<% Html.RenderSnippet("STYLE-BLOCK-HEAD"); %>

<% if (DtmContext.Page.IsStartPageType) { %>
    <script defer src="/js/app.js"></script>
    <script defer src="/js/observer.js"></script>
    <script defer src="/js/lazy.js"></script>
    <script defer src="/js/page.js"></script>
<% } %>