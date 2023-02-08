import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static classes = ['active'];
  static targets = ['tab', 'tabContent'];
  static values = { selectedIndex: String };

  selectedIndexValueChanged(newValue) {
    for (const tab of this.tabTargets) {
      if (tab.dataset.index === newValue) {
        tab.classList.add(this.activeClass);
      } else {
        tab.classList.remove(this.activeClass);
      }
    }

    for (const tabContent of this.tabContentTargets) {
      tabContent.hidden = tabContent.dataset.index !== newValue;
    }
  }

  select({ target }) {
    const actualTarget = target.closest('.tab');
    const { index } = actualTarget.dataset;
    this.selectedIndexValue = index;
  }
}
