<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDB.Navigation" %>
<%@ Import Namespace="CDDB.Models" %>
<%
    var sitemap = ViewData["Sitemap"] as NavigationList ?? new Sitemap().SitemapList;
	var isStartPage = DtmContext.Page.IsStartPageType;
%>
<footer aria-label="Sitemap and copyright information" class="view footer section @print-only-hide bg bg--color-footer">
    <div class="view__in footer__in">
		<div class="footer__group">
			<% if (isStartPage) { %>
			<nav class="footer__social social" aria-label="social media">
				<div class="social__group">
					<% var home = sitemap.GetItemById("home"); %>
					<a href="<%= home.Page %>" class="social__logo contain contain--logo">
						<svg><use href="#icon-logo"></use></svg>
					</a>
					<% var instagram = sitemap.GetItemById("instagram"); %>
					<a href="<%= instagram.Page %>" target="_blank" id="footer-instagram" aria-label="Instagram">
						<svg class="social__icon"><use href="#icon-instagram"></use></svg>
					</a>
					<% var facebook = sitemap.GetItemById("facebook"); %>
					<a href="<%= facebook.Page %>" target="_blank" id="footer-facebook" aria-label="Facebook">
						<svg class="social__icon"><use href="#icon-facebook"></use></svg>
					</a>
					<% var youtube = sitemap.GetItemById("youtube"); %>
					<a href="<%= youtube.Page %>" target="_blank" id="footer-youtube" aria-label="YouTube">
						<svg class="social__icon"><use href="#icon-youtube"></use></svg>
					</a>
				</div>
			</nav>
			<div class="footer__products">
				<nav class="list list--sitemap" aria-label="Products">
					<div class="list__group">
						<div class="list__item list list__first-item-header">
							<% 
								var productsA = sitemap.GetItemsByIdRange(new List<string> { "products", "stardust-shimmer", "deep-teal" });

								foreach (var product in productsA)
								{
									%>
									<a href="<%= product.Page %>"><%= product.Name %></a>
									<%
								}
							%>
						</div>
						<div class="list__item list">
							<% 
								var productsB = sitemap.GetItemsByIdRange(new List<string> { "rose-quartz", "wild-violet", "bundles" });

								foreach (var product in productsB)
								{
									%>
									<a href="<%= product.Page %>"><%= product.Name %></a>
									<%
								}
							%>
						</div>
					</div>
				</nav>
			</div>
			<% } %>
	
			<%= Html.Partial("SitemapList") %>	
		</div>
    </div>

	<%
	    var pagesRequireScripts = new string[] { "OrderNow", "ProcessPayment" };
		var requireScripts = pagesRequireScripts.Contains(DtmContext.PageCode);	
	%>

	<div class="hide l-controls" aria-hidden="true" role="none">
        <script src="/shared/js/jquery.min.js"></script>
        <script type="text/javascript" src="/shared/js/common.js?v=<%= Dtm.Framework.ClientSites.Web.DtmContext.ApplicationVersion %>&language=<%=Dtm.Framework.ClientSites.SettingsManager.ContextSettings["Language.LanguageType", "English"] %>&cb=1"></script>
        <script>const loadFWSnippets = false; const loadFacebox = false;</script>
        <% 
			if (requireScripts) { 
				%>
        		<script defer src="/shared/facebox/facebox.js"></script>
		        <link rel="stylesheet" href="/shared/facebox/facebox.css" media="print" onload="this.media='all'; this.onload=null;"/>
                <script>
                    const setBraintreeHostedFieldsStyles = function () {
                        return {
                            'font-size': '1em',
                            'font-family': 'Helvetica, Arial, sans-serif',
                            'font-weight': 'normal',
                            'line-height': 'normal',
                            'color': '#333',
                        };
                    };
                </script>
                <%
				Html.RenderSnippet("ORDERFORMSCRIPT");
                %>

                <%
            }
		%>

       
        <%

            var colorSelectedGlow = !string.IsNullOrWhiteSpace(ViewData["colorSelectedGlow"] as string) ? ViewData["colorSelectedGlow"] : "0";
            var liveColorSelected1 =  !string.IsNullOrWhiteSpace(ViewData["liveColorSelected1"] as string) ? ViewData["liveColorSelected1"] : "0";
            var liveColorSelected2 =  !string.IsNullOrWhiteSpace(ViewData["liveColorSelected2"] as string) ? ViewData["liveColorSelected2"] : "0";
            var anythingColorSelected1 = !string.IsNullOrWhiteSpace(ViewData["anythingColorSelected1"] as string) ? ViewData["anythingColorSelected1"] : "0";
            var anythingColorSelected2 = !string.IsNullOrWhiteSpace(ViewData["anythingColorSelected2"] as string) ? ViewData["anythingColorSelected2"] : "0";
            var anythingColorSelected3 =  !string.IsNullOrWhiteSpace(ViewData["anythingColorSelected3"] as string) ? ViewData["anythingColorSelected3"] : "0";
            var bundle =  !string.IsNullOrWhiteSpace(ViewData["bundle"] as string) ? ViewData["bundle"] :string.Empty;

            %>
        <script>
            $('#glowColorSelected').val('<%=colorSelectedGlow%>');
            $('#liveColorSelected1').val('<%=liveColorSelected1%>');
            $('#liveColorSelected2').val('<%=liveColorSelected2%>');
            $('#anythingColorSelected1').val('<%=anythingColorSelected1%>');
            $('#anythingColorSelected2').val('<%=anythingColorSelected2%>');
            $('#anythingColorSelected3').val('<%=anythingColorSelected3%>');

            if ('<%=bundle%>' !== '') {
                $('[name=bundle][value="<%=bundle%>"]').prop('checked', true);
            }

        </script>

        <%= Model.FrameworkVersion %>
        <% Html.RenderSiteControls(SiteControlLocation.ContentTop); %>
        <% Html.RenderSiteControls(SiteControlLocation.ContentBottom); %>
        <% Html.RenderSiteControls(SiteControlLocation.PageBottom); %>
    </div>
