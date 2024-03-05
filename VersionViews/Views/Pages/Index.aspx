<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDB.Navigation" %>
<%@ Import Namespace="CDDB.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<% 
    var sitemap = ViewData["Sitemap"] as NavigationList ?? new Sitemap().SitemapList;
    var order = sitemap.GetItemById("order-now");
    var videos = sitemap.GetItemById("influencers");
%>

<main aria-labelledby="main-title" class="view view--content hero hero--main hero--wave section bg bg--rainbow-inverse">
    <div id="main" class="view__anchor"></div>
    <div class="view__offset hero__in">
        <div class="hero__group hero__product-content">
            <picture class="hero__product contain contain--hero-product">
                <source srcset="/images/batiste.webp" type="image/webp" />
                <img src="/images/batiste.png" alt="Batiste one day express hair color product" width="319" height="723">
            </picture>
            <div class="hero__content">
                <div class="hero__logo contain contain--logo"><svg><use href="#icon-logo"></use></svg></div>
                <div class="hero__standfirst">1-Day Express Hair Color</div>
                <h1 class="hero__headline" id="main-title">Hello Color.</h1>
                <div class="hero__subheadline">Express Yourself Without the Commitment</div>
                <div class="hero__offer">
                    as low as <b class="hero__price">$7 <span class="hero__desc">each</span></b>
                    <div class="hero__shipping">Free Shipping</div>
                </div>
            </div>
            <div class="hero__action hero hero--button-text">
                <div class="hero__group">
                    <!--<a href="<%= order.Page %>" class="hero__button">
                        <svg><use href="#button-buy-now"></use></svg>
                    </a>-->
                    <b class="hero__text">Bundle & Save!</b>
                </div>
            </div>
        </div>
        <picture class="hero__bg contain contain--hero-girls">
            <source srcset="/images/girls-mobile.webp" media="(max-width: 700px)" type="image/webp" />
            <source srcset="/images/girls-updated.webp" media="(min-width: 701px)" type="image/webp" />
            <source srcset="/images/girls-mobile.png" media="(max-width: 700px)" />
            <img src="/images/girls-updated.png" alt="Two girls laughing with dyed hair" width="1156" height="970">
        </picture>
    </div>
    <div class="hero__wave-top contain contain--wave-top">
        <svg><use href="#graphic-wave-top"></use></svg>
    </div>
    <div class="hero__wave-bottom contain contain--wave-bottom">
        <svg><use href="#graphic-wave-bottom"></use></svg>
    </div>
</main>

<section class="view billboard" aria-labelledby="billboard-title">
    <div class="view__anchor" id="billboard"></div>
    <a href="#billboard" class="billboard__button">
        <svg class="icon"><use href="#icon-chevron"></use></svg>
    </a>
    <picture data-src-img="/images/hair-purple.jpg" class="billboard__image-left contain contain--billboard-left">
        <img src="/shared/images/blank.png" alt="" width="814" height="780" />
    </picture>
    <div class="view__in">
        <div class="billboard__title text--angle">
            <h2 class="title title--rainbow text--wrap" id="billboard-title">
                <span>Bold Today,</span>
                <span>Gone Tomorrow</span>
            </h2>
            <h3 class="title-sub color--accent">Rinses Out In Just 1 Wash</h3>
        </div>
    </div>
    <picture data-src-img="/images/hair-green.jpg" class="billboard__image-right contain contain--billboard-right">
        <img src="/shared/images/blank.png" alt="" width="947" height="382" />
    </picture>
</section>

