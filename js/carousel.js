(function (global) {
    if ("app" in global) {
        app.require(["defer"], function () {
            const carousel = app.createContext(app.defer);

            carousel.addProperties({
                hasSlide: function () {
                    return "Slide" in global;
                }
            });

            if (carousel.hasSlide()) {
                Slide.proto({
                    getCurrentIndex: function () {
                        return parseInt(this.dataset.slideIndex);
                    },
                    playOnscreen: function () {
                        const self = this;
                        const id = self.parent.id;

                        if (carousel.isString(id)) {
                            let observer;

                            app.require(["observer"], function () {
                                app.observer.watch({
                                    selector: "#" + id,
                                    inRange: function () {
                                        observer = setTimeout(
                                            self.play.bind(self),
                                            self.getDelay()
                                        );
                                    },
                                    outRange: function () {
                                        clearTimeout(observer);
                                        self.pause();
                                    },
                                    unObserve: hasIntersectionObserver(),
                                    options: {
                                        threshold: 0.5
                                    }
                                });
                            });
                        }
                    },
                    updateConfig: function (options) {
                        const config = this.parent.dataset.slideConfig;
                        if (config) {
                            const configJSON = JSON.parse(config);
                            if (carousel.isObject(configJSON)) {
                                Object.keys(options).forEach(function (option) {
                                    configJSON[option] = options[option];
                                });
                            }
                            const configString = JSON.stringify(configJSON);
                            this.parent.dataset.slideConfig = configString;
                        }
                    },
                    extendConfig: function () {
                        const config = this.parent.dataset.slideConfig;
                        if (config) {
                            const configJSON = JSON.parse(config);
                            if (carousel.isObject(configJSON)) {
                                if (configJSON.delay) {
                                    this.setDelay(configJSON.delay);
                                }

                                if (configJSON.auto) {
                                    this.playOnscreen();
                                }

                                if (configJSON.steps) {
                                    this.steps = configJSON.steps;
                                }

                                return configJSON;
                            }
                        }
                        return false;
                    },
                    updateSteps: function (steps) {
                        this.updateConfig({ steps: steps });
                        this.extendConfig();
                    }
                });
            }

            const hasIntersectionObserver = function () {
                return "IntersectionObserver" in window ? false : true;
            };

            carousel
                .toArray(document.querySelectorAll(".slide"))
                .forEach(function (slide) {
                    const into = slide.querySelector(".slide__into");

                    Slide.into(into, function () {
                        slide.classList.add("slide--is-ready");

                        // handle next button
                        // handle prev button
                        return this;
                    });
                });

            carousel
                .toArray(document.querySelectorAll(".slide--fade"))
                .forEach(function (carouselItem) {
                    const into = carouselItem.querySelector(".slide__into");
                    Slide.into(
                        into,
                        {
                            currentState: "slide__item--current"
                        },
                        function () {
                            const self = this;
                            this.extendConfig();

                            self.handleRotation(false);
                            self.setShim(true);
                            self.watch(function (currentIndex, prevIndex) {
                                if (self.isAuto()) {
                                    const prevSlide =
                                            this.children.item(prevIndex),
                                        currentSlide =
                                            this.children.item(currentIndex);

                                    prevSlide.classList.remove(
                                        self.currentState
                                    );
                                    currentSlide.classList.add(
                                        self.currentState
                                    );
                                }
                            });
                        }
                    );
                });
        });
    }
})(window);
