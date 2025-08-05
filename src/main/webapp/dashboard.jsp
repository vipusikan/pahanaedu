<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/4/2025
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Admin Dashboard - Pahana Edu</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            primary: {
              50: '#f0f9ff',
              600: '#0284c7',
              700: '#0369a1',
              800: '#075985',
              900: '#0c4a6e',
            },
            secondary: {
              600: '#7c3aed',
              700: '#6d28d9',
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
    }

    .dashboard-card {
      transition: all 0.2s ease;
      border-left: 4px solid;
    }

    .dashboard-card:hover {
      transform: translateY(-2px);
    }

    .sidebar {
      transition: all 0.3s ease;
    }
  </style>
</head>

<%--<script>--%>
<%--  window.onload = function () {--%>
<%--    fetch('customer-count')--%>
<%--            .then(response => response.json())--%>
<%--            .then(data => {--%>
<%--              document.getElementById("customerCount").textContent = data.totalCustomers;--%>
<%--            })--%>
<%--            .catch(error => {--%>
<%--              console.error("Failed to load customer count:", error);--%>
<%--              document.getElementById("customerCount").textContent = "N/A";--%>
<%--            });--%>
<%--  };--%>
<%--</script>--%>

<script>
  function loadDashboardCounts() {
    // ✅ Fetch inventory count as plain text
    fetch('inventory-count')
            .then(response => response.text())
            .then(data => {
              document.getElementById('inventoryCount').innerText = data;
            });

    // ✅ Fetch customer count as JSON
    fetch('customer-count')
            .then(response => response.json())
            .then(data => {
              document.getElementById('customerCount').innerText = data.totalCustomers;
            })
            .catch(error => {
              console.error("Failed to load customer count:", error);
              document.getElementById("customerCount").innerText = "N/A";
            });

    // ✅ Fetch today’s sales as plain text
    fetch('today-sales')
            .then(response => response.text())
            .then(data => {
              document.getElementById('todaySales').innerText = "Rs. " + data;
            });
  }

  // Run once on page load
  window.onload = loadDashboardCounts;

  // Optional: Refresh every 30 seconds
  setInterval(loadDashboardCounts, 30000);
</script>