<section class="bg bg--rainbow view text--center" aria-labelledby="yaaas-title">
    <div class="section">
        <div class="section__in midline-title">
            <h2 class="title" id="yaaas-title">Colors That Make You Say Yaaas!</h2>
            <h3 class="title-sub">Streaks, Tips, or Multicolors... How Bold Will You Go?</h3>
        </div>
    </div>
    <div class="view product-wrapper">
        <div class="view__anchor" id="products"></div>
        <div class="view product product--teal">
            <div class="view__anchor" id="deep-teal"></div>
            <picture data-src-img="/images/items/deep-teal.png" class="product__image contain contain--product">
                <img src="/shared/images/blank.png" alt="Deep Teal" width="265" height="630" />
            </picture>
            <div class="product__copy">
                <div class="product__title">Deep Teal</div>
                <div class="product__desc">A dark emerald green</div>
                <!--<a href="<%= order.Page %>" class="product__button button">Buy Now</a>-->
            </div>
        </div>
        <div class="view product product--violet">
            <div class="view__anchor" id="wild-violet"></div>
            <picture data-src-img="/images/items/wild-violet.png" class="product__image contain contain--product">
                <img src="/shared/images/blank.png" alt="Wild Violet" width="265" height="630" />
            </picture>
            <div class="product__copy">
                <div class="product__title">Wild Violet</div>
                <div class="product__desc">An electric rich purple</div>
                <div class="product__button product__oos button">Out of Stock</div>
            </div>
        </div>
        <div class="view product product--rose">
            <div class="view__anchor" id="rose-quartz"></div>
            <picture data-src-img="/images/items/rose-quartz.png" class="product__image contain contain--product">
                <img src="/shared/images/blank.png" alt="Rose Quartz" width="265" height="630" />
            </picture>
            <div class="product__copy">
                <div class="product__title">Rose Quartz</div>
                <div class="product__desc">A soft delicate pink</div>
                <div class="product__button product__oos button">Out of Stock</div>
            </div>
        </div>
        <div class="view product product--stardust">
            <div class="view__anchor" id="stardust-shimmer"></div>
            <picture data-src-img="/images/items/stardust.png" class="product__image contain contain--product">
                <img src="/shared/images/blank.png" alt="Rose Quartz" width="265" height="630" />
            </picture>
            <div class="product__copy">
                <div class="product__title text--shadow">Stardust Shimmer</div>
                <div class="product__desc text--shadow">A light sheen sparkle</div>
               <!-- <a href="<%= order.Page %>" class="product__button button">Buy Now</a>-->
            </div>
        </div>
    </div>
</section>

<section class="view bg bg--rainbow step step--main section" aria-labelledby="steps-title" id="directions">
    <div class="section__in step__in">
        <h2 class="title step__title" id="steps-title">3 Steps to Tinted Tresses</h2>
        <div class="step__group">
            <figure class="step__figure">
                <div class="step__content">
                    <picture data-src-img="/images/graphic-shake.svg" data-attr='{ "alt" : "Shaking bottle" }' class="contain contain--g-shake"></picture>
                    <figcaption>
                        Shake &amp; Dispense
                    </figcaption>
                </div>
            </figure>
            <figure class="step__figure">
                <div class="step__content">
                    <picture data-src-img="/images/graphic-comb.svg" data-attr='{ "alt" : "Combing through hair" }' class="contain contain--g-comb"></picture>
                    <figcaption>
                        Distribute Evenly
                    </figcaption>
                </div>
            </figure>
            <figure class="step__figure">
                <div class="step__content">
                    <picture data-src-img="/images/graphic-clock.svg" data-attr='{ "alt" : "Timer" }' class="contain contain--g-clock"></picture>
                    <figcaption>
                        Style &amp; Go!
                    </figcaption>
                </div>
            </figure>
            <div class="step__footer">
                <% var instructions = sitemap.GetItemById("instructions"); %>
                <a href="<%= instructions.Page %>" class="step__button button button--color-extra">View Full Directions</a>
            </div>
        </div>
    </div>
</section>

