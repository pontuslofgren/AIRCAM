import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
        enableTime: false,
        dateFormat: "Y-m-d H:i",
        mode: "range",
        disable: [
          // these dates should be provided from the camera controller
          // how do I accomplish this?
          // This should be used on the booking and the unavailabilities forms?
          {
              from: "2023-12-01",
              to: "2023-12-03"
          },
          {
              from: "2025-09-01",
              to: "2025-12-01"
          }
      ]
    })
  }
}