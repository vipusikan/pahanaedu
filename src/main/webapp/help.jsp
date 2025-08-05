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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: {
                            50: '#f0f9ff',
                            100: '#e0f2fe',
                            600: '#0284c7',
                            700: '#0369a1',
                        },
                        accent: {
                            500: '#ec4899',
                            600: '#db2777',
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
            background: linear-gradient(135deg, #f9fafb 0%, #f0f9ff 100%);
            min-height: 100vh;
        }

        .guide-card {
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -4px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .guide-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
        }

        .section-icon {
            width: 48px;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            margin-right: 16px;
            flex-shrink: 0;
        }

        .step-item {
            position: relative;
            padding-left: 32px;
            margin-bottom: 16px;
        }

        .step-item:before {
            content: "";
            position: absolute;
            left: 8px;
            top: 8px;
            width: 16px;
            height: 16px;
            border-radius: 50%;
            background-color: #0284c7;
            z-index: 1;
        }

        .step-item:after {
            content: "";
            position: absolute;
            left: 15px;
            top: 24px;
            bottom: -16px;
            width: 2px;
            background-color: #e5e7eb;
        }

        .step-item:last-child:after {
            display: none;
        }
    </style>
</head>
<body class="font-sans antialiased text-gray-800">

<!-- Header -->
<div class="bg-gradient-to-r from-primary-600 to-primary-700 py-12 px-6 text-white">
    <div class="max-w-6xl mx-auto">
        <div class="flex items-center justify-between">
            <div>
                <h1 class="text-3xl md:text-4xl font-bold flex items-center">
                    <i class="fas fa-question-circle mr-4"></i>
                    Pahana Edu Help Center
                </h1>
                <p class="mt-2 text-primary-100 opacity-90">Everything you need to know to use our system effectively</p>
            </div>
            <div class="hidden md:block">
                <div class="bg-white/10 p-4 rounded-lg backdrop-blur-sm">
                    <i class="fas fa-headset text-3xl text-white"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Main Content -->
<div class="max-w-6xl mx-auto px-6 py-12 -mt-10">
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <!-- Navigation Sidebar -->
        <div class="lg:col-span-1">
            <div class="bg-white guide-card p-6 sticky top-6">
                <h2 class="text-xl font-bold text-gray-800 mb-6 flex items-center">
                    <i class="fas fa-bookmark text-accent-500 mr-3"></i>
                    Quick Navigation
                </h2>
                <ul class="space-y-3">
                    <li>
                        <a href="#add-customers" class="flex items-center px-4 py-3 rounded-lg hover:bg-primary-50 text-gray-700 hover:text-primary-600 transition-colors">
                            <i class="fas fa-user-plus mr-3 text-primary-600"></i>
                            Adding Customers
                        </a>
                    </li>
                    <li>
                        <a href="#manage-inventory" class="flex items-center px-4 py-3 rounded-lg hover:bg-primary-50 text-gray-700 hover:text-primary-600 transition-colors">
                            <i class="fas fa-boxes mr-3 text-primary-600"></i>
                            Managing Inventory
                        </a>
                    </li>
                    <li>
                        <a href="#generate-bills" class="flex items-center px-4 py-3 rounded-lg hover:bg-primary-50 text-gray-700 hover:text-primary-600 transition-colors">
                            <i class="fas fa-file-invoice-dollar mr-3 text-primary-600"></i>
                            Generating Bills
                        </a>
                    </li>
                    <li>
                        <a href="#troubleshooting" class="flex items-center px-4 py-3 rounded-lg hover:bg-primary-50 text-gray-700 hover:text-primary-600 transition-colors">
                            <i class="fas fa-tools mr-3 text-primary-600"></i>
                            Troubleshooting
                        </a>
                    </li>
                    <li>
                        <a href="#contact" class="flex items-center px-4 py-3 rounded-lg hover:bg-primary-50 text-gray-700 hover:text-primary-600 transition-colors">
                            <i class="fas fa-envelope mr-3 text-primary-600"></i>
                            Contact Support
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Content Area -->
        <div class="lg:col-span-2 space-y-8">
            <!-- Add Customers Section -->
            <div id="add-customers" class="bg-white guide-card p-8">
                <div class="flex items-start mb-6">
                    <div class="section-icon bg-blue-100 text-primary-600">
                        <i class="fas fa-user-plus text-xl"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold text-gray-800">Adding Customers</h2>
                        <p class="text-gray-600 mt-1">Learn how to register new customers in the system</p>
                    </div>
                </div>

                <div class="ml-16">
                    <div class="step-item">
                        <h3 class="font-semibold text-lg text-gray-800">1. Access the Customer Form</h3>
                        <p class="text-gray-600 mt-1">Navigate to the <span class="font-medium text-primary-600">Add Customer</span> page from the main dashboard sidebar.</p>
                    </div>

                    <div class="step-item">
                        <h3 class="font-semibold text-lg text-gray-800">2. Enter Customer Details</h3>
                        <p class="text-gray-600 mt-1">Fill in all required fields including name, address, account number, and contact information.</p>
                    </div>

                    <div class="step-item">
                        <h3 class="font-semibold text-lg text-gray-800">3. Save the Record</h3>
                        <p class="text-gray-600 mt-1">Click the <span class="font-medium text-green-600">Save Customer</span> button to store the information in the database.</p>
                    </div>
                </div>
            </div>

            <!-- Manage Inventory Section -->
            <div id="manage-inventory" class="bg-white guide-card p-8">
                <div class="flex items-start mb-6">
                    <div class="section-icon bg-purple-100 text-purple-600">
                        <i class="fas fa-boxes text-xl"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold text-gray-800">Managing Inventory</h2>
                        <p class="text-gray-600 mt-1">How to add, update, and organize your book inventory</p>
                    </div>
                </div>

                <div class="ml-16">
                    <div class="step-item">
                        <h3 class="font-semibold text-lg text-gray-800">1. Open Inventory Management</h3>
                        <p class="text-gray-600 mt-1">Select <span class="font-medium text-primary-600">Manage Inventory</span> from the navigation menu.</p>
                    </div>

                    <div class="step-item">
                        <h3 class="font-semibold text-lg text-gray-800">2. Browse by Categories</h3>
                        <p class="text-gray-600 mt-1">Use the category tabs (Horror, Romance, Knowledge) to filter books.</p>
                    </div>

                    <div class="step-item">
                        <h3 class="font-semibold text-lg text-gray-800">3. Modify Inventory</h3>
                        <p class="text-gray-600 mt-1">
                            <span class="inline-block bg-green-100 text-green-800 text-xs px-2 py-1 rounded mr-2">Add</span>
                            <span class="inline-block bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded mr-2">Edit</span>
                            <span class="inline-block bg-red-100 text-red-800 text-xs px-2 py-1 rounded">Delete</span>
                            books as needed using the action buttons.
                        </p>
                    </div>
                </div>
            </div>

            <!-- Generate Bills Section -->
            <div id="generate-bills" class="bg-white guide-card p-8">
                <div class="flex items-start mb-6">
                    <div class="section-icon bg-green-100 text-green-600">
                        <i class="fas fa-file-invoice-dollar text-xl"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold text-gray-800">Generating Bills</h2>
                        <p class="text-gray-600 mt-1">Create professional invoices for customer purchases</p>
                    </div>
                </div>

                <div class="ml-16">
                    <div class="step-item">
                        <h3 class="font-semibold text-lg text-gray-800">1. Select a Customer</h3>
                        <p class="text-gray-600 mt-1">Choose from registered customers in the dropdown or search by name.</p>
                    </div>

                    <div class="step-item">
                        <h3 class="font-semibold text-lg text-gray-800">2. Add Book Items</h3>
                        <p class="text-gray-600 mt-1">Search for books, enter quantities, and the system will calculate totals automatically.</p>
                    </div>

                    <div class="step-item">
                        <h3 class="font-semibold text-lg text-gray-800">3. Finalize Invoice</h3>
                        <p class="text-gray-600 mt-1">Click <span class="font-medium text-green-600">Print Bill</span> to generate a professional PDF invoice that's saved to your records.</p>
                    </div>
                </div>
            </div>

            <!-- Troubleshooting Section -->
            <div id="troubleshooting" class="bg-white guide-card p-8">
                <div class="flex items-start mb-6">
                    <div class="section-icon bg-yellow-100 text-yellow-600">
                        <i class="fas fa-tools text-xl"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold text-gray-800">Troubleshooting</h2>
                        <p class="text-gray-600 mt-1">Solutions to common issues you might encounter</p>
                    </div>
                </div>

                <div class="ml-16 space-y-6">
                    <div>
                        <h3 class="font-semibold text-lg text-gray-800 flex items-center">
                            <i class="fas fa-user-slash text-red-500 mr-2"></i>
                            Customer Not Appearing
                        </h3>
                        <p class="text-gray-600 mt-1 pl-8">Verify the customer was saved successfully in the database. Check for duplicate entries or spelling variations.</p>
                    </div>

                    <div>
                        <h3 class="font-semibold text-lg text-gray-800 flex items-center">
                            <i class="fas fa-database text-red-500 mr-2"></i>
                            Bill Not Saving
                        </h3>
                        <p class="text-gray-600 mt-1 pl-8">Ensure database connection is active and all required fields are completed. Verify table structure matches expectations.</p>
                    </div>

                    <div>
                        <h3 class="font-semibold text-lg text-gray-800 flex items-center">
                            <i class="fas fa-image text-red-500 mr-2"></i>
                            Images Not Loading
                        </h3>
                        <p class="text-gray-600 mt-1 pl-8">Confirm the image files exist in the specified directory and file paths are correctly referenced in the database.</p>
                    </div>
                </div>
            </div>

            <!-- Contact Section -->
            <div id="contact" class="bg-white guide-card p-8">
                <div class="flex items-start mb-6">
                    <div class="section-icon bg-pink-100 text-accent-500">
                        <i class="fas fa-headset text-xl"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold text-gray-800">Contact Support</h2>
                        <p class="text-gray-600 mt-1">Get in touch with our technical team for assistance</p>
                    </div>
                </div>

                <div class="ml-16 space-y-4">
                    <div class="flex items-start">
                        <div class="bg-primary-50 p-3 rounded-lg mr-4">
                            <i class="fas fa-envelope text-primary-600"></i>
                        </div>
                        <div>
                            <h3 class="font-semibold text-gray-800">Email Support</h3>
                            <a href="mailto:support@pahanaedu.lk" class="text-primary-600 hover:underline">support@pahanaedu.lk</a>
                            <p class="text-sm text-gray-500 mt-1">Typically responds within 2 business hours</p>
                        </div>
                    </div>

                    <div class="flex items-start">
                        <div class="bg-primary-50 p-3 rounded-lg mr-4">
                            <i class="fas fa-phone-alt text-primary-600"></i>
                        </div>
                        <div>
                            <h3 class="font-semibold text-gray-800">Phone Support</h3>
                            <p class="text-gray-700">+94 758731825</p>
                            <p class="text-sm text-gray-500 mt-1">Available Monday-Friday, 9AM-5PM</p>
                        </div>
                    </div>

                    <div class="flex items-start">
                        <div class="bg-primary-50 p-3 rounded-lg mr-4">
                            <i class="fas fa-users text-primary-600"></i>
                        </div>
                        <div>
                            <h3 class="font-semibold text-gray-800">Development Team</h3>
                            <p class="text-gray-700">Segar Vipusikan</p>
                            <p class="text-sm text-gray-500 mt-1">Lead Developer & System Architect</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Back Button -->
            <div class="text-center mt-12">
                <a href="dashboard.jsp" class="inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition-all">
                    <i class="fas fa-arrow-left mr-2"></i>
                    Return to Dashboard
                </a>
            </div>
        </div>
    </div>
</div>

</body>
</html>