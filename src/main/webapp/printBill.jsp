<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/5/2025
  Time: 8:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLDecoder" %>
<%
    String customer = request.getParameter("customer");
    String itemsRaw = request.getParameter("items");
    String total = request.getParameter("total");

    if (itemsRaw != null) {
        itemsRaw = URLDecoder.decode(itemsRaw, "UTF-8");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Printable Bill</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            margin: 30px;
            background: #f5f5f5;
        }

        .bill-container {
            background: white;
            padding: 40px;
            max-width: 700px;
            margin: auto;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 40px;
        }

        .bill-header {
            margin-bottom: 20px;
        }

        .bill-header span {
            font-weight: bold;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: left;
        }

        table th {
            background-color: #f0f0f0;
        }

        .total {
            margin-top: 30px;
            text-align: right;
            font-size: 18px;
            font-weight: bold;
        }

        @media print {
            button {
                display: none;
            }
        }

        button {
            margin-top: 20px;
            padding: 10px 20px;
            background: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background: #218838;
        }
    </style>
</head>
<body>

<div class="bill-container">
    <h1>Customer Bill</h1>

    <div class="bill-header">
        <p><span>Customer:</span> <%= customer %></p>
        <p><span>Date:</span> <%= new java.util.Date() %></p>
    </div>

    <table>
        <thead>
        <tr>
            <th>Book Name</th>
            <th>Price (Rs.)</th>
            <th>Quantity</th>
            <th>Subtotal (Rs.)</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (itemsRaw != null && !itemsRaw.isEmpty()) {
                String[] rows = itemsRaw.split(";");
                for (String row : rows) {
                    String[] parts = row.split(",");
                    if (parts.length == 3) {
                        String name = parts[0];
                        String priceStr = parts[1];
                        String qtyStr = parts[2];
                        try {
                            double price = Double.parseDouble(priceStr);
                            int qty = Integer.parseInt(qtyStr);
                            double subtotal = price * qty;
        %>
        <tr>
            <td><%= name %></td>
            <td><%= price %></td>
            <td><%= qty %></td>
            <td><%= subtotal %></td>
        </tr>
        <%
        } catch (NumberFormatException e) {
            // Skip or show an error row for invalid data
        %>
        <tr>
            <td colspan="4" style="color:red;">Invalid number format for item: <%= name %></td>
        </tr>
        <%
                        }
                    }
                }
            }
        %>

        </tbody>
    </table>

    <div class="total">
        Grand Total: Rs. <%= total %>
    </div>

    <button onclick="window.print()">Print Now</button>
</div>

</body>
</html>

