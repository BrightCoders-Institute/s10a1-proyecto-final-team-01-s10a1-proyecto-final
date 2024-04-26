// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"

import moment from 'moment'
window.moment = moment

import { DateRangePicker } from 'libraries/vanilla-datetimerange-picker'
window.DateRangePicker = DateRangePicker

import TomSelect from "tom-select"
window.TomSelect = TomSelect

import RangeSlider from '@spreadtheweb/multi-range-slider'
window.RangeSlider = RangeSlider

document.addEventListener("DOMContentLoaded", function() {
    let currentSlide = 0;
    const slides = document.querySelectorAll(".slide");
    const totalSlides = slides.length;
  
    function showSlide(n) {
      slides.forEach(slide => slide.classList.remove("active"));
      slides[n].classList.add("active");
    }
  
    showSlide(currentSlide);
  
    function nextSlide() {
      currentSlide = (currentSlide + 1) % totalSlides;
      showSlide(currentSlide);
    }
  
    setInterval(nextSlide, 4000);
  });
