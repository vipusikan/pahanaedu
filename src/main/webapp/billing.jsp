<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/5/2025
  Time: 8:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Billing</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        function updateTotal() {
            let total = 0;
            document.querySelectorAll(".book-row").forEach(row => {
                const price = parseFloat(row.dataset.price);
                const qty = parseInt(row.querySelector(".qty").value) || 0;
                total += price * qty;
            });
            document.getElementById("totalDisplay").textContent = total.toFixed(2);
        }

        function printBill() {
            const customer = document.getElementById("customer").value;
            const items = [];
            document.querySelectorAll(".book-row").forEach(row => {
                const name = row.dataset.name;
                const qty = parseInt(row.querySelector(".qty").value) || 0;
                if (qty > 0) {
                    items.push(`${name} x ${qty}`);
                }
            });
            const total = document.getElementById("totalDisplay").textContent;

            if (!customer || items.length === 0) {
                alert("Please select a customer and add at least one book.");
                return;
            }

            const params = new URLSearchParams();
            params.append("customer", customer);
            params.append("items", items.join(", "));
            params.append("total", total);

            fetch("BillServlet", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: params.toString()
            }).then(res => res.text()).then(result => {
                if (result === "success") {
                    alert("Saved successfully!");
                    window.open("printBill.jsp?customer=" + encodeURIComponent(customer) +
                        "&items=" + encodeURIComponent(items.join(", ")) +
                        "&total=" + encodeURIComponent(total), "_blank");

                } else {
                    alert("Failed to save!");
                }
            });
        }
    </script>
</head>
<body class="bg-gray-100 p-10">
<div class="max-w-4xl mx-auto bg-white p-8 shadow-lg rounded-xl">
    <h2 class="text-2xl font-bold mb-6">Billing Page</h2>

    <!-- Customer Select -->
    <label class="block mb-2 text-gray-700 font-semibold">Select Customer:</label>
    <select id="customer" class="w-full p-2 border rounded mb-6">
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT name FROM customers");
                while (rs.next()) {
        %>
        <option value="<%= rs.getString("name") %>"><%= rs.getString("name") %></option>
        <%
                }
                rs.close(); stmt.close(); conn.close();
            } catch(Exception e) {
                out.print("<option>Error loading customers</option>");
            }
        %>
    </select>

    <!-- Book Table -->
    <table class="w-full mb-6 border">
        <thead>
        <tr class="bg-gray-200">
            <th class="p-2 text-left">Book Name</th>
            <th class="p-2 text-left">Price</th>
            <th class="p-2 text-left">Quantity</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT name, price FROM books");
                while (rs.next()) {
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
        %>
        <tr class="book-row" data-name="<%= name %>" data-price="<%= price %>">
            <td class="p-2"><%= name %></td>
            <td class="p-2">Rs. <%= price %></td>
            <td class="p-2">
                <input type="number" class="qty w-16 border p-1" value="0" min="0" onchange="updateTotal()" />
            </td>
        </tr>
        <%
                }
                rs.close(); stmt.close(); conn.close();
            } catch(Exception e) {
                out.print("<tr><td colspan='3'>Error loading books</td></tr>");
            }
        %>
        </tbody>
    </table>

    <!-- Total Display -->
    <div class="text-right mb-6">
        <span class="text-xl font-bold">Total: Rs. <span id="totalDisplay">0.00</span></span>
    </div>

    <!-- Print Button -->
    <button onclick="printBill()" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700">
        Print Bill
    </button>
</div>
</body>
</html>

