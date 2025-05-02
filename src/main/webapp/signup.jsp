<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>ATM Sign Up</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    body {
      background-image: url('pictures/atm_bg.jpeg');
      background-size: cover;
      background-position: center;
    }
    small.error {
      color: white;
      font-size: 0.75rem;
    }
  </style>
</head>
<body class="min-h-screen flex item	s-center justify-center p-4">

  <div class="bg-white/30 backdrop-blur-md p-6 sm:p-8 md:p-10 rounded-2xl shadow-2xl w-full max-w-lg">
    <h2 class="text-2xl sm:text-3xl font-bold text-center text-black mb-6">ATM Sign Up</h2>

    <form id="signupForm" action="<%= request.getContextPath() %>/bank/signuphandler" method="post" class="space-y-4">

      <div>
        <label class="block text-black font-medium mb-1">Full Name</label>
        <input type="text" id="username" name="accountholdername" placeholder="Enter your full name"
               class="w-full px-4 py-2 border bg-white/70 text-black rounded-xl" required />
        <small class="text-black" id="usernameError"></small>
      </div>

      <div>
        <label class="block text-black font-medium mb-1">E-mail</label>
        <input type="email" id="email" name="email" placeholder="Enter your email"
               class="w-full px-4 py-2 border bg-white/70 text-black rounded-xl" required />
        <small class="text-black" id="emailError"></small>
      </div>

      <div>
        <label class="block text-black font-medium mb-1">Phone Number</label>
        <input type="text" id="phonenumber" name="phonenumber" placeholder="Enter your phone number"
               class="w-full px-4 py-2 border bg-white/70 text-black rounded-xl" required />
        <small class="text-black" id="phNumberError"></small>
      </div>

      <div>
        <label class="block text-black font-medium mb-1">Address</label>
        <input type="text" name="address" placeholder="Enter your address"
               class="w-full px-4 py-2 border bg-white/70 text-black rounded-xl" required />
      </div>

      <div>
        <label class="block text-black font-medium mb-1">Set 4-digit Unique PIN</label>
        <input type="password" id="password" name="password" maxlength="4" placeholder="Set your PIN"
               class="w-full px-4 py-2 border bg-white/70 text-black rounded-xl" required />
        <small class="text-black" id="passwordError"></small>
      </div>

      <div>
        <label class="block text-black font-medium mb-1">Confirm PIN</label>
        <input type="password" id="confirmPassword" name="confirmPin" maxlength="4" placeholder="Confirm your PIN"
               class="w-full px-4 py-2 border bg-white/70 text-black rounded-xl" required />
        <small class="text-black" id="confirmPasswordError"></small>
      </div>

      <div>
        <label class="block text-black font-medium mb-1">Initial Balance</label>
        <input type="number" id="initialAmount" name="balance" placeholder="Enter starting balance"
               class="w-full px-4 py-2 border bg-white/70 text-black rounded-xl" required />
        <small class="text-black" id="amountError"></small>
      </div>

      <input type="submit" value="Create Account"
             class="w-full cursor-pointer bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 rounded-xl" />

    </form>
  </div>
  <script src="script/script.js"></script>
</body>
</html>
