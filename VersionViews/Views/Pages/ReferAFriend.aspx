<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<main aria-labelledby="main-title" class="view content section">
    <div id="main" class="view__anchor"></div>
    <div class="view__in section__in">
        <div class="section__block content__block">
            <div class="content__header">
                <h1 id="main-title">Refer A Friend</h1>
            </div>
            <div class="content__text">
                <%= Html.Partial("ReferAFriendForm") %>
            </div>
        </div>
    </div>
</main>

</asp:Content>