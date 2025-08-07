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
    <title>Invoice Receipt</title>
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2980b9;
            --accent-color: #e74c3c;
            --text-color: #333;
            --light-gray: #f8f9fa;
            --border-color: #e0e0e0;
        }

        body {
            font-family: 'Segoe UI', 'Roboto', sans-serif;
            margin: 0;
            padding: 20px;
            background: #f5f7fa;
            color: var(--text-color);
        }

        .invoice-container {
            background: white;
            padding: 40px;
            max-width: 800px;
            margin: 20px auto;
            box-shadow: 0 5px 30px rgba(0,0,0,0.1);
            border-radius: 8px;
            position: relative;
        }

        .invoice-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--border-color);
        }

        .invoice-title {
            color: var(--primary-color);
            margin: 0;
            font-size: 28px;
            font-weight: 700;
        }

        .invoice-logo {
            font-size: 24px;
            font-weight: bold;
            color: var(--primary-color);
        }

        .invoice-details {
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
        }

        .detail-block {
            flex: 1;
        }

        .detail-block h3 {
            color: var(--primary-color);
            margin-top: 0;
            font-size: 18px;
            border-bottom: 2px solid var(--primary-color);
            padding-bottom: 5px;
            display: inline-block;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
        }

        table th {
            background-color: var(--primary-color);
            color: white;
            padding: 12px 15px;
            text-align: left;
            font-weight: 500;
        }

        table td {
            padding: 12px 15px;
            border-bottom: 1px solid var(--border-color);
        }

        table tr:nth-child(even) {
            background-color: var(--light-gray);
        }

        table tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }

        .total-section {
            margin-top: 30px;
            text-align: right;
        }

        .total-line {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .grand-total {
            font-size: 22px;
            font-weight: bold;
            color: var(--accent-color);
        }

        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-print {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-print:hover {
            background-color: var(--secondary-color);
        }

        .btn-back {
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }

        .btn-back:hover {
            background-color: #5a6268;
        }

        .thank-you {
            margin-top: 40px;
            text-align: center;
            font-style: italic;
            color: #666;
            border-top: 1px solid var(--border-color);
            padding-top: 20px;
        }

        @media print {
            body {
                background: none;
                padding: 0;
            }

            .invoice-container {
                box-shadow: none;
                padding: 0;
                max-width: 100%;
            }

            .action-buttons {
                display: none;
            }
        }

        @media (max-width: 768px) {
            .invoice-details {
                flex-direction: column;
            }

            .detail-block {
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>

<div class="invoice-container">
    <div class="invoice-header">
        <div>
            <h1 class="invoice-title">INVOICE</h1>
            <p>Pahana Edu.</p>
        </div>
        <div class="invoice-logo">PH</div>
    </div>

    <div class="invoice-details">
        <div class="detail-block">
            <h3>Bill To</h3>
            <p><strong><%= customer %></strong></p>
            <p>Customer</p>
        </div>
        <div class="detail-block">
            <h3>Invoice Details</h3>
            <p><strong>Date:</strong> <%= new java.util.Date() %></p>
            <p><strong>Status:</strong> <span style="color: var(--accent-color);">Paid</span></p>
        </div>
    </div>

    <table>
        <thead>
        <tr>
            <th>Item Description</th>
            <th>Unit Price</th>
            <th>Quantity</th>
            <th>Amount</th>
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
            <td>Rs. <%= String.format("%.2f", price) %></td>
            <td><%= qty %></td>
            <td>Rs. <%= String.format("%.2f", subtotal) %></td>
        </tr>
        <%
        } catch (NumberFormatException e) {
        %>
        <tr>
            <td colspan="4" style="color:red;">Invalid item data: <%= name %></td>
        </tr>
        <%
                        }
                    }
                }
            }
        %>
        </tbody>
    </table>

    <div class="total-section">
        <div class="total-line">
            <strong>Subtotal:</strong> Rs. <%= total != null ? String.format("%.2f", Double.parseDouble(total)) : "0.00" %>
        </div>
        <div class="total-line">
            <strong>Tax (0%):</strong> Rs. 0.00
        </div>
        <div class="total-line grand-total">
            <strong>Grand Total:</strong> Rs. <%= total != null ? String.format("%.2f", Double.parseDouble(total)) : "0.00" %>
        </div>
    </div>

    <div class="thank-you">
        <p>Thank you for your business! We appreciate your trust in us.</p>
    </div>

    <div class="action-buttons">
        <a href="javascript:history.back()" class="btn btn-back">← Back To Previous</a>
        <button onclick="window.print()" class="btn btn-print">Print Invoice</button>
    </div>
</div>

</body>
</html>