// components
import Nav from "Shared/ts/components/nav";
import Carousel from "shared/ts/components/carousel";
import ResponsiveCarousel from "Shared/ts/components/responsive-carousel";
import Accordion from "Shared/ts/components/accordion";
import Toast from "shared/ts/components/toast";
import FadeCarousel from "Shared/ts/components/fade-carousel";
import FingerPrintNav from "Shared/ts/components/fingerprint-nav";
import PromoBanner from "ts/components/header";

// adapters
import SlideCarouselAdapter from "Shared/ts/api/carousel/slide/adapters/slide-carousel";
import ResponsiveSlideCarouselAdapter from "Shared/ts/api/carousel/slide/adapters/responsive-slide-carousel";
import FadeSlideCarouselAdapter from "Shared/ts/api/carousel/slide/adapters/fade-slide-carousel";

// utils
import LoadItem from "Shared/ts/utils/load-item";
import {
    createElement,
    elementExists,
    enumerateElements
} from "shared/ts/utils/html";
import VimeoManager from "Shared/ts/utils/vimeo-manager";

// observers
import MediaQuery from "Shared/ts/observers/media-query";
import { observer } from "shared/ts/observers/intersection";
import Header from "ts/components/header";

// finger print nav
const fp = new FingerPrintNav();

// nav
const nav = new Nav("nav");

const fixateNav = () => nav.root.classList.add("nav--is-fixed");
const undoFixateNav = () => nav.root.classList.remove("nav--is-fixed");

observer("[data-nav-fixate]", {
    inRange: () => undoFixateNav(),
    outRange: () => fixateNav(),
    unObserve: false
});

// header
const header = new Header(document.querySelector(".header"));

observer("[data-viewport]", {
    inRange: (record) => header.hide(),
    outRange: (record) => header.show(),
    unObserve: false,
    options: {
        threshold: 0.25
    }
});

// defer images
observer("[data-src-img]", {
    inRange: (record) => new LoadItem(record)
});

// defer vimeo player iframes
const vimeoManager = new VimeoManager();

observer("[data-src-iframe]", {
    inRange: (record) => {
        new LoadItem(record, { tag: "iframe", src: "data-src-iframe" });

        const vimeoUrl = record.getAttribute("data-src-iframe");

        const vimeoId = vimeoManager.getIdByUrl(vimeoUrl);
        vimeoManager.generatePosterImage(vimeoId).then((poster) => {
            const image = createElement("img", {
                src: poster
            });

            record.insertAdjacentElement("afterbegin", image);
        });
    }
});

const handleCarouselImages = (carousel: Carousel, record: Element): void => {
    const slides = record.querySelectorAll(".slide__item");
    const map: WeakMap<Element, Element[]> = new WeakMap();

    carousel.on("rotation", (currentIndex: number) => {
        const currentSlide = slides.item(currentIndex);

        if (!map.has(currentSlide)) {
            const placeholderImages = enumerateElements(
                currentSlide.querySelectorAll("[data-src-img]")
            );

            placeholderImages.forEach(
                (placeholderImage) => new LoadItem(placeholderImage)
            );

            map.set(currentSlide, placeholderImages);
        }
    });
};

// before and after
observer(".slide--before-after", {
    inRange: (record) => {
        const carousel = new ResponsiveCarousel(
            new ResponsiveSlideCarouselAdapter(record)
        );

        carousel.enablePrevNextControls();

        new MediaQuery("(min-width: 0px) and (max-width: 499px)").inbound(() =>
            carousel.setAttributes({ steps: 1 })
        );

        new MediaQuery("(min-width: 500px) and (max-width: 999px)").inbound(
            () => carousel.setAttributes({ steps: 2 })
        );

        new MediaQuery("(min-width: 1000px)").inbound(() =>
            carousel.setAttributes({ steps: 3 })
        );

        handleCarouselImages(carousel, record);
    }
});

// influencer
observer(".slide--influencer", {
    inRange: (record) => {
        const carousel = new ResponsiveCarousel(
            new ResponsiveSlideCarouselAdapter(record)
        );

        carousel.enablePrevNextControls();

        new MediaQuery("(min-width: 0px) and (max-width: 399px)").inbound(() =>
            carousel.setAttributes({ steps: 1 })
        );

        new MediaQuery("(min-width: 400px) and (max-width: 749px)").inbound(
            () => carousel.setAttributes({ steps: 2 })
        );

        new MediaQuery("(min-width: 750px) and (max-width: 999px)").inbound(
            () => carousel.setAttributes({ steps: 3 })
        );

        new MediaQuery("(min-width: 1000px)").inbound(() =>
            carousel.setAttributes({ steps: 4 })
        );

        handleCarouselImages(carousel, record);
    }
});

// testimonials carousel
observer(".slide--testimonial", {
    inRange: (record) => {
        const carousel = new Carousel(new SlideCarouselAdapter(record));

        carousel.enablePrevNextControls();
    }
});

// accordion
const createAccordion = (element: HTMLElement) => {
    if (elementExists(element)) {
        new Accordion(element);
    }
};

enumerateElements(document.querySelectorAll(".accordion")).forEach(
    (accordion) => {
        createAccordion(accordion as HTMLElement);
    }
);

// toast
const toast = new Toast("toast-status");

globalThis.toast = toast;

// form dropdowns
const imageDropdowns = enumerateElements(
    document.querySelectorAll(".bundle__image-dropdown")
);

imageDropdowns.forEach((imageDropdown) => {
    const image = imageDropdown.querySelector(".slide"),
        dropdown = imageDropdown.querySelector("select");

    if (elementExists(image) && elementExists(dropdown)) {
        const carousel = new FadeCarousel(new FadeSlideCarouselAdapter(image));

        setTimeout(() => {
            carousel.goto(dropdown.selectedIndex);
        }, 100);

        dropdown.addEventListener("change", () => {
            carousel.goto(dropdown.selectedIndex);
        });
    }
});
