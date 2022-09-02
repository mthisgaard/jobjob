import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["jobs", "tab"]
  connect() {
  }

  open(event) {
    event.preventDefault()

    this.updateActive(event.currentTarget)

    const url = event.currentTarget.href
    console.log(url)
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.element.innerHTML = data;
        window.history.pushState(url,"");
      })
  }

  updateActive(clicked) {
    this.tabTargets.forEach(tab => {
      tab.classList.remove("active")
    });

    clicked.classList.add("active")
  }

}
