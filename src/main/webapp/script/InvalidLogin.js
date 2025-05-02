// InvalidLogin.js
document.addEventListener("DOMContentLoaded", function () {
    let errorMessage = document.getElementById("invalidData");
    let message = document.querySelector("body").getAttribute("data-error-message");
   
    if (message) {
        errorMessage.innerText = message;
        errorMessage.style.display = "block";
    }
});

document.querySelector("form").addEventListener("submit", function (e) {
    let amount = parseFloat(document.querySelector("input[name='amount']").value);
    if (amount <= 0) {
        e.preventDefault();
        document.getElementById("invalidData").innerText = "Amount must be greater than 0.";
    }
});

