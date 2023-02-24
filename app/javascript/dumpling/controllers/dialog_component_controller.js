import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static outlets = ['dumpling-dialog-container'];
  static targets = ['template'];
  static values = { dialogId: String };

  connect() {
    setTimeout(() => {
      if (!this.hasDumplingDialogContainerOutlet) {
        throw new Error('Dialog container outlet not found!');
      }

      this.dumplingDialogContainerOutlet.addDialog(this.templateTarget.content.cloneNode(true));
    }, 100);
  }

  openDialog() {
    this.dumplingDialogContainerOutlet.openDialog(this.dialogIdValue);
  }
}
