import { Controller } from '@hotwired/stimulus';

import { wait } from '../helpers/utilities';

export default class extends Controller {
  static classes = ['closing', 'opening', 'visible'];
  static values = { animationDuration: 250, duration: 5000 };

  async connect() {
    this.element.style.setProperty(
      '--notification-animation-duration',
      `${this.animationDurationValue}ms`
    );
    await wait(this.animationDurationValue);
    this.element.classList.remove(this.openingClass);
    await wait(this.durationValue);
    this.close();
  }

  async close() {
    this.element.classList.add(this.closingClass);
    this.element.classList.remove(this.visibleClass);
    await wait(this.animationDurationValue);
    this.element.remove();
  }
}
