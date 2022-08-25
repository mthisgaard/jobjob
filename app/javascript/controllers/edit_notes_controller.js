import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-notes"
export default class extends Controller {
  static targets = ["form", "input", "save"]

  connect() {
console.log("hello")
  }

  updateNote(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
  }

  showButton() {
    this.saveTarget.classList.remove('hide');
  }
}
