import 'dumpling/controllers';
import { html } from 'dumpling/helpers/dom';

document.body.insertAdjacentElement('afterbegin', html`
  <div
    data-controller="dumpling-dialog-container"
    data-dumpling-dialog-container-closing-class="dialog-closing"
    data-dumpling-dialog-container-opening-class="dialog-opening"
    data-dumpling-dialog-container-visible-class="dialog-visible"
    data-turbo-cache="false"
  ></div>
`.firstElementChild);
