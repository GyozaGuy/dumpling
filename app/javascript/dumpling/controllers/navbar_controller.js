import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['menu', 'menuButton'];

  toggleMenu() {
    this.menuButtonTarget.classList.toggle('is-active');
    this.menuTarget.classList.toggle('is-active');

    if (this.menuTarget.matches('.is-active')) {
      setTimeout(() => {
        document.addEventListener('click', event => {
          if (event.target.closest('.navbar')) {
            return;
          }

          event.preventDefault();
          this.menuButtonTarget.classList.remove('is-active');
          this.menuTarget.classList.remove('is-active');
        }, { once: true });
      });
    }
  }
}
