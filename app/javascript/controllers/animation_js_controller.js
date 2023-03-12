import { Controller } from "@hotwired/stimulus"
import AOS from 'aos';

// Connects to data-controller="animation-js"
export default class extends Controller {
  connect() {
    AOS.init();
  }
}
