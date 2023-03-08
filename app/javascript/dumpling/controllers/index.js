import { eagerLoadControllersFrom } from '@hotwired/stimulus-loading';

eagerLoadControllersFrom('dumpling/components', window.Stimulus);
eagerLoadControllersFrom('dumpling/controllers', window.Stimulus);
eagerLoadControllersFrom('components', window.Stimulus);