</footer>

<span class="svg-symbols">
    <svg>
        <symbol id="icon-facebook" viewBox="0 0 42.717 42.717">
            <defs>
                <style>
                    #icon-facebook .a {
                        fill: currentColor;
                    }
                </style>
            </defs>
            <path class="a" d="M36.46,6.257a21.351,21.351,0,1,0,6.257,15.1A21.259,21.259,0,0,0,36.46,6.257ZM26.2,19.64l-.142,1.719H22.827v10.9H18.463v-10.9h-2.2V17h2.178V15.034a4.241,4.241,0,0,1,4.589-4.564H26.4v3.738H23.953a.919.919,0,0,0-.959,1.043V17h3.462Z" />
        </symbol>

        <symbol id="icon-instagram" viewBox="0 0 42.742 42.742">
            <defs>
                <style>
                    #icon-instagram .a {
                        fill: currentColor;
                    }
                </style>
            </defs>
            <path class="a" d="M195.968,190.4a5.476,5.476,0,1,0,5.476,5.476A5.483,5.483,0,0,0,195.968,190.4Z" transform="translate(-174.597 -174.505)" />
            <path class="a" d="M158,142.9H146.7a3.8,3.8,0,0,0-3.8,3.8V158a3.8,3.8,0,0,0,3.8,3.8H158a3.8,3.8,0,0,0,3.8-3.8V146.7A3.8,3.8,0,0,0,158,142.9Zm-5.66,16.354a6.912,6.912,0,1,1,6.912-6.912A6.915,6.915,0,0,1,152.342,159.254Zm6.779-12.53a1.11,1.11,0,1,1,1.11-1.11A1.11,1.11,0,0,1,159.12,146.723Z" transform="translate(-130.971 -130.971)" />
            <path class="a" d="M36.481,6.261a21.369,21.369,0,1,0-15.11,36.481A21.369,21.369,0,0,0,36.481,6.261ZM32.09,27.031A5.081,5.081,0,0,1,27.023,32.1H15.728a5.091,5.091,0,0,1-5.067-5.067v-11.3a5.081,5.081,0,0,1,5.067-5.067h11.3A5.07,5.07,0,0,1,32.1,15.728v11.3Z" transform="translate(0 0)" />
        </symbol>

        <symbol id="icon-youtube" viewBox="0 0 42.733 42.742">
            <defs>
                <style>
                    #icon-youtube .a {
                        fill: currentColor;
                    }
                </style>
            </defs>
            <g transform="translate(0)">
                <path class="a" d="M228.9,214.7v6.385l5.909-3.18-3.23-1.753Z" transform="translate(-209.795 -196.78)" />
                <path class="a" d="M36.474,6.26a21.369,21.369,0,1,0,6.26,15.115A21.337,21.337,0,0,0,36.474,6.26Zm-4.2,14.556v1.411c0,1.845-.209,3.664-.209,3.664a5.223,5.223,0,0,1-.876,2.27,3.064,3.064,0,0,1-2.178.968c-3.055.217-7.629.234-7.629.234s-5.676-.058-7.42-.234a3.549,3.549,0,0,1-2.412-.968,5.223,5.223,0,0,1-.876-2.27,34.087,34.087,0,0,1-.225-3.664V20.491a34.709,34.709,0,0,1,.225-3.664,5.167,5.167,0,0,1,.876-2.262,3.091,3.091,0,0,1,2.187-.968c3.055-.225,7.62-.225,7.62-.225h.025s4.582,0,7.629.225a3.139,3.139,0,0,1,2.178.968,5.132,5.132,0,0,1,.876,2.262s.209,1.845.209,3.664Z" transform="translate(0 0)" />
            </g>
        </symbol>
    </svg>
</span>

