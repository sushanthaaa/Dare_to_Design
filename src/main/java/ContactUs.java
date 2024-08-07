import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class ContactUs extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet
{
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		    String fullName = request.getParameter("fullName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String message = request.getParameter("message");
		 
			try
	{
			Class.forName("com.mysql.jdbc.Driver");
	   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");
	// Prepare an SQL INSERT statement
	   String sql = "INSERT INTO contactus (fullName, email, phone, message) VALUES (?, ?, ?, ?)";
	   PreparedStatement statement = conn.prepareStatement(sql);
	   statement.setString(1, fullName);
	   statement.setString(2, email);
	   statement.setString(3, phone);
	   statement.setString(4, message);
	  
	   // Execute the statement
	   statement.executeUpdate();
	   conn.close();
	} catch (SQLException e) {
	   System.out.println("Error: " + e.getMessage());
	}
			 catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}

	        response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        out.println("<html>");
	        out.println("<head>");
	        out.println("<title>Thank You</title>");
	        out.println("<link rel=\"stylesheet\" href=\"https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css\">");
	        out.println("<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>");
	        out.println("<script src=\"https://code.jquery.com/ui/1.13.0/jquery-ui.min.js\"></script>");
	        out.println("<script>");
	        out.println("$(function() {");
	        out.println("    $('<div></div>').dialog({");
	        out.println("        title: 'Thank You',");
	        out.println("        modal: true,");
	        out.println("        buttons: {");
	        out.println("            Ok: function() {");
	        out.println("                $(this).dialog('close');");
	        out.println("                window.location.href = 'mainpage.jsp';"); 
	        out.println("            }");
	        out.println("        },");
	        out.println("        close: function() {");
	        out.println("            window.location.href = 'mainpage.jsp';");
	        out.println("        },");
	        out.println("        resizable: false");
	        out.println("    }).html('Thank you for the response');");
	        out.println("});");
	        out.println("</script>");
	        out.println("</head>");
	        out.println("<body>");
	        out.println("</body>");
	        out.println("</html>");
	    }
	}
