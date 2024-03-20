import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  showDialog({
    target: {
      dataset: { dialogId }
    }
  }) {
    this.#showElement(dialogId);
  }

  showDrawer({ target }) {
    const actualTarget = target.closest('button');
    this.#showElement(actualTarget.dataset.drawerId);
  }

  #showElement(id) {
    document.getElementById(id).show();
  }
}
