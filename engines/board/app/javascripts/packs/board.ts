import '../polyfills'
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { AppModule } from '../board';

platformBrowserDynamic().bootstrapModule(AppModule);
