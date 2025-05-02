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
    <title>RC ATM</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body style="background-image: url('<%= request.getContextPath() %>/pictures/atm_bg.jpeg'); background-size: cover; background-position: center;"  
      class="min-h-screen bg-gradient-to-r from-blue-100 to-blue-300 flex items-center justify-center px-4 py-8 relative">

    <%
	    String successMessage = (String) session.getAttribute("successMessage");
	    if (successMessage != null) 
	    {
	        session.removeAttribute("successMessage"); // prevent it from showing again
	%>
		    <script>
		        alert("<%= successMessage %>");
		    </script>
	<%
		}
	%>
    
    <!-- Logo and heading fixed at top-left -->
    <div class="absolute top-4 left-4 flex items-center gap-3">
        <img src="<%= request.getContextPath() %>/pictures/atm_logo.png" alt="ATM Logo" class="w-14 h-14 sm:w-20 sm:h-20 object-contain">
        <h1 class="text-xl sm:text-2xl md:text-3xl font-bold text-white drop-shadow-lg">
            Welcome to RC ATM
        </h1>
    </div>

    <!-- User Details Box centered -->
    <div class="bg-white/30 backdrop-blur-md p-6 sm:p-10 rounded-xl shadow-2xl w-full max-w-2xl mt-20">
        <h2 class="text-2xl sm:text-3xl font-bold text-center mb-6">User Details</h2>
        <hr class="mb-6 border-black">

        <div class="space-y-4 text-gray-800 text-base sm:text-lg">
            <p><strong>Account Holder Name : </strong> <%= user.getAccountHolderName() %></p>
            <p><strong>Account Number : </strong> <%= user.getAccountNumber() %></p>
            <p><strong>IFSC Code : </strong> <%= user.getIFSCCode() %></p>
            <p><strong>Card Number : </strong> <%= user.getCardNumber() %></p>
            <p><strong>E-Mail : </strong> <%= user.getEmail() %></p>
            <p><strong>Address : </strong> <%= user.getAddress() %></p>
            <p><strong>Available Balance : </strong> <%= user.getBalanceAmount() %> ₹</p>
            <p><strong>Phone Number : </strong> <%= user.getPhoneNumber() %></p>
        </div>

        <div class="grid grid-cols-2 sm:grid-cols-4 gap-4 mt-10">
            <form action="<%= request.getContextPath() %>/transactions/deposit.jsp" method="get">
                <button type="submit" class="w-full px-4 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600">Deposit</button>
            </form>
            <form action="<%= request.getContextPath() %>/transactions/transferAmount.jsp" method="get">
                <button type="submit" class="w-full px-4 py-2 bg-yellow-500 text-white rounded-lg hover:bg-yellow-600">Transfer</button>
            </form>
            <form action="<%= request.getContextPath() %>/transactions/withdraw.jsp" method="get">
                <button type="submit" class="w-full px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600">Withdraw</button>
            </form>
            <form action="<%= request.getContextPath() %>/bank/updateUserDetails.jsp" method="post">
                <button type="submit" class="w-full px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600">Update</button>
            </form>
        </div>
    </div>
</body>

</html>
