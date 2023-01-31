import { Controller } from '@hotwired/stimulus';

const DEFAULT_DURATION = 5000;

export default class extends Controller {
  static targets = ['container', 'template'];

  async open({ target: { dataset: { content, duration = DEFAULT_DURATION, title } } }) {
    const notification = this.templateTarget.content.cloneNode(true);
    notification.firstElementChild.dataset.notificationComponentDurationValue = duration;
    notification.querySelector('[slot="title"]').textContent = title;
    notification.querySelector('[slot="content"]').innerHTML = content;
    this.containerTarget.appendChild(notification);
  }
}
