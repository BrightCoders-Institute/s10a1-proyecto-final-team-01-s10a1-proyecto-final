import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tomselect"
export default class extends Controller {
  connect() {
    new TomSelect(this.element, {})
  }
}
