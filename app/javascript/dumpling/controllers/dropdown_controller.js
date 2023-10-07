import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  toggle() {
    this.element.classList.toggle('is-active');

    if (this.element.matches('.is-active')) {
      setTimeout(() => {
        document.addEventListener('click', event => {
          event.preventDefault();
          this.element.classList.remove('is-active');
        }, { once: true });
      });
    }
  }
}
