<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>
<html>
<head>
    <title>Add Customer - Pahana Edu</title>
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
                            100: '#f8fafc',
                            200: '#e2e8f0'
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

        .notification {
            animation: slideIn 0.5s forwards, fadeOut 0.5s forwards 3s;
        }

        @keyframes slideIn {
            from { transform: translateY(-20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes fadeOut {
            from { opacity: 1; }
            to { opacity: 0; }
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4">
<!-- Success Notification -->
<% if(success != null && success.equals("true")) { %>
<div class="fixed top-4 right-4 z-50">
    <div class="notification bg-green-50 border border-green-200 rounded-lg shadow-lg p-4 max-w-sm">
        <div class="flex items-center">
            <div class="flex-shrink-0">
                <i class="fas fa-check-circle text-green-500 text-xl"></i>
            </div>
            <div class="ml-3">
                <p class="text-sm font-medium text-green-800">Successfully Added!</p>
                <p class="text-xs text-green-600 mt-1">Customer has been added to the system.</p>
            </div>
        </div>
    </div>
</div>
<% } %>

<!-- Error Notification -->
<% if(error != null && error.equals("exists")) { %>
<div class="fixed top-4 right-4 z-50">
    <div class="notification bg-red-50 border border-red-200 rounded-lg shadow-lg p-4 max-w-sm">
        <div class="flex items-center">
            <div class="flex-shrink-0">
                <i class="fas fa-times-circle text-red-500 text-xl"></i>
            </div>
            <div class="ml-3">
                <p class="text-sm font-medium text-red-800">Already Available!</p>
                <p class="text-xs text-red-600 mt-1">This customer already exists in the system.</p>
            </div>
        </div>
    </div>
</div>
<% } %>

<div class="w-full max-w-2xl bg-white rounded-xl shadow-lg overflow-hidden">
    <!-- Form Header -->
    <div class="bg-gradient-to-r from-primary-600 to-primary-700 p-6 text-white">
        <div class="flex items-center justify-between">
            <div>
                <h1 class="text-2xl font-bold flex items-center">
                    <i class="fas fa-user-plus mr-3"></i>
                    Add New Customer
                </h1>
                <p class="text-primary-100 mt-1">Fill in the customer details below</p>
            </div>
            <div class="bg-white bg-opacity-20 p-3 rounded-full">
                <i class="fas fa-user-tie text-xl"></i>
            </div>
        </div>
    </div>

    <!-- Form Content -->
    <div class="p-8">
        <form action="add-customer" method="post" class="space-y-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Full Name <span class="text-red-500">*</span></label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fas fa-user text-gray-400"></i>
                        </div>
                        <input
                                type="text"
                                name="name"
                                required
                                class="input-field pl-10 w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-1 focus:ring-primary-600"
                                placeholder="John Doe"
                        />
                    </div>
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Mobile Number <span class="text-red-500">*</span></label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fas fa-mobile-alt text-gray-400"></i>
                        </div>
                        <input
                                type="tel"
                                name="mobileNumber"
                                required
                                class="input-field pl-10 w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-1 focus:ring-primary-600"
                                placeholder="0712345678"
                        />
                    </div>
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Account Number <span class="text-red-500">*</span></label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-id-card text-gray-400"></i>
                    </div>
                    <input
                            type="text"
                            name="accountNumber"
                            required
                            class="input-field pl-10 w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-1 focus:ring-primary-600"
                            placeholder="ACC-2023-001"
                    />
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Address <span class="text-red-500">*</span></label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-map-marker-alt text-gray-400"></i>
                    </div>
                    <input
                            type="text"
                            name="address"
                            required
                            class="input-field pl-10 w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-1 focus:ring-primary-600"
                            placeholder="123 Main Street, Colombo"
                    />
                </div>
            </div>

            <div class="flex justify-between pt-4">
                <div class="flex space-x-4">
                    <a href="dashboard.jsp" class="btn inline-flex items-center px-6 py-3 border border-gray-300 text-sm font-medium rounded-lg shadow-sm text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500">
                        <i class="fas fa-arrow-left mr-2"></i>
                        Back to Dashboard
                    </a>
                    <a href="calculateBill.jsp" class="btn inline-flex items-center px-6 py-3 border border-transparent text-sm font-medium rounded-lg shadow-sm text-white bg-secondary-600 hover:bg-secondary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-secondary-500">
                        <i class="fas fa-calculator mr-2"></i>
                        Calculate Bill
                    </a>
                </div>
                <button type="submit" class="btn inline-flex items-center px-6 py-3 border border-transparent text-sm font-medium rounded-lg shadow-sm text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500">
                    <i class="fas fa-save mr-2"></i>
                    Save Customer
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

<script>
    // Auto-close notifications after 3 seconds
    setTimeout(() => {
        const notifications = document.querySelectorAll('.notification');
        notifications.forEach(notification => {
            notification.style.display = 'none';
        });
    }, 3000);
</script>
</body>
</html>