<span class="svg-symbols">
    <svg>
        <symbol id="icon-logo" x="0px" y="0px" viewBox="0 0 120.8719 30.0978">
            <style type="text/css">
                #icon-logo path {
                    fill: currentColor;
                }
            </style>
            <path d="M117.6329,15.0515l.4344.0021.2962-1.5721.6.0032.0757-.4-1.6353-.0077-.0757.4.601.0024Z" transform="translate(-0.4765 -1.1819)" />
            <path d="M120.8772,13.0931l-.6755.8308-.362-.8359-.4677-.0017-.3706,1.9714.4253.0017.2416-1.2812.3959.8368.0106.0028.7149-.843-.2432,1.287.4312.0023.3707-1.9715Z" transform="translate(-0.4765 -1.1819)" />
            <path d="M74.9271,11.89a4.3942,4.3942,0,0,0,3.835-2.8484c.55-1.58-.2738-2.87-1.8417-2.8782C74.0083,5.8819,70.6648,11.4342,74.9271,11.89Z" transform="translate(-0.4765 -1.1819)" />
            <path d="M105.1893,24.62c3.71-.3716,9.0653-2.3838,10.8045-6.66a3.2641,3.2641,0,0,0-2.1564-4.589c-4.4173-1.3061-8.9717,1.2408-11.62,4.7187a12.7,12.7,0,0,0-2.7192,5.8645c-.4747.6354-1.8558,2.375-2.8554,2.21-2.6584-.5692.7062-4.9083,1.4972-6.3026l4.4726-7.1713,2.069.0085,1.8276-2.916-2.1137-.0081,1.9562-3.2013L100.3,6.55,98.3466,9.7517,96.5883,9.743l-1.822,2.9185,1.7991.0073c-.9453,1.5442-4.3225,7.0834-4.3225,7.0834h0A25.6394,25.6394,0,0,1,88.739,24.9a5.1165,5.1165,0,0,0-.535-2.4692h0c-.3751-.826-.961-1.8725-.961-1.8725h0c-.85-1.8188-1.6274-2.8008-1.2639-4.3423.8654-2.0587,3.4439-.8162,4.4616.4036l1.3527-2.1336c-2.186-2.4034-9.7557-2.8148-11.4851,2.5355-1.0038,3.9333,2.3922,6.1511,2.1555,8.4518-.3764,3.7036-6.9215,3.126-6.3677-.6976,0,0,2.2638-.0187,3.05-1.5106a2.72,2.72,0,0,0-.7015-3.45c-3.9475-1.8776-6.0455,3.1839-5.159,6.4169C70.9166,27.57,69.38,25.6351,70.3267,23.76c1.3139-2.5935,4.464-7.5931,6.01-10.121l-6.0645-.0245s-3.2221,5.2516-5.1345,8.2483c-1.7607,2.76-3.1422,4.5129-4.4805,4.0177-1.3908-.5155.0937-3.1656.4969-3.7664l5.8493-9.5709,2.0692.0076L70.9,9.6345l-2.1147-.0084,1.9552-3.2016L64.6908,6.4,62.7365,9.6017,60.9782,9.593,59.1568,12.51l1.7988.0083s-4.2952,6.9012-6.6018,10.6c-1.2126,1.9445-2.6622,3.0888-3.6228,2.7989-1.1121-.4622-.8135-1.5127-.5435-2.0728.3643-.7562,5.6794-9.6207,6.0542-10.2892L50.3036,13.53l-.6648,1.0492a6.0738,6.0738,0,0,0-3.7959-1.61l.0763.0205c-4.0009-.4493-7.8448,1.61-10.4676,4.5444h0a17.9134,17.9134,0,0,0-1.479,1.88c-.1728.2568-.3619.5362-.5337.8276a7.9976,7.9976,0,0,0-.7611-3.4829h0a4.56,4.56,0,0,0-2.7453-2.2341c9.82-1.4679,11.15-13.784-4.59-13.33C16.3106,1.2277,7.2311,5.6054,4.1581,13.5516h0c-1.3011,3.5031-.4111,7.78,3.0459,9.6714,0,0-1.2006,1.8959-1.5373,2.4307a15.15,15.15,0,0,1-3.32-2.1921l-1.87,2.9707c5.0575,5.0993,23.7213,8.247,31.1962-1.4109a6.96,6.96,0,0,0,.1145,2.5h0c1.2242,3.6439,6.732,4.2279,12.1936-.0527.9806,4.8864,6.9311,3.3578,10.9236-.371A3.8681,3.8681,0,0,0,58.77,30.54h0a10.886,10.886,0,0,0,6.4609-2.1772c1.2542,2.7789,5.8933,3.2158,9.2233.1931,1.7654,2.1658,5.2532,2.5628,7.8969,2.21h0a13.7,13.7,0,0,0,7.9346-4.2377,3.9452,3.9452,0,0,0,3.7085,4.1682q.1876.0108.3757.0039h0a10.972,10.972,0,0,0,6.04-1.9022c4.51,5.0791,14.895.6607,17.9554-4.7557l-1.4927-1.1364C113.8577,27.8915,104.4479,30.6236,105.1893,24.62Zm4.31-8.4581c5.1895-3.8319,4.8488,5.2088-3.8857,6.35a16.0924,16.0924,0,0,1,3.8859-6.3508ZM25.6382,18.8272c-.541,2.8152-7.95,4.7172-11.7311,4.002L14.89,21.27l-.01-.0026,3.53-5.5839s7.883-.2251,7.2283,3.1426ZM8.65,20.9219C4.2525,18.4942,6.1316,7.9024,18.3083,5.6444,18.2526,5.64,9.7122,19.26,8.6506,20.921Zm2.69,6.5442c-.1066-.0194-.2109-.0361-.3192-.057l1.3971-2.2334a19.3221,19.3221,0,0,0,13.2977-2.34C22.8114,29.05,13.208,27.7766,11.341,27.4642ZM29.4169,8.2883c-1.18,3.3868-4.9846,4.8782-9.3546,4.7842L25.28,4.6892c1.9322.0669,4.8622-.1027,4.1377,3.5972ZM45.96,19.8656c-3.1113,5.1861-6.2325,8.0984-8.0549,6.9788-.9483-.5859-.5827-2.32.7921-4.5506C42.2267,15.5622,49.9306,13.2457,45.96,19.8656Z" transform="translate(-0.4765 -1.1819)" />
        </symbol>
        <symbol id="graphic-wave-top" x="0px" y="0px" viewBox="0 0 3000 717.8">
            <style type="text/css">
                .st0 {
                    fill: #3D3D3D;
                }
            </style>
            <g>
                <path class="st0" d="M1835.6,170.6c87.3-18.5,143.2-62.3,197.3-104.8c31.3-24.5,61.8-48.4,96.9-65.8h-118.1
                    c-3.9,3.1-7.8,6.1-11.7,9.2c-54.2,42.9-110.2,87.2-198.8,105.9c-148.4,31.4-246.7-38.6-350.9-112.6c-1.2-0.8-2.3-1.7-3.5-2.5h-43
                    c29.8,18.5,58.1,38.8,86.2,58.9C1592.6,132.2,1689.5,201.5,1835.6,170.6z" />
                <path class="st0" d="M1800.2,110c87.4-18.5,142.9-62.4,196.6-104.9c2.2-1.7,4.3-3.4,6.5-5.1h-108.4
                    c-35.8,23.4-76.7,43.5-129.1,54.6c-25,5.3-48.6,7.7-71.1,7.7c-74.2,0-136-26.4-194.8-62.3h-44C1558.2,72.7,1655.2,140.7,1800.2,110
                    z" />
                <path class="st0" d="M2625.4,92.4c53,4.2,129-26.6,198.2-80.2c5.1-4,10.2-8,15.1-12.2h-86.1c-55.2,33.5-110.6,51.1-153.1,47.4
                    c-42.7-3.7-83.8-22.6-125.3-47.4h-44.6c3.2,2.1,6.5,4.3,9.7,6.4C2501.8,48,2560.7,87.3,2625.4,92.4z" />
                <path class="st0" d="M209.7,168.8c164,12,272.6-70.6,379.4-168.8h-99.3c-25.3,20.4-51.4,39.3-78.8,55.5
                    c-67,39.7-135.5,59.1-208.4,59.1c-10.2,0-20.5-0.4-30.8-1.1C97,108,46.9,85.1,0,61.6v36c9.6,4.6,19,9.4,28.4,14.1
                    C78.2,136.9,129.8,163,209.7,168.8z" />
                <path class="st0" d="M2650.8,142.6c50.5,3.5,126.8-26.8,194.3-77.1c26.8-19.9,51.1-42,72.6-65.5h-70.8c-6.5,5.6-13.2,11-20,16.3
                    c-70.2,54.4-147.6,85.5-201.9,81.3c-66-5.2-125.5-44.8-188.5-86.8c-5.4-3.6-10.8-7.2-16.3-10.8h-54.9
                    c36.7,16.9,71.1,39.5,104.9,61.8C2529.8,101.1,2586.1,138.2,2650.8,142.6z" />
                <path class="st0" d="M1871.1,231.2c87.2-18.4,143.5-62.3,198-104.6c66.2-51.4,128.6-100,237-92.3c75.7,5.4,136.2,44.8,194.8,82.9
                    c56.8,37,110.5,71.9,175.1,75.7c48.7,2.8,123.5-26.2,190.5-74C2915,84.3,2955,43.7,2984.4,0h-59.9
                    c-81.7,91.4-193.5,148.1-265.4,148.1c-3,0-5.8-0.1-8.7-0.3c-66-4.5-122.9-42-183.1-81.7c-36.9-24.3-74.6-49.1-115-66.2h-210
                    c-39.1,17.5-72,43.3-106,70c-54.6,42.8-111,87.1-199.5,105.8c-25,5.3-48.6,7.7-71,7.7c-110.5,0-192.7-58.7-278.8-120.3
                    c-30.3-21.6-60.8-43.5-93.2-63.1h-82.5c83.1,24.5,150,72.5,215.4,119.5C1628.7,192.8,1725.1,262.1,1871.1,231.2z" />
                <path class="st0" d="M247.2,229.4c186,13.6,300.9-94.6,422.5-209.1c7.2-6.8,14.4-13.5,21.6-20.3h-94.5
                    c-46.6,43-95.2,84.7-148.3,116.1c-67,39.7-135.5,59.1-208.4,59.1c-10.2,0-20.5-0.4-30.8-1.1c-81-5.9-133-32.2-183.4-57.6
                    c-8.7-4.4-17.3-8.7-26-13v38.3c23.5,9.2,44.8,20,65.9,30.6C115.7,197.5,167.3,223.5,247.2,229.4z" />
                <path class="st0" d="M2912.4,230c-64.7,42-135.3,68.6-181.5,68.6c-1.4,0-2.8,0-4.2-0.1c-66.1-2.5-115-33.4-166.8-66.1
                    c-51.7-32.7-105.2-66.5-179-71.8c-106.6-7.6-169.5,40.5-236.1,91.5c-55.7,42.6-113.3,86.7-201.5,105.4c-25,5.3-48.5,7.7-70.8,7.7
                    c-110.1,0-190.8-58.6-275.5-120.1c-93.5-67.9-190.3-138.1-335.3-135c-174.2,3.7-289.4,112.2-400.7,217
                    c-58.6,55.2-119.2,112.3-187.3,152.5c-67,39.7-135.5,59.1-208.4,59.1c-10.2,0-20.5-0.4-30.8-1.1c-81-5.9-133-32.2-183.4-57.6
                    c-61.6-31.1-119.7-60.5-227-54.9c-8,0.4-16,1-24,1.8v60.4c20.3-3.5,40.7-5.8,61.2-6.9c108.6-5.7,170.1,25.4,229.6,55.4
                    c49.9,25.2,101.4,51.2,181.4,57.1c186,13.6,300.9-94.6,422.5-209.1c112.1-105.5,228-214.7,404.2-218.4c3.2-0.1,6.3-0.1,9.5-0.1
                    c141.6,0,236.4,69.2,328.2,136.2c100.3,73.2,195,142.4,341,111.5c86.9-18.4,144.5-62,200.1-104.3c68.1-51.6,132.3-100.4,241-92.7
                    c74.8,5.3,125.6,37,174.8,67.5c48.3,30,93.9,58.4,158.7,60c0.9,0,1.7,0,2.6,0c57.4,0,166.6-46.2,245.2-115.3v-70
                    C2969.3,190.3,2936.1,214.6,2912.4,230z" />
                <path class="st0" d="M2990.7,0c-29.9,45.3-71.1,87.5-121,123.1c-67.9,48.5-144,77.9-193.8,74.9c-66.1-3.9-120.3-39.2-177.7-76.5
                    c-58-37.7-117.9-76.8-192.3-82.1c-106.4-7.6-168.1,40.4-233.4,91.2c-55,42.7-111.8,86.9-200.2,105.6c-25,5.3-48.6,7.7-70.9,7.7
                    c-110.4,0-192-58.7-277.7-120.2C1453.8,73.6,1382.1,22.1,1290.9,0h-191.3C971.9,30.7,877.6,119.5,785.9,205.9
                    C727.2,261,666.6,318.1,598.6,358.4c-67,39.7-135.5,59.1-208.4,59.1c-10.2,0-20.5-0.4-30.8-1.1c-81-5.9-133-32.2-183.4-57.6
                    c-51-25.8-99.8-50.4-176-54.8v54.8c100.1-2.5,158.9,27.2,215.9,55.9c49.9,25.2,101.4,51.2,181.4,57.1
                    c186,13.6,300.9-94.6,422.5-209.1C931.8,157.1,1047.7,48,1224,44.2c146.8-3.2,244.7,67.6,339.4,136
                    c101.4,73.3,197.2,142.5,343.3,111.6c87.1-18.4,143.9-62.2,198.7-104.5c66.8-51.5,129.9-100.1,238.3-92.4
                    c75.4,5.4,132.7,42.2,188.1,77.7c54,34.7,105,67.4,169.7,70.5c46.9,2.3,120.2-25.6,186.6-70.8c30-20.5,75.6-56.3,111.9-105.3V0
                    H2990.7z" />
                <path class="st0" d="M2754.8,348.8c-0.9,0-1.8,0-2.7,0c-66.2-1.7-112.4-30.4-161.3-60.8c-48.6-30.2-98.9-61.5-172.4-66.7
                    c-106.7-7.6-170.2,40.6-237.4,91.6c-56.1,42.6-114.1,86.6-202.2,105.2c-148.2,31.4-243.9-38.5-345.2-112.4
                    c-93.1-67.9-189.3-138.2-334.4-135.1c-174.2,3.7-289.4,112.2-400.7,217c-58.6,55.2-119.2,112.3-187.3,152.5
                    c-67,39.7-135.5,59.1-208.4,59.1c-10.2,0-20.5-0.4-30.8-1.1c-81-5.9-133-32.2-183.4-57.6c-61.6-31.1-119.7-60.5-227-54.9
                    c-20.6,1.1-41.2,3.4-61.5,7v63.2c32.4-8.1,65.5-13.1,98.7-14.9c108.6-5.7,170.1,25.4,229.6,55.4c49.9,25.2,101.4,51.2,181.4,57.1
                    c186,13.6,300.9-94.6,422.5-209.1c112.1-105.5,228-214.7,404.2-218.4c146.9-3.1,243.4,67.7,336.8,136.1
                    c99.7,73.2,193.9,142.3,339.8,111.4c86.9-18.4,144.8-62,200.8-104.1c68.7-51.7,133.6-100.6,242.3-92.8
                    c74.4,5.3,122.1,34.4,168.2,62.5c45.4,27.7,88.3,53.9,153.2,54.7c0.4,0,0.9,0,1.3,0c50.1,0,145.6-37,221.1-92.2v-66.2
                    c-23.9,20.6-47.9,36.8-66.2,48.1C2869.9,322.8,2798.5,348.8,2754.8,348.8z" />
                <path class="st0" d="M2891,176.6c-67.3,45.9-141.8,74.1-189.8,71.8c-66.1-3.2-117.7-36.3-172.3-71.4
                    c-54.8-35.2-111.5-71.6-185.6-76.9c-106.5-7.6-168.8,40.5-234.8,91.3c-55.3,42.7-112.6,86.8-200.9,105.5
                    c-148.3,31.4-245-38.5-347.4-112.5c-94-67.9-191.2-138-336.2-135c-174.2,3.7-289.4,112.2-400.7,217
                    C764.7,321.6,704.1,378.7,636.1,419c-67,39.7-135.5,59.1-208.4,59.1c-10.2,0-20.5-0.4-30.8-1.1c-81-5.9-133-32.2-183.4-57.6
                    c-59-29.8-114.8-58-213.5-55.4v57.7c7.9-0.8,15.8-1.4,23.7-1.8c108.6-5.7,170.1,25.4,229.6,55.4c49.9,25.2,101.4,51.2,181.4,57.1
                    c186,13.6,300.9-94.6,422.5-209.1c112.1-105.5,228-214.7,404.2-218.4c146.9-3.2,244.3,67.6,338.5,136
                    c100.9,73.2,196.1,142.4,342.1,111.6c87-18.4,144.2-62.1,199.4-104.4c67.4-51.6,131.1-100.3,239.7-92.6
                    c75.1,5.4,129.2,39.5,181.5,72.6c51.2,32.4,99.5,62.9,164.2,65.3c44.4,1.7,117.8-25.6,182.7-67.7c24.4-15.9,59.1-41.3,90.4-74.9
                    V75.6C2963.9,122.4,2920.2,156.6,2891,176.6z" />
                <path class="st0" d="M322.2,350.6c186,13.6,300.9-94.6,422.5-209.1C798.1,91.2,852.4,40.1,913.6,0H804.3c-32.2,27-63,56-93.5,84.7
                    C652.2,139.9,591.6,197,523.6,237.2c-67,39.7-135.5,59.1-208.4,59.1c-10.2,0-20.5-0.4-30.8-1.1c-81-5.9-133-32.2-183.4-57.6
                    c-32.1-16.2-63.3-32-101-42.5v47.2c57.8,9.3,99.8,30.5,140.9,51.3C190.7,318.7,242.3,344.7,322.2,350.6z" />
                <path class="st0" d="M2777.5,399c-66.3-0.9-109.8-27.4-155.8-55.5c-45.6-27.8-92.7-56.5-165.8-61.7
                    c-106.8-7.6-170.9,40.7-238.8,91.8c-56.5,42.5-114.9,86.5-202.9,105.1c-25,5.3-48.5,7.7-70.7,7.7c-109.7,0-189.6-58.6-273.3-120
                    c-92.6-68-188.4-138.2-333.5-135.1c-174.2,3.7-289.4,112.2-400.7,217c-58.6,55.2-119.2,112.3-187.3,152.5
                    c-67,39.7-135.5,59.1-208.4,59.1c-10.2,0-20.5-0.4-30.8-1.1c-81-5.9-133-32.2-183.4-57.6c-61.6-31.1-119.7-60.5-227-54.9
                    c-33.4,1.8-66.6,6.8-99,15V630c40.7-13.6,86-23.2,136.4-25.9c197.8-10.4,233.5,99.5,410.7,112.5c364.3,26.7,466.7-419.8,827-427.5
                    c303.8-6.5,391.9,307.4,675.1,247.5c195.3-41.3,249.3-210.8,444.4-196.9c147.2,10.5,171.2,110.9,309.4,106.9
                    c70-2,138-30,197.1-72.7v-66.2c-76.1,54.8-171,91.3-221.2,91.3C2778.4,399,2777.9,399,2777.5,399z" />
                <path class="st0" d="M284.7,290c186,13.6,300.9-94.6,422.5-209.1c29-27.4,58.4-54.9,88.9-80.9h-97.1c-8.6,8-17.2,16.1-25.7,24.1
                    c-58.6,55.2-119.2,112.3-187.3,152.5c-67,39.7-135.5,59.1-208.4,59.1c-10.2,0-20.5-0.4-30.8-1.1c-81-5.9-133-32.2-183.4-57.6
                    C42.6,166.5,22.1,156.1,0,147.3v42.5c39.5,10.9,71.7,27.1,103.4,43.1C153.2,258.1,204.8,284.1,284.7,290z" />
                <path class="st0" d="M359.7,411.1c186,13.6,300.9-94.6,422.5-209.1c87.6-82.5,177.5-167.2,296.8-202H923.3
                    c-63.7,40.5-119.8,93.3-175,145.3c-58.6,55.2-119.2,112.3-187.3,152.5c-67,39.7-135.5,59.1-208.4,59.1c-10.2,0-20.5-0.4-30.8-1.1
                    c-81-5.9-133-32.2-183.4-57.6C96.3,276.9,55.8,256.4,0,247.4v51.3c78.1,4.7,128.9,30.4,178.4,55.3
                    C228.2,379.2,279.8,405.3,359.7,411.1z" />
            </g>
        </symbol>
        <symbol id="graphic-wave-bottom" x="0px" y="0px" viewBox="0 0 2369.1 1024.4">
            <style type="text/css">
                .st0 {
                    fill: #3D3D3D;
                }
            </style>
            <g>
                <path class="st0" d="M2246.9,631.4c-66.6,28.6-83.9,108-102.2,192c-15,68.9-31.6,145-78.2,201h90.1c18.4-43.8,28.2-93.1,37.9-141.6
                c17.6-88.2,34.2-171.6,103.3-201.2c24-10.3,47.7-13.8,71.3-12.6v-40.4C2328.4,616.5,2288.1,613.7,2246.9,631.4z" />
                <path class="st0" d="M2081,270.6c-67.2-28.5-130.7-55.4-204.8-23.7c-67.8,29.1-91.6,89.9-116.9,154.4
                c-26.3,67.2-56.2,143.4-140.7,196.8c-21.1,13.3-42.3,19.1-64.2,19.1c-51.1,0-106.5-31.1-175.1-69.7
                c-34.6-19.5-73.8-41.5-117.1-61.9c-96.7-45.6-186.5-46.7-240.3-2.9c-59.9,48.8-73.6,148.3-39.8,287.9c14.1,58,7.5,100-19.4,124.7
                c-19.3,17.7-49.1,26.6-89.2,26.6c-49.6,0-114.9-13.5-195.5-40.6c-177.2-59-280.6,67.4-330.3,128.1c-4.2,5.1-8.4,10.1-12.5,14.9
                h60.5c27.6-31.8,63.5-67,109.5-91.5c65.3-34.6,137.1-39.5,213.6-14.5c153.8,50.9,253.6,56.6,296.8,16.8
                c23.5-21.6,29.6-56.4,18.2-103.4c-33.9-139.8-20.4-239.2,38.9-287.5c28.5-23.1,66.1-33.8,111.8-31.7c41.9,2,89.4,15,137.4,37.8
                c41.9,19.8,80.1,41,113.7,59.7c98,54.4,168.7,93.7,237.1,50.5c83.2-52.6,110.4-128,136.7-200.9c24.6-68.3,47.9-132.9,117.6-162.7
                c76.1-32.6,141.6-4.3,210.9,25.6c61.9,26.7,126,54.4,205.9,45.4c8.1-0.9,16.5-2.4,25.1-4.5v-73.6c-29.4,13.4-57.1,21.8-81.7,24.6
                C2206.2,323.8,2142.5,296.7,2081,270.6z" />
                <path class="st0" d="M2026,213.7c-66.1-27.5-128.5-53.6-202.7-21.7c-68,29.2-91.7,84.7-119.1,149.1
                c-27.3,64.1-58.3,136.7-142.5,190c-20.7,13.1-41.5,18.8-63.1,18.8c-50.6,0-105.3-31.1-173.3-69.8c-35.6-20.2-75.9-43.2-120.6-64.1
                c-93.7-44-182.3-43.7-236.9,0.9c-43.3,35.4-85.9,115.1-42.6,293.9c10.7,44.3,20.6,107.1-17.4,141.8c-19.4,17.8-49.8,26.3-90.2,25.5
                c-45.7-1-105.9-14-178.8-38.8C467.8,781.4,365.8,906,311.1,973l-0.1,0.2c-15.6,19.1-31.4,36.2-47.5,51.3h64.7
                c5.1-5.9,10.3-11.9,15.4-18.2c33.9-41.4,72.3-83.8,123.6-112.7c64.9-36.6,136.4-42.4,212.4-17.1c143.8,48.3,237.8,53.3,279.5,15.1
                c25.4-23.3,31.4-63.6,17.9-119.6c-43.4-179-1.3-258.3,41.6-293.2c55.4-45.1,147.3-44.3,245.9,2.2c43.4,20.5,82.7,42.6,117.4,62.1
                c96.6,54.3,166.4,93.5,234,50.8c83-52.5,112.5-127.8,138.6-194.3c25.7-65.5,49.9-127.4,119.7-157.3c76.2-32.7,140.6-5.3,208.9,23.7
                c60.9,25.9,123.9,52.6,203.8,43.7c25.5-2.9,53.6-11.9,82.2-25.2v-85.4c-46.8,30-95.7,52.3-138.8,57.2
                C2149.2,265.1,2086.6,239,2026,213.7z" />
                <path class="st0" d="M1971,156.9c-65-26.6-126.4-51.6-200.7-19.8c-68.3,29.3-92.9,82.4-121.4,143.8
                c-28.3,61-60.3,130.1-144.2,183.1c-68.7,43.4-137.9,3.6-233.6-51.5c-36.5-21-77.9-44.8-123.9-66.3c-90.8-42.5-178-40.8-233.4,4.5
                c-30.1,24.6-49.7,60.9-58.3,107.9c-9.6,52.4-5.3,117,12.9,192c15.2,62.6,24,125.3-13.6,159.5c-40.1,36.5-123.5,32.2-255.1-13
                c-165.6-56.8-262.4,62-320.2,133l-5.5,6.7c-30.4,37.1-62.5,66.1-97.3,87.6h78.9c17.3-15.9,34.3-34,51.1-54.6l0.1-0.2
                c28.7-35.1,68.1-83.3,122.5-115.8c64.5-38.6,135.5-45.2,211.1-19.6c135.2,45.9,223.9,50.8,263.8,14.4
                c35.9-32.8,26.2-93.8,15.8-136.7c-44-181.5-0.2-262.9,44.3-299.2c56.2-45.9,146.9-46.5,242.5-1.5c44.8,21,85.3,44,120.9,64.3
                c95.3,54.2,164.2,93.4,231,51.1c82.8-52.4,113.4-124.2,140.4-187.6c26.7-62.7,51.9-121.9,121.9-151.9
                c76.2-32.7,139.7-6.3,206.8,21.7c59.9,25,121.9,50.8,201.7,41.9c43.2-4.8,92.4-27.6,139.4-58.1V97.4
                c-62.8,49.8-135.2,93-195.9,99.9C2092.2,206.4,2030.6,181.2,1971,156.9z" />
                <path class="st0" d="M2141,521.6c-66.9,28.7-86,102.8-106.3,181.2c-21.4,82.7-45.6,176.5-131,230.6
                c-74.9,47.4-151.5,6.6-257.5-49.8c-28.8-15.3-61.4-32.7-96.4-49.5c-115.5-55.7-206.5-64.1-256.3-23.9
                c-44,35.6-56.4,107.6-37.1,214.3h43.7c-5.2-73.8,9.7-125.2,44.6-153.3c64.2-51.8,179.5-13.4,264.9,27.9
                c33.2,16,62.8,31.7,91.6,46.8c110.4,58.2,183.3,96.6,256.7,50.2c83.8-53,105.6-145,126.7-234c19.6-82.5,38.1-160.5,107.3-190.2
                c60.7-26,118.2-10,177.2,15.4V561c-4.4-2-8.8-4-13.1-6C2283.3,521.5,2214.6,490,2141,521.6z" />
                <path class="st0" d="M2115.7,136c-172.4,19.3-258.4-116.7-399.4-56.3c-139.8,60-105.2,210.8-270,315
                c-93.9,59.4-192.3-44.7-355.4-120.6c-168.6-78.5-359.5-3.7-281.8,317.1C832.9,689.6,882,864,561.6,752.5
                c-172.5-60-269.6,77-326.2,146.2c-76.1,93-157.7,117.3-235.3,125.6h166.6c37.3-21.6,71.4-51.6,103.5-90.9l5.4-6.7
                c28.7-35.2,68-83.4,121.1-115.5c62.7-37.8,131.6-44.3,204.9-19.2c127.8,43.9,211.8,48.7,249.8,14.1c35.6-32.4,26.8-93.3,12-154.4
                c-18.4-75.8-22.7-141.1-13-194.2c8.9-48.3,29.1-85.6,60.2-111c56.9-46.6,146.3-48.5,238.9-5.1c46.2,21.6,87.7,45.5,124.3,66.5
                c94.1,54.2,162.1,93.3,228.2,51.6c82.6-52.2,114.3-120.6,142.3-180.9c27.8-59.8,54-116.4,124.1-146.5
                C1844.6,99.5,1907,125,1973,152c59,24.1,119.9,49,199.6,40.1c44.5-5,101.2-31.5,163.7-76.6c10.9-7.8,21.8-16.2,32.8-25V0
                C2299,68.3,2216.8,124.7,2115.7,136z" />
                <path class="st0" d="M2136,327.5c-68.3-29.5-132.8-57.4-206.8-25.6c-67.6,29-90.5,92.5-114.7,159.7
                c-25.4,70.3-54.1,150-138.8,203.6c-21.5,13.6-43,19.4-65.4,19.4c-51.7,0-107.7-31.1-177.1-69.7c-33.6-18.7-71.6-39.8-113.4-59.6
                c-99.7-47.3-190.8-49.8-243.7-6.8c-57.6,46.9-70.5,144.5-37.1,282.2c11.9,49,5.2,85.4-19.8,108.5c-44.7,41.2-146.3,35.9-302-15.6
                c-149.6-49-249.4,27.7-314.4,100.9h65.5c20.8-18.9,45.7-37.4,74.9-52c65.6-32.7,137.9-36.7,214.8-11.8
                c162.8,53.2,271.9,60,315.5,19.7c21-19.4,26.8-49.1,17.3-88.4c-17.5-72.1-22.6-133.2-15.1-181.5c6.8-44.4,24.1-78.2,51.5-100.4
                c54.3-44.1,146.3-40.4,252.5,10.2c40.4,19.2,77.3,39.4,109.8,57.3c99.4,54.6,171.2,94.1,240.5,50.2
                c83.3-52.7,109.5-131.4,134.7-207.6c23.6-71.2,45.9-138.4,115.5-168.2c76-32.6,142.6-3.4,213,27.6c54.3,23.9,110.3,48.4,176,48.9
                V369c-8.4,2-16.6,3.4-24.5,4.3C2263.2,382.4,2198.5,354.5,2136,327.5z" />
                <path class="st0" d="M1982.1,356.8c-67.4,28.9-89.3,95-112.5,165c-24.4,73.4-52,156.6-136.9,210.4c-21.8,13.8-43.8,19.7-66.6,19.7
                c-52.3,0-109-31.2-179.3-69.8c-32.5-17.8-69.3-38.1-109.5-57.2c-104.3-49.7-194.3-53.6-247-10.9c-55.5,45.1-67.4,140.7-34.5,276.6
                c10,41.2,3.7,72.7-18.8,93.5c-45.7,42.3-153.6,36.1-320.7-18.5c-104-33.6-196.1-14.4-279.7,58.8h80.7c7.8-4.6,15.8-8.7,23.8-12.5
                c65.9-30.7,138.6-33.8,215.9-9.2c26.2,8.5,50.5,15.6,73,21.7h264.6c16.1-16.9,20.5-41.3,12.9-72.5
                c-17.3-71.2-22.5-131.3-15.6-178.5c6.3-43.5,23-76.4,49.4-97.9c53.2-43.1,146.4-37.9,255.7,14.4c38.7,18.5,74.3,37.8,105.6,54.8
                c101,54.9,173.9,94.5,244.2,50.1c83.5-52.8,108.5-134.8,132.8-214.2c22.6-74,44-143.9,113.4-173.7c75.9-32.6,143.5-2.4,215.1,29.5
                c38.7,17.3,78.1,34.8,121,44.1v-46.8c-66.8-0.5-123.3-25.2-178.1-49.3C2121.6,353.9,2056,325.1,1982.1,356.8z" />
                <path class="st0" d="M2088,466.6c-67,28.8-87.1,100.2-108.3,175.8c-22.4,79.6-47.7,169.9-133,223.8c-22.6,14.3-45.4,20.4-69.1,20.4
                c-53.6,0-112-31.4-184.3-70.2c-30.1-16.2-64.2-34.5-101-52.2c-52-24.9-101.6-40.4-143.5-44.6c-46.4-4.7-83.3,3.8-109.8,25.2
                c-24.5,19.8-39.8,50.8-45.5,92.1c-6.3,45.5-0.9,104,16,173.7c1.2,4.8,2,9.3,2.5,13.7h39.2c-19.5-108.3-6.4-181.6,39.1-218.4
                c51.5-41.6,144.5-33.3,261.9,23.3c35.1,16.9,67.8,34.3,96.6,49.6c108.3,57.7,179.9,95.8,252.2,50
                c83.7-52.9,106.6-141.6,128.8-227.4c20.6-79.7,40-155,109.3-184.7c75.8-32.5,145.5-0.5,219.2,33.4c3.6,1.7,7.3,3.4,10.9,5v-28.1
                c-23.3-8.7-45.8-18.9-68.1-29.1C2229.4,465.6,2161.8,435,2088,466.6z" />
                <path class="st0" d="M2035.1,411.7c-67.2,28.8-88.2,97.6-110.4,170.4c-23.4,76.5-49.9,163.3-135,217.1
                c-72.8,46.1-146.9,5.8-249.5-49.9c-31.3-17-66.8-36.3-105.4-54.7c-107.4-51.4-198.6-56.9-250.2-15.1
                c-25.4,20.6-41.4,52.4-47.5,94.5c-6.8,46.6-1.6,106,15.5,176.5c7.5,31,3.8,55.7-11,73.7h65c-0.5-4-1.2-8.2-2.3-12.5
                c-33-136.3-22.5-227.5,31.4-271.1c27.6-22.3,65.8-31.2,113.6-26.4c42.5,4.3,92.7,19.9,145.2,45.1c37,17.7,71.1,36.1,101.2,52.3
                c102.7,55.2,176.8,95.1,248.1,50c83.6-52.9,107.6-138.3,130.8-220.8c21.6-76.9,42-149.4,111.3-179.2
                c75.9-32.5,144.5-1.4,217.2,31.5c21.6,9.8,43.5,19.7,66,28.2v-35.6c-43.8-9.3-83.9-27.1-123.1-44.7
                C2175.5,409.8,2108.9,380.1,2035.1,411.7z" />
            </g>
        </symbol>
        <symbol id="icon-chevron" x="0px" y="0px" viewBox="0 0 13.7 27.3">
            <style type="text/css">
                #icon-chevron .st0 {
                    fill: none;
                    stroke: currentColor;
                    stroke-width: 2.8037;
                    stroke-linecap: round;
                    stroke-linejoin: round;
                    stroke-miterlimit: 10
                }
            </style>
            <polyline class="st0" points="1.5,1.7 12.2,13.8 1.5,25.9 " />
        </symbol>
        <symbol id="icon-combobox" x="0px" y="0px" viewBox="0 0 87 168">
            <polygon points="43.5,-0.5 0.2,74.5 86.8,74.5 " />
            <polygon points="43.5,167.5 86.8,92.5 0.2,92.5 " />
        </symbol>
    </svg>
</span>