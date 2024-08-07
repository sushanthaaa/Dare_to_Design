import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class mainpage extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet
{
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		String username = "myusername";
	    String password = "mypassword";
		    String fullName = request.getParameter("fullName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String message = request.getParameter("message");
		 
			PrintWriter out = response.getWriter(); 
			try
	{
			Class.forName("com.mysql.jdbc.Driver");
	   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");
	// Prepare an SQL INSERT statement
	   String sql = "INSERT INTO contactus (fullname, email, phone, message) VALUES (?, ?, ?, ?)";
	   PreparedStatement statement = conn.prepareStatement(sql);
	   statement.setString(1, fullName);
	   statement.setString(2, email);
	   statement.setString(3, phone);
	   statement.setString(4, message);
	  
	   // Execute the statement
	   statement.executeUpdate();
	   response.sendRedirect("mainpage.jsp?msg=valid");


	   // Close the database connection
	   conn.close();

	}
		catch (Exception e) 
		  {
			System.out.println(e);
			response.sendRedirect("mainpage.jsp?msg=invalid"); 
		  }

	}
	}
