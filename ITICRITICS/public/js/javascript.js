const btnLeft = document.querySelector(".btn-left"),
      btnRight = document.querySelector(".btn-right"),
      slider = document.querySelector("#slider"),
      sliderSections = document.querySelectorAll(".slider-section");

btnLeft.addEventListener("click", moveToLeft);
btnRight.addEventListener("click", moveToRight);

let counter = 0;
const totalSlides = sliderSections.length;
const widthImg = 100 / totalSlides; // Debería ser 20%

function moveToRight() {
    counter++; // Incrementamos primero

    if (counter >= totalSlides) {
        // Si se llega al final, volver al inicio sin transición
        counter = 0;
        slider.style.transition = "none";
        slider.style.transform = `translateX(0%)`;

        // Repaint forzando el desplazamiento antes de continuar
        void slider.offsetWidth;

        return;
    }

    // Aplicar el movimiento con transición
    slider.style.transition = "all ease .6s";
    slider.style.transform = `translateX(-${widthImg * counter}%)`;
}

function moveToLeft() {
    counter--; // Decrementamos primero

    if (counter < 0) {
        // Si estamos en el inicio, ir al final sin transición
        counter = totalSlides - 1;
        slider.style.transition = "none";
        slider.style.transform = `translateX(-${widthImg * counter}%)`;

        // Forzar el repaint
        void slider.offsetWidth;

        return;
    }

    // Aplicar el movimiento con transición
    slider.style.transition = "all ease .6s";
    slider.style.transform = `translateX(-${widthImg * counter}%)`;
}
