import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  toggleMenu() {
    this.element.classList.toggle('is-active');
  }
}
