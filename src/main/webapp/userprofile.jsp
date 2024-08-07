<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
  response.setHeader("Pragma", "no-cache"); 
  response.setHeader("Expires", "0");
 
  Object email = session.getAttribute("email"); 
  if (email == null) { 
    response.sendRedirect("mainpage.jsp"); 
  } 
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dare to Design | Home</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/5119d0d9b6.js" ></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.min.css"  />
    <style>
     .card {
  border: 1px solid #ccc;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  margin: 20px auto;
  max-width: 600px;
  overflow: hidden;
}

.card-header {
  background-color: #f8f8f8;
  border-bottom: 1px solid #ccc;
  padding: 10px 20px;
}

.card-header h2 {
  margin: 0;
}

.card-body {
  padding: 20px;
}

.card-body ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.card-body ul li {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
}

.card-body ul li span:first-child {
  font-weight: bold;
  min-width: 100px;
}

#user-languages {
  margin: 0;
  padding: 0;
}

#user-languages li {
  display: inline-block;
  margin-right: 10px;
}
#image{
  border-radius: 15%;
}
a{
text-decoration: none;
}


    </style>
</head>
<body>
<%
// Retrieve the message from the query parameter
String message = request.getParameter("message");
if (message != null) {
%>
<script>
   alert("<%= message %>");
</script>
<%
}
%>
    <!--------------------------------- navbar -------------------------------- -->
    <header>
        <div class="container2 row1">
            <a href="mainpage.jsp"><img class="logo" src="images/logo.png" alt="logo"></a>
            <nav class="nav">
                <ul class="nav__list nav__list--primary">
                    <li class="nav__item"><a href="mainpage.jsp" class="nav__link">Home</a></li>
                    <li class="nav__item"><a href="services.jsp" class="nav__link">Services</a></li>
                    <li class="nav__item"><a href="quotation.jsp" class="nav__link">Quotation</a></li>
                    <li class="nav__item"><a href="mainpage.jsp#contact" class="nav__link">Contact</a></li>
               
                <%@ include file="header.jsp" %>
                </ul>
            </nav>
        </div>
    </header>
    <!-- --------------------------------------main content ------------------------------ -->
<div class="container">
  <div class="card shadow-lg">
    <div class="card-header bg-light">
      <h2 class="text-center text-primary">User Profile</h2>
    </div>
    <div class="card-body">
      <img id="image" src="images/user.jpeg" alt="user profile image">
      <ul>
        <li>
          <span>UserID:</span>
          <span id="userId">${userId}</span>
        </li>
        <li>
          <span>Name:</span>
          <span id="username">${username}</span>
        </li>
        <li>
          <span>Email:</span>
          <span id="userEmail">${userEmail}</span>
        </li>
        <li>
          <span>Password:</span>
          <span id="userpassword">${userPassword}</span>
        </li>
        <li>
          <span>Address:</span>
          <span id="userAddress">${userAddress}</span>
        </li>
        <li>
          <span>Phone:</span>
          <span id="userPhone">${userPhone}</span>
        </li>

      </ul>

    
  </div>
       <a href="approvedquotes.jsp" class="form-submit">Approved Quotations</a>
      <a href="logout.jsp" class="form-submit">Logout</a>
</div>
</div>
 
</body>
</html>
