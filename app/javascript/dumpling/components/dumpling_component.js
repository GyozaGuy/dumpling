export default class extends HTMLElement {
  props = {};

  constructor() {
    super();
    this.root = this.attachShadow({ mode: 'open' });
    this.root.append(document.head.querySelector('link[href*="bulma"]').cloneNode());
    this.styles()?.forEach(child => this.root.append(child));
    this.template()?.forEach(child => this.root.append(child));
  }

  connectedCallback() {
    this.root.querySelectorAll('[data-action]').forEach(element => {
      let [eventName, action] = element.dataset.action.split('->');

      if (!action) {
        action = eventName;
        eventName = this.#defaultAction(element);
      }

      if (!(action && eventName)) return;

      element.addEventListener(eventName, this[action].bind(this));
    });
    this.root.querySelectorAll('[data-target]').forEach(element => {
      this[`${element.dataset.target}Target`] = element;
    });
    this.#configureProps();
    this.connected?.();
  }

  disconnectedCallback() {
    this.disconnected?.();
  }

  styles() {
    if (!this.constructor.styles?.hasChildNodes()) return;
    return [...this.constructor.styles.children];
  }

  template() {
    if (!this.constructor.template?.hasChildNodes()) return;
    return [...this.constructor.template.children];
  }

  #configureProps() {
    if (!this.constructor.props) return;

    Object.entries(this.constructor.props).forEach(([name, options]) => {
      const attrName = dashCase(name);

      const attrValue = this.getAttribute(attrName);

      if (attrValue && Array.isArray(options.oneOf) && !options.oneOf.includes(attrValue)) {
        throw new Error(
          `Invalid value for attribute ${name}: ${attrValue}\nValid values include ${options.oneOf.join(
            ', '
          )}`
        );
      }

      this.props[name] = typeof options.default === 'boolean' ? true : attrValue || options.default;
    });
  }

  #defaultAction(element) {
    return { button: 'click', input: 'input' }[element.tagName.toLowerCase()];
  }
}

export function html(htmlStrings, ...parts) {
  const htmlString = htmlStrings.reduce((acc, cur, i) => `${acc}${cur}${parts[i]}`, '');
  const template = document.createElement('template');
  template.innerHTML = htmlString;
  return template.content;
}

function dashCase(string) {
  return string.replace(/[A-Z]/g, m => `-${m.toLowerCase()}`);
}