<section class="view section before-after" aria-labelledby="ba-title" id="before-and-after">
    <div class="view__in">
        <h2 class="title before-after__title" id="ba-title">Before and After</h2>
        <div class="before-after__content">
            <div class="slide slide--before-after">
                <div id="carousel-before-after" class="slide__into" data-slide-config='{ "steps" : 1 }'>
                    <div class="slide__item">
                        <figure class="before-after__figure color-teal">
                            <picture data-src-img="/images/ba-1.jpg" class="contain contain--ba">
                                <img src="/shared/images/blank.png" width="540" height="537" alt="Before and after look of the deep teal dye" />
                            </picture>
                            <figcaption>Deep Teal</figcaption>
                        </figure>
                    </div>
                    <div class="slide__item">
                        <figure class="before-after__figure color-rose">
                            <picture data-src-img="/images/ba-2.jpg" class="contain contain--ba">
                                <img src="/shared/images/blank.png" width="540" height="537" alt="Before and after look of the rose quartz dye" />
                            </picture>
                            <figcaption>Rose Quartz</figcaption>
                        </figure>
                    </div>
                    <div class="slide__item">
                        <figure class="before-after__figure color-stardust">
                            <picture data-src-img="/images/ba-3.jpg" class="contain contain--ba">
                                <img src="/shared/images/blank.png" width="540" height="537" alt="Before and after look of the stardust shimmer dye" />
                            </picture>
                            <figcaption>Stardust Shimmer</figcaption>
                        </figure>
                    </div>
                    <div class="slide__item">
                        <figure class="before-after__figure color-violet">
                            <picture data-src-img="/images/ba-4.jpg" class="contain contain--ba">
                                <img src="/shared/images/blank.png" width="540" height="537" alt="Before and after look of the wild violet dye" />
                            </picture>
                            <figcaption>Wild Violet</figcaption>
                        </figure>
                    </div>
                </div>
                <nav class="slide__nav slide__nav--persist">
                    <button
                        aria-label="Select the previous slide"
                        class="slide__prev"
                        type="button"
                    >
                        <svg class="icon"><use href="#icon-chevron"></use></svg>
                    </button>
                    <button
                        aria-label="Select the next slide"
                        class="slide__next"
                        type="button"
                    >
                        <svg class="icon"><use href="#icon-chevron"></use></svg>
                    </button>
                </nav>
            </div>
        </div>
        <div class="before-after__content">
            <small class="text--disclaimer">Results may vary depending on different hair colors.</small>
        </div>
    </div>
</section>

<section class="view difference section bg bg--purple-to-teal" aria-labelledby="difference-title" id="difference">
    <div class="view__in">
        <div class="difference__copy">
            <h2 class="title color-pop difference__title" id="difference-title">The Batiste<span class="trademark">&trade;</span> Difference</h2>
            <ul class="list list--checkmarks difference__list">
                <li>Easy no-drip mousse</li>
                <li>Leaves hair soft, brushable and not sticky</li>
                <li>Light fresh scent</li>
                <li>Works on all hair colors and textures</li>
                <li>Bold color stays in all day</li>
                <li>Rinses away in just 1 wash</li>
                <li>Ammonia and peroxide free</li>
            </ul>
            <% var faq = sitemap.GetItemById("faq"); %>
            <div class="playlist">
                <a href="<%= faq.Page %>" class="difference__button">
                    <svg><use href="#button-view-faqs"></use></svg>
                </a>
                <a href="<%= videos.Page %>" class="difference__button difference__button--video">
                    <svg><use href="#button-view-videos"></use></svg>
                </a>
            </div>
        </div>
        <picture data-src-img="/images/girl-with-glasses.png" class="difference__image contain contain--girl-with-glasses" data-tag='{ "source" : [{ "srcset" : "/images/girl-with-glasses.webp", "type" : "image/webp" }]}'>
            <img src="/shared/images/blank.png" alt="Girl with red tipped braids and round sunglasses" width="886" height="957" />
        </picture>
    </div>
</section>