<body class="bg-gray-50">
<!-- Sidebar and Main Content Container -->
<div class="flex h-screen">
  <!-- Sidebar Navigation -->
  <div class="sidebar w-64 bg-white shadow-md hidden md:block">
    <div class="p-6 border-b border-gray-200">
      <h1 class="text-xl font-bold text-gray-800 flex items-center">
        <i class="fas fa-book-open text-primary-600 mr-2"></i>
        Pahana Edu
      </h1>
      <p class="text-xs text-gray-500 mt-1">Admin Dashboard</p>
    </div>
    <nav class="p-4">
      <div class="mb-6">
        <p class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3">Navigation</p>
        <a href="#" class="flex items-center py-2 px-3 bg-primary-50 text-primary-700 rounded-lg">
          <i class="fas fa-tachometer-alt mr-3"></i>
          Dashboard
        </a>
      </div>
      <div class="mb-6">
        <p class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3">Customer Management</p>
        <a href="addCustomer.jsp" class="flex items-center py-2 px-3 text-gray-600 hover:bg-gray-100 rounded-lg mb-2">
          <i class="fas fa-user-plus mr-3"></i>
          Add Customer
        </a>
        <a href="viewAccounts.jsp" class="flex items-center py-2 px-3 text-gray-600 hover:bg-gray-100 rounded-lg mb-2">
          <i class="fas fa-user-edit mr-3"></i>
          Edit Customer
        </a>
        <a href="viewAccounts.jsp" class="flex items-center py-2 px-3 text-gray-600 hover:bg-gray-100 rounded-lg">
          <i class="fas fa-address-book mr-3"></i>
          View Accounts
        </a>
      </div>
      <div class="mb-6">
        <p class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3">Inventory</p>
        <a href="manageInventory.jsp" class="flex items-center py-2 px-3 text-gray-600 hover:bg-gray-100 rounded-lg">
          <i class="fas fa-boxes mr-3"></i>
          Manage Items
        </a>
      </div>
      <div>
        <p class="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3">Operations</p>
        <a href="billing.jsp" class="flex items-center py-2 px-3 text-gray-600 hover:bg-gray-100 rounded-lg mb-2">
          <i class="fas fa-file-invoice-dollar mr-3"></i>
          Calculate Bill
        </a>
        <a href="help.jsp" class="flex items-center py-2 px-3 text-gray-600 hover:bg-gray-100 rounded-lg mb-2">
          <i class="fas fa-question-circle mr-3"></i>
          Help Guide
        </a>
        <a href="logout.jsp" class="flex items-center py-2 px-3 text-gray-600 hover:bg-gray-100 rounded-lg">
          <i class="fas fa-sign-out-alt mr-3"></i>
          Logout
        </a>
      </div>
    </nav>
  </div>

  <!-- Main Content Area -->
  <div class="flex-1 flex flex-col overflow-hidden">
    <!-- Top Header -->
    <header class="bg-white shadow-sm z-10">
      <div class="flex items-center justify-between px-6 py-4">
        <div class="flex items-center">
          <button class="md:hidden text-gray-500 mr-4">
            <i class="fas fa-bars"></i>
          </button>
          <h2 class="text-lg font-semibold text-gray-800">Dashboard Overview</h2>
        </div>
        <div class="flex items-center space-x-4">
          <div class="relative">
            <i class="fas fa-bell text-gray-500 hover:text-primary-600 cursor-pointer"></i>
            <span class="absolute top-0 right-0 h-2 w-2 rounded-full bg-red-500"></span>
          </div>
          <div class="flex items-center">
            <img src="https://ui-avatars.com/api/?name=Admin+User&background=0369a1&color=fff"
                 alt="Admin" class="h-8 w-8 rounded-full">
            <span class="ml-2 text-sm font-medium text-gray-700 hidden md:inline">Admin User</span>
          </div>
        </div>
      </div>
    </header>

    <!-- Dashboard Content -->
    <main class="flex-1 overflow-y-auto p-6 bg-gray-50">
      <!-- Stats Cards -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        <div class="bg-white p-6 rounded-lg shadow border-l-4 border-blue-500">
          <div class="flex items-center justify-between">
            <div>
              <p class="text-sm font-medium text-gray-500">Total Customers</p>
<%--              <span class="text-2xl font-bold text-gray-800 mt-1" id="customerCount">0</span>--%>
              <p class="text-2xl font-bold text-gray-800 mt-1" id="customerCount">Loading...</p>

            </div>
            <div class="bg-blue-100 p-3 rounded-full">
              <i class="fas fa-users text-blue-600"></i>
            </div>
          </div>
          <p class="text-xs text-gray-500 mt-2"><span class="text-green-500">+12.5%</span> from last month</p>
        </div>

        <div class="bg-white p-6 rounded-lg shadow border-l-4 border-green-500">
          <div class="flex items-center justify-between">
            <div>
              <p class="text-sm font-medium text-gray-500">Today's Sales</p>
