import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="user"
export default class extends Controller {
  connect() {
    console.log('Hello!')
    this.channel = createConsumer().subscriptions.create(
      { channel: "UserChannel" },
      { received: data => {
        console.log(data)
        const message = `<div class="alert alert-info alert-dismissible fade show m-1" role="alert", style="background-color: #D3F3EE; color: black; border: none;">
          ${data}
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
          </button>
          </div>`
          this.element.insertAdjacentHTML('afterbegin', message)
        }
      }
    )
  }
}

