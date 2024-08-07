<%@ page import="java.sql.*" %>

<%
    String email = request.getParameter("email");
    // validate the email format, if required
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");
        String sql = "SELECT * FROM usersignup WHERE email = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, email);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            // email exists in database, proceed with password reset
            // set any required session or request attributes, if required
            RequestDispatcher rd = request.getRequestDispatcher("resetpassword.jsp");
            rd.forward(request, response);
        } else {
            // email does not exist in database, display error message
            response.sendRedirect("forgotpassword.jsp?message=error");
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>