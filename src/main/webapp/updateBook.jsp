<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/5/2025
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Book</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">
<div class="max-w-xl mx-auto bg-white rounded-lg shadow-lg p-8">
    <h2 class="text-2xl font-bold mb-6 text-center">Update Book</h2>

    <form action="update-book" method="post" class="space-y-4">
        <!-- Book ID (Read-only) -->
        <div>
            <label for="id" class="block text-gray-700">Book ID</label>
            <input type="text" id="id" name="id" value="${param.id}" readonly
                   class="w-full px-4 py-2 border rounded bg-gray-100 text-gray-700" />
        </div>

        <!-- Book Name -->
        <div>
            <label for="name" class="block text-gray-700">Book Name</label>
            <input type="text" id="name" name="name" value="${param.name}" required
                   class="w-full px-4 py-2 border rounded" />
        </div>

        <!-- Category -->
        <div>
            <label for="category" class="block text-gray-700">Category</label>
            <select id="category" name="category" class="w-full px-4 py-2 border rounded" required>
                <option value="">Select Category</option>
                <option value="horror" ${param.category == 'horror' ? 'selected' : ''}>Horror</option>
                <option value="romance" ${param.category == 'romance' ? 'selected' : ''}>Romance</option>
                <option value="knowledge" ${param.category == 'knowledge' ? 'selected' : ''}>Knowledge</option>
            </select>
        </div>

        <!-- Price -->
        <div>
            <label for="price" class="block text-gray-700">Price</label>
            <input type="number" id="price" name="price" value="${param.price}" step="0.01" required
                   class="w-full px-4 py-2 border rounded" />
        </div>

        <!-- Image URL -->
        <div>
            <label for="image" class="block text-gray-700">Image URL</label>
            <input type="url" id="image" name="image" value="${param.image}" required
                   class="w-full px-4 py-2 border rounded" />
        </div>

        <!-- Description -->
        <div>
            <label for="description" class="block text-gray-700">Description</label>
            <textarea id="description" name="description" rows="4" required
                      class="w-full px-4 py-2 border rounded">${param.description}</textarea>
        </div>

        <!-- Submit Button -->
        <div class="text-center">
            <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded">
                Update Book
            </button>
        </div>
    </form>
</div>
</body>
</html>

