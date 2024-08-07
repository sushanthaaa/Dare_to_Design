<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
  response.setHeader("Pragma", "no-cache"); 
  response.setHeader("Expires", "0");
 
  Object email = session.getAttribute("email"); 
  if (email == null) { 
    response.sendRedirect("login.jsp"); 
  } 
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dare to Design | Upload</title>
    <link rel="stylesheet" href="style.css">
    
    <style>
    h1 {
	text-align: center;
}

form {
	margin: 0 auto;
	font-size: 20px;
	font-weight:bold;
	max-width: 500px;
	background-color: rgb(174, 177, 181);
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
}

label {
	display: block;
	margin-bottom: 10px;
}

textarea {
	width: 100%;
	height: 60px;
	border-radius: 10px;
}

#builder_id{
width: 100%;
	height: 40px;
	border-radius: 10px;
}
#buildername{
width: 100%;
	height: 40px;
	border-radius: 10px;
}
#price{
    width: 100%;
	height: 40px;
	border-radius: 10px;
}
input[type="submit"] {
	background-color: #4CAF50;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}

#service{
    width: 100%;
	height: 40px;
	border-radius: 10px;
}

input[type="submit"]:hover {
	background-color: #3e8e41;
}
 input[type="file"]{
   border-radius: 5px;
 }
.error {
	color: red;
	font-size: 0.8em;
	display: block;
	margin-top: 5px;
}

.error-message {
    font-size: 16px; /* change the font size to your desired size */
    font-weight: normal; /* remove bold */
  }
    </style>
   
    <script>
    
    function validateForm() {
      // Get the input fields and error spans
      var service = document.getElementById("service");
      var serviceError = document.getElementById("serviceError");
      var image = document.getElementById("image");
      var imageError = document.getElementById("imageError");
      var builderId = document.getElementById("builder_id");
      var builderIdError = document.getElementById("builderIdError");
      var builderName = document.getElementById("buildername");
      var builderNameError = document.getElementById("builderNameError");
      var description = document.getElementById("description");
      var descriptionError = document.getElementById("descriptionError");
      var price = document.getElementById("price");
      var priceError = document.getElementById("priceError");

      // Reset all error messages
      serviceError.innerHTML = "";
      imageError.innerHTML = "";
      builderIdError.innerHTML = "";
      builderNameError.innerHTML = "";
      descriptionError.innerHTML = "";
      priceError.innerHTML = "";

      // Check if each field is valid
      var valid = true;
      if (service.value == "") {
        serviceError.innerHTML = "Please select a service*";
        serviceError.style.color = "red";
        valid = false;
      }
      if (image.value == "") {
        imageError.innerHTML = "Please select an image*";
        imageError.style.color = "red";
        valid = false;
      }
      if (builderId.value == "" || isNaN(builderId.value)) {
        builderIdError.innerHTML = "Please enter a valid builder ID*";
        builderIdError.style.color = "red";
        valid = false;
      }
      if (builderName.value == "") {
        builderNameError.innerHTML = "Please enter a builder name*";
        builderNameError.style.color = "red";
        valid = false;
      }
      if (description.value == "") {
        descriptionError.innerHTML = "Please enter a description*";
        descriptionError.style.color = "red";
        valid = false;
      }
      if (price.value == "" || price.value < 1000.00 || price.value > 1000000.00) {
        priceError.innerHTML = "Please enter a price between 1000.00 and 1000000.00*";
        priceError.style.color = "red";
        valid = false;
      }

      // Return true if all fields are valid, false otherwise
      return valid;
    }
  
    </script>
</head>

