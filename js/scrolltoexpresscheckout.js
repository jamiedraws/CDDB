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
		return document.getElementById("paypal-button");
	};

	const scrollPayPalIntoView = function () {
		const button = getPayPalButton();
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
					addEventListener("ECDrawFormComplete", emitCheckoutEvent);
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
