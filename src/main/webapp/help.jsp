<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/5/2025
  Time: 9:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Help Guide - Pahana Edu</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 font-sans leading-relaxed tracking-wide">

<div class="max-w-4xl mx-auto p-8 bg-white shadow-lg mt-10 rounded-lg">
    <h1 class="text-3xl font-bold text-blue-700 mb-4">📘 Help Guide</h1>
    <p class="text-gray-600 mb-6">Here’s how to use the system efficiently.</p>

    <!-- Add Customers Section -->
    <div class="mb-6">
        <h2 class="text-xl font-semibold text-gray-800 mb-2">👤 How to Add Customers</h2>
        <ul class="list-disc list-inside text-gray-700">
            <li>Go to <strong>Add Customer</strong> from the sidebar.</li>
            <li>Fill in the customer's name, address, account number, and mobile number.</li>
            <li>Click "Save" to add them to the database.</li>
        </ul>
    </div>

    <!-- Manage Inventory Section -->
    <div class="mb-6">
        <h2 class="text-xl font-semibold text-gray-800 mb-2">📚 How to Manage Inventory</h2>
        <ul class="list-disc list-inside text-gray-700">
            <li>Open the <strong>Manage Inventory</strong> page from the sidebar.</li>
            <li>View books by categories (Horror, Romance, Knowledge).</li>
            <li>Use the Add, Update, or Delete buttons to manage books.</li>
        </ul>
    </div>

    <!-- Generate Bills Section -->
    <div class="mb-6">
        <h2 class="text-xl font-semibold text-gray-800 mb-2">🧾 How to Generate Bills</h2>
        <ul class="list-disc list-inside text-gray-700">
            <li>Navigate to the <strong>Calculate Bill</strong> page.</li>
            <li>Select a registered customer from the dropdown.</li>
            <li>Choose the books and enter the quantity.</li>
            <li>The total will be calculated automatically.</li>
            <li>Click “Print Bill” to save and print the invoice.</li>
        </ul>
    </div>

    <!-- Common Issues -->
    <div class="mb-6">
        <h2 class="text-xl font-semibold text-gray-800 mb-2">⚠️ Common Issues & Solutions</h2>
        <ul class="list-disc list-inside text-gray-700">
            <li><strong>Customer not appearing?</strong> → Make sure they were saved properly.</li>
            <li><strong>Bill not saving?</strong> → Check database connection and table columns.</li>
            <li><strong>Image not loading?</strong> → Confirm the image path is correct in your folder.</li>
        </ul>
    </div>

    <!-- Contact -->
    <div class="mb-6">
        <h2 class="text-xl font-semibold text-gray-800 mb-2">📞 Contact Support</h2>
        <p class="text-gray-700">If you face issues, please contact the system admin:</p>
        <ul class="mt-2 text-gray-700">
            <li>Email: <a href="mailto:support@pahanaedu.lk" class="text-blue-600 underline">support@pahanaedu.lk</a></li>
            <li>Phone: +94 758731825</li>
            <li>Developing Team: Segar Vipusikan</li>
        </ul>
    </div>

    <!-- Back Button -->
    <div class="text-center mt-8">
        <a href="dashboard.jsp" class="inline-block bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-6 rounded">
            ← Back to Dashboard
        </a>
    </div>
</div>

</body>
</html>

