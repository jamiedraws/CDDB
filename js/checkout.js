(function (global) {
    if ("app" in global) {
        const dependencyManager = app.createContext(app);

        dependencyManager.addProperties({
            hasjQuery: function () {
                return "jQuery" in global;
            },
            hasFancybox: function () {
                return this.hasjQuery() && "fancybox" in global.jQuery;
            }
        });

        if (dependencyManager.hasFancybox()) {
            $("[data-fancybox]").fancybox({
                touch: false
            });
        }

        addEventListener("load", function () {
            app.require(["defer"], function () {
                app.defer.revealContainers();
            });
        });

        const scrollToExpressCheckout = (function () {
            const scrollCheckoutIntoView = function (element) {
                try {
                    element.scrollIntoView({ block: "center" });
                } catch (e) {
                    console.warn(
                        "Scrolling to express checkout issue report:",
                        e.message
                    );
                }
            };

            const getPayPalButton = function () {
                return document.getElementById("ctaButtonScrollTarget");
            };

            const scrollPayPalIntoView = function () {
                const button = getPayPalButton();
                console.log(button.style.display);
                scrollCheckoutIntoView(button);
            };

            const isPayPal = function (type) {
                return type.match(/PayPal/i);
            };

            const handleCheckoutType = function (type) {
                if (isPayPal(type)) {
                    scrollPayPalIntoView();
                }
            };

            const emitCheckoutEvent = function () {
                addEventListener("PaymentOptionSelected", function (event) {
                    handleCheckoutType(event.detail);
                });
            };

            return Object.create(
                {},
                {
                    listen: {
                        value: function () {
                            emitCheckoutEvent();
                        }
                    },
                    subscribe: {
                        value: function () {
                            addEventListener(
                                "ECDrawFormComplete",
                                emitCheckoutEvent
                            );
                        }
                    },
                    scrollIntoViewByCheckoutType: {
                        value: function (type) {
                            handleCheckoutType(type);
                        }
                    }
                }
            );
        })();

        scrollToExpressCheckout.listen();
    }
})(window);
