import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-task"
export default class extends Controller {
  static targets = ["tasks", "form", "input"]

  add(event) {
    event.preventDefault()
    if (this.inputTarget.value.trim() !== '') {
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
          this.tasksTarget.outerHTML = data;
          this.inputTarget.value = "";
      })
    }
  }
}
