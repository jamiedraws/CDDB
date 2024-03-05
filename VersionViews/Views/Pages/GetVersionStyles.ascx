<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>

<link rel="preconnect" href="https://use.typekit.net">
<link rel="preconnect" href="https://p.typekit.net" crossorigin>
<link rel="preload" href="/css/shell.css" as="style"/>

<link rel="stylesheet" href="https://use.typekit.net/oyh8prs.css">
<link rel="stylesheet" href="/css/shell.css" />

<%
    var isIndexPage = DtmContext.PageCode == "Index";
    var isOrderPage = DtmContext.PageCode == "OrderNow";
    var isReferAFriend = DtmContext.PageCode == "ReferAFriend";
    var isLandingPage = DtmContext.Page.IsStartPageType && !isIndexPage && !isOrderPage && !isReferAFriend;
    var isConfirmation = !DtmContext.Page.IsStartPageType;

    if (isIndexPage)
    {
        %>
        
        <link rel="preload" href="/css/index.css" as="style"/>
        <link rel="preload" href="/images/girls-mobile.webp" as="image" media="(max-width: 700px)" type="image/webp">
        <link rel="preload" href="/images/girls-updated.webp" as="image" media="(min-width: 701px)" type="image/webp">
        <link rel="stylesheet" href="/css/index.css?v=2" />
        <%
    }

    if (isOrderPage)
    {
        %>
        <link rel="preload" href="/css/order-now.css" as="style"/>
        <link rel="stylesheet" href="/css/order-now.css" />
        <%
    }

    if (isConfirmation)
    {
        %>
        <link rel="preload" href="/css/confirmation.css" as="style"/>
        <link rel="stylesheet" href="/css/confirmation.css" />
        <%
    }

    if (isLandingPage)
    {
        %>
        <link rel="preload" href="/css/landing-page.css" as="style"/>
        <link rel="stylesheet" href="/css/landing-page.css" />
        <%
    }

    if (isReferAFriend)
    {
        %>
        <link rel="preload" href="/css/refer-a-friend.css" as="style"/>
        <link rel="stylesheet" href="/css/refer-a-friend.css" />
        <%
    }
%>