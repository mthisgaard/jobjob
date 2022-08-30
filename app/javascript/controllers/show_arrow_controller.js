import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-arrow"
export default class extends Controller {
  static targets = ["text"]
  connect() {
  }

  show() {
    if (this.textTarget.innerHTML == "Show more <i class=\"fa-solid fa-angle-down\"></i>") {
      this.textTarget.innerHTML = "Show less <i class=\"fa-solid fa-angle-up\"></i>"
    } else {
      this.textTarget.innerHTML = "Show more <i class=\"fa-solid fa-angle-down\"></i>"
    }
  }
}
