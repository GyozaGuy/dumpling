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
    spaced: { default: false }
  };

  connected() {
    if (this.props.color) {
      this.navbarTarget.classList.add(`is-${this.props.color}`);
    }

    if (this.props.spaced) {
      this.navbarTarget.classList.add('is-spaced');
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
          <a class="navbar-item" data-target="brandImageLink" id="brandImageLink">
            <slot name="brand-image"></slot>
          </a>

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
