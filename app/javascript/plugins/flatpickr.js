import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

console.log("Hello");

flatpickr(".datepicker", {
  enableTime: true
})
