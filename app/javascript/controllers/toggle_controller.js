import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "button"];

  toggle() {
    this.formTarget.classList.toggle("hidden");
    if (this.formTarget.classList.contains("hidden")) {
      this.buttonTarget.textContent = "Show Filters";
    } else {
      this.buttonTarget.textContent = "Hide Filters";
    }
  }
}
