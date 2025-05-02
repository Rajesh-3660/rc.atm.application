const form = document.getElementById('signupForm');
const username = document.getElementById('username');
const email = document.getElementById('email');
const phNum = document.getElementById('phonenumber');
const password = document.getElementById('password');
const confirmPassword = document.getElementById('confirmPassword');
const initialAmount = document.getElementById('initialAmount');

let isValidName = false;
let isValidEmail = false;
let isValidPhoneNum = false;
let isValidPassword = false;
let isValidConfirmPassword = false;
let isValidAmount=false;

form.addEventListener('submit', (e) => {
  e.preventDefault();
  validation();
});

function validation() {
  let unameValue = username.value.trim();
  let emailValue = email.value.trim();
  let phoneNoValue = phNum.value.trim();
  let passwordValue = password.value.trim();
  let confirmPasswordValue = confirmPassword.value.trim();
  let initialAmountValue = +initialAmount.value.trim();

  isValidName = isValidEmail = isValidPhoneNum = isValidPassword = isValidConfirmPassword = isValidAmount = false;

  checkUserName(unameValue);
  checkEmail(emailValue);
  checkPhoneNo(phoneNoValue);
  checkPassword(passwordValue);
  checkConfirmPassword(passwordValue, confirmPasswordValue);
  checkInitialAmount(initialAmountValue);

  if (isValidName && isValidEmail && isValidPhoneNum && isValidPassword && isValidConfirmPassword && isValidAmount) {
    form.submit();
  }
}

function checkUserName(value) {
  if (value === '') {
    setError(username, "User name cannot be empty");
  } else if (value.length < 5) {
    setError(username, "User name must be at least 5 characters");
  } else {
    setSuccess(username);
    isValidName = true;
  }
}

function checkEmail(value) {
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (value === '') {
    setError(email, "Email cannot be empty.");
  } else if (!regex.test(value)) {
    setError(email, "Invalid email format.");
  } else {
    setSuccess(email);
    isValidEmail = true;
  }
}

function checkPhoneNo(value) {
  const regex = /^\d{10}$/;
  if (value === '') {
    setError(phNum, "Phone Number cannot be empty.");
  } else if (!regex.test(value)) {
    setError(phNum, "Phone number must be 10 digits.");
  } else {
    setSuccess(phNum);
    isValidPhoneNum = true;
  }
}

function checkPassword(value) {
  const regex = /^\d{4}$/;
  if (value === '') {
    setError(password, "PIN cannot be empty.");
  } else if (!regex.test(value)) {
    setError(password, "PIN must be exactly 4 digits.");
  } else {
    setSuccess(password);
    isValidPassword = true;
  }
}

function checkConfirmPassword(pass, confirmPass) {
  if (confirmPass === '') {
    setError(confirmPassword, "Confirm PIN cannot be empty.");
  } else if (pass !== confirmPass) {
    setError(confirmPassword, "PINs do not match.");
  } else {
    setSuccess(confirmPassword);
    isValidConfirmPassword = true;
  }
}

function checkInitialAmount(amount) {
  if (isNaN(amount) || amount < 1000) {
    setError(initialAmount, "The initial amount should be 1000 or moore than 1000.");
  } else {
    setSuccess(initialAmount);
    isValidAmount = true;
  }
}


function setError(input, message) {
  const parent = input.parentElement;
  const small = parent.querySelector('small');
  small.innerText = message;
  input.style.border = '2px solid red';
}

function setSuccess(input) {
  const parent = input.parentElement;
  const small = parent.querySelector('small');
  small.innerText = '';
  input.style.border = '2px solid green';
}
