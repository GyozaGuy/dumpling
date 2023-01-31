import { Application } from '@hotwired/stimulus';

import AlertComponentController from './controllers/alert_component_controller';

const application = Application.start();
window.Stimulus = application;

window.Stimulus.register('alert-component', AlertComponentController);
