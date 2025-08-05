package com.pahanaedu.pahanaedu.Controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/BillServlet")
public class BillServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/pahanaedu";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Vipu0627";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        String customer = request.getParameter("customer");
        String items = request.getParameter("items");
        String total = request.getParameter("total");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO bills (customer_name, book_details, total_price) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, customer);
            pstmt.setString(2, items);       // 'items' contains book details JSON or CSV
            pstmt.setDouble(3, Double.parseDouble(total));  // 'total' is the total price


            int result = pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            if (result > 0) {
                out.write("success");
            } else {
                out.write("fail");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.write("fail");
        }

        out.close();
    }
}