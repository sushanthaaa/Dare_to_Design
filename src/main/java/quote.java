import java.io.*;
import java.sql.*;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class quote extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet
{
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
			String userid = request.getParameter("userid");
			String builder_id = request.getParameter("builder_id");
			String service = request.getParameter("service");
		    String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phonenumber = request.getParameter("phone_number");
			String work = request.getParameter("work");
			String room = request.getParameter("room");
			String purpose= request.getParameter("purpose");
			String sqrtfeet= request.getParameter("sqrtfeet");
			String message= request.getParameter("message");
		 
			try
	{
	   Class.forName("com.mysql.jdbc.Driver");
	   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");
	// Prepare an SQL INSERT statement
	   String sql = "INSERT INTO quote (fullname, email, phonenumber, works, room, purpose, sqrtfeet, message, userid, builder_id, services) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	   PreparedStatement statement = conn.prepareStatement(sql);
	   statement.setString(1, name);
	   statement.setString(2, email);
	   statement.setString(3, phonenumber);
	   statement.setString(4, work);
	   statement.setString(5, room);
	   statement.setString(6, purpose);
	   statement.setString(7, sqrtfeet);
	   statement.setString(8, message);
	   statement.setString(9, userid);
	   statement.setString(10, builder_id);
	   statement.setString(11, service);
	   
	  
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

	// Display alert box
    
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
    out.println("    }).html('Check in Profile section for approved quotes');");
    out.println("});");
    out.println("</script>");
    out.println("</head>");
    out.println("<body>");
    out.println("</body>");
    out.println("</html>");
}
}

