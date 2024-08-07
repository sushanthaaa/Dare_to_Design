<%@ page import="java.sql.*, javax.servlet.*" %>
<%@ page import="java.util.*" %>
<%
    // Retrieve the builder ID from the database based on the email address
    String builderEmail = (String) session.getAttribute("email");
    int builderId = -1;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");
        PreparedStatement ps = conn.prepareStatement("SELECT builder_id FROM consignup WHERE email=?");
        ps.setString(1, builderEmail);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            builderId = rs.getInt("builder_id");
        }
        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        throw new ServletException("Error connecting to the database.", e);
    }

    if (builderId == -1) {
        throw new ServletException("User ID not found for email address: " + builderEmail);
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dare to Design | Request Quote</title>
    <link rel="stylesheet" href="style.css">
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
   
   .nav__link {
    color: darkorange;
    text-decoration: none;
    text-transform: uppercase;
}
.nav__link:hover {
    opacity: 0.50;
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
 <!-- ------------------------------- navbar -------------------------------- -->
    <header>
        <div class="container2 row1">
            <a href="mainpage.jsp"><img class="logo" src="images/logo.png" alt="logo"></a>
            <nav class="nav">
                <ul class="nav__list nav__list--primary">
                    <li class="nav__item"><a href="home.jsp" class="nav__link">Home</a></li>
                    <li class="nav__item"><a href="bservices.jsp" class="nav__link">Services</a></li>
                    <li class="nav__item"><a href="buildupload.jsp" class="nav__link">Upload</a></li> 
                    <li class="nav__item"><a href="#" id="active" class="nav__link">Quotation Request</a></li> 
                </ul>
                <ul class="nav__list">
                <li class="nav__item">
                  <%@ page import="java.sql.*, javax.servlet.*" %>
                      <% if (session.getAttribute("email") != null){ %>
                      
                      <a href="BuilderProfileServlet?id=<%=builderId%>" class="nav__link">Profile</a>
                      <a href="logout.jsp" class="nav__link">Logout</a> 
                          <% } %>
                          
                    </li>
                </ul>
            </nav>
        </div>
    </header>
    <div id="title">
	<center><i><h4>Quotation Request</h4></i></center>
	</div>
    
<table>
    <thead>
    <tr>
        <th>Quotation ID</th>
        <th>User ID</th>
        <th>User Name</th>
        <th>Email</th>
        <th>Phone Number</th>
        <th>Services</th>
        <th>Works</th>
        <th>Room</th>
        <th>Purpose</th>
        <th>Square Feet</th>
        <th>Message</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        // Establish database connection
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM quote WHERE builder_id=?");
            ps.setInt(1, builderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) { // loop through each row of the result set
                int id = rs.getInt("id");
                int userid = rs.getInt("userid");
                String fullName = rs.getString("fullname");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phonenumber");
                String services = rs.getString("services");
                String works = rs.getString("works");
                String room = rs.getString("room");
                String purpose = rs.getString("purpose");
                int squareFeet = rs.getInt("sqrtfeet");
                String message = rs.getString("message");
                boolean approved = rs.getBoolean("approved");

                // display the data in a table row
                out.println("<tr>");
                out.println("<td>" + id + "</td>");
                out.println("<td>"+ userid + "</td>");
                out.println("<td>" + fullName + "</td>");
                out.println("<td>" + email + "</td>");
                out.println("<td>" + phoneNumber + "</td>");
                out.println("<td>" + services + "</td>");
                out.println("<td>" + works + "</td>");
                out.println("<td>" + room + "</td>");
                out.println("<td>" + purpose + "</td>");
                out.println("<td>" + squareFeet + "</td>");
                out.println("<td>" + message + "</td>");
                out.println("<td>");
                if (approved) { // display "approved" or "rejected" based on the value of the approved column
                    out.println("Approved");
                } else {
                    out.println("<form action=\"QuoteApprovalServlet\" method=\"post\">");
                    out.println("<input type=\"hidden\" name=\"id\" value=\"" + id + "\">");
                    out.println("<input type=\"hidden\" name=\"action\" value=\"approve\">");
                    out.println("<button type=\"submit\">Approve</button>");
                    out.println("</form>");
                    out.println("<form action=\"QuoteApprovalServlet\" method=\"post\">");
                    out.println("<input type=\"hidden\" name=\"id\" value=\"" + id + "\">");
                    out.println("<input type=\"hidden\" name=\"action\" value=\"reject\">");
                    out.println("<button type=\"submit\">Reject</button>");
                    out.println("</form>");
                }
                out.println("</td>");
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
  <a href="rejectedquotes.jsp" class="reject-link">View Rejected Quotes</a>
</div>
</body>
</html>
