import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.InputStream;
import java.io.IOException;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

public class upload extends HttpServlet {
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/dare_to_design";

    // Database credentials
    static final String USER = "root";
    static final String PASS = "12345";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        // Get the form data
        String service = "Texture Painting";
        System.out.println("Service selected : "+service);
        System.out.println("Form submitted successfully");
        String description = request.getParameter("description");
        InputStream inputStream = null;

        // Get the uploaded file and store it in the input stream
        Part filePart = request.getPart("image");
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }

        // Get the userID of the logged-in user
        HttpSession session = request.getSession();
        int userID = getUserID(session);

        try {
            // Register JDBC driver
            Class.forName(JDBC_DRIVER);

            // Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // Query the services table for the services ID based on the selected service name
            String servicesIDSql = "SELECT services_id FROM services WHERE services = ?";
            pstmt = conn.prepareStatement(servicesIDSql);
            pstmt.setString(1, service);
            rs = pstmt.executeQuery();

            int servicesID = 0;

            if(rs.next()) {
                // Retrieve the services ID
                servicesID = rs.getInt("services_id");
            }

            if(servicesID != 0) {
                // Create the SQL statement for the target table
                String sql = "INSERT INTO builderimg (builder_id,services_id,image,image_description) values (?, ?, ?, ?)";

                // Prepare the statement
                stmt = conn.prepareStatement(sql);

                // Set the parameters
                stmt.setInt(1, userID);
                stmt.setInt(2, servicesID);

    
                if (inputStream != null) {
                    // Set the input stream as blob parameter
                    stmt.setBlob(3, inputStream); 
                } else {
                    // Set a default (empty) image if the input stream is null
                    stmt.setBlob(3, new ByteArrayInputStream(new byte[0]));
                }
                
                stmt.setString(4, description);


                // Execute the statement
                stmt.executeUpdate();

                // Close the connection and statement
                stmt.close();

                // Inform the user of the upload success
                System.out.println("File uploaded and data stored successfully!");

            } else {
                // Inform the user that the selected service name cannot be found in the services table
                System.out.println("Services ID not found for the selected service name!");
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

    private static int getUserID(HttpSession session) {
        // Retrieve the userID of the logged-in user from the session object
        int userID = 0;
        Object object = session.getAttribute("builder_id");
        if (object instanceof Integer) {
            userID = ((Integer) object).intValue();
        }
        return userID;
    }
}