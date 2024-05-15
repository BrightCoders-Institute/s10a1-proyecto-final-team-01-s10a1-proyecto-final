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
    let range = [this.minValue, this.maxValue];

    if (this.rangeValue !== undefined && this.rangeValue !== "") {
      range = this.rangeValue.split(",").map(number => parseInt(number)).sort((a, b) => a - b)
    }

    new RangeSlider("#" + this.element.id, {
      values: range,
      min: this.minValue,
      max: this.maxValue,
      pointRadius: 8
    }).onChange(values => {
      field.value = values;
    })
  }
}
