import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rangeslider"
export default class extends Controller {
  static values = {
    min: Number,
    max: Number,
    range: String,
    field: String
  }

  connect() {
    let field = document.getElementById(this.fieldValue);

    if (this.rangeValue !== undefined && this.rangeValue !== "") {
      var range = this.rangeValue.split(",").map(number => parseInt(number)).sort((a, b) => a - b)
    }
    else {
      var range = [this.minValue, this.maxValue]
    }

    new RangeSlider("#" + this.element.id, {
      values: [range[0], range[range.length - 1]],
      min: this.minValue,
      max: this.maxValue,
      pointRadius: 8
    }).onChange(values => {
      field.value = values;
    })
  }
}
