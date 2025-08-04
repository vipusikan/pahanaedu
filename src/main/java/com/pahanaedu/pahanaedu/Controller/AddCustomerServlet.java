package com.pahanaedu.pahanaedu.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/add-customer")
public class AddCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String accountNumber = request.getParameter("accountNumber");
        String mobileNumber = request.getParameter("mobileNumber");

        Connection conn = null;
        PreparedStatement checkStmt = null;
        PreparedStatement insertStmt = null;
        ResultSet rs = null;

        try {
            // Load JDBC driver and establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");

            // First check if customer already exists
            String checkSql = "SELECT id FROM customers WHERE account_number = ? OR mobile_number = ?";
            checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setString(1, accountNumber);
            checkStmt.setString(2, mobileNumber);
            rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Customer already exists
                response.sendRedirect("addCustomer.jsp?error=exists");
                return;
            }

            // If not exists, insert new customer
            String insertSql = "INSERT INTO customers (name, address, account_number, mobile_number) VALUES (?, ?, ?, ?)";
            insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setString(1, name);
            insertStmt.setString(2, address);
            insertStmt.setString(3, accountNumber);
            insertStmt.setString(4, mobileNumber);

            int rows = insertStmt.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("addCustomer.jsp?success=true");
            } else {
                response.sendRedirect("addCustomer.jsp?error=database");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("addCustomer.jsp?error=driver");
        } catch (SQLException e) {
            e.printStackTrace();
            // Check for duplicate entry error (MySQL error code 1062)
            if (e instanceof SQLIntegrityConstraintViolationException ||
                    (e.getErrorCode() == 1062)) {
                response.sendRedirect("addCustomer.jsp?error=exists");
            } else {
                response.sendRedirect("addCustomer.jsp?error=database");
            }
        } finally {
            // Close all resources
            try {
                if (rs != null) rs.close();
                if (checkStmt != null) checkStmt.close();
                if (insertStmt != null) insertStmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}