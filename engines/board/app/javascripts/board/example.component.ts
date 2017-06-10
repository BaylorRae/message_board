import { Component } from '@angular/core';

@Component({
  selector: 'example',
  template: `<h1>Hello {{name}}!</h1>`
})
export default class ExampleComponent {
  name = 'World'
}