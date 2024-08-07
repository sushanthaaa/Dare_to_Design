import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/UserProfileServlet")
public class UserProfileServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set up the database connection
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");
            System.out.println("conn is " + conn);
            // Prepare the SQL query to retrieve user information
            String query = "SELECT * FROM usersignup WHERE userid=?";
            PreparedStatement ps = conn.prepareStatement(query);
            
            // Get the user ID from the request parameter
            int userId = Integer.parseInt(request.getParameter("id"));
            System.out.println("userId is " + userId);
            ps.setInt(1, userId);
            
            // Execute the query and retrieve the user information
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String username = rs.getString("fullname");
                String userEmail = rs.getString("email");
                String userPassword = rs.getString("passwords");
                String userAddress = rs.getString("address");
                String userPhone = rs.getString("phonenumber");
               // String userLanguages = rs.getString("languages");
                
                // Set the values of the span tags in the JSP file
                request.setAttribute("userId", userId);
                request.setAttribute("username", username);
                request.setAttribute("userEmail", userEmail);
                request.setAttribute("userPassword", userPassword);
                request.setAttribute("userAddress", userAddress);
                request.setAttribute("userPhone", userPhone);
                
               // String[] languages = userLanguages.split(",");
               // request.setAttribute("userLanguages", languages);
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            throw new ServletException("Error connecting to the database.", e);
        }
        
        // Forward the request to the JSP file
        RequestDispatcher dispatcher = request.getRequestDispatcher("userprofile.jsp");
        dispatcher.forward(request, response);
    }
}