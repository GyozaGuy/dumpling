import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  showDialog({ target }) {
    const actualTarget = target.closest('button') || target.closest('sl-button');
    this.#showElement(actualTarget.dataset.dialogId);
  }

  showDrawer({ target }) {
    const actualTarget = target.closest('button') || target.closest('sl-button');
    this.#showElement(actualTarget.dataset.drawerId);
  }

  #showElement(id) {
    document.getElementById(id).show();
  }
}
