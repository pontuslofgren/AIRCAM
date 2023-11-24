import { Controller } from "@hotwired/stimulus"

  // Connects to data-controller="datepicker"
  export default class extends Controller {

    static values = {
      dates: Array
    };

    connect() {
      console.log("hello")
      console.log(this.datesValue);
      flatpickr(this.element, {
          enableTime: false,
          inline: true,
          dateFormat: "Y-m-d",
          mode: "range",
          disable: this.datesValue // passed via HTML
      })
    }
}
