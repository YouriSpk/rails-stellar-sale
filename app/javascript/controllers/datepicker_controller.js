import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["totalSum"]
  connect() {
    flatpickr(this.element, {
      minDate: "today",
      mode: "multiple",
      onChange: function(selectedDates, dateStr, instance) {
        if (selectedDates.length === 2) {
          const startDate = selectedDates[0];
          const endDate = selectedDates[1];
          const date1 = new Date(startDate);
          const date2 = new Date(endDate);
          const diffTime = Math.abs(date2 - date1);
          const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

          document.querySelector("#totalSum").innerHTML =(parseInt(document.querySelector("#starPrice").innerText) * diffDays) + " Euro"
        }
    }
    })
  }
}
