<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/4/2025
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page session="true" %>
<%
  String user = (String) session.getAttribute("user");
  if (user == null) {
    response.sendRedirect("index.jsp");
    return;
  }
%>
<html>
<head><title>Dashboard</title></head>
<body>
<h1>Welcome, <%= user %>!</h1>
<p>This is your dashboard.</p>
<a href="logout">Logout</a>
</body>
</html>
