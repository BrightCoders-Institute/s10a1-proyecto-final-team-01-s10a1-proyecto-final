let currentIndex = 0;
const slider = document.querySelector(".slider-items");
const items = document.querySelectorAll(".slider-item");
const prevButton = document.querySelector(".prev-button");
const nextButton = document.querySelector(".next-button");

function nextSlide() {
  if (currentIndex < items.length - 10) {
    currentIndex++;
    updateSlider();
  }
}

function prevSlide() {
  if (currentIndex > 0) {
    currentIndex--;
    updateSlider();
  }
}

function updateSlider() {
  const offset = -currentIndex * (items[0].offsetWidth + 10);
  slider.style.transform = `translateX(${offset}px)`;

  // Mostrar u ocultar el botón de "Prev" dependiendo de la posición actual
  if (currentIndex === 0) {
    prevButton.style.display = "none";
  } else {
    prevButton.style.display = "flex";
  }

  // Mostrar u ocultar el botón de "Next" dependiendo de la posición actual
  if (currentIndex >= items.length - 10) {
    nextButton.style.display = "none";
  } else {
    nextButton.style.display = "flex";
  }
}