<section class="section view bundle" aria-labelledby="bundle-title">
    <div class="view__anchor" id="bundles"></div>
    <div class="view__in">
        <h2 class="bundle__title title color-dull">Bundle &amp; Save</h2>
        <h3 class="bundle__subtitle title-sub color-dull">Because It's More Fun Than Just One</h3>
        <div class="bundle__group">
            <div class="bundle__item color-primary">
                <figure class="bundle__box">
                    <picture data-src-img="/images/batiste-contour.svg" class="contain contain--batiste-contour">
                        <img src="/shared/images/blank.png" width="46" height="176" alt="">
                    </picture>
                    <figcaption class="bundle__caption">Glow Up</figcaption>
                </figure>
                <div class="bundle__copy">
                    Pick Any Color <b>for $9</b>
                </div>
            </div>
            <div class="bundle__item color-violet">
                <figure class="bundle__box">
                    <picture data-src-img="/images/batiste-contour.svg" class="contain contain--batiste-contour">
                        <img src="/shared/images/blank.png" width="46" height="176" alt="">
                    </picture>
                    <span class="bundle__plus">+</span>
                    <picture data-src-img="/images/batiste-contour.svg" class="contain contain--batiste-contour">
                        <img src="/shared/images/blank.png" width="46" height="176" alt="">
                    </picture>
                    <figcaption class="bundle__caption">Live Out Loud</figcaption>
                </figure>
                <div class="bundle__copy">
                    Pick Any 2 Colors <b>for <span class="bundle__markdown">$9</span> <span class="bundle__offer">$8 ea.</span></b>
                </div>
            </div>
            <div class="bundle__item color-vibrant">
                <figure class="bundle__box">
                    <picture data-src-img="/images/batiste-contour.svg" class="contain contain--batiste-contour">
                        <img src="/shared/images/blank.png" width="46" height="176" alt="">
                    </picture>
                    <span class="bundle__plus">+</span>
                    <picture data-src-img="/images/batiste-contour.svg" class="contain contain--batiste-contour">
                        <img src="/shared/images/blank.png" width="46" height="176" alt="">
                    </picture>
                    <span class="bundle__plus">+</span>
                    <picture data-src-img="/images/batiste-contour.svg" class="contain contain--batiste-contour">
                        <img src="/shared/images/blank.png" width="46" height="176" alt="">
                    </picture>
                    <span class="bundle__plus">+</span>
                    <picture data-src-img="/images/batiste-contour-shimmer.svg" class="contain contain--batiste-contour">
                        <img src="/shared/images/blank.png" width="46" height="176" alt="">
                    </picture>
                    <figcaption class="bundle__caption">Anything But Basic</figcaption>
                </figure>
                <div class="bundle__copy">
                    Pick Any 3 Colors + <span class="bundle__text-promo-code">FREE Shimmer <small>Use Code: FREESHIMMER</small></span> <b>for <span class="bundle__markdown">$9</span> <span class="bundle__offer">$7 ea.</span></b>
                </div>
            </div>
        </div>
        <!--<a href="<%= order.Page %>" class="bundle__button">
            <svg><use href="#button-shop-now"></use></svg>
        </a>-->
    </div>
</section>

<section class="section view bg bg--rainbow text--center testimonial" aria-labelledby="testimonials-title">
    <div class="view__anchor" id="testimonials"></div>
    <div class="view__in section__frame">
        <h2 id="testimonials-title" class="title testimonial__title">Testimonials</h2>
        <div class="slide slide--testimonial testimonial__content">
            <div id="carousel-testimonials" class="slide__into testimonial__into">
                <figure class="slide__item">
                    <blockquote>Batiste is the best! Being able to have a fun trendy color in my hair for a hot minute is amazing. So impressed that it immediately washes out and isn't a hassle to get out.</blockquote>
                    <figcaption>- Maddie M.</figcaption>
                </figure>
                <figure class="slide__item">
                    <blockquote>I am so impressed that I was able to spray this in and the color was so bright and didn't drip or run. The part I liked the best was being able to brush through my hair and it wasn't sticky and could still style it. Definitely going to buy more colors. LOVE IT!!!</blockquote>
                    <figcaption>- Jules S.</figcaption>
                </figure>
                <figure class="slide__item">
                    <blockquote>Colors are awesome and the shimmer really is GoRgEoUs! A must have. Going to make a great holiday gift for my friends!</blockquote>
                    <figcaption>- Abbie F.</figcaption>
                </figure>
            </div>

            <nav class="slide__nav">
                <button
                    aria-label="Select the previous slide"
                    class="slide__prev testimonial__prev"
                    type="button"
                >
                    <svg class="icon icon-chevron"><use href="#icon-chevron"></use></svg>
                </button>
                <button
                    aria-label="Select the next slide"
                    class="slide__next testimonial__next"
                    type="button"
                >
                    <svg class="icon icon-chevron"><use href="#icon-chevron"></use></svg>
                </button>
            </nav>
        </div>
    </div>
