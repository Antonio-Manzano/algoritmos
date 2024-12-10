function toggleMenu() {
    var menu = document.getElementById("menu");
    if (menu.style.display === "block") {
      menu.style.display = "none";
    } else {
      menu.style.display = "block";
    }
}
  

window.onclick = function(event) {
    var menu = document.getElementById("menu");
    var profilePic = document.querySelector('.user');
    
    if (menu.style.display === "block" && !menu.contains(event.target) && event.target !== profilePic) {
      menu.style.display = "none";
    }
}


const notificationIcon = document.querySelector('.notificaciones img');
const notificationList = document.querySelector('.lista-notificaciones');

notificationIcon.addEventListener('click', () => {
    notificationList.style.display = notificationList.style.display === 'block' ? 'none' : 'block';
});

document.addEventListener('click', (event) => {
    if (!notificationIcon.contains(event.target) && !notificationList.contains(event.target)) {
        notificationList.style.display = 'none';
    }
});

const aceptarBtns = document.querySelectorAll('.aceptar');
const rechazarBtns = document.querySelectorAll('.rechazar');

function showProject(id) {
  const proyecto = proyectos.find(p => p.id === id);
  if (proyecto) {
      const projectDetails = document.getElementById("project-details");
      projectDetails.innerHTML = `
          <h2>${proyecto.nombre}</h2>
          <p>${proyecto.descripcion}</p>
      `;
      projectDetails.style.display = "block"; 
  }
}

function toggleSidebar() {
  document.getElementById("sidebar").classList.toggle("active");
  document.getElementById("content").classList.toggle("shifted");
}

function openPopup() {
      document.getElementById("popup").classList.remove("hidden");
}
  
function closePopup() {
      document.getElementById("popup").classList.add("hidden");
}

