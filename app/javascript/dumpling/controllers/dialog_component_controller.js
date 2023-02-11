import { Controller } from '@hotwired/stimulus';

import { wait } from 'dumpling/helpers/utilities';

export default class extends Controller {
  static classes = ['closing', 'opening', 'visible'];
  static targets = ['dialog', 'scrim'];
  static values = { startX: Number, startY: Number };

  beginMove({ clientX, clientY }) {
    const [x, y] = this.dialogCoords;
    this.startXValue = clientX - x;
    this.startYValue = clientY - y;
    document.body.addEventListener('mousemove', this.handleMouseMove);
  }

  async close() {
    this.dialogTarget.classList.add(this.closingClass);

    if (this.hasScrimTarget) {
      this.scrimTarget.classList.add(this.closingClass);
    }

    await wait(120); // NOTE: This is shorter than the animation duration on purpose

    this.dialogTarget.classList.remove(this.visibleClass, this.closingClass);

    if (this.hasScrimTarget) {
      this.scrimTarget.classList.remove(this.visibleClass, this.closingClass);
    }
  }

  endMove() {
    document.body.removeEventListener('mousemove', this.handleMouseMove);
  }

  handleMouseMove = ({ clientX, clientY }) => {
    const newX = (this.startXValue - clientX) * -1;
    const newY = (this.startYValue - clientY) * -1;

    this.dialogTarget.style.setProperty('--dialog-translate-x', `${newX}px`);
    this.dialogTarget.style.setProperty('--dialog-translate-y', `${newY}px`);
  };

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

  get dialogCoords() {
    const x = (
      parseInt(this.dialogTarget.style.getPropertyValue('--dialog-translate-x')) || 0
    );
    const y = (
      parseInt(this.dialogTarget.style.getPropertyValue('--dialog-translate-y')) || 0
    );
    return [x, y];
  }
}
