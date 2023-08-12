<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>403 - Forbidden</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .container {
      text-align: center;
      padding: 20px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    h1 {
      color: #e74c3c;
    }
    p {
      color: #555;
    }
    .image {
      max-width: 100%;
      height: auto;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>403 - Forbidden</h1>
  <img src="${pageContext.request.contextPath}/auths/login/images/SM_BLOG_Fixing-403-Forbidden-Errors.png" alt="Forbidden" class="image">
  <p style="font-size: 24px; color: orangered;font-weight: bold">Sorry, you don't have permission to access this page.</p>
</div>
</body>
</html>
