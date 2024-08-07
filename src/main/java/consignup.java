import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class consignup extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet
{
protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
{
	String username = "myusername";
    String password = "mypassword";
	    String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String passwords = request.getParameter("password");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String exp_year = request.getParameter("year");
		String edu = request.getParameter("edu");
		String[] language = request.getParameterValues("language");
	    // Join the hobbies array into a comma-separated string
	    String languagesString = String.join(",", language);
	 
		PrintWriter out = response.getWriter(); 
		try
{
		Class.forName("com.mysql.jdbc.Driver");
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");
	
   //check if email already exists in database
   String query = "SELECT * FROM consignup WHERE email=?";
   PreparedStatement ps = conn.prepareStatement(query);
   ps.setString(1,  email);
   ResultSet rs = ps.executeQuery();
   if(rs.next()){
	   out.println("<html>");
       out.println("<head>");
       out.println("<title>Builder Registration Unsucessfull</title>");
       out.println("<link rel=\"stylesheet\" href=\"https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css\">");
       out.println("<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>");
       out.println("<script src=\"https://code.jquery.com/ui/1.13.0/jquery-ui.min.js\"></script>");
       out.println("<script>");
       out.println("$(function() {");
       out.println("    $('<div></div>').dialog({");
       out.println("        title: 'Builder Registration',");
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
       out.println("    }).html('This email_Id is already taken! <br>"
       		+ "Try again with a new Email_Id..');");
       out.println("});");
       out.println("</script>");
       out.println("</head>");
       out.println("<body>");
       out.println("</body>");
       out.println("</html>");
	} 
	//Insert new user into database
   else
    {
// Prepare an SQL INSERT statement
   String sql = "INSERT INTO consignup (fullName, email, passwords, address, phone, exp_year, edu, languages) VALUES (?, ?, ?, ?, ?, ? ,? ,?)";
   PreparedStatement statement = conn.prepareStatement(sql);
   statement.setString(1, fullName);
   statement.setString(2, email);
   statement.setString(3, passwords);
   statement.setString(4, address);
   statement.setString(5, phone);
   statement.setString(6, exp_year);
   statement.setString(7, edu);
   statement.setString(8, languagesString);
  
   // Execute the statement
// Execute the statement
   int rowsInserted = statement.executeUpdate();
   if (rowsInserted > 0) {
	// Display an alert box with the message
       response.setContentType("text/html"); 
   	out.println("<html>");
       out.println("<head>");
       out.println("<title>Thank You</title>");
       out.println("<link rel=\"stylesheet\" href=\"https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css\">");
       out.println("<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>");
       out.println("<script src=\"https://code.jquery.com/ui/1.13.0/jquery-ui.min.js\"></script>");
       out.println("<script>");
       out.println("$(function() {");
       out.println("    $('<div></div>').dialog({");
       out.println("        title: 'Builder Registration',");
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
       out.println("    }).html('Registration Sucessfull');");
       out.println("});");
       out.println("</script>");
       out.println("</head>");
       out.println("<body>");
       out.println("</body>");
       out.println("</html>");
     
   } else {
       // Set the pop-up message to indicate the data is not stored in the database
     
       // Display an alert box with the message
       response.setContentType("text/html"); 
   	out.println("<html>");
       out.println("<head>");
       out.println("<title>Error</title>");
       out.println("<link rel=\"stylesheet\" href=\"https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css\">");
       out.println("<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>");
       out.println("<script src=\"https://code.jquery.com/ui/1.13.0/jquery-ui.min.js\"></script>");
       out.println("<script>");
       out.println("$(function() {");
       out.println("    $('<div></div>').dialog({");
       out.println("        title: 'Builder Registration',");
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
       out.println("    }).html('Registration Unsucessfull');");
       out.println("});");
       out.println("</script>");
       out.println("</head>");
       out.println("<body>");
       out.println("</body>");
       out.println("</html>");
   }
   // Close the database connection
   conn.close();
} 
   }
		catch (Exception e) {
   System.out.println(e);
   // Set the pop-up message to indicate the data is not stored in the database
 
   // Display an alert box with the message
   response.setContentType("text/html"); 
	out.println("<html>");
   out.println("<head>");
   out.println("<title>Registration</title>");
   out.println("<link rel=\"stylesheet\" href=\"https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css\">");
   out.println("<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>");
   out.println("<script src=\"https://code.jquery.com/ui/1.13.0/jquery-ui.min.js\"></script>");
   out.println("<script>");
   out.println("$(function() {");
   out.println("    $('<div></div>').dialog({");
   out.println("        title: 'Builder Registration',");
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
   out.println("    }).html('Registration Unsucessfull');");
   out.println("});");
   out.println("</script>");
   out.println("</head>");
   out.println("<body>");
   out.println("</body>");
   out.println("</html>");

}
}
}

