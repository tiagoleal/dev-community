import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="bs-modal"
export default class extends Controller {
  connect() {
    console.log("I Am Also Connected!!!");
    this.modal = new bootstrap.Modal(this.element, {
      keyboard: false,
    });
    this.modal.show();
  }

  disconnect() {
    this.modal.hide();
  }

  submitEnd(event) {
    console.log("event:" + event);
    this.modal.hide();
  }
}