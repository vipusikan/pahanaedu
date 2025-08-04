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
  <title>Add Book - Pahana Edu</title>
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

    .header-gradient {
      background: linear-gradient(135deg, #0369a1 0%, #0284c7 100%);
    }
  </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4">
<div class="w-full max-w-2xl bg-white rounded-xl shadow-lg overflow-hidden">
  <!-- Form Header -->
  <div class="header-gradient p-6 text-white">
    <div class="flex items-center justify-between">
      <div>
        <h1 class="text-2xl font-bold flex items-center">
          <i class="fas fa-book-medical mr-3"></i>
          Add New Book
        </h1>
        <p class="text-primary-100 mt-1">Fill in the book details below</p>
      </div>
      <div class="bg-white bg-opacity-20 p-3 rounded-full">
        <i class="fas fa-book text-xl"></i>
      </div>
    </div>
  </div>

  <!-- Form Content -->
  <div class="p-8">
    <form method="post" class="space-y-6">
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">Book Title <span class="text-red-500">*</span></label>
        <div class="relative">
          <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <i class="fas fa-book text-gray-400"></i>
          </div>
          <input
                  type="text"
                  name="name"
                  placeholder="Enter book title"
                  required
                  class="input-field pl-10 w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-1 focus:ring-primary-600"
          />
        </div>
      </div>

      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">Category <span class="text-red-500">*</span></label>
        <div class="relative">
          <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <i class="fas fa-tag text-gray-400"></i>
          </div>
          <select
                  name="category"
                  required
                  class="input-field pl-10 w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-1 focus:ring-primary-600 appearance-none"
          >
            <option value="">Select a category</option>
            <option value="horror">Horror</option>
            <option value="romance">Romance</option>
            <option value="knowledge">Knowledge</option>
          </select>
          <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
            <i class="fas fa-chevron-down text-gray-400"></i>
          </div>
        </div>
      </div>

      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">Price (Rs) <span class="text-red-500">*</span></label>
        <div class="relative">
          <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <i class="fas fa-rupee-sign text-gray-400"></i>
          </div>
          <input
                  type="number"
                  step="0.01"
                  name="price"
                  placeholder="Enter price"
                  required
                  class="input-field pl-10 w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-1 focus:ring-primary-600"
          />
        </div>
      </div>

      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">Image URL <span class="text-red-500">*</span></label>
        <div class="relative">
          <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <i class="fas fa-image text-gray-400"></i>
          </div>
          <input
                  type="text"
                  name="image_url"
                  placeholder="Enter image URL (e.g., /img/book1.jpg)"
                  required
                  class="input-field pl-10 w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-1 focus:ring-primary-600"
          />
        </div>
      </div>

      <div class="flex justify-between pt-4">
        <a href="manageInventory.jsp" class="btn inline-flex items-center px-6 py-3 border border-gray-300 text-sm font-medium rounded-lg shadow-sm text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500">
          <i class="fas fa-arrow-left mr-2"></i>
          Back to Inventory
        </a>
        <button
                type="submit"
                class="btn inline-flex items-center px-6 py-3 border border-transparent text-sm font-medium rounded-lg shadow-sm text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500"
        >
          <i class="fas fa-plus-circle mr-2"></i>
          Add Book
        </button>
      </div>
    </form>
  </div>

  <!-- Form Footer -->
  <div class="bg-gray-50 px-6 py-4 border-t border-gray-200">
    <div class="flex items-center justify-between">
      <p class="text-xs text-gray-500">
        <i class="fas fa-info-circle mr-1"></i>
        All fields marked with <span class="text-red-500">*</span> are required
      </p>
      <p class="text-xs text-gray-500">
        <i class="fas fa-shield-alt mr-1"></i>
        Your data is securely stored
      </p>
    </div>
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
        response.sendRedirect("manageInventory.jsp?success=true");
      }

      stmt.close();
      conn.close();
    } catch (Exception e) {
      response.sendRedirect("addBook.jsp?error=" + e.getMessage());
    }
  }
%>
</body>
</html>
