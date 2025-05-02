package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAOClass {


	private static final String url = "jdbc:postgresql://dpg-d05r33er433s73dv4ing-a.oregon-postgres.render.com/atm_application";


    public Connection conn;

    public DAOClass() {
        initiateDBConnection();
    }

    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println(" PostgreSQL Driver not found: " + e);
        }
    }

    void initiateDBConnection() {
        try {
            this.conn = DriverManager.getConnection(url,"atm_application_user","2394BCKM1QuwSPWcuvTnhUmwkkCzBAxV");
            System.out.println(" DB connected successfully");
        } catch (SQLException e) {
            System.err.println(" DB connection failed: " + e);
        }
    }

    public Connection getConnection() {
        return this.conn;
    }
}
