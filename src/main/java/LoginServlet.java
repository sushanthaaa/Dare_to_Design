import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        LoginBean loginBean = new LoginBean();
        loginBean.setEmail(email);
        loginBean.setPassword(password);

        try {
            if (email.isEmpty() || password.isEmpty()) {
                request.setAttribute("errorMessage", "Please enter both email and password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (loginDao.validate(loginBean)) {
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                response.sendRedirect("mainpage.jsp");
            } else {
                PreparedStatement emailCheckStatement = null;
                Connection connection = null;
                try {
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design?useSSL=false", "root", "12345");
                    emailCheckStatement = connection.prepareStatement("select * from usersignup where email = ?");
                    emailCheckStatement.setString(1, email);
                    ResultSet emailCheckResult = emailCheckStatement.executeQuery();
                    if (emailCheckResult.next()) {
                        // the email exists but the password is incorrect
                        request.setAttribute("errorMessage", "The specified password is incorrect for the specified email");
                    } else {
                        // the email is not registered in the system
                        request.setAttribute("errorMessage", "The specified email is not registered");
                    }
                } catch (SQLException e) {
                    request.setAttribute("errorMessage", "Sorry, something went wrong on our end. Please try again later.");
                    e.printStackTrace();
                } finally {
                    try {
                        if (emailCheckStatement != null) {
                            emailCheckStatement.close();
                        }
                        if (connection != null) {
                            connection.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                HttpSession session = request.getSession();
                session.setAttribute("email", null);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}