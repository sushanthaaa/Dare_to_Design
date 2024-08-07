<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rejected Quotes</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 1000px;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: darkorange;
            font-weight: bold;
            color: #333;
        }

        .title{
            font-size: 40px;
            height: 60px;
            text-align: center;
        }  
   
        .nav__link {
            color: darkorange;
            text-decoration: none;
            text-transform: uppercase;
            margin-right: 20px;
        }

        .nav__link:hover {
            opacity: 0.50;
        }

        .back-button {
            float: left;
            margin-left: 5px;
            margin-top: 5px;
        }
        
    </style>
</head>
<body>
    <div class="title">
        <a href="approvedquotes.jsp" class="nav__link back-button">&#8617;</a>
        <span>Rejected Quotes</span>
    </div>
    <table>
        <tr>
            <th>Builder Name</th>
            <th>Services</th>
            <th>Works</th>
            <th>Room</th>
            <th>Purpose</th>
            <th>Square feet</th>
        </tr>

        <% 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");

           
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM rejected ORDER BY userid DESC");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String name = rs.getString("buildername");
                String services = rs.getString("services");
                String works = rs.getString("works");
                String room = rs.getString("room");
                String purpose = rs.getString("purpose");
                int squareFeet = rs.getInt("sqrtfeet");

                %>
                <tr>
                    <td><%= name %></td>
                    <td><%= services %></td>
                    <td><%= works %></td>
                    <td><%= room %></td>
                    <td><%= purpose %></td>
                    <td><%= squareFeet %></td>
                </tr>
                <%
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException  e) {
            e.printStackTrace();
        }
        %>
    </table>
</body>
</html>