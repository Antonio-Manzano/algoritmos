const creadoresButton = document.getElementById("creadoresButton");
const creadoresOverlay = document.getElementById("creadoresOverlay");
const overlayContent = document.querySelector(".overlayContent");

// Mostrar el overlay al presionar el botón "DESARROLLADORES"
creadoresButton.addEventListener("click", () => {
    creadoresOverlay.style.display = "flex";
});

creadoresOverlay.addEventListener("click", (event) => {
    if (event.target === creadoresOverlay) {
        creadoresOverlay.style.display = "none";
    }
});
