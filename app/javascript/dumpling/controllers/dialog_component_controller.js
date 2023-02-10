import { Controller } from '@hotwired/stimulus';

import { wait } from '../helpers/utilities';

export default class extends Controller {
  static classes = ['closing', 'opening', 'visible'];
  static targets = ['dialog', 'scrim'];

  async close() {
    this.dialogTarget.classList.add(this.closingClass);

    if (this.hasScrimTarget) {
      this.scrimTarget.classList.add(this.closingClass);
    }

    await wait(124); // NOTE: This is shorter than the animation duration on purpose

    this.dialogTarget.classList.remove(this.visibleClass, this.closingClass);

    if (this.hasScrimTarget) {
      this.scrimTarget.classList.remove(this.visibleClass, this.closingClass);
    }
  }

  async open() {
    this.dialogTarget.classList.add(this.openingClass, this.visibleClass);

    if (this.hasScrimTarget) {
      this.scrimTarget.classList.add(this.openingClass, this.visibleClass);
    }

    await wait(125);

    this.dialogTarget.classList.remove(this.openingClass);

    if (this.hasScrimTarget) {
      this.scrimTarget.classList.remove(this.openingClass);
    }
  }
}
