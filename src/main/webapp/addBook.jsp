<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/4/2025
  Time: 7:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
  <title>Add Book</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6 font-sans">

<div class="max-w-xl mx-auto bg-white shadow-md rounded-lg p-6">
  <h2 class="text-2xl font-bold mb-4 text-center text-gray-800">Add New Book</h2>

  <form method="post" class="space-y-4">
    <input type="text" name="name" placeholder="Book Name" required
           class="w-full px-4 py-2 border rounded" />

    <select name="category" required class="w-full px-4 py-2 border rounded">
      <option value="">Select Category</option>
      <option value="horror">Horror</option>
      <option value="romance">Romance</option>
      <option value="knowledge">Knowledge</option>
    </select>

    <input type="number" step="0.01" name="price" placeholder="Price (Rs)" required
           class="w-full px-4 py-2 border rounded" />

    <input type="text" name="image_url" placeholder="Image URL (e.g., /img/book1.jpg)" required
           class="w-full px-4 py-2 border rounded" />

    <button type="submit"
            class="bg-green-600 text-white w-full py-2 rounded hover:bg-green-700">
      Add Book
    </button>
  </form>

  <div class="mt-4 text-center">
    <a href="manageInventory.jsp" class="text-blue-600 hover:underline">← Back to Inventory</a>
  </div>
</div>

<%
  // Save book if form is submitted
  if ("post".equalsIgnoreCase(request.getMethod())) {
    String name = request.getParameter("name");
    String category = request.getParameter("category");
    String priceStr = request.getParameter("price");
    String imageUrl = request.getParameter("image_url");

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conn = DriverManager.getConnection(
              "jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");

      String sql = "INSERT INTO books (name, category, price, image_url) VALUES (?, ?, ?, ?)";
      PreparedStatement stmt = conn.prepareStatement(sql);
      stmt.setString(1, name);
      stmt.setString(2, category);
      stmt.setDouble(3, Double.parseDouble(priceStr));
      stmt.setString(4, imageUrl);

      int result = stmt.executeUpdate();
      if (result > 0) {
%>
<script>alert("Book added successfully!"); window.location = "manageInventory.jsp";</script>
<%
  }

  stmt.close();
  conn.close();
} catch (Exception e) {
%>
<p class="text-red-600 mt-4 text-center">Error: <%= e.getMessage() %></p>
<%
    }
  }
%>

</body>
</html>

