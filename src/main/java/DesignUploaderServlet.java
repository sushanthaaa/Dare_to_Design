import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig
public class DesignUploaderServlet extends HttpServlet {
    // JDBC driver name and database URL

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        // Get the form data
        String service = request.getParameter("service");
        System.out.println("Service selected : " + service);
        String builder_id = request.getParameter("builder_id");
        System.out.println("Service builderid : " + builder_id);
        String buildername = request.getParameter("buildername");
        System.out.println("Service buildername : " + buildername);
        String description = request.getParameter("description");
        System.out.println("Service description : " + description);
        String price = request.getParameter("price");
        System.out.println("Service price : " + price);
        InputStream inputStream = null;

        // Get the uploaded file and store it in the input stream
        Part filePart = request.getPart("image");
        if (filePart != null) {
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
        	
            inputStream = filePart.getInputStream();
        }

        // Get the builderID of the logged-in builder
      //  HttpSession session = request.getSession();
       // int builderID = getBuilderID(session);


        try {
            // Register JDBC driver
	          Class.forName("com.mysql.jdbc.Driver");
              conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design?useSSL=false", "root", "12345");

            // Query the services table for the services ID based on the selected service name
            String servicesIDSql = "SELECT services_id FROM services WHERE services = ?";
            pstmt = conn.prepareStatement(servicesIDSql);
            pstmt.setString(1, service);
            rs = pstmt.executeQuery();

            int servicesID = 0;

            if (rs.next()) {
                // Retrieve the services ID
                servicesID = rs.getInt("services_id");
            }

            if (servicesID != 0) {
                // Create the SQL statement for the target table
                String sql = "INSERT INTO builderimg (services_id, image, builder_id, buildername, image_description, price) values (?, ?, ?, ?, ?, ?)";

                // Prepare the statement
                stmt = conn.prepareStatement(sql);

                // Set the parameters
                stmt.setInt(1, servicesID);

                if (inputStream != null) {
                    // Set the input stream as blob parameter
                    stmt.setBlob(2, inputStream);
                } else {
                    // Set a default (empty) image if the input stream is null
                    stmt.setBlob(2, new ByteArrayInputStream(new byte[0]));
                }
                
                stmt.setString(3, builder_id);
                stmt.setString(4, buildername);
                stmt.setString(5, description);
                stmt.setString(6, price);

                // Execute the statement
                stmt.executeUpdate();

                // Close the connection and statement
                stmt.close();
            
                // Inform the user of the upload success
                String message = "File uploaded and data stored successfully!";
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('" + message + "');");
                out.println("location='buildupload.jsp';");
                out.println("</script>");
            }
        } catch (SQLException se) {
            // Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            // Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException se3) {
                se3.printStackTrace();
            }

            try {
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException se2) {
                se2.printStackTrace();
            }

            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }

  //  private static int getBuilderID(HttpSession session) {
        // Retrieve the builderID of the logged-in builder from the session object
    //    int builderID = 0;
      //  Object object = session.getAttribute("builder_id");
        //if (object instanceof Integer) {
          //  builderID = ((Integer) object).intValue();
        //}
        //return builderID;
    //}
}