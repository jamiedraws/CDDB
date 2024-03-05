<%@ Page Language="C#" MasterPageFile="~/VersionViews/99.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
var product = SettingsManager.ContextSettings["Label.ProductName", "Batiste&trade;"];
%>

<div class="hero">
	<div class="hero__item hero__offer offer">
		<picture class="contain contain--product offer__image">
			<img src="/images/batiste.png" alt="<%= product %>">
		</picture>
		<div class="offer__text">
			<div class="offer__price">
				1 COLOR
				<strong>$9.00</strong>
				<a href="#order" class="btn" title="Click here to order now">Buy Now</a>
			</div>
			<picture data-src-img="/images/tagline.png" data-attr='{ "alt" : "Bold Today, Gone Tomorrow - Rinses Out In Just 1 Wash" }' class="contain contain--tagline hero__tagline"></picture>
		</div>
	</div>
	<div class="hero__item hero__image">
		<picture data-src-img="/images/girls.png" data-attr='{ "alt" : "Two girls with dyed hair and sunglasses" }' class="contain contain--girls"></picture>
	</div>
</div>

</asp:Content>


