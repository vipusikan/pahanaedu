<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
  <title>Customer Accounts - Pahana Edu</title>
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

    .table-row:hover {
      background-color: #f3f4f6;
      transform: translateY(-1px);
      box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
    }

    .action-btn {
      transition: all 0.2s ease;
    }

    .action-btn:hover {
      transform: translateY(-1px);
      box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
    }
  </style>
</head>
<body class="min-h-screen">
<!-- Header -->
<header class="bg-white shadow-sm">
  <div class="max-w-7xl mx-auto px-4 py-4 sm:px-6 lg:px-8 flex justify-between items-center">
    <h1 class="text-2xl font-bold text-gray-900 flex items-center">
      <i class="fas fa-users text-primary-600 mr-3"></i>
      Customer Accounts
    </h1>
    <div class="flex items-center space-x-4">
      <a href="addCustomer.jsp" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500">
        <i class="fas fa-user-plus mr-2"></i>
        Add Customer
      </a>
    </div>
  </div>
</header>

<!-- Main Content -->
<main class="max-w-7xl mx-auto px-4 py-6 sm:px-6 lg:px-8">
  <div class="bg-white shadow rounded-lg overflow-hidden">
    <!-- Table Header -->
    <div class="px-6 py-4 border-b border-gray-200 flex justify-between items-center">
      <div class="flex items-center">
        <div class="relative rounded-md shadow-sm max-w-xs w-full">
          <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <i class="fas fa-search text-gray-400"></i>
          </div>
          <input type="text" name="search" id="search" class="focus:ring-primary-500 focus:border-primary-500 block w-full pl-10 pr-12 py-2 border-gray-300 rounded-md" placeholder="Search customers...">
        </div>
      </div>
      <div class="flex items-center space-x-2">
                    <span class="text-sm text-gray-500">Total:
                        <span class="font-medium">
                            <%
                              try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection countConn = DriverManager.getConnection(
                                        "jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");
                                Statement countStmt = countConn.createStatement();
                                ResultSet countRs = countStmt.executeQuery("SELECT COUNT(*) FROM customers");
                                if(countRs.next()) {
                                  out.print(countRs.getInt(1));
                                }
                                countRs.close();
                                countStmt.close();
                                countConn.close();
                              } catch(Exception e) {
                                out.print("N/A");
                              }
                            %>
                        </span>
                    </span>
      </div>
    </div>

    <!-- Customer Table -->
    <div class="overflow-x-auto">
      <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
        <tr>
          <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
            Account Number
          </th>
          <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
            Name
          </th>
          <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
            Address
          </th>
          <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
            Mobile
          </th>
          <th scope="col" class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
            Actions
          </th>
        </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
        <%
          try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/pahanaedu", "root", "Vipu0627");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM customers ORDER BY name ASC");

            while (rs.next()) {
              String accountNumber = rs.getString("account_number");
              String name = rs.getString("name");
              String address = rs.getString("address");
              String mobile = rs.getString("mobile_number");
        %>
        <tr class="table-row transition-all duration-150">
          <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
            <%= accountNumber %>
          </td>
          <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
            <%= name %>
          </td>
          <td class="px-6 py-4 text-sm text-gray-500">
            <%= address %>
          </td>
          <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
            <%= mobile %>
          </td>
          <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
            <div class="flex justify-end space-x-2">
              <a href="editCustomer.jsp?accountNumber=<%= accountNumber %>" class="action-btn inline-flex items-center px-3 py-1 border border-transparent text-xs font-medium rounded-md shadow-sm text-white bg-primary-600 hover:bg-primary-700">
                <i class="fas fa-edit mr-1"></i> Edit
              </a>
              <a href="#" onclick="confirmDelete('<%= accountNumber %>')" class="action-btn inline-flex items-center px-3 py-1 border border-transparent text-xs font-medium rounded-md shadow-sm text-white bg-red-600 hover:bg-red-700">
                <i class="fas fa-trash-alt mr-1"></i> Delete
              </a>
            </div>
          </td>
        </tr>
        <%
          }
          rs.close();
          stmt.close();
          conn.close();
        } catch (Exception e) {
          e.printStackTrace();
        %>
        <tr>
          <td colspan="5" class="px-6 py-4 text-center text-sm text-red-500">
            <i class="fas fa-exclamation-triangle mr-2"></i> Error loading customer data. Please try again later.
          </td>
        </tr>
        <%
          }
        %>
        </tbody>
      </table>
    </div>

    <!-- Pagination -->
    <div class="bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200 sm:px-6">
      <div class="flex-1 flex justify-between sm:hidden">
        <a href="#" class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
          Previous
        </a>
        <a href="#" class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
          Next
        </a>
      </div>
      <div class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
        <div>
          <p class="text-sm text-gray-700">
            Showing <span class="font-medium">1</span> to <span class="font-medium">10</span> of <span class="font-medium">20</span> results
          </p>
        </div>
        <div>
          <nav class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px" aria-label="Pagination">
            <a href="#" class="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
              <span class="sr-only">Previous</span>
              <i class="fas fa-chevron-left"></i>
            </a>
            <a href="#" aria-current="page" class="z-10 bg-primary-50 border-primary-500 text-primary-600 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
              1
            </a>
            <a href="#" class="bg-white border-gray-300 text-gray-500 hover:bg-gray-50 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
              2
            </a>
            <a href="#" class="bg-white border-gray-300 text-gray-500 hover:bg-gray-50 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
              3
            </a>
            <a href="#" class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
              <span class="sr-only">Next</span>
              <i class="fas fa-chevron-right"></i>
            </a>
          </nav>
        </div>
      </div>
    </div>
  </div>
