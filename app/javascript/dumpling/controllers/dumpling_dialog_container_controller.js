import { Controller } from '@hotwired/stimulus';

import { wait } from 'dumpling/helpers/utilities';

export default class extends Controller {
  static classes = ['closing', 'opening', 'visible'];
  static targets = ['dialog', 'scrim'];
  static values = { activeDialogId: String, startX: Number, startY: Number };

  addDialog(dialogElement) {
    this.element.appendChild(dialogElement);
  }

  beginMove({ clientX, clientY, params: { dialogId } }) {
    this.activeDialogId = dialogId;
    const [x, y] = this.dialogCoords();
    this.startXValue = clientX - x;
    this.startYValue = clientY - y;
    document.body.addEventListener('mousemove', this.handleMouseMove);
  }

  async close({ params: { dialogId } }) {
    const { dialog, scrim } = this.findDialog(dialogId);
    dialog.classList.add(this.closingClass);

    if (scrim) {
      scrim.classList.add(this.closingClass);
    }

    await wait(120); // NOTE: This is shorter than the animation duration on purpose

    dialog.classList.remove(this.visibleClass, this.closingClass);

    if (scrim) {
      scrim.classList.remove(this.visibleClass, this.closingClass);
    }
  }

  dialogCoords() {
    const x = (
      parseInt(this.activeDialog.style.getPropertyValue('--dialog-translate-x')) || 0
    );
    const y = (
      parseInt(this.activeDialog.style.getPropertyValue('--dialog-translate-y')) || 0
    );
    return [x, y];
  }

  endMove() {
    document.body.removeEventListener('mousemove', this.handleMouseMove);
  }

  findDialog(dialogId) {
    const byDialogId = target => target.dataset.dialogId === dialogId;
    const dialog = this.dialogTargets.find(byDialogId);
    const scrim = this.scrimTargets.find(byDialogId);
    return { dialog, scrim };
  }

  handleMouseMove = ({ clientX, clientY }) => {
    const newX = (this.startXValue - clientX) * -1;
    const newY = (this.startYValue - clientY) * -1;
    this.activeDialog.style.setProperty('--dialog-translate-x', `${newX}px`);
    this.activeDialog.style.setProperty('--dialog-translate-y', `${newY}px`);
  };

  async openDialog(dialogId) {
    const { dialog, scrim } = this.findDialog(dialogId);
    dialog.classList.add(this.openingClass, this.visibleClass);

    if (scrim) {
      scrim.classList.add(this.openingClass, this.visibleClass);
    }

    await wait(125);

    dialog.classList.remove(this.openingClass);

    if (scrim) {
      scrim.classList.remove(this.openingClass);
    }
  }

  get activeDialog() {
    return this.findDialog(this.activeDialogId).dialog;
  }
}
