<%@ page import="java.sql.*, java.io.*, javax.imageio.*, java.awt.image.BufferedImage, java.util.Base64" %>
<html>
<head>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
  <style>
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
    /* Table styling */
    table {
       border-collapse: collapse;
            width: 100%;
            max-width: 1000px;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid #ccc;
    }
    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ccc;
      vertical-align: middle;
    }
    th {
      background-color: darkorange;
            font-weight: bold;
            color: #333;
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
    
    /* Style the button */
  #myBtn {
  display: none; 
  position: fixed; 
  bottom: 10px; 
  right: 2px;
  z-index: 99; 
  border: 10px; 
  outline: none; 
  background-color: #555; 
  color: white; 
  cursor: pointer; 
  padding: 5px; 
  border-radius: 20px; 
  transition: transform 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94); /* add a 0.5 second transition with a custom timing function */
}

#myBtn:hover {
  transform: translateY(-20px); /* add a significant upward movement on hover */
   background-color: #999;
}


  /* On hover, add a lighter background color */

  /* Add font awesome icon */
  .fa-arrow-up {
    font-size: 20px;
  }

  /* Show the button when the user scrolls down */
  @media only screen and (max-width: 600px) {
    #myBtn {
      bottom: 10px;
      right: 10px;
      padding: 10px;
    }

    .fa-arrow-up {
      font-size: 8px;
    }
  }
  
  .quote-link {
  position: fixed;
  bottom: 20px;
  right: 35px;
  padding: 10px;
  background-color: darkorange;
  color: white;
  text-decoration: none;
  font-weight: bold;
  border-radius: 5px;
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
  transition: all 5s cubic-bezier(0.25, 0.46, 0.45, 0.94); /* add a 5-second transition with a custom timing function */
}

.quote-link:hover {
  background-color: orange;
  box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.3);
  transform: translateY(-20px); /* add a significant upward movement on hover */
}.quote-link {
  position: fixed;
  bottom: 20px;
  right: 35px;
  padding: 10px;
  background-color: darkorange;
  color: white;
  text-decoration: none;
  font-weight: bold;
  border-radius: 5px;
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
  transition: all 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94); /* add a 0.5-second transition with a custom timing function */
}

.quote-link:hover {
  background-color: orange;
  box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.3);
  animation: blink 1s infinite; /* add a blink animation with a duration of 1 second and infinite repetitions */
}

@keyframes blink {
  50% {
    opacity: 0.5; /* make the element invisible at 50% of the animation */
  }
}

@keyframes blinks {
  0% {
    opacity: 1;
  }
  50% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}


  </style>
</head>
<body>
<div class="title">
   <a href="services.jsp" class="nav__link back-button">&#8617;</a>
  <span>Wall-Designing</span>
</div>
<marquee width="99%" height="20px" style="color: red;  border: none; background-color: transparent;" direction="right" scrollamount="9" behavior="scroll" onmouseover="this.stop()" onmouseout="this.start()">
 **Looks like you are interested in our builders' designs click on
  <span style="animation: blinks 1s infinite;"><b>Request Quotation Button</b></span>
    below to proceed ahead.**
</marquee>
<%
// Get the services_id parameter

int services_id = 1006;

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
out.println("<tr><th>Builder Id</th><th>Builder Name</th><th>Image</th><th>Image Description</th><th>Price</th></tr>");
while (rs.next()) {
	String builder_id = rs.getString("builder_id");
    String buildername = rs.getString("buildername");
    String imagedescription = rs.getString("image_description");
    double price = rs.getDouble("price");
    Blob blob = rs.getBlob("image");
    byte[] imageBytes = blob.getBytes(1, (int) blob.length());
    String base64Image = Base64.getEncoder().encodeToString(imageBytes);
    out.println("<tr>");
    out.println("<td>" + builder_id + "</td>");
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
<div>
  <a href="quotation.jsp" class="quote-link">Request Quotation</a>
</div>
</body>
<button onclick="topFunction()" id="myBtn" title="Go to top">
  <i class="fas fa-arrow-up"></i>
</button>
<script>
// Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {
  scrollFunction()
};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}
</script>
</html>