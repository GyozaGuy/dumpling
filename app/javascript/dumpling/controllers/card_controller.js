import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['content', 'footer'];

  toggle() {
    this.contentTarget.toggleAttribute('hidden');
    this.footerTarget.toggleAttribute('hidden');
  }
}
