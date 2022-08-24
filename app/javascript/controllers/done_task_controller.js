import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="done-task"
export default class extends Controller {
  static targets = ["form"]
  
  toggle(event) {

    fetch(this.formTarget.action, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
  }
}