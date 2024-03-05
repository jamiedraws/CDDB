(function (global) {
    if ("app" in global) {
        const defer = app.createContext(app);

        defer.addProperties({
            updateContainer: function (placeholder, element, state) {
                let operation = state === true ? "add" : "remove";

                if (
                    this.elementExists(placeholder) &&
                    this.elementExists(element)
                ) {
                    placeholder.classList[operation]("defer--success");
                    element.classList[operation]("defer__success");
                }
            },
            setContainer: function (placeholder) {
                const element = placeholder.querySelector(".defer__progress");

                return Object.create(
                    {},
                    {
                        show: {
                            value: this.updateContainer.bind(
                                this,
                                placeholder,
                                element,
                                true
                            )
                        },
                        hide: {
                            value: this.updateContainer.bind(
                                this,
                                placeholder,
                                element,
                                false
                            )
                        }
                    }
                );
            },
            revealContainers: function () {
                const placeholders = app.toArray(
                    document.querySelectorAll(".defer")
                );
                placeholders.forEach(function (placeholder) {
                    const container = defer.setContainer(placeholder);
                    container.show();
                });
            },
            isAvailable: function (selector, response) {
                let result = response || false;
                if (this.isString(selector)) {
                    const element = document.querySelector(selector);
                    if (this.elementExists(element)) {
                        result = element;
                    }
                }
                return result;
            },
            viewElement: function (config, inRangeCallback, outRangeCallback) {
                if (this.isObject(config)) {
                    let element = this.isAvailable(config.selector);

                    if (element && this.isString(config.state)) {
                        element = this.isAvailable(config.neighbor, element);

                        if (app.require(["observer"])) {
                            const func = function () {},
                                inRange = inRangeCallback || func,
                                outRange = outRangeCallback || func;

                            app.observer.watch({
                                selector: config.selector,
                                inRange: inRange.bind(element, config),
                                outRange: outRange.bind(element, config),
                                unObserve: false
                            });
                        }
                    }
                }
            }
        });

        app.require(["observer"], function () {
            app.require(["lazy"], function () {
                app.observer.watch({
                    selector: "[data-src-img]",
                    inRange: function (loadItem) {
                        defer.lazy(loadItem);
                    }
                });

                app.observer.watch({
                    selector: "[data-src-iframe]",
                    inRange: function (record) {
                        defer.lazy(record, {
                            tag: "iframe",
                            src: "data-src-iframe",
                            ondemand: true
                        });
                    }
                });
            });

            app.observer.watch({
                selector: ".view--remove-nav",
                inRange: function () {
                    if (app.require(["nav"])) {
                        app.nav.hide();
                    }
                },
                outRange: function () {
                    if (app.require(["nav"])) {
                        app.nav.show();
                    }
                },
                unObserve: false,
                options: {
                    threshold: 0.1
                }
            });
        });

        defer.lock();
        app.addProperty("defer", defer);
    }
})(window);
