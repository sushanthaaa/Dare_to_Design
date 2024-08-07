<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
  response.setHeader("Pragma", "no-cache"); 
  response.setHeader("Expires", "0");
 
  Object email = session.getAttribute("email"); 
  if (email == null) { 
    response.sendRedirect("login1.jsp"); 
  } 
%> 
 
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dare to Design | Quotation</title>
    <link rel="stylesheet" href="style.css">
<script>
function validateFormj() {
  var userid = document.forms["myForm"]["userid"].value;
  var name = document.forms["myForm"]["name"].value;
  var email = document.forms["myForm"]["email"].value;
  var phone_number = document.forms["myForm"]["phone_number"].value;
  var builder_id = document.forms["myForm"]["builder_id"].value;
  var service = document.forms["myForm"]["service"].value;
  var work = document.forms["myForm"]["work"].value;
  var room = document.forms["myForm"]["room"].value;
  var purpose = document.forms["myForm"]["purpose"].value;
  var sqrtfeet = document.forms["myForm"]["sqrtfeet"].value;
  var message = document.forms["myForm"]["message"].value;
  
  if (userid == "") {
    alert("User ID is required.");
    return false;
  }
  if (name == "") {
    alert("Full Name is required.");
    return false;
  }
  if (email == "") {
    alert("Email is required.");
    return false;
  }
  if (phone_number == "") {
    alert("Phone Number is required.");
    return false;
  }
  if (builder_id == "") {
    alert("Builder ID is required.");
    return false;
  }
  if (service == "") {
    alert("Please select a service.");
    return false;
  }
  if (work == "") {
    alert("Please select a work.");
    return false;
  }
  if (room == "") {
    alert("Please select the number of rooms.");
    return false;
  }
  if (purpose == "") {
    alert("Please select a purpose.");
    return false;
  }
  if (sqrtfeet == "") {
    alert("Sqrt Feet is required.");
    return false;
  }
  if (sqrtfeet < 150) {
    alert("Sqrt Feet should be minimum 150.");
    return false;
  }
  if (message == "") {
    alert("Message is required.");
    return false;
  }else if (message.length > 100) {
		  alert("Address should be no more than 100 characters.");
		  return false;
	}
  
  if (message.length > 100) {
    alert("Message should be maximum 100 characters.");
    return false;
  }
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
                    <li class="nav__item"><a href="mainpage.jsp" class="nav__link">Home</a></li>
                    <li class="nav__item"><a href="services.jsp" class="nav__link">Services</a></li>
                    <li class="nav__item"><a id="active" href="#" class="nav__link">Quotation</a></li>
                    <li class="nav__item"><a href="mainpage.jsp#contact" class="nav__link">Contact</a></li>
                </ul>
                <ul class="nav__list">
						<%@ include file="header.jsp" %>
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
  String qemail = (String) session.getAttribute("email"); // Change "user_id" to the name of your session variable that stores the user ID
  
  String userid = null;
  String fullname = null;
  String phone= null;

  try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dare_to_design", "root", "12345"); // Replace with your database details
    Statement stmt = conn.createStatement();
    String query = "SELECT userid, fullname, phonenumber FROM usersignup WHERE email='" + email + "'";
    ResultSet rs = stmt.executeQuery(query);

    while (rs.next()) {
      userid = rs.getString("userid");
      fullname = rs.getString("fullname");
      phone = rs.getString("phonenumber");
    }

    conn.close();
  } catch(Exception e) {
    e.printStackTrace();
  }
%>

    <!-- ------------------------------ Quotation ------------------------------ -->

    <div class="wrapper">
        <article class="main">
            <h1>Quotation</h1>
<!-- Use Java to fill the input fields with the user details -->
<form name="myForm" class="form" action="quote" method="post" onsubmit="return validateFormj()">
  <h2 class="sec-title"></h2>
  <input type="text" name="userid" value="<%= userid %>" readonly autocomplete="off" >
  <input type="text" name="name" value="<%= fullname %>" readonly  autocomplete="off" >
  <input type="email" name="email" value="<%= email %>" readonly autocomplete="off"/>
  <input type="text" name="phone_number" value="<%= phone %>" readonly placeholder="Phone Number*" autocomplete="off"/>
  <input type="text" name="builder_id" value="" placeholder="Enter BuilderID you love to contact(check services for their ID) *" autocomplete="off"/>               
  <select name="service">
    <option value="" >-- Select an service --</option>
    <option value="Texture Painting">Texture Painting</option>
    <option value="Wooden Flooring">Wooden Flooring</option>
    <option value="Interior Curtains">Interior Curtains</option>
    <option value="Furniture Work">Furniture Work</option>
    <option value="Lighting Works">Lighting Works</option>
    <option value="Wall-designing Works">Wall-designing Works</option>
  </select>
  <select name="work">
    <option value="">-- Select an work --</option>
    <option>Full Interior</option>
    <option>Renovate</option>
    <option>Wooden Flooring</option>
    <option>Lighting Works</option>
  </select>
  <select name="room">
    <option value="">-- Select number of rooms --</option>
    <option>1BHK</option>
    <option>2BHK</option>
    <option>3BHK</option>
    <option>3BHK +</option>
  </select>
  <select name="purpose">
    <option value="">-- Select a purpose --</option>
    <option>Own use</option>
    <option>To Rent out</option>
    <option>To Sale</option>
  </select>
  <input type="number" name="sqrtfeet" value="" placeholder="Enter Sqrt Feet*" min="150" autocomplete="off"/>
  <textarea name="message" placeholder="Message *"></textarea>
  <input class="form-submit" type="submit" name="submit_qoute" onsubmit="return validateFormj()" value="Get Quotation">
</form>
        </article>
        </div>


      
</body>

</html>