</main>

<!-- Delete Confirmation Modal (hidden by default) -->
<div id="deleteModal" class="fixed z-10 inset-0 overflow-y-auto hidden" aria-labelledby="modal-title" role="dialog" aria-modal="true">
  <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
    <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" aria-hidden="true"></div>
    <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
    <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
      <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
        <div class="sm:flex sm:items-start">
          <div class="mx-auto flex-shrink-0 flex items-center justify-center h-12 w-12 rounded-full bg-red-100 sm:mx-0 sm:h-10 sm:w-10">
            <i class="fas fa-exclamation text-red-600"></i>
          </div>
          <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
            <h3 class="text-lg leading-6 font-medium text-gray-900" id="modal-title">Delete customer</h3>
            <div class="mt-2">
              <p class="text-sm text-gray-500">Are you sure you want to delete this customer? This action cannot be undone.</p>
            </div>
          </div>
        </div>
      </div>
      <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
        <button type="button" id="confirmDeleteBtn" class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-red-600 text-base font-medium text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 sm:ml-3 sm:w-auto sm:text-sm">
          Delete
        </button>
        <button type="button" onclick="closeModal()" class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm">
          Cancel
        </button>
      </div>
    </div>
  </div>
</div>

<script>
  let customerToDelete = null;

  function confirmDelete(accountNumber) {
    customerToDelete = accountNumber;
    document.getElementById('deleteModal').classList.remove('hidden');
  }

  function closeModal() {
    customerToDelete = null;
    document.getElementById('deleteModal').classList.add('hidden');
  }

  document.getElementById('confirmDeleteBtn').addEventListener('click', function() {
    if (customerToDelete) {
      window.location.href = 'DeleteCustomerServlet?accountNumber=' + customerToDelete;
    }
  });

  // Simple search functionality
  document.getElementById('search').addEventListener('input', function(e) {
    const searchTerm = e.target.value.toLowerCase();
    const rows = document.querySelectorAll('tbody tr');

    rows.forEach(row => {
      const text = row.textContent.toLowerCase();
      row.style.display = text.includes(searchTerm) ? '' : 'none';
    });
  });
</script>
</body>
</html>