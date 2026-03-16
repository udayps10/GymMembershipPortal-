function choosePlan(planName, days) {
    
    localStorage.setItem("plan", planName);
    localStorage.setItem("days", days);

    
    window.location.href = "dashboard.jsp";
}

function loadDashboard() {
    const plan = localStorage.getItem("plan");
    const days = localStorage.getItem("days");

    if (plan && days) {
        document.getElementById("plan").innerText = plan;
        document.getElementById("days").innerText = days + " days";
    }

    document.getElementById("welcome").innerText = "Welcome to Fitzone 💪";
}
function choosePlan(planName, days){

    localStorage.setItem("plan", planName);
    localStorage.setItem("days", days);

    // Elite users choose trainer
    if(planName === "Elite"){
        window.location.href = "trainers.jsp";
    }else{
        window.location.href = "dashboard.jsp";
    }
}