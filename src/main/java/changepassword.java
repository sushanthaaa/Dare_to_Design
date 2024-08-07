import java.io.*;
import java.sql.*;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class changepassword extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet
{
protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
{

String email = request.getParameter("email");
String oldPassword = request.getParameter("old_password");
String newPassword = request.getParameter("new_password");
PrintWriter out = response.getWriter(); 

boolean success = true;
try {
    // Establish connection to MySQL database
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");
    
    // Check if email and old password match
    String query = "SELECT * FROM usersignup WHERE email = ? AND passwords = ?";
    PreparedStatement stmt = conn.prepareStatement(query);
    stmt.setString(1, email);
    stmt.setString(2, oldPassword);
    ResultSet rs = stmt.executeQuery();
    
    if (rs.next()) {
        // If email and old password match, update the password
        query = "UPDATE usersignup SET passwords = ? WHERE email = ?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, newPassword);
        stmt.setString(2, email);
        stmt.executeUpdate();
        success = true;
    }
    
    conn.close();
} catch (Exception e) {
    e.printStackTrace();
}

if (success) {
    // If password is changed successfully, redirect to the main page and display an alert box
    out.print("<script>alert('Password changed successfully!');</script>");
    response.sendRedirect("mainpage.jsp");
} else {
    // If email and old password do not match, display an error message and redirect back to the change password page
    out.print("<h1>Error: Email and/or old password do not match.</h1>");
    response.setHeader("Refresh", "3; URL=change_password.jsp");
}
}
}