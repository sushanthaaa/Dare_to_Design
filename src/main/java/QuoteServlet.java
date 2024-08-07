import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QuoteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String status = request.getParameter("status");

        // check if the user is requesting the approved quotes page
        if (status != null && status.equals("approved")) {
            request.getRequestDispatcher("approvedquotes.jsp?userId=" + userId).forward(request, response);
        } else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM quote WHERE userid=?");
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();

                request.setAttribute("quotes", rs);
                request.getRequestDispatcher("requestquote.jsp").forward(request, response);

                        rs.close();
                        ps.close();
                        conn.close();
                    } catch (Exception e) {
                        throw new ServletException("Error connecting to the database.", e);
                    }
                }
            }
}