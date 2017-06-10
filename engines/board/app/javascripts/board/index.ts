import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import ExampleComponent from "./example.component";

@NgModule({
  declarations: [
    ExampleComponent
  ],
  imports: [
    BrowserModule,
  ],
  providers: [ ],
  bootstrap: [ExampleComponent]
})
export class AppModule { }
