<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>RC ATM</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="<%= request.getContextPath() %>/script/InvalidLogin.js" defer></script>
  <style>
    body {
      background-image: url('<%= request.getContextPath() %>/pictures/atm_bg.jpeg');
      background-size: cover;
      background-position: center;
    }
  </style>
</head>
<body class="h-screen w-screen bg-cover bg-center overflow-hidden flex items-center justify-center" data-error-message="${errorMessage}">

  <!-- Fixed Logo and Heading at Top-Left -->
  <div class="absolute top-4 left-4 flex items-center gap-4 z-10">
    <img src="<%= request.getContextPath() %>/pictures/atm_logo.png"  alt="ATM Logo" class="w-14 h-14 sm:w-20 sm:h-20 object-contain">
    <h1 class="text-xl sm:text-2xl md:text-3xl font-bold text-white drop-shadow-lg">
            Welcome to RC ATM
        </h1>
  </div>

  <!-- Centered Login Box -->
  <div class="bg-white/30 backdrop-blur-md p-6 sm:p-8 rounded-2xl shadow-2xl w-full max-w-md">
    <h2 class="text-xl sm:text-2xl font-bold text-center text-black mb-6">ATM Login</h2>
    <small id="invalidData" style="color: red; font-size:15px;text-align:center;"></small>  
    <form action="<%=request.getContextPath()%>/bank/logincredentialscheck" method="POST" class="space-y-5">
      <div>
        <label class="block text-black font-medium mb-1">Phone Number</label>
        <input type="text" name="phoneNumber" maxlength="10" placeholder="Enter your card number"
               class="w-full px-4 py-2 border border-black/40 bg-black/20 text-black placeholder-black/70 rounded-xl focus:outline-none focus:ring-2 focus:ring-white/60" required />
      </div>

      <div>
        <label class="block text-black font-medium mb-1">PIN</label>
        <input type="password" name="pin" maxlength="4" placeholder="Enter 4-digit PIN"
               class="w-full px-4 py-2 border border-black/40 bg-black/20 text-black placeholder-black/70 rounded-xl focus:outline-none focus:ring-2 focus:ring-white/60" required />
      </div>

      <button type="submit"
              class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 rounded-xl transition duration-200">
        Login
      </button>
      <h4 class="text-center">Don't have an account? <a class="underline decoration-blue-500 text-blue-500 cursor-pointer" href="signup.jsp"> Sign up</a></h4>
    </form>
  </div>

</body>
</html>
