<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/7/2025
  Time: 3:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Book - Pahana Edu</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
<%
    String id = request.getParameter("id"); // Book ID passed via URL (e.g., ?id=3)
    boolean deleted = false;
    boolean errorOccurred = false;
    String errorMessage = "";

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
            errorMessage = e.getMessage();
        }
    }
%>

<div class="bg-white p-10 rounded-xl shadow-xl max-w-md w-full">
    <h1 class="text-2xl font-bold mb-4 text-red-600 flex items-center">
        <i class="fas fa-trash-alt mr-3"></i> Delete Book
    </h1>

    <% if (deleted) { %>
    <p class="text-green-600 font-medium mb-4">Book deleted successfully.</p>
    <a href="manageInventory.jsp" class="inline-block mt-4 px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">
        Back to Inventory
    </a>
    <% } else if (errorOccurred) { %>
    <p class="text-red-600 font-medium mb-4">Error: <%= errorMessage %></p>
    <a href="manageInventory.jsp" class="inline-block mt-4 px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">
        Back to Inventory
    </a>
    <% } else { %>
    <p class="mb-4 text-gray-700">Are you sure you want to delete this book (ID: <%= id %>)?</p>
    <form method="post" class="flex space-x-4">
        <button type="submit" class="px-4 py-2 bg-red-600 text-white rounded hover:bg-red-700">
            Yes, Delete
        </button>
        <a href="manageInventory.jsp" class="px-4 py-2 bg-gray-300 text-gray-800 rounded hover:bg-gray-400">
            Cancel
        </a>
    </form>
    <% } %>
</div>
</body>
</html>

