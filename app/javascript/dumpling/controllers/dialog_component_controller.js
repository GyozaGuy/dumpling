import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static outlets = ['dumpling-dialog-container'];
  static values = { dialogId: String };

  openDialog() {
    this.dumplingDialogContainerOutlet.openDialog(this.dialogIdValue);
  }
}
