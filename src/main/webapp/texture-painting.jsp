<%@ page import="java.sql.*, java.io.*, javax.imageio.*, java.awt.image.BufferedImage, java.util.Base64" %>
<html>
<head>
  <style>
    /* Table styling */
    table {
      border-collapse: collapse;
      width: 100%;
      margin-bottom: 20px;
    }
    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
      vertical-align: middle;
    }
    th {
      background-color: #f2f2f2;
    }
    img {
      max-width: 200px;
      max-height: 200px;
    }
    /* Header styling */
    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #333;
      color: white;
      padding: 10px;
    }
    .back-button {
      background-color: #4CAF50;
      border: none;
      color: white;
      padding: 8px 16px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin-right: 20px;
      cursor: pointer;
    }
    h1 {
      margin: 0;
      font-size: 24px;
      font-weight: normal;
    }
  </style>
</head>
<body>
<div class="header">
  <a href="services.jsp" class="back-button">&#8592; Back</a>
  <h1>Texture Painting</h1>
  <div></div>
</div>
<%
// Get the services_id parameter

int services_id = 1001;

// Create a connection to the database
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/dare_to_design";
String username = "root";
String password = "12345";
Connection conn = DriverManager.getConnection(url, username, password);

// Create a prepared statement for selecting data with a specific services_id
PreparedStatement ps = conn.prepareStatement("SELECT * FROM builderimg WHERE services_id = ?");
ps.setInt(1, services_id);
ResultSet rs = ps.executeQuery();

// Create a table to display the data
out.println("<table>");
out.println("<tr><th>Builder Name</th><th>Image</th><th>Image Description</th><th>Price</th></tr>");
while (rs.next()) {
    String buildername = rs.getString("buildername");
    String imagedescription = rs.getString("image_description");
    double price = rs.getDouble("price");
    Blob blob = rs.getBlob("image");
    byte[] imageBytes = blob.getBytes(1, (int) blob.length());
    String base64Image = Base64.getEncoder().encodeToString(imageBytes);
    out.println("<tr>");
    out.println("<td>" + buildername + "</td>");
    out.println("<td><img src='data:image/jpg;base64," + base64Image + "'/></td>");
    out.println("<td>" + imagedescription + "</td>");
    out.println("<td>" + price + "</td>");
    out.println("</tr>");
}
out.println("</table>");

// Close the database connection
rs.close();
ps.close();
conn.close();
%>
</body>
</html>