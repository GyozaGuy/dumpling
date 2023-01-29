import { setScreenSize } from './helpers/screen';
import './controllers';

window.addEventListener('resize', setScreenSize);
setScreenSize();
