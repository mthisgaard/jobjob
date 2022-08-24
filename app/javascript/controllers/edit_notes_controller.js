import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-notes"
export default class extends Controller {
  static targets = ["note"]

  connect() {
    // console.log("edit notes controller")
    // console.log(this.noteTarget.innerHTML)
    this.noteTargets.forEach(note => {
      console.log(note.dataset.jobid)
    });
  }

  updateNote() {
    // console.log(this.noteTarget.innerHTML)
    // console.log(this.currentTarget.dataset.jobId)
  }
}
