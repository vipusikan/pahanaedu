<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Billing System - Pahana Edu</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: {
                            600: '#0284c7',
                            700: '#0369a1',
                        },
                        secondary: {
                            600: '#7c3aed',
                        },
                        gray: {
                            50: '#f9fafb',
                            100: '#f3f4f6',
                        }
                    },
                    fontFamily: {
                        sans: ['Inter', 'system-ui', 'sans-serif'],
                    }
                }
            }
        }
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8fafc;
            background-image: radial-gradient(#e5e7eb 1px, transparent 1px);
            background-size: 20px 20px;
        }

        .input-field {
            transition: all 0.2s ease;
        }

        .input-field:focus {
            box-shadow: 0 0 0 3px rgba(2, 132, 199, 0.2);
            border-color: #0284c7;
        }

        .btn {
            transition: all 0.2s ease;
        }

        .btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .book-row:hover {
            background-color: #f3f4f6;
        }
    </style>
</head>
<body class="min-h-screen p-6">
<div class="max-w-6xl mx-auto bg-white rounded-xl shadow-lg overflow-hidden">
    <!-- Header -->
    <div class="bg-gradient-to-r from-primary-600 to-primary-700 p-6 text-white">
        <div class="flex items-center justify-between">
            <div>
                <h1 class="text-2xl font-bold flex items-center">
                    <i class="fas fa-file-invoice-dollar mr-3"></i>
                    Billing System
                </h1>
                <p class="text-primary-100 mt-1">Generate invoices for customers</p>
            </div>
            <div class="flex items-center space-x-4">
                <a href="dashboard.jsp" class="btn inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-gray-600 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-500">
                    <i class="fas fa-arrow-left mr-2"></i>
                    Back to Dashboard
                </a>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="p-8">
        <!-- Customer Selection -->
        <div class="mb-8">
            <label class="block text-sm font-medium text-gray-700 mb-2">Select Customer <span class="text-red-500">*</span></label>
            <div class="relative">
                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <i class="fas fa-user text-gray-400"></i>
                </div>
                <select
                        id="customer"
                        class="input-field pl-10 w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-1 focus:ring-primary-600 appearance-none"
                >
                    <option value="">Select a customer</option>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT name FROM customers ORDER BY name ASC");
                            while (rs.next()) {
                    %>
                    <option value="<%= rs.getString("name") %>"><%= rs.getString("name") %></option>
                    <%
                        }
                        rs.close(); stmt.close(); conn.close();
                    } catch(Exception e) {
                    %>
                    <option value="">Error loading customers</option>
                    <%
                        }
                    %>
                </select>
                <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                    <i class="fas fa-chevron-down text-gray-400"></i>
                </div>
            </div>
        </div>

        <!-- Book Search -->
        <div class="mb-6">
            <label class="block text-sm font-medium text-gray-700 mb-2">Search Books</label>
            <div class="relative">
                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <i class="fas fa-search text-gray-400"></i>
                </div>
                <input
                        type="text"
                        id="bookSearch"
                        placeholder="Search by book name..."
                        class="input-field pl-10 w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-1 focus:ring-primary-600"
                        onkeyup="filterBooks()"
                />
            </div>
        </div>

        <!-- Book Table -->
        <div class="overflow-x-auto mb-8">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                <tr>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Book Name</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Price (Rs)</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Quantity</th>
                </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200" id="bookTableBody">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT name, price FROM books ORDER BY name ASC");
                        while (rs.next()) {
                            String name = rs.getString("name");
                            double price = rs.getDouble("price");
                %>
                <tr class="book-row" data-name="<%= name %>" data-price="<%= price %>">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= name %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Rs. <%= String.format("%.2f", price) %></td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <input
                                type="number"
                                class="qty input-field w-20 px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-primary-600"
                                value="0"
                                min="0"
                                onchange="updateTotal()"
                        />
                    </td>
                </tr>
                <%
                    }
                    rs.close(); stmt.close(); conn.close();
                } catch(Exception e) {
                %>
                <tr>
                    <td colspan="3" class="px-6 py-4 text-center text-sm text-red-500">
                        <i class="fas fa-exclamation-triangle mr-2"></i> Error loading books
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>

        <!-- Total and Actions -->
        <div class="flex flex-col md:flex-row justify-between items-center border-t border-gray-200 pt-6">
            <div class="mb-4 md:mb-0">
                <span class="text-xl font-bold text-gray-800">Total: Rs. <span id="totalDisplay">0.00</span></span>
            </div>
            <div>
                <button
                        onclick="printBill()"
                        class="btn inline-flex items-center px-6 py-3 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500"
                >
                    <i class="fas fa-print mr-2"></i> Generate Bill
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    function filterBooks() {
        const searchTerm = document.getElementById("bookSearch").value.toLowerCase();
        const rows = document.querySelectorAll(".book-row");

        rows.forEach(row => {
            const bookName = row.dataset.name.toLowerCase();
            if (bookName.includes(searchTerm)) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }
        });
    }

    function updateTotal() {
        let total = 0;
        document.querySelectorAll(".book-row").forEach(row => {
            if (row.style.display !== "none") {
                const price = parseFloat(row.dataset.price);
                const qty = parseInt(row.querySelector(".qty").value) || 0;
                total += price * qty;
            }
        });
        document.getElementById("totalDisplay").textContent = total.toFixed(2);
    }

    function printBill() {
        const customer = document.getElementById("customer").value;
        const items = [];
        document.querySelectorAll(".book-row").forEach(row => {
            if (row.style.display !== "none") {
                const name = row.dataset.name;
                const qty = parseInt(row.querySelector(".qty").value) || 0;
                const price = parseFloat(row.dataset.price);
                if (qty > 0) {
                    items.push({
                        name: name,
                        quantity: qty,
                        price: price,
                        subtotal: (price * qty).toFixed(2)
                    });
                }
            }
        });
        const total = document.getElementById("totalDisplay").textContent;

        if (!customer || items.length === 0) {
            alert("Please select a customer and add at least one book.");
            return;
        }

        // Prepare data for submission
        const params = new URLSearchParams();
        params.append("customer", customer);
        params.append("items", JSON.stringify(items));
        params.append("total", total);

        fetch("BillServlet", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: params.toString()
        }).then(res => res.text()).then(result => {
            if (result === "success") {
                // Open print view in new tab
                window.open("printBill.jsp?customer=" + encodeURIComponent(customer) +
                    "&items=" + encodeURIComponent(JSON.stringify(items)) +
                    "&total=" + encodeURIComponent(total), "_blank");
            } else {
                alert("Failed to save bill!");
            }
        });
    }
</script>
</body>
</html>