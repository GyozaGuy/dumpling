import { Application } from '@hotwired/stimulus';

import AlertComponentController from './controllers/alert_component_controller';
import NotificationComponentController from './controllers/notification_component_controller';
import NotificationController from './controllers/notification_controller';

const application = Application.start();
window.Stimulus = application;

window.Stimulus.register('alert-component', AlertComponentController);
window.Stimulus.register('notification-component', NotificationComponentController);
window.Stimulus.register('notification', NotificationController);
