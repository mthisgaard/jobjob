import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="user-subscription"
export default class extends Controller {
  connect() {
    console.log(`Subscribed to the UserChannel`)
    // this.channel = createConsumer().subscriptions.create(
    //   { channel: "UserChannel" },
    //   { received: data => console.log(data) }
    // )
  }
}
