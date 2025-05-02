<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.customer.Customer" %>
<%
    Customer user = (Customer) session.getAttribute("userdata");
    if (user == null) {
        response.sendRedirect("../index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>	
    <meta charset="UTF-8">
    <title>User Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body style="background-image: url('<%= request.getContextPath() %>/pictures/atm_bg.jpeg'); background-size: cover; background-position: center;"  
      class="min-h-screen bg-gradient-to-r from-blue-100 to-blue-300 flex items-center justify-center px-4 py-8 relative">

    <!-- Logo and heading fixed at top-left -->
    <div class="absolute top-4 left-4 flex items-center gap-3">
        <img src="<%= request.getContextPath() %>/pictures/atm_logo.png" alt="ATM Logo" class="w-14 h-14 sm:w-20 sm:h-20 object-contain">
        <h1 class="text-xl sm:text-2xl md:text-3xl font-bold text-white drop-shadow-lg">
            Welcome to RC ATM
        </h1>
    </div>
     <div class="bg-white/30 backdrop-blur-md p-6 sm:p-10 rounded-xl shadow-2xl w-full max-w-2xl mt-20">
    
        <h2 class="text-2xl font-bold text-center mb-6 border-b border-black pb-2">User Details</h2>

        <form action="<%= request.getContextPath() %>/bank/updateuserdata" method="post" class="space-y-4">
            <div>
                <label class="block font-semibold">Account Holder Name:</label>
                <input type="text" name="updatedName" value="<%= user.getAccountHolderName() %>" class="w-full mt-1 p-2 border rounded-md" required>
            </div>

            <div>
                <label class="block font-semibold">Phone Number:</label>
                <input type="tel" name="updatedPhoneNumber"  maxlength="10" value="<%= user.getPhoneNumber() %>" class="w-full mt-1 p-2 border rounded-md" required>
            </div>

            <div>
                <label class="block font-semibold">Address:</label>
                <input type="text" name="updatedAddress" value="<%= user.getAddress() %>" class="w-full mt-1 p-2 border rounded-md" required>
            </div>

            <div>
                <label class="block font-semibold">E-mail:</label>
                <input type="email" name="updatedEmail" value="<%= user.getEmail() %>" class="w-full mt-1 p-2 border rounded-md" required>
            </div>

            <div>
                <label class="block font-semibold">Password</label>
                <input type="password" name="updatedPassword"  maxlength="4" value="<%= user.getPassword() %>" class="w-full mt-1 p-2 border rounded-md" required>
            </div>
            
            <button type="submit" class="w-full bg-blue-600 text-white font-bold py-2 rounded-md hover:bg-blue-700">
                Update Details
            </button>
        </form>
    </div>

</body>
</html>
