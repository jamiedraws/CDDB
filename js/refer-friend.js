(function (global) {
    if ("app" in global) {
        const referEngine = app.createContext(app);

        referEngine.addProperties({
            form: document.querySelector("#leadForm"),
            submit: document.querySelector("#referSubmit"),
            email: document.querySelector("#LeadEmails"),
            submitForm: function () {
                var req = new XMLHttpRequest();
                req.addEventListener(
                    "load",
                    this.handleResponse.bind(this, req)
                );
                req.open("POST", "/Refer");
                req.setRequestHeader(
                    "Content-Type",
                    "application/x-www-form-urlencoded"
                );
                req.send(this.getPayload.call(this));
            },
            getPayload: function () {
                return (
                    "Emails=" +
                    this.getEmails.call(this) +
                    "&oid=" +
                    this.getOrderId.call(this) +
                    "&createOrder=''"
                );
            },
            getOrderId: function () {
                var orderEle = document.getElementById("LeadOrderId");
                var orderId = "";
                if (this.elementExists(orderEle)) {
                    orderId = orderEle.value;
                }
                return orderId;
            },
            getEmails: function () {
                var emailsEle = this.email;
                var emails = "";
                if (this.elementExists(emailsEle)) {
                    emails = emailsEle.value;
                }
                return emails;
            },
            handleResponse: function (req) {
                if (req.status === 200) {
                    const details = JSON.parse(req.responseText);

                    this.updateResponse(
                        details.Message,
                        details.Success ? "valid" : "invalid"
                    );
                } else {
                    this.updateResponse(
                        "A network error has occurred. Please try submitting again.",
                        "default"
                    );
                }

                this.renderResponse(this.responseDictionary);
            },
            renderResponse: function () {
                if (app.isObject(global.toast)) {
                    global.toast.post(this.responseDictionary.message);
                    global.toast.show();
                }
            },
            updateResponse: function (message, state) {
                if (this.isString(message)) {
                    this.responseDictionary.message = message;
                }

                if (this.isString(state)) {
                    this.responseDictionary.state = state;
                }
            },
            responseDictionary: {
                message: "Processing... Please wait.",
                state: "pending"
            },
            validateEmail: function () {
                let result = this.email.validity;

                if (!result.valid) {
                    this.updateResponse(
                        "Please enter a valid email address.",
                        "invalid"
                    );
                }

                if (result.valueMissing) {
                    this.updateResponse(
                        "Please enter an email address.",
                        "invalid"
                    );
                }

                return result.valid;
            },
            validateOrderId: function () {
                let nanRegex = "/[^0-9]/g";
                let result =
                    this.getOrderId() === "0" || this.getOrderId() === nanRegex;

                if (result) {
                    this.updateResponse(
                        "We could not locate your order number. Please refer to your email confirmation and try again."
                    );
                }

                return !result;
            },
            processEvent: function () {
                if (this.validateEmail() && this.validateOrderId()) {
                    this.updateResponse(
                        "Processing... Please wait.",
                        "default"
                    );
                    this.submitForm();
                }

                this.renderResponse();
            }
        });

        addEventListener("DOMContentLoaded", function () {
            referEngine.listen(
                referEngine.submit,
                referEngine.processEvent.bind(referEngine)
            );
        });
    }
})(window);
