import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['modal']

  close() {
    this.modalTarget.remove()
  }
}