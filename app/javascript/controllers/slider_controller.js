import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["sliderItems", "sliderItem", "prevButton", "nextButton"];

  currentIndex = 0;

  connect() {
    this.slider = this.sliderItemsTarget;
    this.items = this.sliderItemTargets;
    this.prevButton = this.prevButtonTarget;
    this.nextButton = this.nextButtonTarget;
  }

  nextSlide() {
    if (this.currentIndex < this.items.length - 10) {
      this.currentIndex++;
      this.updateSlider();
    }
    console.log(this.currentIndex);
    console.log(this.items);
    console.log(this.sliderItemTargets);
  }

  prevSlide() {
    if (this.currentIndex > 0) {
      this.currentIndex--;
      this.updateSlider();
    }
  }

  updateSlider() {
    const offset = -this.currentIndex * (this.items[0].offsetWidth + 10);
    this.slider.style.transform = `translateX(${offset}px)`;

    if (this.currentIndex === 0) {
      this.prevButton.style.display = "none";
    } else {
      this.prevButton.style.display = "flex";
    }

    if (this.currentIndex >= this.items.length - 10) {
      this.nextButton.style.display = "none";
    } else {
      this.nextButton.style.display = "flex";
    }
  }
}
