<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/4/2025
  Time: 4:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
  String accountNumber = request.getParameter("accountNumber");
  String name = "", address = "", mobileNumber = "";

  if (accountNumber != null) {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");

      String sql = "SELECT * FROM customers WHERE account_number = ?";
      PreparedStatement stmt = conn.prepareStatement(sql);
      stmt.setString(1, accountNumber);
      ResultSet rs = stmt.executeQuery();

      if (rs.next()) {
        name = rs.getString("name");
        address = rs.getString("address");
        mobileNumber = rs.getString("mobile_number");
      }

      rs.close();
      stmt.close();
      conn.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
%>
<html>
<head>
  <title>Edit Customer</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6 font-sans">

<div class="max-w-xl mx-auto bg-white p-8 shadow-md rounded-lg">
  <h2 class="text-2xl font-bold mb-6 text-gray-800">Edit Customer 5</h2>

  <form action="update-customer" method="post" class="space-y-4">
    <input type="hidden" name="accountNumber" value="<%= accountNumber %>"/>

    <div>
      <label class="block text-gray-600 font-medium">Name</label>
      <input type="text" name="name" value="<%= name %>" required class="w-full p-2 border rounded-lg" />
    </div>

    <div>
      <label class="block text-gray-600 font-medium">Address</label>
      <input type="text" name="address" value="<%= address %>" required class="w-full p-2 border rounded-lg" />
    </div>

    <div>
      <label class="block text-gray-600 font-medium">Mobile Number</label>
      <input type="text" name="mobileNumber" value="<%= mobileNumber %>" required class="w-full p-2 border rounded-lg" />
    </div>

    <button type="submit" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">
      Update Customer
    </button>
  </form>
</div>

</body>
</html>

