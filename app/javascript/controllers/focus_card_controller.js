import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="focus-card"
export default class extends Controller {
  static targets = ["card"]
  connect() {
    console.log("focus card")
  }

  focus(event) {
    // console.log(event.currentTarget)
  }
}
