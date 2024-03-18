import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tommultipleselect"
export default class extends Controller {
  connect() {
    new TomSelect(this.element, {
      plugins: ["remove_button"]
    })
  }
}
