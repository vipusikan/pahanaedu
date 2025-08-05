<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/5/2025
  Time: 10:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  // Invalidate the current session
  session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Logged Out - Pahana Edu</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

    body {
      font-family: 'Inter', sans-serif;
      background-image:
              linear-gradient(rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.9)),
              url('https://images.unsplash.com/photo-1589998059171-988d887df646?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1476&q=80');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      min-height: 100vh;
    }

    .logout-card {
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(10px);
      border-radius: 16px;
      box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
      transition: all 0.3s ease;
    }

    .logout-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
    }

    .btn-login {
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .btn-login:hover {
      transform: translateY(-2px);
      box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
    }

    .btn-login:after {
      content: "";
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
      transition: 0.5s;
    }

    .btn-login:hover:after {
      left: 100%;
    }
  </style>
</head>
<body class="flex items-center justify-center p-6">
<div class="logout-card p-10 max-w-md w-full text-center">
  <div class="mb-6">
    <i class="fas fa-book-open text-5xl text-blue-600 mb-4"></i>
    <h1 class="text-3xl font-bold text-gray-800 mb-2">Session Ended</h1>
    <p class="text-gray-600">You've been securely logged out from Pahana Edu Billing System</p>
  </div>

  <div class="animate-bounce mb-8">
    <i class="fas fa-lock text-4xl text-blue-500"></i>
  </div>

  <div class="space-y-4">
    <p class="text-gray-500 italic">"The more that you read, the more things you will know. The more that you learn, the more places you'll go."</p>
    <p class="text-sm text-gray-400">- Dr. Seuss</p>
  </div>

  <div class="mt-8">
    <a href="index.jsp" class="btn-login inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
      <i class="fas fa-sign-in-alt mr-2"></i>
      Sign In Again
    </a>
  </div>

  <div class="mt-8 pt-6 border-t border-gray-100">
    <p class="text-sm text-gray-500">
      © 2025 Pahana Edu Bookshop. All rights reserved.
    </p>
  </div>
</div>
</body>
</html>