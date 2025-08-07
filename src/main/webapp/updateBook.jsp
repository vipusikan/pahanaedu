<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/7/2025
  Time: 2:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String name = "";
    String category = "";
    double price = 0.0;
    String imageUrl = "";

    if (id != null && !id.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");

            PreparedStatement ps = conn.prepareStatement("SELECT * FROM books WHERE id = ?");
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                category = rs.getString("category");
                price = rs.getDouble("price");
                imageUrl = rs.getString("image_url");
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Book - Pahana Edu</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8fafc;
            background-image:
                    radial-gradient(circle at 10% 20%, rgba(0, 82, 212, 0.05) 0%, transparent 20%),
                    radial-gradient(circle at 90% 80%, rgba(0, 212, 255, 0.05) 0%, transparent 20%);
        }

        .form-container {
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-2px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .input-field {
            transition: all 0.2s ease;
            border: 1px solid #e2e8f0;
        }

        .input-field:focus {
            border-color: #60a5fa;
            box-shadow: 0 0 0 3px rgba(96, 165, 250, 0.2);
        }

        .btn-primary {
            transition: all 0.3s ease;
            background-image: linear-gradient(to right, #3b82f6, #2563eb);
        }

        .btn-primary:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 6px -1px rgba(59, 130, 246, 0.3);
            background-image: linear-gradient(to right, #2563eb, #1d4ed8);
        }

        .btn-secondary {
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            transform: translateY(-1px);
            background-color: #f1f5f9;
        }

        .category-select {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 0.5rem center;
            background-repeat: no-repeat;
            background-size: 1.5em 1.5em;
            appearance: none;
        }

        .preview-image {
            transition: all 0.3s ease;
            border: 2px dashed #e2e8f0;
        }

        .preview-image:hover {
            transform: scale(1.02);
            border-color: #93c5fd;
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4 md:p-8">
<div class="w-full max-w-2xl form-container bg-white">
    <!-- Header -->
    <div class="bg-gradient-to-r from-blue-600 to-blue-700 p-6 text-white">
        <div class="flex items-center justify-between">
            <div>
                <h1 class="text-2xl font-bold flex items-center">
                    <i class="fas fa-book-edit mr-3"></i>
                    Update Book Details
                </h1>
                <p class="text-blue-100 mt-1">Edit the book information below</p>
            </div>
            <div class="bg-white/20 p-3 rounded-full">
                <i class="fas fa-book text-xl"></i>
            </div>
        </div>
    </div>

    <!-- Form Content -->
    <div class="p-8">
        <form method="post" class="space-y-6">
            <input type="hidden" name="id" value="<%= id %>"/>

            <!-- Book Preview -->
            <div class="flex justify-center mb-6">
                <div class="w-40 h-56 bg-gray-100 rounded-lg overflow-hidden preview-image flex items-center justify-center">
                    <% if (imageUrl != null && !imageUrl.isEmpty()) { %>
                    <img src="<%= imageUrl %>" alt="Book Cover" class="w-full h-full object-cover" id="imagePreview">
                    <% } else { %>
                    <i class="fas fa-book-open text-gray-400 text-4xl" id="imagePlaceholder"></i>
                    <% } %>
                </div>
            </div>

            <!-- Book Title -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Book Title <span class="text-red-500">*</span></label>
                <input type="text" name="name" value="<%= name %>" required
                       class="w-full px-4 py-3 rounded-lg input-field focus:outline-none focus:ring-2 focus:ring-blue-200">
            </div>

            <!-- Category and Price Row -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Category -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Category <span class="text-red-500">*</span></label>
                    <select name="category" required
                            class="w-full px-4 py-3 rounded-lg input-field focus:outline-none focus:ring-2 focus:ring-blue-200 category-select">
                        <option value="">Select a category</option>
                        <option value="horror" <%= category.equals("horror") ? "selected" : "" %>>Horror</option>
                        <option value="romance" <%= category.equals("romance") ? "selected" : "" %>>Romance</option>
                        <option value="knowledge" <%= category.equals("knowledge") ? "selected" : "" %>>Knowledge</option>
                    </select>
                </div>

                <!-- Price -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Price (Rs) <span class="text-red-500">*</span></label>
                    <div class="relative">
                        <span class="absolute left-3 top-3 text-gray-500">Rs.</span>
                        <input type="number" step="0.01" name="price" value="<%= price %>" required
                               class="w-full pl-10 pr-4 py-3 rounded-lg input-field focus:outline-none focus:ring-2 focus:ring-blue-200">
                    </div>
                </div>
            </div>

            <!-- Image URL -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Image URL <span class="text-red-500">*</span></label>
                <input type="text" name="image_url" value="<%= imageUrl %>" required
                       class="w-full px-4 py-3 rounded-lg input-field focus:outline-none focus:ring-2 focus:ring-blue-200"
                       onchange="updateImagePreview(this.value)">
                <p class="text-xs text-gray-500 mt-2">Enter a valid image URL (e.g., https://example.com/book.jpg)</p>
            </div>

            <!-- Form Actions -->
            <div class="flex flex-col-reverse sm:flex-row justify-between gap-4 pt-4">
                <a href="manageInventory.jsp"
                   class="btn-secondary inline-flex items-center justify-center px-6 py-3 rounded-lg border border-gray-300 text-gray-700 font-medium">
                    <i class="fas fa-arrow-left mr-2"></i> Back to Inventory
                </a>
                <button type="submit"
                        class="btn-primary inline-flex items-center justify-center px-6 py-3 rounded-lg text-white font-medium shadow-sm">
                    <i class="fas fa-save mr-2"></i> Update Book
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    // Update image preview when URL changes
    function updateImagePreview(url) {
        const preview = document.getElementById('imagePreview');
        const placeholder = document.getElementById('imagePlaceholder');

        if (url && url.trim() !== '') {
            if (preview) {
                preview.src = url;
            } else {
                const container = document.querySelector('.preview-image');
                container.innerHTML = `<img src="${url}" alt="Book Cover" class="w-full h-full object-cover" id="imagePreview">`;
            }
            if (placeholder) placeholder.style.display = 'none';
        } else {
            if (preview) preview.style.display = 'none';
            if (placeholder) placeholder.style.display = 'block';
        }
    }
</script>

<%
    // If submitted, update the book
    if ("post".equalsIgnoreCase(request.getMethod())) {
        String bookId = request.getParameter("id");
        String newName = request.getParameter("name");
        String newCategory = request.getParameter("category");
        String newPriceStr = request.getParameter("price");
        String newImageUrl = request.getParameter("image_url");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");

            PreparedStatement ps = conn.prepareStatement("UPDATE books SET name = ?, category = ?, price = ?, image_url = ? WHERE id = ?");
            ps.setString(1, newName);
            ps.setString(2, newCategory);
            ps.setDouble(3, Double.parseDouble(newPriceStr));
            ps.setString(4, newImageUrl);
            ps.setInt(5, Integer.parseInt(bookId));

            int updated = ps.executeUpdate();
            if (updated > 0) {
                response.sendRedirect("manageInventory.jsp?update=success");
            }

            ps.close();
            conn.close();
        } catch (Exception e) {
            response.sendRedirect("updateBook.jsp?id=" + id + "&error=" + e.getMessage());
        }
    }
%>
</body>
</html>