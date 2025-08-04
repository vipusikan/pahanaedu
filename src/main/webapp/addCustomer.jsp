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
                            50: '#f0f9ff',
                            600: '#0284c7',
                            700: '#0369a1',
                        },
                        secondary: {
                            600: '#7c3aed',
                            700: '#6d28d9',
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

        .input-field {
            transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .input-field:focus {
            box-shadow: 0 0 0 3px rgba(2, 132, 199, 0.2);
            border-color: #0284c7;
        }

        .btn {
            transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .btn:hover {
            transform: translateY(-1px);
        }

        .card {
            box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.04);
        }

        .notification {
            animation: slideIn 0.4s cubic-bezier(0.16, 1, 0.3, 1) forwards,
            fadeOut 0.4s cubic-bezier(0.16, 1, 0.3, 1) forwards 3s;
        }

        @keyframes slideIn {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes fadeOut {
            from { opacity: 1; }
            to { opacity: 0; }
        }

        .header-gradient {
            background: linear-gradient(135deg, #0369a1 0%, #0284c7 100%);
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4 md:p-6">
<!-- Success Notification -->
<% if(success != null && success.equals("true")) { %>
<div class="fixed top-6 right-6 z-50">
    <div class="notification bg-green-50 border border-green-200 rounded-xl shadow-hard p-4 w-80">
        <div class="flex items-start">
            <div class="flex-shrink-0 mt-0.5">
                <div class="h-8 w-8 rounded-full bg-green-100 flex items-center justify-center">
                    <i class="fas fa-check-circle text-green-500 text-lg"></i>
                </div>
            </div>
            <div class="ml-3">
                <h3 class="text-sm font-medium text-green-800">Customer Added</h3>
                <p class="text-xs text-green-600 mt-1">The customer has been successfully added to the system.</p>
                <div class="mt-2">
                    <div class="h-1 w-full bg-green-100 rounded-full overflow-hidden">
                        <div class="h-full bg-green-200 rounded-full animate-progress"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<% } %>

<!-- Error Notification -->
<% if(error != null && error.equals("exists")) { %>
<div class="fixed top-6 right-6 z-50">
    <div class="notification bg-red-50 border border-red-200 rounded-xl shadow-hard p-4 w-80">
        <div class="flex items-start">
            <div class="flex-shrink-0 mt-0.5">
                <div class="h-8 w-8 rounded-full bg-red-100 flex items-center justify-center">
                    <i class="fas fa-times-circle text-red-500 text-lg"></i>
                </div>
            </div>
            <div class="ml-3">
                <h3 class="text-sm font-medium text-red-800">Duplicate Customer</h3>
                <p class="text-xs text-red-600 mt-1">This customer already exists in our system.</p>
                <div class="mt-2">
                    <div class="h-1 w-full bg-red-100 rounded-full overflow-hidden">
                        <div class="h-full bg-red-200 rounded-full animate-progress"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<% } %>

<div class="w-full max-w-2xl bg-white rounded-xl card overflow-hidden">
    <!-- Form Header -->
    <div class="header-gradient p-6 text-white">
        <div class="flex items-center justify-between">
            <div>
                <div class="flex items-center">
                    <div class="bg-white bg-opacity-20 p-2 rounded-lg mr-4">
                        <i class="fas fa-user-plus text-xl"></i>
                    </div>
                    <div>
                        <h1 class="text-2xl font-bold tracking-tight">New Customer Registration</h1>
                        <p class="text-primary-100 opacity-90 mt-1 text-sm">Please fill in the customer details below</p>
                    </div>
                </div>
            </div>
            <div class="hidden md:block">
                <div class="bg-white bg-opacity-20 p-3 rounded-full">
                    <i class="fas fa-user-tie text-xl"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- Form Content -->
    <div class="p-8">
        <form action="add-customer" method="post" class="space-y-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2 flex items-center">
                        <span>Full Name</span>
                        <span class="text-red-500 ml-1">*</span>
                    </label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fas fa-user text-gray-400"></i>
                        </div>
                        <input
                                type="text"
                                name="name"
                                required
                                class="input-field pl-10 w-full px-4 py-3 border border-gray-200 rounded-lg focus:outline-none focus:ring-1 focus:ring-primary-600 bg-gray-50"
                                placeholder="John Doe"
                        />
                    </div>
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2 flex items-center">
                        <span>Mobile Number</span>
                        <span class="text-red-500 ml-1">*</span>
                    </label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fas fa-mobile-alt text-gray-400"></i>
                        </div>
                        <input
                                type="tel"
                                name="mobileNumber"
                                required
                                class="input-field pl-10 w-full px-4 py-3 border border-gray-200 rounded-lg focus:outline-none focus:ring-1 focus:ring-primary-600 bg-gray-50"
                                placeholder="0712345678"
                        />
                    </div>
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2 flex items-center">
                    <span>Account Number</span>
                    <span class="text-red-500 ml-1">*</span>
                </label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-id-card text-gray-400"></i>
                    </div>
                    <input
                            type="text"
                            name="accountNumber"
                            required
                            class="input-field pl-10 w-full px-4 py-3 border border-gray-200 rounded-lg focus:outline-none focus:ring-1 focus:ring-primary-600 bg-gray-50"
                            placeholder="ACC-2023-001"
                    />
                </div>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2 flex items-center">
                    <span>Address</span>
                    <span class="text-red-500 ml-1">*</span>
                </label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-map-marker-alt text-gray-400"></i>
                    </div>
                    <input
                            type="text"
                            name="address"
                            required
                            class="input-field pl-10 w-full px-4 py-3 border border-gray-200 rounded-lg focus:outline-none focus:ring-1 focus:ring-primary-600 bg-gray-50"
                            placeholder="123 Main Street, Colombo"
                    />
                </div>
            </div>

            <div class="flex flex-col-reverse md:flex-row justify-between pt-6 gap-4">
                <div class="flex flex-col md:flex-row gap-4">
                    <a href="dashboard.jsp" class="btn inline-flex items-center justify-center px-6 py-3 border border-gray-300 text-sm font-medium rounded-lg shadow-sm text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500">
                        <i class="fas fa-arrow-left mr-2"></i>
                        Dashboard
                    </a>
                    <a href="calculateBill.jsp" class="btn inline-flex items-center justify-center px-6 py-3 border border-transparent text-sm font-medium rounded-lg shadow-sm text-white bg-secondary-600 hover:bg-secondary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-secondary-500">
                        <i class="fas fa-calculator mr-2"></i>
                        Calculate Bill
                    </a>
                </div>
                <button type="submit" class="btn inline-flex items-center justify-center px-6 py-3 border border-transparent text-sm font-medium rounded-lg shadow-sm text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500">
                    <i class="fas fa-save mr-2"></i>
                    Save Customer
                </button>
            </div>
        </form>
    </div>

    <!-- Form Footer -->
    <div class="bg-gray-50 px-6 py-4 border-t border-gray-200">
        <div class="flex flex-col md:flex-row items-center justify-between gap-2 text-center md:text-left">
            <p class="text-xs text-gray-500 flex items-center justify-center">
                <i class="fas fa-info-circle mr-1.5"></i>
                Fields marked with <span class="text-red-500 mx-0.5">*</span> are required
            </p>
            <p class="text-xs text-gray-500 flex items-center justify-center">
                <i class="fas fa-shield-alt mr-1.5"></i>
                All data is encrypted and securely stored
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