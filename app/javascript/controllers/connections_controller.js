import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["connection"];

  connect() {
    this.element.setAttribute(
      "data-action",
      "click->connections#prepareConnectionParams"
    );
  }

  prepareConnectionParams(event) {
    event.preventDefault();

    const element = this.connectionTarget;

    if (!element) {
      console.error("Connection target not found.");
      return;
    }

    const requesterId = element.dataset.requesterId;
    const connectedId = element.dataset.connectedId;

    if (!requesterId || !connectedId) {
      console.error("Requester ID or Connected ID is missing.");
      return;
    }

    this.url = this.element.getAttribute("href");

    const connectionBody = new FormData();

    connectionBody.append("connection[user_id]", requesterId);
    connectionBody.append("connection[connected_user_id]", connectedId); // Fixed typo in attribute name
    connectionBody.append("connection[status]", "pending");

    fetch(this.url, {
      method: "POST",
      headers: {
        Accept: "text/vnd.turbo-stream.html",
        "X-CSRF-Token": document
          .querySelector('meta[name="csrf-token"]') // Fixed typo in 'metal' to 'meta'
          .getAttribute("content"),
      },
      body: connectionBody,
    })
      .then((response) => response.text())
      .then((html) => Turbo.renderStreamMessage(html))
      .catch((error) => {
        console.error("Error during fetch:", error);
      });
  }
}
