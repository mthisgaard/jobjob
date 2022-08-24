import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-notes"
export default class extends Controller {
  static targets = ["form", "input"]

  connect() {
    // console.log("edit notes controller")
    // console.log(this.noteTarget.innerHTML)

  }

  updateNote(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
          console.log(data)
      })
  }
}
