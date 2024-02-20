import DumplingComponent, { html } from 'dumpling/components/dumpling_component';

class BulmaNavbar extends DumplingComponent {
  static props = {
    brand: {},
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
    href: {},
    spaced: { default: false }
  };
  static styles = html`
    <style>
      #brandImageLink:not(:has(::slotted)) {
        display: none;
      }

      #brand:not(:has(::slotted)) {
        display: none;
      }
    </style>
  `;
  static template = html`
    <nav class="navbar" data-target="navbar" role="navigation">
      <div class="navbar-brand">
        <a class="navbar-item" data-target="brandImageLink" id="brandImageLink">
          <slot name="brand-image"></slot>
        </a>
        <a class="navbar-item" data-target="brand" id="brand">
          <slot name="brand"></slot>
        </a>
      </div>
    </nav>
  `;

  connected() {
    if (this.props.color) {
      this.navbarTarget.classList.add(`is-${this.props.color}`);
    }

    if (this.props.href) {
      this.brandTarget.href = this.props.href;
      this.brandImageLinkTarget.href = this.props.href;
    }

    if (this.props.spaced) {
      this.navbarTarget.classList.add('is-spaced');
    }
  }
}

customElements.define('bulma-navbar', BulmaNavbar);
