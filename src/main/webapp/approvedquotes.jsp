<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
  response.setHeader("Pragma", "no-cache"); 
  response.setHeader("Expires", "0");
 
  Object email = session.getAttribute("email"); 
  if (email == null) { 
    response.sendRedirect("login1.jsp"); 
  } 
%> 
<%@ page import="java.sql.*, javax.servlet.*" %>

  <% 
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
<html>
<head>
    <title>Approved Quotes</title>
    <style>
    
        table {
  border-collapse: collapse;
  width: 100%;
  max-width: 1000px;
  margin: 0 auto;
  background-color: #fff;
  border: 1px solid #ccc;
}

th, td {
  padding: 10px;
  text-align: left;
  border-bottom: 1px solid #ccc;
}

th {
  background-color: darkorange;
  font-weight: bold;
  color: #333;
}

.title{
      font-size: 40px;
      height: 60px;
      text-align: center;
   }  
    .back-button {
            float: left;
            margin-left: 5px;
            margin-top: 5px;
        }
   .nav__link {
    color: darkorange;
    text-decoration: none;
    text-transform: uppercase;
}
.nav__link:hover {
    opacity: 0.50;
}
   
    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #333;
      color: white;
      padding: 10px;
    }
      .reject-link {
    position: fixed;
    bottom: 20px;
    right: 20px;
    padding: 10px;
    background-color: #FF6347;
    color: white;
    text-decoration: none;
  }
  </style>
</head>
<body>
  <div class="title">
   <a href="quotation.jsp" class="nav__link back-button">&#8617;</a>
  <span>Approved Quotes</span>
</div>
<table>
<thead>
<tr>
    <th>Quotation ID</th>
    <th>Builder ID</th>
    <th>Builder Name</th>
    <th>Services</th>
    <th>Works</th>
    <th>Room</th>
    <th>Purpose</th>
    <th>Square Feet</th>
</tr>
</thead>
<tbody>
<%
    // retrieve the user ID from the request parameter


    // establish database connection
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM quote WHERE userid=? AND approved=true");
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) { // loop through each row of the result set
            int id = rs.getInt("id");
            String builder_id = rs.getString("builder_id");
            String buildername = rs.getString("buildername");
            String services = rs.getString("services");
            String works = rs.getString("works");
            String room = rs.getString("room");
            String purpose = rs.getString("purpose");
            int squareFeet = rs.getInt("sqrtfeet");

            // display the data in a table row
            out.println("<tr>");
            out.println("<td>" + id + "</td>");
            out.println("<td>" + builder_id + "</td>");
            out.println("<td>" + buildername + "</td>");
            out.println("<td>" + services + "</td>");
            out.println("<td>" + works + "</td>");
            out.println("<td>" + room + "</td>");
            out.println("<td>" + purpose + "</td>");
            out.println("<td>" + squareFeet + "</td>");
            out.println("</tr>");
        }

        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        throw new ServletException("Error connecting to the database.", e);
    }
%>
</tbody>
</table>
<div>
  <a href="userrejectedquotes.jsp" class="reject-link">View Rejected Quotes</a>
</div>
</body>
</html>