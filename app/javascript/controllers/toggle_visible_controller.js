import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-visible"
export default class extends Controller {
  static targets = ["form"]
  connect() {
    console.log("connected")
  }

  toggleVisible(){
    console.log("clicking")
    this.formTarget.classList.toggle("d-none")
  }
}