<body>

    <!-- ------------------------------- navbar -------------------------------- -->
     <header>
        <div class="container2 row1">
            <a href="mainpage.jsp"><img class="logo" src="images/logo.png" alt="logo"></a>
            <nav class="nav">
                <ul class="nav__list nav__list--primary">
                    <li class="nav__item"><a href="home.jsp" class="nav__link">Home</a></li>
                    <li class="nav__item"><a href="bservices.jsp" class="nav__link">Services</a></li>
                    <li class="nav__item"><a href="#" id="active" class="nav__link">Upload</a></li> 
                    <li class="nav__item"><a href="requestquote.jsp" class="nav__link">Quotation Request</a></li> 
                    
                </ul>
                <ul class="nav__list">
                    <li class="nav__item">
                     <%@ page import="java.sql.*, javax.servlet.*" %>
                      <% if (session.getAttribute("email") != null) {
        // Retrieve the builder ID from the database based on the email address
        String builderEmail = (String) session.getAttribute("email");
        int builderId = -1;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345");
            PreparedStatement ps = conn.prepareStatement("SELECT builder_id FROM consignup WHERE email=?");
            ps.setString(1, builderEmail);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                builderId = rs.getInt("builder_id");
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            throw new ServletException("Error connecting to the database.", e);
        }

        if (builderId == -1) {
            throw new ServletException("User ID not found for email address: " + builderEmail);
        }
                      
  %>
                      
                      <a href="BuilderProfileServlet?id=<%=builderId%>" class="nav__link">Profile</a> 
                      <a href="logout.jsp" class="nav__link">Logout</a> 
                          <% } %>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
    <!-- Create a Java session -->
<% 
  HttpSession mysession = request.getSession();
%>

<!-- Use Java to retrieve the user details from the database and assign them to variables -->
<% 
  String qemail = (String) session.getAttribute("email"); // Change "builder_id" to the name of your session variable that stores the user ID
  
  String builderId = null;
  String fullname = null;

  try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345"); // Replace with your database details
    Statement stmt = conn.createStatement();
    String query = "SELECT builder_id, fullname FROM consignup WHERE email='" + email + "'";
    ResultSet rs = stmt.executeQuery(query);

    while (rs.next()) {
      builderId = rs.getString("builder_id");
      fullname = rs.getString("fullname");
    }

    conn.close();
  } catch(Exception e) {
    e.printStackTrace();
  }
%>
    <!-------------------------------- Builder Upload --------------------------------->
	<h1>Design Upload</h1>
	<form name="myForm" onsubmit="return validateForm()" action="DesignUploaderServlet" method="post" enctype="multipart/form-data">
		<label for="service">Service:</label>
		<select id="service" name="service">
			<option value="" >-- Select an service --</option>
			<option value="Texture Painting">Texture Painting</option>
			<option value="Wooden Flooring">Wooden Flooring</option>
			<option value="Interior Curtains">Interior Curtains</option>
			<option value="Furniture Work">Furniture Work</option>
			<option value="Lighting Works">Lighting Works</option>
			<option value="Wall-designing Works">Wall-designing Works</option>
		</select>
	   <span id="serviceError" class="error-message"></span>
		<br>
		
		<label for="image">Image:</label>
		<input type="file" id="image" name="image"><br>
		<span id="imageError" class="error-message"></span>
		<br>
		
		<label for="builder_id">Builder Id:</label>
		<input type="number" id="builder_id" name="builder_id" value="<%= builderId %>" readonly>
		<span id="builderIdError" class="error-message"></span>
		<br>
		
		<label for="buildername">Builder Name:</label>
		<input type="text" id="buildername" name="buildername" value=" <%= fullname %> " readonly>
		<span id="builderNameError" class="error-message"></span>
		<br>
		
		<label for="description">Description:</label>
		<textarea id="description" name="description" autocomplete="off"></textarea>
		<span id="descriptionError" class="error-message"></span>
		<br>
		
		<label for="price">Price:</label>
		<input type="number" min="1000.00" max="1000000.00" step="1" id="price" name="price" autocomplete="off"/>
		<span id="priceError" class="error-message"></span>
		<br><br>
		
		<input type="submit" value="Upload" onsubmit="return validateForm();">
	</form>
</body>
</html>
