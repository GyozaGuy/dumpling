import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  showDialog({
    currentTarget: {
      dataset: { dialogId }
    }
  }) {
    this.#showElement(dialogId);
  }

  showDrawer({
    currentTarget: {
      dataset: { drawerId }
    }
  }) {
    this.#showElement(drawerId);
  }

  #showElement(id) {
    document.getElementById(id).show();
  }
}