<%--              <span id="todaySales">0.00</span>--%>
              <p class="text-2xl font-bold text-gray-800 mt-1" id="todaySales">Loading...</p>

            </div>
            <div class="bg-green-100 p-3 rounded-full">
              <i class="fas fa-rupee-sign text-green-600"></i>
            </div>
          </div>
          <p class="text-xs text-gray-500 mt-2"><span class="text-green-500">+8.3%</span> from yesterday</p>
        </div>

        <div class="bg-white p-6 rounded-lg shadow border-l-4 border-purple-500">
          <div class="flex items-center justify-between">
            <div>
              <p class="text-sm font-medium text-gray-500">Inventory Items</p>
              <p class="text-2xl font-bold text-gray-800 mt-1" id="inventoryCount">Loading...</p>


            </div>
            <div class="bg-purple-100 p-3 rounded-full">
              <i class="fas fa-box-open text-purple-600"></i>
            </div>
          </div>
          <p class="text-xs text-gray-500 mt-2"><span class="text-red-500">-3.2%</span> from last week</p>
        </div>

        <div class="bg-white p-6 rounded-lg shadow border-l-4 border-yellow-500">
          <div class="flex items-center justify-between">
            <div>
              <p class="text-sm font-medium text-gray-500">Pending Orders</p>
              <p class="text-2xl font-bold text-gray-800 mt-1">24</p>
            </div>
            <div class="bg-yellow-100 p-3 rounded-full">
              <i class="fas fa-clipboard-list text-yellow-600"></i>
            </div>
          </div>
          <p class="text-xs text-gray-500 mt-2"><span class="text-green-500">-5.6%</span> from yesterday</p>
        </div>
      </div>

      <!-- Quick Actions -->
      <div class="mb-8">
        <h3 class="text-lg font-semibold text-gray-800 mb-4">Quick Actions</h3>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          <a href="addCustomer.jsp" class="dashboard-card bg-white rounded-lg p-6 shadow border-l-4 border-blue-500 hover:shadow-md">
            <div class="flex items-start">
              <div class="bg-blue-100 p-3 rounded-full mr-4">
                <i class="fas fa-user-plus text-blue-600"></i>
              </div>
              <div>
                <h4 class="font-semibold text-gray-800">Add New Customer</h4>
                <p class="text-sm text-gray-600 mt-1">Register a new customer in the system</p>
              </div>
            </div>
          </a>

          <a href="billing.jsp" class="dashboard-card bg-white rounded-lg p-6 shadow border-l-4 border-green-500 hover:shadow-md">
            <div class="flex items-start">
              <div class="bg-green-100 p-3 rounded-full mr-4">
                <i class="fas fa-file-invoice-dollar text-green-600"></i>
              </div>
              <div>
                <h4 class="font-semibold text-gray-800">Calculate Bill</h4>
                <p class="text-sm text-gray-600 mt-1">Generate billing details and print invoice</p>
              </div>
            </div>
          </a>

          <a href="manageInventory.jsp" class="dashboard-card bg-white rounded-lg p-6 shadow border-l-4 border-purple-500 hover:shadow-md">
            <div class="flex items-start">
              <div class="bg-purple-100 p-3 rounded-full mr-4">
                <i class="fas fa-boxes text-purple-600"></i>
              </div>
              <div>
                <h4 class="font-semibold text-gray-800">Manage Inventory</h4>
                <p class="text-sm text-gray-600 mt-1">Add, update or delete item records</p>
              </div>
            </div>
          </a>
        </div>
      </div>

      <!-- Recent Activity -->
      <div class="bg-white rounded-lg shadow overflow-hidden">
        <div class="px-6 py-4 border-b border-gray-200">
          <h3 class="text-lg font-semibold text-gray-800">Recent Activity</h3>
        </div>
        <div class="divide-y divide-gray-200">
          <div class="p-6 flex items-start hover:bg-gray-50">
            <div class="bg-blue-100 p-2 rounded-full mr-4">
              <i class="fas fa-user-plus text-blue-600 text-sm"></i>
            </div>
            <div class="flex-1">
              <p class="text-sm font-medium text-gray-800">New customer registered</p>
              <p class="text-xs text-gray-500 mt-1">John Doe was added to the system</p>
            </div>
            <span class="text-xs text-gray-500">10 min ago</span>
          </div>
          <div class="p-6 flex items-start hover:bg-gray-50">
            <div class="bg-green-100 p-2 rounded-full mr-4">
              <i class="fas fa-rupee-sign text-green-600 text-sm"></i>
            </div>
            <div class="flex-1">
              <p class="text-sm font-medium text-gray-800">Order completed</p>
              <p class="text-xs text-gray-500 mt-1">Invoice #INV-2023-1245 for ₹2,450</p>
            </div>
            <span class="text-xs text-gray-500">1 hour ago</span>
          </div>
          <div class="p-6 flex items-start hover:bg-gray-50">
            <div class="bg-yellow-100 p-2 rounded-full mr-4">
              <i class="fas fa-exclamation-triangle text-yellow-600 text-sm"></i>
            </div>
            <div class="flex-1">
              <p class="text-sm font-medium text-gray-800">Low stock alert</p>
              <p class="text-xs text-gray-500 mt-1">"Advanced Mathematics" is running low (3 remaining)</p>
            </div>
            <span class="text-xs text-gray-500">3 hours ago</span>
          </div>
        </div>
      </div>
    </main>
  </div>
</div>

<!-- Footer -->
<footer class="bg-white py-4 border-t border-gray-200 text-center text-sm text-gray-500">
  <div class="container mx-auto px-6">
    &copy; 2025 Pahana Edu Bookstore. All rights reserved.
  </div>
</footer>
</body>
</html>