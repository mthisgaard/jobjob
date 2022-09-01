import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-status"
export default class extends Controller {
  static targets = ["status"]
  connect() {
  }

  update() {
    console.log(this.statusTarget)
  }
}
