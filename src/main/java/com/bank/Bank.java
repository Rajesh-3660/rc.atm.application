package com.bank;

import com.customer.Customer;

public class Bank
{
	    public void changeData(Customer customer,String name, String email, String password, String phoneNumber, String address)
	    {
	         customer.setAccountHolderName(name);
	         customer.setEmail(email);
	         customer.setPhoneNumber(phoneNumber);
	         customer.setAddress(address);
	         customer.setPassword(password);

	    }

	    public void updateWithdrawlAmount(Customer customer,double withdrawlAmount) {
	    	customer.setBalanceAmount(customer.getBalanceAmount()-withdrawlAmount);
	    }

	    public void updateDepositAmount(Customer customer,double depositAmount) {
	    	customer.setBalanceAmount(customer.getBalanceAmount()+depositAmount);
	    }
}