package com.pahanaedu.pahanaedu.Controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/update-customer")
public class UpdateCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber = request.getParameter("accountNumber");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String mobileNumber = request.getParameter("mobileNumber");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");

            String sql = "UPDATE customers SET name = ?, address = ?, mobile_number = ? WHERE account_number = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, address);
            stmt.setString(3, mobileNumber);
            stmt.setString(4, accountNumber);

            stmt.executeUpdate();
            stmt.close();
            conn.close();

            response.sendRedirect("editCustomer.jsp?accountNumber=" + accountNumber + "&updated=true");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editCustomer.jsp?accountNumber=" + accountNumber + "&error=true");
        }
    }
}
