document.addEventListener("DOMContentLoaded", function() {
    const reviewForm = document.querySelector("form[action*='/review']");
    if (reviewForm) {
        reviewForm.addEventListener("submit", function() {
            alert("¡Gracias por tu comentario!");
        });
    }
});
