<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password Form</title>
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
    <form class="form" name="forgotForm" action="forgotpasswordhandler.jsp" method="post">
        <h2>Forgot Password</h2>
        <label for="email">Enter your registered email ID:</label>
        <input type="email" id="email" name="email" required>
        <button type="submit" class="form-submit">Submit</button>
    </form>
    <%-- Display error message, if required --%>
</body>
</html>