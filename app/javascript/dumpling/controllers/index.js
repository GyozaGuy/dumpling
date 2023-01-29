import { Application } from '@hotwired/stimulus';

import AlertController from './controllers/alert_controller';

const application = Application.start();
window.Stimulus = application;

window.Stimulus.register('alert', AlertController);
