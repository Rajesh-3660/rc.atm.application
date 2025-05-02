package com.transactions;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.customer.Customer;
import com.dao.DAOClass;


public class TransferAmountHandler {
    DAOClass loginDao;
    Customer customer;
    double balance;

    public TransferAmountHandler() {
        loginDao = new DAOClass();
        customer = new Customer();
    }

    public  boolean findTransferDetails(String accountholdername,String accountnumber,String cardNumber,String ifsccode,String phoneNumber)
    {
    	String query = "select balance from userdata where accountholdername=? and accountnumber=? and cardNumber=? and ifsccode=? and phoneNumber=?";
        try
        {
            PreparedStatement st = (loginDao.getConnection()).prepareStatement(query);
            st.setString(1, accountholdername);
            st.setString(2, accountnumber);
            st.setString(3, cardNumber);
            st.setString(4, ifsccode);
            st.setString(5, phoneNumber);
            ResultSet rs = st.executeQuery();

            if (rs.next())
            {
                 this.balance=rs.getDouble("balance");
                 return true;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkAccountDetails(double transferedAmount,String accountholdername, String accountnumber,String cardNumber,String ifsccode,String phoneNumber) {

    	if(findTransferDetails(accountholdername,accountnumber,cardNumber,ifsccode,phoneNumber))
    	{

	        String query = "update userdata set balance=? where accountholdername=? and ifsccode=? and cardnumber=? and accountnumber=? and phonenumber=?";
	        this.balance+=transferedAmount;
	        try
	        {
	            PreparedStatement st = (loginDao.getConnection()).prepareStatement(query);
	            st.setDouble(1, this.balance);
	            st.setString(2, accountholdername);
	            st.setString(3, ifsccode);
	            st.setString(4, cardNumber);
	            st.setString(5, accountnumber);
	            st.setString(6, phoneNumber);
				int noOfRowsUpdated=st.executeUpdate();
				if(noOfRowsUpdated!=0) {
					return true;
				}

	        }
	        catch (SQLException e) {
	            e.printStackTrace();
	        }
    	}
        return false;
    }
}
