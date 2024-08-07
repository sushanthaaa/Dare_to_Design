import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QuoteApprovalServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");

            if (action.equals("approve")) {
                PreparedStatement ps = conn.prepareStatement("UPDATE quote SET approved=true WHERE id=?");
                ps.setInt(1, id);
                ps.executeUpdate();
                ps.close();
            } else if (action.equals("reject")) {
                String selectQuery = "SELECT * FROM quote WHERE id=?";
                String insertQuery = "INSERT INTO rejected (userid, fullname, email, phonenumber, services, works, room, purpose, sqrtfeet, message) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                String deleteQuery = "DELETE FROM quote WHERE id=?";

                try (Connection conn2 = getDatabaseConnection();
                    PreparedStatement selectPs = conn2.prepareStatement(selectQuery);
                    PreparedStatement insertPs = conn2.prepareStatement(insertQuery);
                    PreparedStatement deletePs = conn2.prepareStatement(deleteQuery)) {

                    conn2.setAutoCommit(false);

                    selectPs.setInt(1, id);
                    ResultSet rs = selectPs.executeQuery();
                    if (rs.next()) { // copy the quote to the rejected_quotes table
                        insertPs.setInt(1, rs.getInt("userid"));
                        insertPs.setString(2, rs.getString("fullname"));
                        insertPs.setString(3, rs.getString("email"));
                        insertPs.setString(4, rs.getString("phonenumber"));
                        insertPs.setString(5, rs.getString("services"));
                        insertPs.setString(6, rs.getString("works"));
                        insertPs.setString(7, rs.getString("room"));
                        insertPs.setString(8, rs.getString("purpose"));
                        insertPs.setInt(9, rs.getInt("sqrtfeet"));
                        insertPs.setString(10, rs.getString("message"));
                        insertPs.executeUpdate();
                    }
                    rs.close();
                    selectPs.close();

                    // then delete the quote from the quote table
                    deletePs.setInt(1, id);
                    int rowsAffected = deletePs.executeUpdate();

                    conn2.commit();

                    if (rowsAffected > 0) {
                        String message = "Quote has been rejected and moved to rejected quotes list.";
                        request.getSession().setAttribute("message", message);
                        response.sendRedirect(request.getContextPath() + "/requestquote.jsp");
                    } else {
                        String message = "Quote deletion failed.";
                        request.getSession().setAttribute("message", message);
                        response.sendRedirect(request.getContextPath() + "/requestquote.jsp");
                    }

                } catch (SQLException ex) {
                    ex.printStackTrace();

                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();

        }
    }

    private Connection getDatabaseConnection() throws SQLException {
        String jdbcUrl = "jdbc:mysql://localhost:3306/dare_to_design";
        String username = "root";
        String password = "12345";
        return DriverManager.getConnection(jdbcUrl, username, password);
    }
}