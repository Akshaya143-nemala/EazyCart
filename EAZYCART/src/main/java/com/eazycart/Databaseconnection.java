package com.eazycart;

import java.sql.Connection;
import java.sql.DriverManager;

public class Databaseconnection {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Load the MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish connection
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/eazycart", // DB URL
                "root",                                  // your MySQL username
                "3009"                          // your MySQL password
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}

