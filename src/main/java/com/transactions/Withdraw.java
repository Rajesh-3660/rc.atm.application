package com.transactions;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bank.Bank;
import com.bank.UserDataHandler;
import com.customer.Customer;
import com.dao.DAOClass;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/transactions/withdrawl")
public class Withdraw extends HttpServlet
{
	DAOClass daoClass;
	UserDataHandler loginDao;
	Customer customer;
	Bank admin;

	public Withdraw()  {
		daoClass = new DAOClass();
		loginDao = new UserDataHandler();
		customer = new Customer();
		admin=new Bank();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Customer user = (Customer) session.getAttribute("userdata");
		double currentBalance=user.getBalanceAmount();
		int id = user.getId();

        String accountholdername=request.getParameter("accountholdername");
		String accountNumber = request.getParameter("accountnumber");
		String ifsccode=request.getParameter("ifsccode");
		String amount = request.getParameter("amount");
		double withdrawlAmount=Double.valueOf(amount);

		Customer cust=loginDao.getCustomerData();
        System.out.println("hi hello namaste aadaam"+currentBalance);


		if(currentBalance>=withdrawlAmount)
		{
			admin.updateWithdrawlAmount(user, withdrawlAmount);
			currentBalance=currentBalance-withdrawlAmount;

			// query
			String quary = "UPDATE userdata SET balance=?  WHERE accountholdername=? and accountnumber=? and ifsccode=?";
			try {

				PreparedStatement st = (daoClass.getConnection()).prepareStatement(quary);
				st.setDouble(1, currentBalance);
				st.setString(2, accountholdername.toUpperCase());
				st.setString(3, accountNumber);
				st.setString(4,ifsccode);


				st.executeUpdate();
                loginDao.fetchById(id);

				session.setAttribute("userdata", cust);
				session.setAttribute("successMessage", withdrawlAmount+" Rupees Withdrawal Successful! ");
				response.sendRedirect(request.getContextPath() + "/home.jsp");

			} catch (SQLException e)
			{
				e.printStackTrace();
		    }
	   }
		else {
			request.setAttribute("errorMessage","Your current balance is "+ currentBalance);
			RequestDispatcher rd = request.getRequestDispatcher("withdraw.jsp");
		    rd.forward(request, response);

		}
	}
}
