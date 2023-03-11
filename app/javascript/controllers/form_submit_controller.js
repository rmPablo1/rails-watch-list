import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-submit"
export default class extends Controller {
  connect(){
    console.log("connected")
  }
  submit() {
    console.log("clicked")
    this.element.submit();
  }
}
