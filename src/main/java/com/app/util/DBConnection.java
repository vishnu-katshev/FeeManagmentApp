package com.app.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection con;

    public static Connection getConnection() {
        try {
            // 1. Load Oracle Driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // 2. Create Connection
            con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:orcl",
                    "system",
                    "vishnu12"
            );
            
           

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
    
    public static void main(String[] args) {
		DBConnection.getConnection();
	}
}
