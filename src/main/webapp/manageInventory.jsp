<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/4/2025
  Time: 7:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Inventory Management - Pahana Edu</title>
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
                    },
                    boxShadow: {
                        'soft': '0 4px 20px -2px rgba(0, 0, 0, 0.08)',
                        'hard': '0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06)'
                    }
                }
            }
        }
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f9fafb;
            background-image: radial-gradient(#e5e7eb 1px, transparent 1px);
            background-size: 20px 20px;
        }

        .book-card {
            transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .book-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .category-tab {
            transition: all 0.2s ease;
        }

        .category-tab:hover {
            transform: translateY(-2px);
        }

        .header-gradient {
            background: linear-gradient(135deg, #0369a1 0%, #0284c7 100%);
        }
    </style>
</head>
<body class="min-h-screen">
<!-- Header -->
<header class="header-gradient text-white shadow-lg">
    <div class="max-w-7xl mx-auto px-4 py-6 sm:px-6 lg:px-8">
        <div class="flex flex-col md:flex-row justify-between items-start md:items-center">
            <div class="flex items-center mb-4 md:mb-0">
                <div class="bg-white bg-opacity-20 p-3 rounded-lg mr-4">
                    <i class="fas fa-boxes text-xl"></i>
                </div>
                <div>
                    <h1 class="text-2xl font-bold tracking-tight">Inventory Management</h1>
                    <p class="text-primary-100 opacity-90 mt-1 text-sm">Manage your bookstore inventory</p>
                </div>
            </div>
            <div class="flex space-x-3">
                <a href="dashboard.jsp" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-gray-600 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-500">
                    <i class="fas fa-arrow-left mr-2"></i>
                    Dashboard
                </a>
                <a href="addBook.jsp" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
                    <i class="fas fa-plus mr-2"></i>
                    Add Book
                </a>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<main class="max-w-7xl mx-auto px-4 py-8 sm:px-6 lg:px-8">
    <!-- Search and Filter Section -->
    <div class="bg-white rounded-lg shadow-sm p-6 mb-8">
        <form method="get" action="manageInventory.jsp" class="mb-6">
            <div class="flex">
                <div class="relative flex-grow">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-search text-gray-400"></i>
                    </div>
                    <input
                            type="text"
                            name="search"
                            placeholder="Search by book name..."
                            value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>"
                            class="pl-10 w-full px-4 py-3 border border-gray-300 rounded-l-lg focus:outline-none focus:ring-2 focus:ring-primary-600 focus:border-transparent"
                    />
                </div>
                <button
                        type="submit"
                        class="inline-flex items-center px-6 py-3 border border-transparent text-sm font-medium rounded-r-lg shadow-sm text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500"
                >
                    <i class="fas fa-search mr-2"></i>
                    Search
                </button>
            </div>
        </form>

        <!-- Category Filter Tabs -->
        <div class="flex flex-wrap gap-3">
            <%
                String currentCategory = request.getParameter("category");
                String searchParam = request.getParameter("search") != null ? "&search=" + request.getParameter("search") : "";
            %>
            <a
                    href="manageInventory.jsp<%= searchParam %>"
                    class="category-tab inline-flex items-center px-4 py-2 rounded-lg text-sm font-medium <%= currentCategory == null ? "bg-primary-100 text-primary-800" : "bg-gray-100 text-gray-700 hover:bg-gray-200" %>"
            >
                <i class="fas fa-th-list mr-2"></i>
                All Books
            </a>
            <a
                    href="manageInventory.jsp?category=horror<%= searchParam %>"
                    class="category-tab inline-flex items-center px-4 py-2 rounded-lg text-sm font-medium <%= "horror".equals(currentCategory) ? "bg-red-100 text-red-800" : "bg-gray-100 text-gray-700 hover:bg-gray-200" %>"
            >
                <i class="fas fa-ghost mr-2"></i>
                Horror
            </a>
            <a
                    href="manageInventory.jsp?category=romance<%= searchParam %>"
                    class="category-tab inline-flex items-center px-4 py-2 rounded-lg text-sm font-medium <%= "romance".equals(currentCategory) ? "bg-pink-100 text-pink-800" : "bg-gray-100 text-gray-700 hover:bg-gray-200" %>"
            >
                <i class="fas fa-heart mr-2"></i>
                Romance
            </a>
            <a
                    href="manageInventory.jsp?category=knowledge<%= searchParam %>"
                    class="category-tab inline-flex items-center px-4 py-2 rounded-lg text-sm font-medium <%= "knowledge".equals(currentCategory) ? "bg-yellow-100 text-yellow-800" : "bg-gray-100 text-gray-700 hover:bg-gray-200" %>"
            >
                <i class="fas fa-brain mr-2"></i>
                Knowledge
            </a>
        </div>
    </div>

    <!-- Book Grid -->
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
        <%
            String search = request.getParameter("search");
            String category = request.getParameter("category");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");

                String sql = "SELECT * FROM books";
                boolean hasCondition = false;

                if (search != null && !search.isEmpty()) {
                    sql += " WHERE name LIKE ?";
                    hasCondition = true;
                }
                if (category != null && !category.isEmpty()) {
                    sql += hasCondition ? " AND category = ?" : " WHERE category = ?";
                }

                PreparedStatement stmt = conn.prepareStatement(sql);
                int paramIndex = 1;
                if (search != null && !search.isEmpty()) {
                    stmt.setString(paramIndex++, "%" + search + "%");
                }
                if (category != null && !category.isEmpty()) {
                    stmt.setString(paramIndex++, category);
                }

                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    String name = rs.getString("name");
                    String cat = rs.getString("category");
                    String image = rs.getString("image_url");
                    double price = rs.getDouble("price");
                    int id = rs.getInt("id");
                    String description = rs.getString("description");
        %>
        <div class="book-card bg-white rounded-xl shadow-md overflow-hidden">
            <div class="h-48 bg-gray-100 flex items-center justify-center">
                <img src="<%= image %>" alt="<%= name %>" class="h-full w-full object-cover">
            </div>
            <div class="p-5">
                <div class="flex justify-between items-start">
                    <div>
                        <h3 class="font-bold text-lg text-gray-800 mb-1"><%= name %></h3>
                        <span class="inline-block px-2 py-1 text-xs font-semibold rounded-full
                                <%= "horror".equals(cat) ? "bg-red-100 text-red-800" :
                                    "romance".equals(cat) ? "bg-pink-100 text-pink-800" :
                                    "bg-yellow-100 text-yellow-800" %>">
                                <%= cat %>
                            </span>
                    </div>
                    <span class="text-lg font-bold text-green-600">Rs. <%= String.format("%.2f", price) %></span>
                </div>
                <% if (description != null && !description.isEmpty()) { %>
                <p class="text-gray-600 text-sm mt-2 line-clamp-2"><%= description %></p>
                <% } %>
                <div class="mt-4 flex space-x-2">
                    <a href="editBook.jsp?id=<%= id %>" class="flex-1 inline-flex justify-center items-center px-3 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                        <i class="fas fa-edit mr-2"></i> Edit
                    </a>
                    <a href="deleteBook.jsp?id=<%= id %>" class="flex-1 inline-flex justify-center items-center px-3 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500">
                        <i class="fas fa-trash-alt mr-2"></i> Delete
                    </a>
                </div>
            </div>
        </div>
        <%
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
        %>
        <div class="col-span-full bg-red-50 border-l-4 border-red-500 p-4">
            <div class="flex">
                <div class="flex-shrink-0">
                    <i class="fas fa-exclamation-circle text-red-500"></i>
                </div>
                <div class="ml-3">
                    <p class="text-sm text-red-700">
                        Error loading books: <%= e.getMessage() %>
                    </p>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>

    <!-- Empty State -->
    <%
        // This would need actual logic to check if there are no results
        boolean isEmpty = false;
        if (isEmpty) {
    %>
    <div class="col-span-full text-center py-12">
        <i class="fas fa-book-open text-4xl text-gray-300 mb-4"></i>
        <h3 class="text-lg font-medium text-gray-900">No books found</h3>
        <p class="mt-1 text-sm text-gray-500">Get started by adding a new book to your inventory.</p>
        <div class="mt-6">
            <a href="addBook.jsp" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
                <i class="fas fa-plus mr-2"></i>
                Add New Book
            </a>
        </div>
    </div>
    <% } %>
</main>

<!-- Footer -->
<footer class="bg-white border-t border-gray-200 mt-12">
    <div class="max-w-7xl mx-auto px-4 py-6 sm:px-6 lg:px-8">
        <p class="text-center text-sm text-gray-500">
            &copy; 2023 Pahana Edu Bookstore. All rights reserved.
        </p>
    </div>
</footer>
</body>
</html>
