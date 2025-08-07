<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/7/2025
  Time: 3:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Book - Pahana Edu</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8fafc;
            background-image:
                    radial-gradient(circle at 10% 20%, rgba(255, 0, 0, 0.03) 0%, transparent 20%),
                    radial-gradient(circle at 90% 80%, rgba(255, 0, 0, 0.03) 0%, transparent 20%);
        }

        .confirmation-card {
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .confirmation-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        .btn-danger {
            transition: all 0.3s ease;
            background-image: linear-gradient(to right, #ef4444, #dc2626);
        }

        .btn-danger:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 6px -1px rgba(239, 68, 68, 0.3);
            background-image: linear-gradient(to right, #dc2626, #b91c1c);
        }

        .btn-secondary {
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            transform: translateY(-1px);
            background-color: #f1f5f9;
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4">
<%
    String id = request.getParameter("id");
    String bookName = "";
    String bookImage = "";
    boolean deleted = false;
    boolean errorOccurred = false;
    String errorMessage = "";

    // First, get book details for display
    if (id != null && !id.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");

            // Get book details
            PreparedStatement getStmt = conn.prepareStatement("SELECT name, image_url FROM books WHERE id=?");
            getStmt.setInt(1, Integer.parseInt(id));
            ResultSet rs = getStmt.executeQuery();

            if (rs.next()) {
                bookName = rs.getString("name");
                bookImage = rs.getString("image_url");
            }

            rs.close();
            getStmt.close();
            conn.close();
        } catch (Exception e) {
            errorOccurred = true;
            errorMessage = "Error fetching book details: " + e.getMessage();
        }
    }

    // Handle deletion if POST request
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");

            String sql = "DELETE FROM books WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(id));

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                deleted = true;
            }

            stmt.close();
            conn.close();
        } catch (Exception e) {
            errorOccurred = true;
            errorMessage = "Error deleting book: " + e.getMessage();
        }
    }
%>

<div class="w-full max-w-md confirmation-card bg-white">
    <!-- Header -->
    <div class="bg-gradient-to-r from-red-600 to-red-700 p-6 text-white">
        <div class="flex items-center justify-between">
            <div>
                <h1 class="text-2xl font-bold flex items-center">
                    <i class="fas fa-exclamation-triangle mr-3"></i>
                    Delete Book
                </h1>
                <p class="text-red-100 mt-1">This action cannot be undone</p>
            </div>
            <div class="bg-white/20 p-3 rounded-full">
                <i class="fas fa-trash-alt text-xl"></i>
            </div>
        </div>
    </div>

    <!-- Content -->
    <div class="p-8">
        <% if (deleted) { %>
        <!-- Success State -->
        <div class="text-center">
            <div class="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-green-100 mb-4">
                <i class="fas fa-check text-green-600 text-xl"></i>
            </div>
            <h3 class="text-lg font-medium text-gray-900 mb-2">Book Deleted Successfully</h3>
            <p class="text-sm text-gray-500 mb-6">The book has been permanently removed from the system.</p>
            <a href="manageInventory.jsp"
               class="inline-flex items-center justify-center px-6 py-3 rounded-lg text-white font-medium shadow-sm bg-blue-600 hover:bg-blue-700">
                <i class="fas fa-arrow-left mr-2"></i> Back to Inventory
            </a>
        </div>
        <% } else if (errorOccurred) { %>
        <!-- Error State -->
        <div class="text-center">
            <div class="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-red-100 mb-4">
                <i class="fas fa-times text-red-600 text-xl"></i>
            </div>
            <h3 class="text-lg font-medium text-gray-900 mb-2">Deletion Failed</h3>
            <p class="text-sm text-gray-500 mb-2"><%= errorMessage %></p>
            <div class="mt-6">
                <a href="manageInventory.jsp"
                   class="inline-flex items-center justify-center px-6 py-3 rounded-lg text-white font-medium shadow-sm bg-blue-600 hover:bg-blue-700">
                    <i class="fas fa-arrow-left mr-2"></i> Back to Inventory
                </a>
            </div>
        </div>
        <% } else { %>
        <!-- Confirmation State -->
        <div class="text-center">
            <!-- Book Preview -->
            <% if (bookImage != null && !bookImage.isEmpty()) { %>
            <div class="flex justify-center mb-6">
                <div class="w-32 h-44 bg-gray-100 rounded-lg overflow-hidden border-2 border-red-100">
                    <img src="<%= bookImage %>" alt="Book Cover" class="w-full h-full object-cover">
                </div>
            </div>
            <% } %>

            <h3 class="text-lg font-medium text-gray-900 mb-2">Confirm Deletion</h3>
            <p class="text-sm text-gray-500 mb-4">
                Are you sure you want to delete <span class="font-medium text-gray-900"><%= bookName %></span> (ID: <%= id %>)?
            </p>
            <p class="text-xs text-red-500 mb-6">
                <i class="fas fa-exclamation-circle mr-1"></i> This action cannot be undone.
            </p>

            <form method="post" class="flex flex-col sm:flex-row justify-center gap-4">
                <button type="submit"
                        class="btn-danger inline-flex items-center justify-center px-6 py-3 rounded-lg text-white font-medium shadow-sm">
                    <i class="fas fa-trash-alt mr-2"></i> Delete Permanently
                </button>
                <a href="manageInventory.jsp"
                   class="btn-secondary inline-flex items-center justify-center px-6 py-3 rounded-lg border border-gray-300 text-gray-700 font-medium">
                    <i class="fas fa-times mr-2"></i> Cancel
                </a>
            </form>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>