<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%
	var EnableOrderForm = SettingsManager.ContextSettings["Order.EnableOrderform", true];
	var ShowMobileOrderForm = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.ShowOrderFormOnMobile", false];
	var renderOfferDetailsAboveAcceptOffer = SettingsManager.ContextSettings["Order.RenderOfferDetailsAboveAcceptOffer", false];
%>


	<section id="content_bottom" class="l-outer__in c-brand block">

		<div class="l-outer__section u-mar--center">

			<% if ( !ShowMobileOrderForm ) { %>
				<%-- // Displays the back button on a mobile order form --%>
				<% Html.RenderPartial("MobileOrderFormNav", Model); %>

			<% } %>

			<% if ( EnableOrderForm ) { %>

				<%-- // Displays the order form --%>
				<% Html.RenderPartial("OrderForm", Model); %>

			<% } else { %>

				<%-- // Displays the out of stock text --%>
				<% Html.RenderPartial("OutOfStock", Model); %>

			<% } %>

		</div>

	<%-- // Displays the offer details on desktop --%>
	<% if ( EnableOrderForm && !Model.IsMobile && !renderOfferDetailsAboveAcceptOffer) { %>

		<div class="u-mar--bottom @x2-mar">

			<div class="l-disclaimer o-box u-vw--80 u-mar--center" tabindex="0">

				<% Html.RenderSnippet("OFFERDETAILS"); %>

			</div>

		</div>

	<% } %>

	</section>


	<%-- // Displays the offer details on mobile --%>
	<% if ( EnableOrderForm && Model.IsMobile && !renderOfferDetailsAboveAcceptOffer ) { %>

		<div class="c-brand l-outer__in block o-box" tabindex="0">

			<% Html.RenderSnippet("OFFERDETAILS"); %>

		</div>

	<% } %>
