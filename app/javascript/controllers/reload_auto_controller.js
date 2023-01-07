import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  connect() {
    this.interval = setInterval(() => {
      window.location.reload()
    }, 2000)
  }

  disconnect() {
    clearInterval(this.interval)
  }
}