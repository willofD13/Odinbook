import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["post"]
  connect() {
  }

  clear() {
    this.postTarget.reset()
  }
}
