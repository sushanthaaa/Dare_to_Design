import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class blogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("bemail");
        String password = request.getParameter("passwords");

        if (email != null && password != null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design?useSSL=false", "root", "12345"); // Step 1: Establishing a Connection
                PreparedStatement preparedStatement = connection.prepareStatement("select * from consignup where email = ? and passwords = ?");
                preparedStatement.setString(1, email);
    			preparedStatement.setString(2, password);

                System.out.println(preparedStatement);
    			ResultSet result = preparedStatement.executeQuery();

    			if (result.next()) {
                    // The user exists and the credentials are valid, create a session
                    HttpSession mysession = request.getSession();
                    mysession.setAttribute("email", email);
                    response.sendRedirect("home.jsp");
                } else {
                    // The user does not exist or the credentials are invalid, display an error message
                    out.println("<p>Invalid email or password. Please try again.</p>");
                }

                // Close the database connection
                result.close();
                preparedStatement.close();
                connection.close();
            } catch (ClassNotFoundException e) {
                // Handle the exception.
                e.printStackTrace();
            } catch (SQLException e) {
                out.println("<p>Sorry, something went wrong on our end. Please try again later.</p>");
                e.printStackTrace();
            }
        }
    }
}