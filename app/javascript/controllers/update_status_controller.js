import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-status"
export default class extends Controller {
  static targets = ["status"]
  connect() {
  }

  show(e) {
    this.statusTarget.classList.toggle('d-none');
  }
}