</section>

<section class="view influencer section" aria-labelledby="get-colored-title">
    <div class="view__anchor" id="influencer"></div>
    <div class="bg bg--rainbow bg--rainbow--reverse bg--spacer"></div>
    <div class="view__in">
        <div class="influencer__header">
            <h2 class="title title--rainbow influencer__title" id="get-colored-title">Get #ColoredByBatiste</h2>
            <h3 class="title-sub color--dull">Because if you didn't post about it, did it really happen?</h3>
            <div class="influencer__link-container">
                <a href="<%= videos.Page %>" class="influencer__link button button--color-accent">
                    <span>Watch Videos</span>
                </a>
            </div>
        </div>
        <div class="influencer__content">
            <div class="slide slide--influencer">
                <div id="carousel-influencer" class="slide__into">
                    <div class="slide__item">
                        <picture data-src-img="/images/influencers/1.jpg" class="contain contain--influencer">
                            <img src="/shared/images/blank.png" width="608" height="1080" alt="" />
                        </picture>
                    </div>
                    <div class="slide__item">
                        <picture data-src-img="/images/influencers/2.jpg" class="contain contain--influencer">
                            <img src="/shared/images/blank.png" width="608" height="1080" alt="" />
                        </picture>
                    </div>
                    <div class="slide__item">
                        <picture data-src-img="/images/influencers/3.jpg" class="contain contain--influencer">
                            <img src="/shared/images/blank.png" width="608" height="1080" alt="" />
                        </picture>
                    </div>
                    <div class="slide__item">
                        <picture data-src-img="/images/influencers/5.jpg" class="contain contain--influencer">
                            <img src="/shared/images/blank.png" width="608" height="1080" alt="" />
                        </picture>
                    </div>
                    <div class="slide__item">
                        <picture data-src-img="/images/influencers/4.jpg" class="contain contain--influencer">
                            <img src="/shared/images/blank.png" width="608" height="1080" alt="" />
                        </picture>
                    </div>
                    <div class="slide__item">
                        <picture data-src-img="/images/influencers/6.jpg" class="contain contain--influencer">
                            <img src="/shared/images/blank.png" width="608" height="1080" alt="" />
                        </picture>
                    </div>
                    <div class="slide__item">
                        <picture data-src-img="/images/influencers/7.jpg" class="contain contain--influencer">
                            <img src="/shared/images/blank.png" width="608" height="1080" alt="" />
                        </picture>
                    </div>
                </div>
                <nav class="slide__nav slide__nav--persist">
                    <button
                        aria-label="Select the previous slide"
                        class="slide__prev"
                        type="button"
                    >
                        <svg class="icon"><use href="#icon-chevron"></use></svg>
                    </button>
                    <button
                        aria-label="Select the next slide"
                        class="slide__next"
                        type="button"
                    >
                        <svg class="icon"><use href="#icon-chevron"></use></svg>
                    </button>
                </nav>
            </div>
        </div>
    </div>
    <!--<a href="<%= order.Page %>" class="influencer__button">
        <svg><use href="#button-shop-now"></use></svg>
    </a>-->
</section>

