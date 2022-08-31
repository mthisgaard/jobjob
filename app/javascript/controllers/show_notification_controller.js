import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-notification"
export default class extends Controller {
  connect() {
    console.log("notification")
  }

  display() {

  }
}
