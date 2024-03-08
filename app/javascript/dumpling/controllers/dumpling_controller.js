import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  showDialog({
    target: {
      dataset: { dialogId }
    }
  }) {
    this.#showElement(dialogId);
  }

  #showElement(id) {
    document.getElementById(id).show();
  }
}
