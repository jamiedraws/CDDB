<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDB.Navigation" %>
<%@ Import Namespace="CDDB.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
  var sitemap = ViewData["Sitemap"] as NavigationList ?? new Sitemap().SitemapList;
  var videos = sitemap.GetItemById("influencers");
  var customerServiceNumber = SettingsManager.ContextSettings["CustomerService.PhoneNumber", "1-888-325-1257"];
  var customerServiceEmail = SettingsManager.ContextSettings["CustomerService.EmailAddress"];
  var hoursOfService = SettingsManager.ContextSettings["CustomerService.HoursOfService"];
  var refundDays = SettingsManager.ContextSettings["CustomerService.RefundDays"];
  var productName = SettingsManager.ContextSettings["Label.ProductName"];
  var brandName = SettingsManager.ContextSettings["Label.BrandName"];
%>

<main aria-labelledby="main-title" class="view content content--faq section">
    <div id="main" class="view__anchor"></div>
    <article class="view__in section__in">
        <div class="section__block content__block">
			<div class="content__header">
				<h1 id="main-title" class="content__title">Frequenty Asked Questions</h1>
			</div>

			<div class="content__text">
				<div class="accordion" data-accordion-toggle data-accordion-many-containers itemscope itemtype="https://schema.org/FAQPage">

					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="steps-answer" id="steps-question" itemprop="name">
								How do I apply this to my hair?
							</button>
						</h3>
						<section aria-labelledby="steps-question" id="steps-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<ol>
									<li>Put on disposable gloves to protect your manicure.</li>
									<li>Shake the product.</li>
									<li>Angle the bottle and press until you get a nice foam.</li>
									<li>Distribute evenly to thin strands of dry hair where you would like some color accents.</li>
									<li>Wait for it to dry. Use a hair dryer to expedite that process.</li>
									<li>Style and go once dry.</li>
								</ol>
							</div>
						</section>
					</div>
			
		
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="applicator-answer" id="applicator-question" itemprop="name">
								When I press the applicator, no product is coming out?
							</button>
						</h3>
						<section aria-labelledby="applicator-question" id="applicator-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>
									To get the color flowing, angle the bottle down and press until you get a nice foam.  You may only get a little bit of color coming out at first, keep pressing until it forms a nice foam.
								</p>
							</div>
						</section>
					</div>
				
		
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="color-answer" id="color-question" itemprop="name">
								What do the colors look like on your hair?
							</button>
						</h3>
						<section aria-labelledby="color-question" id="color-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>
									The color will vary based on how much you apply and due to your hair color and texture. However, they work well on all colors and textures.  We have 4 colors:  The Deep Teal is a dark emerald green. The Wild Violet is an electric rich purple, the Rose Quartz is a soft delicate pink, and the Stardust Shimmer adds a light sheen of sparkle to your hair for some &ldquo;bling&rdquo;.  See videos of the different colors used on different hair types <a href="<%= videos.Page %>" title="View videos here">here</a>.
								</p>
							</div>
						</section>
					</div>
					
			
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="color-hair-types-answer" id="color-hair-types-question" itemprop="name">
								Will the colors work on all hair types and colors?
							</button>
						</h3>
						<section aria-labelledby="color-hair-types-question" id="color-hair-types-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>
									Yes, they are designed to work well on all colors and textures.  Depending on your hair color, you may want to add more product to make brighter/bolder&hellip;it all depends on how bold you want to go.  Darker hair and bolder looks may require more product.  See videos of the different colors used on different hair types and colors <a href="<%= videos.Page %>" title="View videos here">here</a>.
								</p>
							</div>
						</section>
					</div>
				
			
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="come-out-answer" id="come-out-question" itemprop="name">
								Will this product come out of my hair easily?
							</button>
						</h3>
						<section aria-labelledby="come-out-question" id="come-out-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>
									The formula is designed to come out in just 1 wash.  We recommend a thorough shampoo and conditioner.  For lighter hair, you may want to wash twice to be sure you get it all.  Rub your fingers through your hair and rinse thoroughly.
								</p>
							</div>
						</section>
					</div>
					
			
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="how-long-answer" id="how-long-question" itemprop="name">
								How long will this stay in my hair?
							</button>
						</h3>
						<section aria-labelledby="how-long-question" id="how-long-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>
									The product is designed to stay in your hair until you wash it out.
								</p>
							</div>
						</section>
					</div>
					
			
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="stain-hands-answer" id="stain-hands-question" itemprop="name">
								Will this stain my hands?  
							</button>
						</h3>
						<section aria-labelledby="stain-hands-question" id="stain-hands-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>
									We recommend using disposable gloves to protect your manicure, but any color can be removed from your hands with warm soapy water.  And as a bonus, we included 3 pairs of disposable gloves with each bottle sold.
								</p>
							</div>
						</section>
					</div>
				
			
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="drying-time-answer" id="drying-time-question" itemprop="name">
								Will this take a long time to dry once I put the color in my hair?
							</button>
						</h3>
						<section aria-labelledby="drying-time-question" id="drying-time-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>Drying time varies depending on how much product you apply to your hair.  We recommend using a hair dryer to expedite that process.  Once dry, the color is set and won&rsquo;t come out of your hair until you wash it.</p>
							</div>
						</section>
					</div>
	
			
				
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="hair-sticky-answer" id="hair-sticky-question" itemprop="name">
								Will this make my hair sticky like traditional color spray?
							</button>
						</h3>
						<section aria-labelledby="hair-sticky-question" id="hair-sticky-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>No, the beauty of our formula is that once dry, your hair is left soft and brushable. </p>
							</div>
						</section>
					</div>
			
			
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="wet-dry-answer" id="wet-dry-question" itemprop="name">
								Do I apply this to dry or wet hair?
							</button>
						</h3>
						<section aria-labelledby="wet-dry-question" id="wet-dry-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>We recommend applying evenly to thin strands of dry hair and working through.</p>
							</div>
						</section>
					</div>
					
			
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="style-hair-color-answer" id="style-hair-color-question" itemprop="name">
								Can I style my hair with the color in it?
							</button>
						</h3>
						<section aria-labelledby="style-hair-color-question" id="style-hair-color-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>Yes, but we recommend waiting for hair to dry before styling. Drying time will vary depending on how much product is used.</p>
							</div>
						</section>
					</div>
			
			
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="hair-texture-answer" id="hair-texture-question" itemprop="name">
								Will this change my hair texture?
							</button>
						</h3>
						<section aria-labelledby="hair-texture-question" id="hair-texture-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>It shouldn&rsquo;t change hair texture as it remains soft and brushable, but some consumers have noticed it naturally adds some volume.</p>
							</div>
						</section>
					</div>
		
			
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="additional-colors-answer" id="additional-colors-question" itemprop="name">
								Do you offer additional colors?
							</button>
						</h3>
						<section aria-labelledby="additional-colors-question" id="additional-colors-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>Right now, we just have the 4 colors available on <a href="https://www.batistehaircolor.com">www.batistehaircolor.com</a></p>
							</div>
						</section>
					</div>
				
			
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="where-purchase-answer" id="where-purchase-question" itemprop="name">
								Where can I buy these?
							</button>
						</h3>
						<section aria-labelledby="where-purchase-question" id="where-purchase-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>These are currently only available on <a href="https://www.batistehaircolor.com">www.batistehaircolor.com</a></p>
							</div>
						</section>
					</div>
	
			
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="aerosol-answer" id="aerosol-question" itemprop="name">
								Is this product an aerosol?
							</button>
						</h3>
						<section aria-labelledby="aerosol-question" id="aerosol-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>This product is a foaming mousse.</p>
							</div>
						</section>
					</div>
			
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="stain-clothes-answer" id="stain-clothes-question" itemprop="name">
								Will this product stain my clothes?
							</button>
						</h3>
						<section aria-labelledby="stain-clothes-question" id="stain-clothes-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>We recommend throwing a towel over your shoulders to protect your outfit as color may transfer when wet.</p>
							</div>
						</section>
					</div>
			
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="stain-carpet-answer" id="stain-carpet-question" itemprop="name">
								Will this product stain my carpet? 
							</button>
						</h3>
						<section aria-labelledby="stain-carpet-question" id="stain-carpet-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>We recommend placing a towel over the floor or carpet where you are applying color to your hair.  Since floor material and flooring vary greatly, it is a way to protect it.</p>
							</div>
						</section>
					</div>
			
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="strong-fragrance-answer" id="strong-fragrance-question" itemprop="name">
								Does this have a strong fragrance?
							</button>
						</h3>
						<section aria-labelledby="strong-fragrance-question" id="strong-fragrance-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>All of the Batiste 1-Day Express Hair Colors (including Shimmer) have the same light fragrance that is very pleasant and mild.</p>
							</div>
						</section>
					</div>
			
					<div class="card" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
						<h3 class="accordion__header card__header">
							<button class="accordion__button" aria-controls="stain-hair-shades-answer" id="stain-hair-shades-question" itemprop="name">
								Will this stain lighter hair shades (i.e. blonde) and not easily rinse out? 
							</button>
						</h3>
						<section aria-labelledby="stain-hair-shades-question" id="stain-hair-shades-answer" class="card__section accordion__section" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
							<div class="card__content" itemprop="name">
								<p>The formula has been designed to rinse out of all hair types and colors after 1 thorough wash. If any hint of color remains after washing, simply repeat one more time.</p>
							</div>
						</section>
					</div>
	
				</div>
			</div>
		</div>

	</article>
</main>
</asp:Content>