<span class="svg-symbols">
    <svg>
       <!-- <symbol id="button-buy-now" x="0px" y="0px" viewBox="0 0 301.4 147.1">
            <style type="text/css">
	            #button-buy-now .st0 {
                    fill:#7FE4F1;
	            }

	            #button-buy-now .st1 {
                    fill:#A273E7;
	            }

                #button-buy-now text {
                    letter-spacing: 1.1px;
                    fill: white;
                    font: 800 63px/1 futura-pt-condensed, futura-pt, sans-serif;
                }
            </style>
            <g>
	            <g>
		            <polygon class="st0" points="6.3,33.2 6.3,147.1 301.4,119.3 301.4,4.9"/>
		            <polygon class="st1" points="0,28.3 0,142.2 295,114.4 295,0"/>
	            </g>
	            <text transform="matrix(0.9139 -9.156229e-02 1.621000e-02 0.9999 38.2489 102.2231)">BUY NOW</text>
            </g>
        </symbol>-->
        <symbol id="button-view-faqs" x="0px" y="0px" viewBox="0 0 314.5 151.4">
            <style type="text/css">
	            #button-view-faqs .st0{
                    fill:#FFF450;
	            }

                #button-view-faqs .st1 {
                    fill: #EF51C6;
                }

                #button-view-faqs text {
                    fill: white;
                    font: 800 55px/1 futura-pt-condensed, futura-pt, sans-serif;
                    text-transform: uppercase;
                }
            </style>
            <g>
	            <polygon class="st0" points="9.4,37.6 9.4,151.4 314.5,123.6 314.5,9.2 	"/>
	            <polygon class="st1" points="0,28.3 0,142.2 305.1,114.4 305.1,0 	"/>
	            <text transform="matrix(0.9139 -9.156229e-02 1.621000e-02 0.9999 48.1402 97.8576)">View FAQs</text>
            </g>
        </symbol>
        <symbol id="button-view-videos" x="0px" y="0px" viewBox="0 0 344.5 151.4">
            <style type="text/css">
	            #button-view-videos .st0{
                    fill:#FFF450;
	            }

                #button-view-videos .st1 {
                    fill: #EF51C6;
                }

                #button-view-videos text {
                    fill: white;
                    font: 800 55px/1 futura-pt-condensed, futura-pt, sans-serif;
                    text-transform: uppercase;
                }
            </style>
            <g>
	            <polygon class="st0" points="9.4,37.6 9.4,151.4 344.5,123.6 344.5,9.2 	"/>
	            <polygon class="st1" points="0,28.3 0,142.2 335.1,114.4 335.1,0 	"/>
	            <text transform="matrix(0.9139 -9.156229e-02 1.621000e-02 0.9999 48.1402 97.8576)">View Videos</text>
            </g>
        </symbol>
        <!--<symbol id="button-shop-now" x="0px" y="0px" viewBox="0 0 299.1 136.2">
            <style type="text/css">
                #button-shop-now .st0{
                    fill:#7FE4F1;
                }

                #button-shop-now .st1{
                    fill:#016471;
                }
                
                #button-shop-now text {
                    fill: white;
                    font: 800 55px/1 futura-pt-condensed, futura-pt, sans-serif;
                    text-transform: uppercase;
                }
            </style>
            <g>
                <g>
                    <polygon class="st0" points="6.4,32.8 8.1,136.2 300,106.2 298.3,2.3"/>
                    <polygon class="st1" points="0,29.1 1.6,127.3 290.9,98.6 289.3,0"/>
                </g>
                <text transform="matrix(0.9126 -0.1041 2.992000e-02 0.9996 39.5788 91.7896)" class="st2 st3 st4">SHOP NOW</text>
            </g>
        </symbol>-->
    </svg>
</span>

<nav aria-label="Quick actions and areas of interest" class="fp-nav">
    <!--<a href="<%= order.Page %>" class="fp-nav__a fp-nav__a--order">
        <span>Buy<br>Now</span>
    </a>-->
    <a href="<%= videos.Page %>" class="fp-nav__a">
        <span>Videos</span>
    </a>
</nav>

</asp:Content>