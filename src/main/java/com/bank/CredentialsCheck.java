package com.bank;

import java.io.IOException;

import com.customer.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/bank/logincredentialscheck")
public class CredentialsCheck extends HttpServlet {
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String phoneNumber = request.getParameter("phoneNumber");
        String pin = request.getParameter("pin");

        UserDataHandler login = new UserDataHandler();

        Customer customer = null;
        if (login.check(phoneNumber, pin))
        {
            customer = login.getCustomerData();

	        if (customer != null) {
	            HttpSession session = request.getSession();
	            session.setAttribute("userdata", customer);
	            response.sendRedirect(request.getContextPath() + "/home.jsp");
	            return;
	        }
        }
        else
        {
            request.setAttribute("errorMessage", "Invalid Credentials");
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }
}
