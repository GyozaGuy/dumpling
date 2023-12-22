import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['content'];

  close() {
    this.contentTarget.classList.remove('animate__fadeInDown');
    this.contentTarget.classList.add('animate__fadeOutUp');

    setTimeout(() => {
      this.element.classList.remove('is-active');
    }, 500);
  }
}
