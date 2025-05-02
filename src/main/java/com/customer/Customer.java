package com.customer;

public class Customer {
    private int id;
    private String accountHolderName;
    private String ifscCode;
    private String cardNumber;
    private String accountNumber;
    private String eMail;
    private String phoneNumber;
    private String address;
    private String password;
    private double balanceAmount;

    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getAccountHolderName() {
        return accountHolderName;
    }
    public void setAccountHolderName(String accountHolderName) {
        this.accountHolderName = accountHolderName;
    }

    public String getIFSCCode() {
        return ifscCode;
    }
    public void setIFSCCode(String ifscCode) {
        this.ifscCode = ifscCode;
    }

    public String getCardNumber() {
        return cardNumber;
    }
    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getAccountNumber() {
        return accountNumber;
    }
    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return eMail;
    }
    public void setEmail(String email) {
        this.eMail = email;
    }

    public double getBalanceAmount() {
        return balanceAmount;
    }
    public void setBalanceAmount(double balanceAmount) {
        this.balanceAmount = balanceAmount;
    }
}
