import DumplingComponent, { html } from 'dumpling/components/dumpling_component';

class BulmaNavbar extends DumplingComponent {
  static props = {
    color: {
      default: null,
      oneOf: [
        null,
        'black',
        'danger',
        'dark',
        'info',
        'light',
        'link',
        'primary',
        'success',
        'warning',
        'white'
      ]
    },
    fixed: { default: null, oneOf: [null, 'bottom', 'top'] },
    shadowed: { default: false },
    spaced: { default: false },
    transparent: { default: false }
  };

  connected() {
    if (this.props.color) {
      this.navbarTarget.classList.add(`is-${this.props.color}`);
    }

    if (this.props.fixed) {
      this.navbarTarget.classList.add(`is-fixed-${this.props.fixed}`);
    }

    if (this.props.shadowed) {
      this.navbarTarget.classList.add('has-shadow');
    }

    if (this.props.spaced) {
      this.navbarTarget.classList.add('is-spaced');
    }

    if (this.props.transparent) {
      this.navbarTarget.classList.add('is-transparent');
    }
  }

  render() {
    return html`
      <style>
        #brandImageLink:not(:has(img)) {
          display: none;
        }
      </style>

      <nav class="navbar" data-target="navbar" part="nav" role="navigation">
        <div class="navbar-brand">
          <slot name="brand-image"></slot>
          <slot name="brand"></slot>

          <a
            class="navbar-burger"
            data-action="toggleMenu"
            data-target="burger"
            part="burger"
            role="button"
          >
            <span aria-hidden></span>
            <span aria-hidden></span>
            <span aria-hidden></span>
            <span aria-hidden></span>
          </a>
        </div>

        <div class="navbar-menu" data-target="menu" part="menu">
          <div class="navbar-start">
            <slot name="start"></slot>
          </div>

          <div class="navbar-end">
            <slot name="end"></slot>
          </div>
        </div>
      </nav>
    `;
  }

  toggleMenu() {
    this.burgerTarget.classList.toggle('is-active');
    this.menuTarget.classList.toggle('is-active');
  }
}

customElements.define('bulma-navbar', BulmaNavbar);
