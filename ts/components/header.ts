export default class Header {
    /**
     * Represents the HTML element container for the header section
     */
    public element: Element;

    /**
     * Represents the CSS class name that will handle rendering the header section
     */
    private visibilityClassName: string = "header--is-hidden";

    /**
     * Controls the rendering appearance of a header section. Invoking the show method will allow the header section to appear while invoking the hide method will allow the header section to disappear.
     * @param element Element
     */
    constructor(element: Element) {
        this.element = element;
    }

    /**
     * Allows the header section to appear.
     */
    public show(): void {
        this.element.classList.remove(this.visibilityClassName);
    }

    /**
     * Allows the header section to disappear.
     */
    public hide(): void {
        this.element.classList.add(this.visibilityClassName);
    }
}
