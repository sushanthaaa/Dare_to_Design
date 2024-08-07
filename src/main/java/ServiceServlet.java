import java.io.IOException;
// import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServiceServlet")
public class ServiceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;



    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost:3306/dare_to_design";
        String USER = "root";
        String PASS = "12345";

        String SQL = "SELECT s.services_id, s.services, i.image FROM services s INNER JOIN builderimg i ON s.services_id = i.services_id";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName(JDBC_DRIVER);

            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            stmt = conn.prepareStatement(SQL);

            rs = stmt.executeQuery();

            StringBuilder popupBoxes = new StringBuilder();

            while (rs.next()) {
            	
                int serviceId = rs.getInt("services_id");
                String serviceName = rs.getString("services");
                System.out.println("service id"+serviceId);
                System.out.println("service name"+serviceName);
                Blob imageBlob = rs.getBlob("image");

                String base64Image = Base64.getEncoder().encodeToString(imageBlob.getBytes(1, (int) imageBlob.length()));


                popupBoxes.append("<p>" + serviceName + "</p>");
                popupBoxes.append("<img src=\"data:image/jpeg;base64," + base64Image + "\">");


                request.setAttribute("popupBoxes" + serviceId, popupBoxes.toString());
                popupBoxes.setLength(0);
            }

           // request.getRequestDispatcher("services.jsp").forward(request, response);

        } catch (SQLException se) {
            se.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        // Forward the request to the JSP file
        RequestDispatcher dispatcher = request.getRequestDispatcher("services.jsp");
        dispatcher.forward(request, response);
    }
}