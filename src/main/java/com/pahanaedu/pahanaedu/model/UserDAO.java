package com.pahanaedu.pahanaedu.model;

import java.sql.*;

public class UserDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/pahanaedu";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "Vipu0627";

    public static boolean validateUser(String username, String password) {
        boolean isValid = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                 PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?")) {
                stmt.setString(1, username);
                stmt.setString(2, password);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        isValid = true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }
}
