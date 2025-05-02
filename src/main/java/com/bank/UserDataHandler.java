package com.bank;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.customer.Customer;
import com.dao.DAOClass;

public class UserDataHandler {
    DAOClass loginDao;
    Customer customer;

    public UserDataHandler() {
    	System.out.println("Entering the data handler");
        loginDao = new DAOClass();
        customer = new Customer();
    }

    public boolean check(String phoneNumber, String pin) {

        String query = "select * from userdata where phonenumber=? and password=?";
        try {
            PreparedStatement st = (loginDao.getConnection()).prepareStatement(query);
            st.setString(1, phoneNumber);
            st.setString(2, pin);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                // Setting customer details
                customer.setId(rs.getInt("id"));
                customer.setAccountHolderName(rs.getString("accountholdername"));
                customer.setIFSCCode(rs.getString("ifsccode"));
                customer.setCardNumber(rs.getString("cardnumber"));
                customer.setAccountNumber(rs.getString("accountnumber"));
                customer.setEmail(rs.getString("email"));
                customer.setPhoneNumber(rs.getString("phonenumber"));
                customer.setAddress(rs.getString("address"));
                customer.setPassword(rs.getString("password")); // This is the hashed PIN from DB
                customer.setBalanceAmount(rs.getDouble("balance"));
                return true;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean fetchById(int id) {
    	String query = "select * from userdata where id=?";
        try {
            PreparedStatement st = (loginDao.getConnection()).prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                // Setting customer details
                customer.setId(rs.getInt("id"));
                customer.setAccountHolderName(rs.getString("accountholdername"));
                customer.setIFSCCode(rs.getString("ifsccode"));
                customer.setCardNumber(rs.getString("cardnumber"));
                customer.setAccountNumber(rs.getString("accountnumber"));
                customer.setEmail(rs.getString("email"));
                customer.setPhoneNumber(rs.getString("phonenumber"));
                customer.setAddress(rs.getString("address"));
                customer.setPassword(rs.getString("password")); // This is the hashed PIN from DB
                customer.setBalanceAmount(rs.getDouble("balance"));

                // ✅ Compare raw pin entered by user with hashed password
				/*
				 * boolean isMatch = BCrypt.checkpw(pin, customer.getPassword());
				 *
				 * System.out.println("User-entered PIN: " + pin);
				 * System.out.println("Hash from DB: " + customer.getPassword());
				 * System.out.println("Match result: " + isMatch);
				 */
                return true;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
        }

    public Customer getCustomerData() {
        return customer;
    }
}
