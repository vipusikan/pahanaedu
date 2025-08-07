<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/7/2025
  Time: 2:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String name = "";
    String category = "";
    double price = 0.0;
    String imageUrl = "";

    if (id != null && !id.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");

            PreparedStatement ps = conn.prepareStatement("SELECT * FROM books WHERE id = ?");
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                category = rs.getString("category");
                price = rs.getDouble("price");
                imageUrl = rs.getString("image_url");
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<html>
<head>
    <title>Update Book - Pahana Edu</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="min-h-screen flex items-center justify-center p-4 bg-gray-100">

<div class="w-full max-w-2xl bg-white rounded-xl shadow-lg overflow-hidden">
    <div class="bg-blue-600 p-6 text-white">
        <h1 class="text-2xl font-bold flex items-center">
            <i class="fas fa-edit mr-3"></i> Update Book
        </h1>
        <p class="text-blue-100 mt-1">Modify the book details below</p>
    </div>

    <div class="p-8">
        <form method="post" class="space-y-6">
            <input type="hidden" name="id" value="<%= id %>"/>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Book Title</label>
                <input type="text" name="name" value="<%= name %>" required
                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring focus:ring-blue-300">
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Category</label>
                <select name="category" required
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring focus:ring-blue-300">
                    <option value="">Select a category</option>
                    <option value="horror" <%= category.equals("horror") ? "selected" : "" %>>Horror</option>
                    <option value="romance" <%= category.equals("romance") ? "selected" : "" %>>Romance</option>
                    <option value="knowledge" <%= category.equals("knowledge") ? "selected" : "" %>>Knowledge</option>
                </select>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Price (Rs)</label>
                <input type="number" step="0.01" name="price" value="<%= price %>" required
                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring focus:ring-blue-300">
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Image URL</label>
                <input type="text" name="image_url" value="<%= imageUrl %>" required
                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring focus:ring-blue-300">
            </div>

            <div class="flex justify-between">
                <a href="manageInventory.jsp"
                   class="inline-flex items-center px-6 py-3 border border-gray-300 text-sm font-medium rounded-lg text-gray-700 bg-white hover:bg-gray-50">
                    <i class="fas fa-arrow-left mr-2"></i> Back to Inventory
                </a>
                <button type="submit"
                        class="inline-flex items-center px-6 py-3 text-sm font-medium rounded-lg text-white bg-green-600 hover:bg-green-700">
                    <i class="fas fa-save mr-2"></i> Update Book
                </button>
            </div>
        </form>
    </div>
</div>

<%
    // If submitted, update the book
    if ("post".equalsIgnoreCase(request.getMethod())) {
        String bookId = request.getParameter("id");
        String newName = request.getParameter("name");
        String newCategory = request.getParameter("category");
        String newPriceStr = request.getParameter("price");
        String newImageUrl = request.getParameter("image_url");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");

            PreparedStatement ps = conn.prepareStatement("UPDATE books SET name = ?, category = ?, price = ?, image_url = ? WHERE id = ?");
            ps.setString(1, newName);
            ps.setString(2, newCategory);
            ps.setDouble(3, Double.parseDouble(newPriceStr));
            ps.setString(4, newImageUrl);
            ps.setInt(5, Integer.parseInt(bookId));

            int updated = ps.executeUpdate();
            if (updated > 0) {
                response.sendRedirect("manageInventory.jsp?update=success");
            }

            ps.close();
            conn.close();
        } catch (Exception e) {
            response.sendRedirect("updateBook.jsp?id=" + id + "&error=" + e.getMessage());
        }
    }
%>
</body>
</html>
