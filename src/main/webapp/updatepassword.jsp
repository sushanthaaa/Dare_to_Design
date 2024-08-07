
<%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String newPassword = request.getParameter("new_password");
    String confirmPassword = request.getParameter("confirm_password");
    // perform validation on newPassword and confirmPassword
    if (newPassword.equals(confirmPassword)) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");
            String sql = "UPDATE usersignup SET passwords = ? WHERE email = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newPassword);
            pstmt.setString(2, email);
            int rowsUpdated = pstmt.executeUpdate();
            // Check if the password was updated successfully or not
            if (rowsUpdated > 0) {
                // Password updated successfully
                response.sendRedirect("login.jsp?message=success");
            } else {
                // Display error message
                response.sendRedirect("forgotpassword.jsp?message=error");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        // display an error message
        response.sendRedirect("forgotpassword.jsp?message=error");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Password</title>
</head>
<body>
    <%-- Display success or error message, if required --%>
</body>
</html>