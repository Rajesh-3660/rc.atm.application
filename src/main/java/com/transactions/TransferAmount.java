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

@WebServlet("/transactions/transferamount")
public class TransferAmount extends HttpServlet
{
	DAOClass daoClass;
	UserDataHandler loginDao;
	Customer customer;
	Bank admin;

	public TransferAmount()  {
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
		String cardnumber=request.getParameter("cardnumber");
		String ifsccode=request.getParameter("ifsccode");
		String phonenumber=request.getParameter("phonenumber");
		String amount = request.getParameter("amount");
		double transferAmount=Double.valueOf(amount);

		Customer cust=loginDao.getCustomerData();

		if(currentBalance>=transferAmount)
		{
				TransferAmountHandler transferhandler=new TransferAmountHandler();

				if(transferhandler.checkAccountDetails(transferAmount, accountholdername, accountNumber, cardnumber, ifsccode, phonenumber)) {
				// query
				String quary = "UPDATE userdata SET balance=?  WHERE accountholdername=? and accountnumber=? and ifsccode=?";
				try {

					currentBalance=currentBalance-transferAmount;
					PreparedStatement st = (daoClass.getConnection()).prepareStatement(quary);
					st.setDouble(1, currentBalance);
					st.setString(2, user.getAccountHolderName().toUpperCase());
					st.setString(3, user.getAccountNumber());
					st.setString(4, user.getIFSCCode());


					st.executeUpdate();
	                loginDao.fetchById(id);

					session.setAttribute("userdata", cust);
					session.setAttribute("successMessage", transferAmount+" Rupees Transferred Successful! ");
					response.sendRedirect(request.getContextPath() + "/home.jsp");


				} catch (SQLException e)
				{
					e.printStackTrace();
			    }
			}
		    else {
		    	request.setAttribute("errorMessage","User data not found!");
		    	RequestDispatcher rd = request.getRequestDispatcher("transferAmount.jsp");
			    rd.forward(request, response);
		    }

	   }
	   else
	   {
			request.setAttribute("errorMessage","Your current balance is "+ currentBalance);
			RequestDispatcher rd = request.getRequestDispatcher("transferAmount.jsp");
		    rd.forward(request, response);

	   }
    }
}
