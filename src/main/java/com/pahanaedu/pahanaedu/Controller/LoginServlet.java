package com.pahanaedu.pahanaedu.Controller;

import com.pahanaedu.pahanaedu.model.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Use the Model to validate user
        if (UserDAO.validateUser(username, password)) {
            HttpSession session = req.getSession();
            session.setAttribute("user", username);
            // Redirect to dashboard controller or JSP
            resp.sendRedirect("dashboard.jsp");
        } else {
            // Pass error back to view
            resp.sendRedirect("index.jsp?error=true");
        }
    }
}