<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<%@ page import="java.sql.*, javax.servlet.*" %>
<nav>
  <% if (session.getAttribute("email") != null) {
        // Retrieve the user ID from the database based on the email address
        String userEmail = (String) session.getAttribute("email");
        int userId = -1;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");
            PreparedStatement ps = conn.prepareStatement("SELECT userid FROM usersignup WHERE email=?");
            ps.setString(1, userEmail);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userId = rs.getInt("userid");
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            throw new ServletException("Error connecting to the database.", e);
        }

        if (userId == -1) {
            throw new ServletException("User ID not found for email address: " + userEmail);
        }
  %>
    <ul class="nav__list">
      <li class="nav__item"><a href="UserProfileServlet?id=<%=userId%>" class="nav__link">Profile</a></li>    
        <li class="nav__item"><a href="logout.jsp" class="nav__link">Logout</a></li>    
    </ul>
  <% } else { %>
    <ul class="nav__list">
      <li class="nav__item"><a href="login1.jsp" class="nav__link">Login</a></li>
      <li class="nav__item"><a href="signup.jsp" class="nav__link">Sign up</a></li>
    </ul>
  <% } %>
</nav>
</body>
</html>