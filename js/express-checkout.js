(function (global) {
    if ("app" in global) {
        const expressCheckout = app.createContext(app);

        let acceptOffer = document.querySelector("#AcceptOfferButton");

        expressCheckout.addProperties({
            paymentInformation: document.querySelector("#paymentInformation"),
            shippingIsSameDiv: document.querySelector("#ShippingIsSameDiv"),
            disclaimerText: document.querySelector("#disclaimerText"),
            setAcceptOffer: function (element) {
                if (expressCheckout.elementExists(element)) {
                    acceptOffer = element;
                }
            },
            getAcceptOffer: function () {
                return acceptOffer;
            },
            getState: function (state) {
                return this.isString(state) && !this.isCardState(state)
                    ? state
                    : "CARD";
            },
            isCardState: function (state) {
                return state.match(/card/i);
            },
            createCheckbox: function () {
                const checkbox = document.createElement("span");
                checkbox.classList.add("form__checkbox");
                return checkbox;
            },
            addCustomCheckbox: function (element) {
                const checkbox = this.createCheckbox();
                const label = element.querySelector("label");

                label.classList.add("form__label");
                label.insertAdjacentElement("afterbegin", checkbox);
            },
            registerOptions: function () {
                const self = this;
                this.options.forEach(function (option) {
                    option.classList.add("form__checkbox-label");
                    self.addCustomCheckbox(option);
                });
            },
            processTask: function () {
                this.addProperty(
                    "options",
                    this.toArray(document.querySelectorAll(".checkout-option"))
                );

                this.setNodesToHidden();
                this.registerOptions();
                this.handleOptions();
                this.toggleDisclaimerByState("");
            },
            toggleDisclaimerByState: function (state) {
                if (!this.isCardState(state)) {
                    this.disclaimerText.classList.add("form__is-hidden");
                } else {
                    this.disclaimerText.classList.remove("form__is-hidden");
                }
            },
            createImage: function (state) {
                const image = this.createElement("img");

                if (!this.isCardState(state)) {
                    const acceptOffer = this.getAcceptOffer();
                    const src = acceptOffer.getAttribute("src");

                    if (this.isString(src)) {
                        image.setAttribute("src", src);
                        image.setAttribute("id", "image-" + state);
                        acceptOffer.appendChild(image);
                    }
                }

                return image;
            },
            updateImageByState: function (state) {
                const acceptOffer = this.getAcceptOffer();

                let image = acceptOffer.querySelector("#image-" + state);
                if (!this.elementExists(image)) {
                    image = this.createImage(state);
                }

                const prevImageState =
                    acceptOffer.querySelector(".button__state");
                if (this.elementExists(prevImageState)) {
                    prevImageState.classList.remove("button__state");
                }

                image.classList.add("button__state");
            },
            updateButtonTextByState: function (state) {
                const acceptOffer = this.getAcceptOffer();
                const types = acceptOffer.dataset.orderType;

                if (this.isString(types)) {
                    const dataset = JSON.parse(types);

                    if (this.isObject(dataset)) {
                        const type = dataset[state];

                        if (this.isString(type)) {
                            const text = acceptOffer.querySelector("span");
                            text.textContent = type;
                            acceptOffer.setAttribute(
                                "data-state",
                                state.toLowerCase()
                            );
                        }
                    }
                }
            },
            setNodesToHidden: function () {
                this.paymentInformation.classList.add("hide");
                this.shippingIsSameDiv.classList.add("hide");
            },
            setNodesToVisible: function () {
                this.paymentInformation.classList.remove("hide");
                this.shippingIsSameDiv.classList.remove("hide");
            },
            updateNodesByState: function (state) {
                if (this.isCardState(state)) {
                    this.setNodesToVisible();
                } else {
                    this.setNodesToHidden();
                }
            },
            handleOptions: function () {
                const self = this;

                addEventListener("PaymentOptionSelected", function (response) {
                    const state = self.getState(response.detail);
                    self.toggleDisclaimerByState(state);
                    self.updateButtonTextByState(state);
                    self.updateImageByState(state);
                    self.updateNodesByState(state);
                });
            }
        });

        addEventListener(
            "ECDrawFormComplete",
            expressCheckout.processTask.bind(expressCheckout)
        );

        app.addProperty("expressCheckout", expressCheckout);

        const processors = app.createContext(app);

        processors.addProperties({
            hasBraintree: function () {
                if ("braintree" in global) {
                    processors.requestResource(
                        "/js/braintree-checkout.js",
                        "script"
                    );
                }
            }
        });

        addEventListener("ECDrawFormComplete", function () {
            Object.keys(processors).forEach(function (processor) {
                processors[processor]();
            });
        });
    }
})(window);
