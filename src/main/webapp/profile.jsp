<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
// Check if the user is logged in
if (session.getAttribute("email") == null) {
	response.sendRedirect("login1.jsp");
} else {
	try {
		// Set up the database connection
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/MyDB");
		Connection conn = ds.getConnection();
		
		// Prepare the SQL query
		String email = (String) session.getAttribute("email");
		String query = "SELECT * FROM usersignup WHERE email=?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, email);

		// Execute the query
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			// Get the user's information from the database
			int userId = rs.getInt("id");
			String username = rs.getString("fullname");
			String userEmail = rs.getString("email");
			String userPassword = rs.getString("passwords");
			String userAddress = rs.getString("address");
		//	String userLanguages = rs.getString("languages");
			
			// Display the user's information
			out.println("<h1>Welcome to your profile, " + username + "!</h1>");
			out.println("<p>User ID: " + userId + "</p>");
			out.println("<p>Username: " + username + "</p>");
			out.println("<p>Email: " + userEmail + "</p>");
			out.println("<p>Password: " + userPassword + "</p>");
			out.println("<p>Address: " + userAddress + "</p>");
		//	out.println("<p>Languages Known: " + userLanguages + "</p>");
			
			// Add logout and change password buttons
			out.println("<form action=\"logout.jsp\" method=\"post\">");
			out.println("<input type=\"submit\" value=\"Logout\">");
			out.println("</form>");
			out.println("<form action=\"changepassword.jsp\" method=\"get\">");
			out.println("<input type=\"submit\" value=\"Change Password\">");
			out.println("</form>");
		} else {
			// User not found in the database
			out.println("<p>Sorry, we could not find your profile. Please contact support for assistance.</p>");
		}

		// Clean up the database resources
		rs.close();
		ps.close();
		conn.close();
	} catch (Exception e) {
		// Something went wrong, handle the error
		out.println("<p>Error: " + e.getMessage() + "</p>");
	}
}
%>