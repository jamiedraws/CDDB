<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDB.Navigation" %>
<%@ Import Namespace="CDDB.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<% 
    Func<string, string> renderProductColorCarousel = ((id) =>
    {
        var template = @"<div class=""slide slide--fade slide--product-color"">
            <div id=""{{Id}}"" class=""slide__into"">
                <div class=""slide__item slide__item--current"" data-product-name=""default"">
                    <picture data-src-img=""/images/batiste-contour.svg"" class=""contain contain--product-default"">
                        <img src=""/shared/images/blank.png"" width=""265"" height=""630"" alt="""">
                    </picture>
                </div>
                <div class=""slide__item"" data-product-name=""deep-teal"">
                    <picture data-src-img=""/images/items/deep-teal.png"" class=""contain contain--product-color"">
                        <img src=""/shared/images/blank.png"" width=""265"" height=""630"" alt=""Deep Teal"">
                    </picture>
                </div>
                <div class=""slide__item"" data-product-name=""wild-violet"">
                    <picture data-src-img=""/images/items/wild-violet.png"" class=""contain contain--product-color"">
                        <img src=""/shared/images/blank.png"" width=""265"" height=""630"" alt=""Wild Violet"">
                    </picture>
                </div>
                <div class=""slide__item"" data-product-name=""rose-quartz"">
                    <picture data-src-img=""/images/items/rose-quartz.png"" class=""contain contain--product-color"">
                        <img src=""/shared/images/blank.png"" width=""265"" height=""630"" alt=""Deep Teal"">
                    </picture>
                </div>
                <div class=""slide__item"" data-product-name=""stardust-shimmer"">
                    <picture data-src-img=""/images/items/stardust.png"" class=""contain contain--product-color"">
                        <img src=""/shared/images/blank.png"" width=""265"" height=""630"" alt=""Deep Teal"">
                    </picture>
                </div>
            </div>
        </div>";

        template = template.Replace("{{Id}}", id);

        return template;
    });    
%>

<main aria-label="Order and Checkout" class="view form form--container section">
    <div id="main" class="view__anchor"></div>
    <div class="view__in form__in section__in">
        <form autcomplete="on" action="/<%=DtmContext.OfferCode %>/<%=DtmContext.Version %>/<%=DtmContext.PageCode %><%=DtmContext.ApplicationExtension %>" method="post">
            <div class="form__group form__group-section">
                <div class="form__span-item">
      
                    <div id="ActionCodeDiv"></div>
                    <script>_AdaErrors = true;</script>
                    <div id="vse-errors" class="view__anchor"></div>
                    <div role="alert" class="vse" data-vse-scroll>
                        <%= Html.ValidationSummary("The following errors have occurred:") %>
                    </div>

                    <div class="bundle bundle--order">
                        <h2 class="bundle__title title color-dull">Bundle &amp; Save</h2>
                        <h3 class="bundle__subtitle title-sub color-dull">Because It's More Fun Than Just One</h3>
                    </div>

                    <div class="form form--framez">
                        <div class="form__fieldset">
                            <h2 class="form__title">STEP 1: Select your offer</h2>
                            <div class="form__frame">
                                <div class="bundle bundle--order">
                        <div class="bundle__group">
                            <div class="bundle__item color-primary">
                                <div class="bundle__box">
                                    <div class="form__checkbox-label bundle__checkbox-label">
                                        <input
                                            type="radio"
                                            id="glowUpRadio"
                                            name="bundle"
                                            required
                                            value="glow"
                                            aria-labelledby="glowUpRadioLabel" />
                                        <label for="glowUpRadio" class="form__label">
                                            <span class="form__checkbox"></span>
                                            <span id="glowUpRadioLabel" class="bundle__label-text">
                                                <span class="bundle__caption">Glow Up</span>
                                                <span class="bundle__copy">
                                                    Pick Any Color <b>for $9</b>
                                                </span>
                                            </span>
                                        </label>
                                        <div class="message__group" role="alert">
                                            <span class="message__invalid">Please choose a bundle</span>
                                        </div>
                                    </div>
                                    <div class="bundle__image-dropdown-group">
                                        <div class="bundle__group">
                                            <div class="bundle__image-dropdown">
                                                <div class="bundle__image">
                                                    <%= renderProductColorCarousel("carousel-glow-up") %>
                                                </div>
                                                <div class="form__field-label bundle__dropdown">
                                                    <div class="form form--select">
                                                        <div class="form__contain">
                                                            <select name="colorSelectedGlow" id="glowColorSelected" class="form__field colorSelected" required>
                                                                <option value="0" hidden data-slide-index="0">Select Color</option>
                                                                <option value="T" data-slide-index="1">Deep Teal</option>
                                                                <option value="V" data-slide-index="2" disabled>Wild Violet(Out Of Stock)</option>
                                                                <option value="R" data-slide-index="3" disabled>Rose Quartz(Out Of Stock)</option>
                                                                <option value="S" data-slide-index="4">Stardust Shimmer</option>
                                                            </select>
                                                            <span class="form__field form__button">
                                                                <svg class="icon icon--combobox">
                                                                    <use href="#icon-combobox"></use>
                                                                </svg>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bundle__item color-violet">
                                <div class="bundle__box">
                                    <div class="form__checkbox-label bundle__checkbox-label">
                                        <input
                                            type="radio"
                                            id="liveOutLoudRadio"
                                            name="bundle"
                                            value="live"
                                            required
                                            aria-labelledby="liveOutLoudRadioLabel" />
                                        <label for="liveOutLoudRadio" class="form__label">
                                            <span class="form__checkbox"></span>
                                            <span id="liveOutLoudRadioLabel" class="bundle__label-text">
                                                <span class="bundle__caption">Live Out Loud</span>
                                                <span class="bundle__copy">
                                                    Pick Any 2 Colors <b>for <span class="bundle__markdown">$9</span> <span class="bundle__offer">$8 ea.</span></b>
                                                </span>
                                            </span>
                                        </label>
                                        <div class="message__group" role="alert">
                                            <span class="message__invalid">Please choose a bundle</span>
                                        </div>
                                    </div>
                                    <div class="bundle__image-dropdown-group">
                                        <div class="bundle__group">
                                            <div class="bundle__image-dropdown">
                                                <div class="bundle__image">
                                                    <%= renderProductColorCarousel("carousel-live-out-loud-A") %>
                                                </div>
                                                <div class="form__field-label bundle__dropdown">
                                                    <div class="form form--select">
                                                        <div class="form__contain">
                                                            <select name="liveColorSelected1" id="liveColorSelected1" class="form__field colorSelected" required>
                                                                <option value="0" hidden data-slide-index="0">Select Color</option>
                                                                <option value="T2" data-slide-index="1">Deep Teal</option>
                                                                <option value="V2" data-slide-index="2" disabled>Wild Violet(Out Of Stock)</option>
                                                                <option value="R2" data-slide-index="3" disabled>Rose Quartz(Out Of Stock)</option>
                                                                <option value="S2" data-slide-index="4">Stardust Shimmer</option>
                                                            </select>
                                                            <span class="form__field form__button">
                                                                <svg class="icon icon--combobox">
                                                                    <use href="#icon-combobox"></use>
                                                                </svg>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="bundle__image-dropdown">
                                                <div class="bundle__image">
                                                    <%= renderProductColorCarousel("carousel-live-out-loud-B") %>
                                                </div>
                                                <div class="form__field-label bundle__dropdown">
                                                    <div class="form form--select">
                                                        <div class="form__contain">
                                                            <select name="liveColorSelected2" id="liveColorSelected2" class="form__field colorSelected" required>
                                                                <option value="0" hidden data-slide-index="0">Select Color</option>
                                                                <option value="T2" data-slide-index="1">Deep Teal</option>
                                                                <option value="V2" data-slide-index="2" disabled>Wild Violet(Out Of Stock)</option>
                                                                <option value="R2" data-slide-index="3" disabled>Rose Quartz(Out Of Stock)</option>
                                                                <option value="S2" data-slide-index="4">Stardust Shimmer</option>
                                                            </select>
                                                            <span class="form__field form__button">
                                                                <svg class="icon icon--combobox">
                                                                    <use href="#icon-combobox"></use>
                                                                </svg>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bundle__item color-vibrant">
                                <div class="bundle__box">
                                    <div class="form__checkbox-label bundle__checkbox-label">
                                        <input
                                            type="radio"
                                            id="anythingButBasicRadio"
                                            name="bundle"
                                            required
                                            value="anything"
                                            aria-labelledby="anythingButBasicRadioLabel" />
                                        <label for="anythingButBasicRadio" class="form__label">
                                            <span class="form__checkbox"></span>
                                            <span id="anythingButBasicRadioLabel" class="bundle__label-text">
                                                <span class="bundle__caption">Anything But Basic</span>
                                                <span class="bundle__copy">
                                                    Pick Any 3 Colors + FREE Shimmer <b>for <span class="bundle__markdown">$9</span> <span class="bundle__offer">$7 ea.</span></b>
                                                </span>
                                            </span>
                                        </label>
                                        <div class="bundle__banner">
                                            <b>Best Deal!</b> <span>42% Savings</span>
                                        </div>
                                    </div>
                                    <div class="bundle__image-dropdown-group">
                                        <div class="bundle__group">
                                            <div class="bundle__image-dropdown">
                                                <div class="bundle__image">
                                                    <%= renderProductColorCarousel("carousel-anything-but-basic-A") %>
                                                </div>
                                                <div class="form__field-label bundle__dropdown">
                                                    <div class="form form--select">
                                                        <div class="form__contain">
                                                            <select name="anythingColorSelected1" id="anythingColorSelected1" class="form__field colorSelected" required>
                                                                <option value="0" hidden data-slide-index="0">Select Color</option>
                                                                <option value="T3" data-slide-index="1">Deep Teal</option>
                                                                <option value="V3" data-slide-index="2" disabled>Wild Violet(Out Of Stock)</option>
                                                                <option value="R3" data-slide-index="3" disabled>Rose Quartz(Out Of Stock)</option>
                                                                <option value="S3" data-slide-index="4">Stardust Shimmer</option>
                                                            </select>
                                                            <span class="form__field form__button">
                                                                <svg class="icon icon--combobox">
                                                                    <use href="#icon-combobox"></use>
                                                                </svg>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="bundle__image-dropdown">
                                                <div class="bundle__image">
                                                    <%= renderProductColorCarousel("carousel-anything-but-basic-B") %>
                                                </div>
                                                <div class="form__field-label bundle__dropdown">
                                                    <div class="form form--select">
                                                        <div class="form__contain">
                                                            <select name="anythingColorSelected2" id="anythingColorSelected2" class="form__field colorSelected" required>
                                                                <option value="0" hidden data-slide-index="0">Select Color</option>
                                                                <option value="T3" data-slide-index="1">Deep Teal</option>
                                                                <option value="V3" data-slide-index="2" disabled>Wild Violet(Out Of Stock)</option>
                                                                <option value="R3" data-slide-index="3" disabled>Rose Quartz(Out Of Stock)</option>
                                                                <option value="S3" data-slide-index="4">Stardust Shimmer</option>
                                                            </select>
                                                            <span class="form__field form__button">
                                                                <svg class="icon icon--combobox">
                                                                    <use href="#icon-combobox"></use>
                                                                </svg>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="bundle__image-dropdown">
                                                <div class="bundle__image">
                                                    <%= renderProductColorCarousel("carousel-anything-but-basic-C") %>
                                                </div>
                                                <div class="form__field-label bundle__dropdown">
                                                    <div class="form form--select">
                                                        <div class="form__contain">
                                                            <select name="anythingColorSelected3" id="anythingColorSelected3" class="form__field colorSelected" required>
                                                                <option value="0" hidden data-slide-index="0">Select Color</option>
                                                                <option value="T3" data-slide-index="1">Deep Teal</option>
                                                                <option value="V3" data-slide-index="2" disabled>Wild Violet(Out Of Stock)</option>
                                                                <option value="R3" data-slide-index="3" disabled>Rose Quartz(Out Of Stock)</option>
                                                                <option value="S3" data-slide-index="4">Stardust Shimmer</option>
                                                            </select>
                                                            <span class="form__field form__button">
                                                                <svg class="icon icon--combobox">
                                                                    <use href="#icon-combobox"></use>
                                                                </svg>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <figure class="bundle__image-caption">
                                                <div class="bundle__image">
                                                    <div class="slide slide--product-color">
                                                        <div id="carousel-stardust-shimmer" class="slide__into">
                                                            <div class="slide__item" data-product-name="stardust-shimmer">
                                                                <picture data-src-img="/images/items/stardust.png" class="contain contain--product-color">
                                                                    <img src="/shared/images/blank.png" width="265" height="630" alt="Deep Teal">
                                                                </picture>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <figcaption class="bundle__product-caption">
                                                    <b>FREE</b> <span>
                                                        Stardust Shimmer
                                                        <small>With Code <b>FREESHIMMER</b></small>
                                                    </span>
                                                </figcaption>
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form__span-item form form--frame">
                    <div class="form__fieldset">
                        <h2 class="form__title">Step 2: Enter promo code</h2>
                        <div class="form__frame">
                            <div class="form__field-label form__field-label-button">
                                <label for="promoCode" class="message__label">Promo Code</label>
                                <input type="text" name="promoCode" id="promoCode" class="dtm__restyle form__field ddlPromo cartParam">
                                <button type="button" class="button button--color-extra ddlPromoButton" id="promoCodeButton">
                                    <span>Apply Code</span>
                                </button>
                                <span class="message__group" role="alert">
                                    <span id="errorMessage" class="message__invalid">
                                        Please enter a valid promo code.
                                    </span>
                                    <span id="successMessage" class="message__valid">
                                        Thank you! Your promo code was successfully applied.
                                    </span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form__span-item form form--frame">
                    <div class="form__fieldset">
                        <h2 class="form__title reviewOrderTitle">Step 3: Review your order</h2>
                        <div class="c-brand--form order-table reviewTable form__frame">
                            <% Html.RenderPartial("OrderFormReviewTable"); %>
                        </div>
                    </div>
                </div>
                <div class="form__span-item form__message"><span class="form__error">*</span> Indicates Required Field</div>

                <div class="form__item">
                    <div class="form__group-section">
                        <div class="form__item form__section" data-viewport>
                            <div class="view__scroll form form--frame">
                                <fieldset class="form__fieldset">
                                    <h2 class="form__title paymentFormTitle">Step 4: Enter your payment information</h2>
                                    <div class="form__frame">
                                        <!-- Card Type -->
                                        <div class="form__span-item form message">
                                            <div class="form__group">
                                                <div id="cc" class="form__group form__payment-icons"></div>
                                            </div>
                                            <%
                                                var cardTypeMessage = Html.ValidationMessageFor(m => m.CardType);
                                                var cardTypeIsInvalid = cardTypeMessage != null;
                                            %>
                                            <div id="CardTypeCt" class="form__field-label">
                                                <div class="form form--select">
                                                    <div class="form__contain">
                                                        <%= Html.DropDownList("CardType", new[]
                                                            {
                                                                new SelectListItem { Text = "Visa", Value = "V"},
                                                                new SelectListItem { Text = "Mastercard", Value = "M"},
                                                                new SelectListItem { Text = "Discover", Value = "D"},
                                                                new SelectListItem { Text = "American Express", Value= "AX"}
                                                            }, new { @class = "form__field dtm__restyle" })
                                                        %>
                                                        <span class="form__field form__button">
                                                            <svg class="icon icon--combobox">
                                                                <use href="#icon-combobox"></use>
                                                            </svg>
                                                        </span>
                                                    </div>
                                                </div>
                                                <label class="message__group" for="CardType" role="alert">
                                                    <span class="message__label">
                                                        <span class="form__error">* </span>Card Type
                                                    </span>
                                                    <span class="message__invalid">
                                                        <% if (cardTypeIsInvalid)
                                                        { %>
                                                        <%= cardTypeMessage %>
                                                        <% }
                                                        else
                                                        { %>
                                                            Please choose a card type.
                                                        <% } %>
                                                    </span>
                                                </label>
                                            </div>
                                        </div>

                                        <div id="CardNumberCt" class="form__span-item">
                                            <div class="form__group" id="paymentInformation">
                                                <div role="alert" id="vse-payment" data-vse-scroll></div>
                                                <!-- Card Number -->
                                                <div class="form__span-item form message">
                                                    <%
                                                        var cardNumberMessage = Html.ValidationMessageFor(m => m.CardNumber);
                                                        var cardNumberIsInvalid = cardNumberMessage != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <input type="tel" name="CardNumber" id="CardNumber" placeholder="Card Number" data-required="true" data-validationtype="card" class="dtm__restyle form__field <%= cardNumberIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["CardNumber"] %>">
                                                        <label for="CardNumber" class="message__label">
                                                            <span class="form__error">* </span>Card Number
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (cardNumberIsInvalid)
                                                                { %>
                                                                <%= cardNumberMessage %>
                                                                <% }
                                                                else
                                                                { %>
                                                                    Please enter a valid card number.
                                                                <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- Card Expiration Month -->
                                                <div id="CardExpirationCt" class="form message">
                                                    <%
                                                        var cardExpirationMonthMessage = Html.ValidationMessageFor(m => m.CardExpirationMonth);
                                                        var cardExpirationMonthIsInvalid = cardExpirationMonthMessage != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <div class="form form--select">
                                                            <div class="form__contain">
                                                                <%= Html.CardExpirationMonth("CardExpirationMonth", new { @id="CardExpirationMonth", @class = "form__field dtm__restyle", @data_required="true", @data_validationtype="cardExp", @data_parent="CardExpirationCt" }) %>
                                                                <span class="form__field form__button">
                                                                    <svg class="icon icon--combobox">
                                                                        <use href="#icon-combobox"></use>
                                                                    </svg>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <label for="CardExpirationMonth" class="message__label">
                                                            <span class="form__error">* </span>Card Expiration Month
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (cardExpirationMonthIsInvalid)
                                                                { %>
                                                                <%= cardExpirationMonthMessage %>
                                                                <% }
                                                                else
                                                                { %>
                                                                    Please choose an expiration month.
                                                                <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- Card Expiration Year -->
                                                <div id="CardExpirationYearCt" class="form message">
                                                    <%
                                                        var cardExpirationYearMessage = Html.ValidationMessageFor(m => m.CardExpirationYear);
                                                        var cardExpirationYearIsInvalid = cardExpirationYearMessage != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <div class="form form--select">
                                                            <div class="form__contain">
                                                                <%= Html.NumericDropDown("CardExpirationYear", DateTime.Now.Year, DateTime.Now.Year + 10, ViewData["CardExpirationYear"], new { @id="CardExpirationYear", @class = "form__field dtm__restyle" }) %>
                                                                <span class="form__field form__button">
                                                                    <svg class="icon icon--combobox">
                                                                        <use href="#icon-combobox"></use>
                                                                    </svg>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <label for="CardExpirationYear" class="message__label">
                                                            <span class="form__error">* </span>Card Expiration Year
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (cardExpirationYearIsInvalid)
                                                                { %>
                                                                <%= cardExpirationYearMessage %>
                                                                <% }
                                                                else
                                                                { %>
                                                                    Please enter an expiration year.
                                                                <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- Card CVV2 -->
                                                <div id="CardCVV2Ct" class="form__span-item form message">
                                                    <%
                                                        var cardCVV2Message = Html.ValidationMessageFor(m => m.CardCvv2);
                                                        var cardCVV2IsInvalid = cardCVV2Message != null;
                                                    %>
                                                    <div class="form__field-label form__cvv">
                                                        <input type="text" name="CardCvv2" id="CardCvv2" placeholder="CVV2" data-required="true" data-validationtype="cvv" class="dtm__restyle form__field <%= cardCVV2IsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["CardCvv2"] %>">
                                                        <label for="CardCvv2" class="message__label">
                                                            <span class="form__error">* </span>CVV2
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (cardCVV2IsInvalid)
                                                                { %>
                                                                <%= cardCVV2Message %>
                                                                <% }
                                                                else
                                                                { %>
                                                                    Please enter a CVV number.
                                                                <% } %>
                                                            </span>
                                                        </span>
                                                        <a data-fancybox="" data-type="ajax" href="/shared/cvv.html" title="Learn What is CVV2" id="cvv2" class="account__link form__link">What is CVV2?</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                        <div class="form__item form__section form__info-accordion view__scroll">
                            <div id="billingInformation" class="form__copy">
                                <div class="form form--frame">
                                    <fieldset class="form__fieldset">
                                        <h2 class="form__title billingTitle">Step 5: Enter your billing information</h2>

                                        <div class="form__span-item form__frame">
                                            <div class="form__group">

                                                <!-- Full Name -->
                                                <div class="form message">
                                                    <%
                                                        var billingFullNameMessage = Html.ValidationMessageFor(m => m.BillingFullName);
                                                        var billingFullNameIsInvalid = billingFullNameMessage != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <input type="text" name="BillingFullName" id="BillingFullName" autocomplete="section-bill billing name" placeholder="Full Name" data-required="true" data-pattern="^[A-z]+([A-z .,'-]*)?$" class="dtm__restyle form__field <%= billingFullNameIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingFullName"] %>">
                                                        <label for="BillingFullName" class="message__label">
                                                            <span class="form__error">* </span>Full Name
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (billingFullNameIsInvalid)
                                                                    { %>
                                                                <%= billingFullNameMessage %>
                                                                <% }
                                                                    else
                                                                    { %>
                                                                Please enter Full name.
                                                            <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <!-- Street -->
                                                <div class="form__span-item form message">
                                                    <%
                                                        var billingStreetMessage = Html.ValidationMessageFor(m => m.BillingStreet);
                                                        var billingStreetIsInvalid = billingStreetMessage != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <input type="text" name="BillingStreet" id="BillingStreet" autocomplete="section-bill billing address-line1" placeholder="Address" data-required="true" class="dtm__restyle form__field <%= billingStreetIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingStreet"] %>">
                                                        <label for="BillingStreet" class="message__label">
                                                            <span class="form__error">* </span>Address
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (billingStreetIsInvalid)
                                                                    { %>
                                                                <%= billingStreetMessage %>
                                                                <% }
                                                                    else
                                                                    { %>
                                                                Please enter an address.
                                                            <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- Street 2 -->
                                                <div class="form__span-item form message">
                                                    <%
                                                        var billingStreet2Message = Html.ValidationMessageFor(m => m.BillingStreet2);
                                                        var billingStreet2IsInvalid = billingStreet2Message != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <input type="text" name="BillingStreet2" id="BillingStreet2" autocomplete="section-bill billing address-line2" placeholder="Address 2" class="dtm__restyle form__field <%= billingStreet2IsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingStreet2"] %>">
                                                        <label for="BillingStreet2" class="message__label">
                                                            Address 2
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (billingStreet2IsInvalid)
                                                                    { %>
                                                                <%= billingStreet2Message %>
                                                                <% }
                                                                    else
                                                                    { %>
                                                                Please enter an address.
                                                            <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- City -->
                                                <div class="form__take-some form message">
                                                    <%
                                                        var billingCityMessage = Html.ValidationMessageFor(m => m.BillingCity);
                                                        var billingCityIsInvalid = billingCityMessage != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <input type="text" name="BillingCity" id="BillingCity" placeholder="City" autocomplete="section-bill billing address-level2" data-required="true" class="dtm__restyle form__field <%= billingCityIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingCity"] %>">
                                                        <label for="BillingCity" class="message__label">
                                                            <span class="form__error">* </span>City
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (billingCityIsInvalid)
                                                                    { %>
                                                                <%= billingCityMessage %>
                                                                <% }
                                                                    else
                                                                    { %>
                                                                Please enter a city.
                                                            <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- State -->
                                                <div class="form__take-some form message">
                                                    <%
                                                        var billingStateMessage = Html.ValidationMessageFor(m => m.BillingState);
                                                        var billingStateIsInvalid = billingStateMessage != null;
                                                    %>
                                                    <div class="form__field-label" id="billStateParent">
                                                        <div class="form form--select">
                                                            <div class="form__contain">
                                                            <%= Html.DropDownListFor(m => m.BillingState, new SelectList(Model.States, "StateCode", "StateName"), LabelsManager.Labels["StatePlaceholder"], new { @class="dtm__restyle form__field", @data_required="true", @data_parent="billStateParent", @autocomplete="section-bill billing address-level1" }) %>
                                                                
                                                                <span class="form__field form__button">
                                                                    <svg class="icon icon--combobox">
                                                                        <use href="#icon-combobox"></use>
                                                                    </svg>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <label for="BillingState" class="message__label">
                                                            <span class="form__error">* </span>State
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (billingStateIsInvalid)
                                                                    { %>
                                                                <%= billingStateMessage %>
                                                                <% }
                                                                    else
                                                                    { %>
                                                                Please choose a state.
                                                            <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- Zip Code -->
                                                <div class="form__take-some form message">
                                                    <%
                                                        var billingZipMessage = Html.ValidationMessageFor(m => m.BillingZip);
                                                        var billingZipIsInvalid = billingZipMessage != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <input type="text" name="BillingZip" id="BillingZip" placeholder="Zip Code" autocomplete="section-bill billing postal-code" data-required="true" class="ui-autocomplete-input dtm__restyle form__field <%= billingZipIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingZip"] %>">
                                                        <label for="BillingZip" class="message__label">
                                                            <span class="form__error">* </span>Zip Code
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (billingZipIsInvalid)
                                                                    { %>
                                                                <%= billingZipMessage %>
                                                                <% }
                                                                    else
                                                                    { %>
                                                                Please enter a zip code.
                                                            <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- Country -->
                                                <div class="form message" <%=Model.Countries.Count() > 1 ? string.Empty :"style='display:none'" %>>
                                                    <%
                                                        var billingCountryMessage = Html.ValidationMessageFor(m => m.BillingCountry);
                                                        var billingCountryIsInvalid = billingCountryMessage != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <div class="form form--select">
                                                            <div class="form__contain">
                                                                <%= Html.DropDownListFor(m => m.BillingCountry, new SelectList(Model.Countries, "CountryCode", "CountryName", ViewData["BillingCountry"]), new { @class="dtm__restyle form__field" }) %>
                                                                <span class="form__field form__button">
                                                                    <svg class="icon icon--combobox">
                                                                        <use href="#icon-combobox"></use>
                                                                    </svg>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <label for="BillingCountry" class="message__label">
                                                            <span class="form__error">* </span>Country
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (billingCountryIsInvalid)
                                                                    { %>
                                                                <%= billingCountryMessage %>
                                                                <% }
                                                                    else
                                                                    { %>
                                                                Please choose a country.
                                                            <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- Phone -->
                                                <div class="form message">
                                                    <%
                                                        var phoneMessage = Html.ValidationMessageFor(m => m.Phone);
                                                        var phoneIsInvalid = phoneMessage != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <input type="tel" name="Phone" id="Phone" autocomplete="section-bill billing tel" placeholder="Phone" data-required="true" data-validationtype="phone" class="dtm__restyle form__field <%= phoneIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["Phone"] %>">
                                                        <label for="Phone" class="message__label">
                                                            <span class="form__error">* </span>Phone
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (phoneIsInvalid)
                                                                    { %>
                                                                <%= phoneMessage %>
                                                                <% }
                                                                    else
                                                                    { %>
                                                                Please enter a phone number.
                                                            <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- Email -->
                                                <div class="form__span-item form message">
                                                    <%
                                                        var emailMessage = Html.ValidationMessageFor(m => m.Email);
                                                        var emailIsInvalid = emailMessage != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <input type="email" name="Email" id="Email" autocomplete="section-bill billing email" title="Format example: someone@someplace.com" data-required="true" data-pattern="^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$" placeholder="Email" class="dtm__restyle form__field <%= emailIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["Email"] %>">
                                                        <label for="Email" class="message__label">
                                                            <span class="form__error">* </span>Email
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (emailIsInvalid)
                                                                    { %>
                                                                <%= emailMessage %>
                                                                <% }
                                                                    else
                                                                    { %>
                                                                Please enter an email address.
                                                            <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <div class="form__span-item form message" id="ShippingIsSameDiv">
                                                    <div class="form__checkbox-label">
                                                        <input
                                                            type="checkbox"
                                                            id="ShippingIsDifferentThanBilling"
                                                            name="ShippingIsDifferentThanBilling"
                                                            value="true"
                                                            aria-labelledby="ShippingIsDifferentThanBillingLabel"
                                                            onclick="if (this.checked) { $('#shippingInformation').show() } else { $('#shippingInformation').hide() }" />
                                                        <label for="ShippingIsDifferentThanBilling" class="form__label">
                                                            <span class="form__checkbox"></span>
                                                            <span id="ShippingIsDifferentThanBillingLabel">Check if your shipping address is different than your billing address.</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>

                                <div class="form form--frame message shipping" id="shippingInformation">
                                    <fieldset class="form__fieldset form__expando shipping__required">
                                        <h2 class="form__title shippingTitle">Step 6: Enter your shipping information</h2>
                                        <div class="form__span-item form__frame">
                                            <div class="form__group">
                                                <!-- Full Name -->
                                                <div class="form message">
                                                    <%
                                                        var shippingFullNameMessage = Html.ValidationMessageFor(m => m.ShippingFullName);
                                                        var shippingFullNameIsInvalid = shippingFullNameMessage != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <input type="text" title="Name can only contain letters" autocomplete="section-ship shipping name" data-required="true" data-pattern="^[A-z]+([A-z .,'-]*)?$" name="ShippingFullName" id="ShippingFullName" placeholder="Full Name" class="dtm__restyle form__field shipping__required shipping__field <%= shippingFullNameIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingFullName"] %>">
                                                        <label for="ShippingFullName" class="message__label">
                                                            <span class="form__error">* </span>Full Name
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (shippingFullNameIsInvalid)
                                                                { %>
                                                                <%= shippingFullNameMessage %>
                                                                <% }
                                                                else
                                                                { %>
                                                                    Please enter a Full name.
                                                                <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- Street -->
                                                <div class="form__span-item form message">
                                                    <%
                                                        var shippingStreetMessage = Html.ValidationMessageFor(m => m.ShippingStreet);
                                                        var shippingStreetIsInvalid = shippingStreetMessage != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <input type="text" name="ShippingStreet" id="ShippingStreet"  autocomplete="section-ship shipping address-line1" placeholder="Address" data-required="true" class="dtm__restyle form__field shipping__required shipping__field <%= shippingStreetIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingStreet"] %>">
                                                        <label for="ShippingStreet" class="message__label">
                                                            <span class="form__error">* </span>Address
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (shippingStreetIsInvalid)
                                                                { %>
                                                                <%= shippingStreetMessage %>
                                                                <% }
                                                                else
                                                                { %>
                                                                    Please enter an address.
                                                                <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- Street 2 -->
                                                <div class="form__span-item form message">
                                                    <%
                                                        var shippingStreet2Message = Html.ValidationMessageFor(m => m.ShippingStreet2);
                                                        var shippingStreet2IsInvalid = shippingStreet2Message != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <input type="text" name="ShippingStreet2" id="ShippingStreet2" autocomplete="section-ship shipping address-line2" placeholder="Address 2" class="dtm__restyle form__field shipping__field <%= shippingStreet2IsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingStreet2"] %>">
                                                        <label for="ShippingStreet2" class="message__label">
                                                            Address 2
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (shippingStreet2IsInvalid)
                                                                { %>
                                                                <%= shippingStreet2Message %>
                                                                <% }
                                                                else
                                                                { %>
                                                                    Please enter an address.
                                                                <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- City -->
                                                <div class="form__take-some form message">
                                                    <%
                                                        var shippingCityMessage = Html.ValidationMessageFor(m => m.ShippingCity);
                                                        var shippingCityIsInvalid = shippingCityMessage != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <input type="text" name="ShippingCity" id="ShippingCity" autocomplete="section-ship shipping address-level2" placeholder="City" data-required="true" class="dtm__restyle form__field shipping__required shipping__field <%= shippingCityIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingCity"] %>">
                                                        <label for="ShippingCity" class="message__label">
                                                            <span class="form__error">* </span>City
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (shippingCityIsInvalid)
                                                                { %>
                                                                <%= shippingCityMessage %>
                                                                <% }
                                                                else
                                                                { %>
                                                                    Please enter a city.
                                                                <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- State -->
                                                <div class="form__take-some form message">
                                                    <%
                                                        var shippingStateMessage = Html.ValidationMessageFor(m => m.ShippingState);
                                                        var shippingStateIsInvalid = shippingStateMessage != null;
                                                    %>
                                                    <div class="form__field-label" id="billStateParent">
                                                        <div class="form form--select">
                                                            <div class="form__contain">
                                                                <%= Html.DropDownListFor(m => m.ShippingState, new SelectList(Model.States, "StateCode", "StateName"), LabelsManager.Context["StatePlaceholder"], new { @class="dtm__restyle form__field shipping__required shipping__field", @autocomplete="section-ship shipping address-level1" }) %>
                                                                <span class="form__field form__button">
                                                                    <svg class="icon icon--combobox">
                                                                        <use href="#icon-combobox"></use>
                                                                    </svg>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <label for="ShippingState" class="message__label">
                                                            <span class="form__error">* </span>State
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (shippingStateIsInvalid)
                                                                { %>
                                                                <%= shippingStateMessage %>
                                                                <% }
                                                                else
                                                                { %>
                                                                    Please choose a state.
                                                                <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- Zip Code -->
                                                <div class="form__take-some form message">
                                                    <%
                                                        var shippingZipMessage = Html.ValidationMessageFor(m => m.ShippingZip);
                                                        var shippingZipIsInvalid = shippingZipMessage != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <input type="text" name="ShippingZip" id="ShippingZip" autocomplete="section-ship shipping postal-code" placeholder="Zip Code" data-required="true" class="dtm__restyle form__field shipping__required shipping__field <%= shippingZipIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingZip"] %>">
                                                        <label for="ShippingZip" class="message__label">
                                                            <span class="form__error">* </span>Zip Code
                                                        </label>
                                                        <span class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (shippingZipIsInvalid)
                                                                { %>
                                                                <%= shippingZipMessage %>
                                                                <% }
                                                                else
                                                                { %>
                                                                    Please enter a zip code.
                                                                <% } %>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- Country -->
                                                <div class="form message" <%=Model.Countries.Count() > 1 ? string.Empty :"style='display:none'" %>>
                                                    <%
                                                        var shippingCountryMessage = Html.ValidationMessageFor(m => m.ShippingCountry);
                                                        var shippingCountryIsInvalid = shippingCountryMessage != null;
                                                    %>
                                                    <div class="form__field-label">
                                                        <div class="form form--select">
                                                            <div class="form__contain">
                                                                <%= Html.DropDownListFor(m => m.ShippingCountry, new SelectList(Model.Countries, "CountryCode", "CountryName", ViewData["ShippingCountry"]), new { @class="dtm__restyle form__field" }) %>
                                                                <span class="form__field form__button">
                                                                    <svg class="icon icon--combobox">
                                                                        <use href="#icon-combobox"></use>
                                                                    </svg>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <label for="ShippingCountry" class="message__label">
                                                            <span class="form__error">* </span>Country
                                                        </label>
                                                        <label class="message__group" role="alert">
                                                            <span class="message__invalid">
                                                                <% if (shippingCountryIsInvalid)
                                                                { %>
                                                                <%= shippingCountryMessage %>
                                                                <% }
                                                                else
                                                                { %>
                                                                    Please choose a country.
                                                                <% } %>
                                                            </span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="view form form--frame">
                                <div id="additionalInformation" class="view__anchor"></div>
                                <div class="form__copy">
                                    <fieldset class="form__fieldset">
                                        <h2 class="form__title">Additional Information</h2>

                                        <div class="form__copy form__frame">
                                            <div class="form__span-item form message">
                                                <div class="form__checkbox-label">
                                                    <input type="hidden" name="EmailOptIn" id="EmailOptIn" value="False" />
                                                    <input
                                                        type="checkbox"
                                                        id="EmailOptInCbx"
                                                        name="EmailOptInCbx"
                                                        aria-labelledby="EmailOptInCbxLabel" />
                                                    <label for="EmailOptInCbx" class="form__label">
                                                        <span class="form__checkbox"></span>
                                                        <%
                                                            var productName = SettingsManager.ContextSettings["Label.ProductName"];   
                                                            var sitemap = ViewData["Sitemap"] as NavigationList ?? new Sitemap().SitemapList;

                                                            var privacy = sitemap.GetItemById("privacy-policy");
                                                        %>
                                                        <span id="EmailOptInCbxLabel">Yes, I'd like to receive promotional communications from <%= productName %>. Please review Church & Dwight's <a id="emailoptin-privacy-policy" href="<%= privacy.Page %>" target="_blank"><%= privacy.Name %></a> to understand how Church & Dwight collects and uses personal information.</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="form__span-item form message">
                                                <div class="form__checkbox-label">
                                                    <input
                                                        type="checkbox"
                                                        id="Terms"
                                                        name="Terms"
                                                        required
                                                        aria-labelledby="TermsLabel" />
                                                    <label for="Terms" class="form__label">
                                                        <span class="form__checkbox"></span>
                                                        <%
                                                            var terms = sitemap.GetItemById("terms");    
                                                        %>
                                                        <span id="TermsLabel">
                                                            <span class="form__error">*</span> By checking this box, you are electronically signing your order, agreeing to the terms and to our general <a id="dyn-tos-pp-link2" href="<%= terms.Page %>"><%= terms.Name %></a>, <!--including our no-commitment auto-replenishment program, -->and authorizing us to charge this payment to the credit card you have provided.</span>
                                                    </label>
                                                    <div class="message__group" role="alert">
                                                        <span class="message__invalid">Please accept the terms and conditions</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form__copy form__action-text">
                <div class="form__action">
                    <button type="submit" id="AcceptOfferButton" name="acceptOffer" class="form__submit orderbtn form_validation_required" data-state="card" data-order-type='{ "PayPalEC" : "Continue with PayPal", "CARD" : "Process Order" }'>
                        <svg><use href="#button-process-order"></use></svg>
                        <span>Process Order</span>
                    </button>
                </div>
                <p id="disclaimerText">By clicking Process Order, your credit card will be charged the amount above. Click only once.</p>
                <div class="form__mbg contain contain--mbg" data-src-img="/shared/images/PositiveSSL_tl_trans.png">
                    <img src="/shared/images/blank.png" alt="SSL">
                </div>
                <div class="offer-details">
                    <% Html.RenderSnippet("OFFERDETAILS"); %>
                </div>
            </div>
        </form> 
    </div>
</main>

<span class="svg-symbols">
    <svg>
        <symbol id="button-process-order" x="0px" y="0px" viewBox="0 0 300 136.2" style="enable-background:new 0 0 300 136.2;">
        <style type="text/css">
            #button-process-order .st0{fill:#7FE4F1;}
            #button-process-order .st1{fill:#016471;}
            #button-process-order .st2{
                fill:#FFFFFF;
                font: 800 46px/1 futura-pt-condensed, futura-pt, sans-serif;
            }
        </style>
        <g>
            <g>
                <polygon class="st0" points="6.4,32.8 8.1,136.2 300,106.2 298.3,2.3"/>
                <polygon class="st1" points="0,29.1 1.6,127.3 290.9,98.6 289.3,0"/>
            </g>
            <text transform="matrix(0.9126 -0.1041 2.992006e-02 0.9996 14.9881 94.0425)" class="st2">PROCESS ORDER</text>
        </g>
        </symbol>
    </svg>
</span>

</asp:Content>