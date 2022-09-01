import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="done-task"
export default class extends Controller {
  static targets = ["form", "task"]

  toggle(event) {

    fetch(this.formTarget.action, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
    // parses the json
    // if new badge is added then dispatch action to the badges controller with the returning information
    // when the toggle is enacted
  }

  remove(event) {
    this.taskTarget.outerHTML = "";
  }
}
