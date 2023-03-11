import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="typed-js"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Create a list", "Review a film"],
      typeSpeed: 50,
      loop: true
    })
  }
}
