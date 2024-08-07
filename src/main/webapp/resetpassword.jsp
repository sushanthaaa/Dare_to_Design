<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
        <link rel="stylesheet" href="style.css">
     <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .back-button {
            position: absolute;
            top: 10px;
            left: 10px;
            text-decoration: none;
            color: #000;
            font-size: 16px;
            font-weight: bold;
        }
    </style>   
</head>
<body>
    <a href="login1.jsp" class="back-button">&#8592; Back to Login</a>
    <form class="form" name="resetForm" action="updatepassword.jsp" method="post">
        <h2>Reset Password</h2>
        <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
        <label for="new_password">Enter new password:</label>
        <input type="password" id="new_password" name="new_password" required>
        <label for="confirm_password">Confirm new password:</label>
        <input type="password" id="confirm_password" name="confirm_password" required>
        <button type="submit" class="form-submit">Submit</button>
    </form>
</body>
</html>