const taskForm = document.getElementById("taskForm");
const ganttChart = document.getElementById("ganttChart");

taskForm.addEventListener("submit", function (e) {

    const taskName = document.getElementById("taskName").value;
    const startDate = document.getElementById("startDate").value;
    const endDate = document.getElementById("endDate").value;

    if (!startDate || !endDate) {
        alert("Por favor, ingrese tanto la fecha de inicio como la fecha de finalización.");
        return;
    }

    const start = new Date(startDate);
    const end = new Date(endDate);

    const duration = (end - start) / (1000 * 3600 * 24); 
    if (duration <= 0) {
        alert("La fecha de finalización no puede ser anterior a la fecha de inicio.");
        return;
    }

    const taskRow = document.createElement("div");
    taskRow.className = "task";

    const taskNameDiv = document.createElement("div");
    taskNameDiv.className = "task-name";
    taskNameDiv.textContent = taskName;

    const taskBarsDiv = document.createElement("div");
    taskBarsDiv.className = "task-bars";

    const totalWidth = duration * 4;
    const completedBar = document.createElement("div");
    completedBar.className = "bar completed";

    const maxWidth = 230;
    const calculatedWidth = totalWidth;
    completedBar.style.width = `${Math.min(calculatedWidth, maxWidth)}px`;
    completedBar.textContent = `${duration} días`;  

    taskBarsDiv.appendChild(completedBar);

    taskRow.appendChild(taskNameDiv);
    taskRow.appendChild(taskBarsDiv);

    ganttChart.appendChild(taskRow);

    taskForm.reset(); 
});
