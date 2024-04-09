import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reservationdatespicker"
export default class extends Controller {
  static values = {
    reservationId: Number
  }
  static targets = ["accommodation", "datesrange"];

  connect() {
    let fieldNames = ["minDate", "maxDate"];
    let occupiedDatesList;

    let dateRangeObject = {
      autoApply: true,
      alwaysShowCalendars: true,
      opens: 'left',
      ranges: {
        'Today': [moment().startOf('day'), moment().endOf('day')],
        'Yesterday': [moment().subtract(1, 'days').startOf('day'), moment().subtract(1, 'days').endOf('day')],
        'Tomorrow': [moment().add(1, 'days').startOf('day'), moment().add(1, 'days').endOf('day')],
        'Last 7 Days': [moment().subtract(6, 'days').startOf('day'), moment().endOf('day')],
        'Next 7 Days': [moment().startOf('day'), moment().add(6, 'days').endOf('day')],
        'This Month': [moment().startOf('month').startOf('day'), moment().endOf('month').endOf('day')],
      },
      locale: {
        format: "YYYY/MM/DD"
      },
      isInvalidDate: function(m) {
        return occupiedDatesList.some((dates_range) => {
          let momentDatesRange = dates_range.split("-").map((date) => moment(date.trim(), "YYYY/MM/DD"));
          return m.isBetween(momentDatesRange[0], momentDatesRange[1], 'days', '[]');
        });
      }
    }

    let updateValidDatesInPicker = (function updateValidDatesInPicker(event) {
      if(this.accommodationTarget.value !== undefined && this.accommodationTarget.value !== "") {
        fetch("/accommodation_occupation/show/" + this.accommodationTarget.value + "/" + this.reservationIdValue)
        .then(response => response.json())
        .then((data) => {
          let currentDate = moment().format("YYYY/MM/DD");

          let range = [data.min_date, data.max_date].sort((a, b) => a - b);
          range.forEach((value, i) => setDateProperty(fieldNames[i], value, dateRangeObject));

          occupiedDatesList = data.dates_ranges;
          if(this.datesrangeTarget.value == "") this.datesrangeTarget.value = currentDate + " - " + currentDate;
          new DateRangePicker(this.datesrangeTarget, dateRangeObject);
        })
        .catch((error) => { console.error("Error while fetching accommodation data. " + error); });
      }
    }).bind(this);

    function setDateProperty(property, value, object) {
      if(property !== undefined) object[property] = value;
    }

    this.accommodationTarget.addEventListener('change', updateValidDatesInPicker);
    updateValidDatesInPicker();
  }
}
