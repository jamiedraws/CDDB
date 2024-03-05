<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

	<footer class="l-footer o-box--none block @mv-u-pad--reset @print-only-hide">

		<nav class="l-footer__in c-brand @mv-u-pad--reset fn--center u-mar--center">

			<% Html.RenderSnippet("FOOTER-FRONTEND"); %>

			<% if ( !DtmContext.Page.IsStartPageType ) { %>
				<div class="u-pad--vert center-margin @mobile-only-width-at-60">
					<%= Html.Partial("ViewSwitchLink") %>
				</div>
			<% } %>

		</nav>

	</footer>




	<%-- // @JS-FOOTER --%>
	<% if ( DtmContext.Page.IsStartPageType ) { %>

			<% Html.RenderPartial("Scripts"); %>
			<% Html.RenderSnippet("ORDERFORMSCRIPT"); %>

	<% } %>



	<%= Model.FrameworkVersion %>

	<div class="l-controls" aria-hidden="true" role="none">
		<% Html.RenderSiteControls(SiteControlLocation.ContentTop); %>
		<% Html.RenderSiteControls(SiteControlLocation.ContentBottom); %>
		<% Html.RenderSiteControls(SiteControlLocation.PageBottom); %>
	</div>


