<html>
<head>
    <title>Change Password</title>
    <link rel="stylesheet" href="style.css">
    
</head>
<body>
        <div class="form-column">
                <div class="sec-title">
                    <h2> Change Password</h2>
                </div>
        <form class="form" method="post" action="changepassword">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <br>
        <label for="old_password">Old Password:</label>
        <input type="password" id="old_password" name="old_password" required>
        <br>
        <label for="new_password">New Password:</label>
        <input type="password" id="new_password" name="new_password" required>
        <br>
        <input class="form-submit" type="submit" value="Submit">
    </form>
    </div>
</body>
</html>