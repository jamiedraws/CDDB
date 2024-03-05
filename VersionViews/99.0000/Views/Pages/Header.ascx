<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<%
var product = SettingsManager.ContextSettings["Label.ProductName", "Batiste&trade;"];
%>

<div class="header">
    <div class="header__in">
        <div class="header__group">
            <a href="Index<%= Model.Extension %>">
                <img src="/images/logo.png" alt="<%= product %>">
            </a>
			<h1 class="headline">
				HELLO COLOR.
				<small>Express Yourself Without the Commitment</small>
			</h1>
        </div>
    </div>
</div>