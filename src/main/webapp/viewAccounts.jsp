<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/4/2025
  Time: 5:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
  <title>View Customers</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6 font-sans">

<div class="max-w-5xl mx-auto bg-white p-8 shadow-md rounded-lg">
  <h2 class="text-2xl font-bold mb-6 text-gray-800">Customer Accounts</h2>

  <table class="w-full border-collapse border border-gray-300">
    <thead>
    <tr class="bg-gray-200 text-left">
      <th class="p-3 border">Account Number</th>
      <th class="p-3 border">Name</th>
      <th class="p-3 border">Address</th>
      <th class="p-3 border">Mobile</th>
      <th class="p-3 border">Action</th>
    </tr>
    </thead>
    <tbody>
    <%
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM customers");

        while (rs.next()) {
          String accountNumber = rs.getString("account_number");
          String name = rs.getString("name");
          String address = rs.getString("address");
          String mobile = rs.getString("mobile_number");
    %>
    <tr class="border-t border-gray-300 hover:bg-gray-50">
      <td class="p-3 border"><%= accountNumber %></td>
      <td class="p-3 border"><%= name %></td>
      <td class="p-3 border"><%= address %></td>
      <td class="p-3 border"><%= mobile %></td>
      <td class="p-3 border">
        <a href="editCustomer.jsp?accountNumber=<%= accountNumber %>"
           class="bg-blue-600 text-white px-3 py-1 rounded hover:bg-blue-700 text-sm">
          Edit
        </a>
      </td>
    </tr>
    <%
      }
      rs.close();
      stmt.close();
      conn.close();
    } catch (Exception e) {
      e.printStackTrace();
    %>
    <tr><td colspan="5" class="p-4 text-red-500">Error loading customers.</td></tr>
    <%
      }
    %>
    </tbody>
  </table>
</div>

</body>
</html>
