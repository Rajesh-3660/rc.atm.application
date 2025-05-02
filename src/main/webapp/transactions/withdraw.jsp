<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.customer.Customer" %>
<%
    Customer user = (Customer) session.getAttribute("userdata");
    if (user == null) 
    {
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
    <script src="../script/InvalidLogin.js" defer></script>
</head>
<body style="background-image: url('<%= request.getContextPath() %>/pictures/atm_bg.jpeg'); background-size: cover; background-position: center;"  
      class="min-h-screen bg-gradient-to-r from-blue-100 to-blue-300 flex items-center justify-center px-4 py-8 relative" data-error-message="${errorMessage}" >

    <!-- Logo and heading fixed at top-left -->
    <div class="absolute top-4 left-4 flex items-center gap-3">
        <img src="../pictures/atm_logo.png" alt="ATM Logo" class="w-14 h-14 sm:w-20 sm:h-20 object-contain">
        <h1 class="text-xl sm:text-2xl md:text-3xl font-bold text-white drop-shadow-lg">
            Welcome to RC ATM
        </h1>
    </div>
     <div class="bg-white/30 backdrop-blur-md p-6 sm:p-10 rounded-xl shadow-2xl w-full max-w-2xl mt-20 ">
    
        <h2 class="text-2xl font-bold text-center mb-6 border-b border-black pb-2">User Details</h2>

       <form action="<%= request.getContextPath() %>/transactions/withdrawl" method="post" class="space-y-4">
            <div>
                <label class="block font-semibold">Account Holder Name :</label>
                <input type="text" name="accountholdername" value="<%= user.getAccountHolderName() %>" class="w-full mt-1 p-2 border rounded-md"  required>
            </div>

            <div>
                <label class="block font-semibold">Account Number :</label>
                <input type="text" name="accountnumber"  maxlength="15" value="<%= user.getAccountNumber()%>" class="w-full mt-1 p-2 border rounded-md"  required>
            </div>

			<div>
                <label class="block font-semibold">IFSC Code : </label>
                <input type="text" name="ifsccode" value="<%= user.getIFSCCode() %>" class="w-full mt-1 p-2 border rounded-md" required>
            </div>
            
            <div>
                <label class="block font-semibold">Amount :</label>
                <input type="number" name="amount" placeholder="Enter how much amount you want to withdraw" class="w-full mt-1 p-2 border rounded-md" required>
    			<small id="invalidData" style="color: red; font-size:15px;text-align:center;"></small>  
              
            </div>

            <button type="submit" class="w-full bg-blue-600 text-white font-bold py-2 rounded-md hover:bg-blue-700">
                Withdraw
            </button>
        </form>
    </div>

</body>
</html>