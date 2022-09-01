import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="badges"
export default class extends Controller {
  static targets = ["badgeImage", "badgeInfo"]
  connect() {
    // console.log(this.badgeInfoTargets)
  }

  show(e) {
    const index = this.badgeImageTargets.indexOf(e.currentTarget)
    this.badgeInfoTargets[index].classList.remove("d-none")
  }

  hide(e) {
    const index = this.badgeImageTargets.indexOf(e.currentTarget)
    this.badgeInfoTargets[index].classList.add("d-none")
  }
  // insert the badge with the given information (returning json)
  // set the data target to the element you want
}
