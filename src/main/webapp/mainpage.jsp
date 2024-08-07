<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%
    HttpSession mysession = request.getSession();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dare to Design | Home</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<style>

#services {
  margin-top: 50px;
  padding: 50px;
  background-color: #f2f2f2;
}

#services h2 {
  text-align: center;
  font-size: 2em;
  margin-bottom: 50px;
}

#services .service {
  width: calc(33.3% - 20px);
  margin-left: 150px;
 
  text-align: center;
  display: inline-block;
  vertical-align: top;
}

#services img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

#services h3 {
  margin-top: 20px;
  margin-bottom: 10px;
  font-size: 1.5em;
}


.in-detail-button {
  display: block;
  margin: 50px auto;
  padding: 10px 20px;
  font-size: 1.2em;
  text-align: center;
  background-color: #333;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.in-detail-button:hover {
  background-color: #555;
}

      #scroll-to-top-btn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 20px;
  z-index: 100;
  font-size: 15px;
  border: none;
  outline: none;
  background-color: #555;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 80%;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
}

#scroll-to-top-btn:hover {
  background-color: lightgrey;
} 

.error-message {
  color: red;
  font-size: 0.8rem;
  margin-top: 5px;
}

</style>
</head>
<body>

    <!-- ------------------------------- navbar -------------------------------- -->
    <header>
        <div class="container2 row1">
            <a href="mainpage.jsp"><img class="logo" src="images/logo.png" alt="logo"></a>
            <nav class="nav">
                <ul class="nav__list nav__list--primary">
                    <li class="nav__item"><a id="active" href="#" class="nav__link">Home</a></li>
                    <li class="nav__item"><a href="services.jsp" class="nav__link">Services</a></li>
                    <li class="nav__item"><a href="quotation.jsp" class="nav__link">Quotation</a></li>
                    <li class="nav__item"><a href="#contact" class="nav__link">Contact</a></li>
                </ul>  
                <ul class='nav__list'>
                						<%@ include file="header.jsp" %>
                </ul> 
            </nav>
        </div>
    </header>


    <!-- ------------------------------- Banner -------------------------------- -->

    <section>
        <div class="banner">
            <img src="images/landing-page.jpg" class="landing-page" alt="landing-page" />
        </div>

        <div class="banner">
            <h1>Interior</h1>

            
            <h2>We help you achieve your interior goals</h2>
        </div>
    </section>
    
    <!-- ----------------------------- Services ------------------------------ -->
<section id="services">
  <div>
    <h2>Our Services</h2>
    <div class="service">
      <img src="images\texture painting.jpg" alt="service1" />
      <h3>Texture Painting</h3>
    </div>
    <div class="service">
      <img src="images\wooden flooring.jpg" alt="service2" />
      <h3>Wooden Flooring</h3>
    </div>
    <div class="service">
      <img src="images\Interior Curtains.jpg" alt="service3" />
      <h3>Interior Curtains</h3>
    </div>
    <div class="service">
      <img src="images\Furniture Work.jpg" alt="service4" />
      <h3>Furniture Work</h3>
    </div>
    <div class="service">
      <img src="images\lighting.jpg" alt="service5" />
      <h3>Lighting Works</h3>
    </div>
    <div class="service">
      <img src="images\wall design work.jpg" alt="service6" />
      <h3>Wall-Design Works</h3>
    </div>
    <a href="services.jsp" class="in-detail-button">In Detail</a>
  </div>
</section>
    


    <!-- ----------------------------- Contact Us ------------------------------ -->
    <section style="height: 80vh; margin-top: 150px;" id="contact">

        <div class="form-column">
  <form class="form" name="contact-form" onsubmit="return validateForm()" action="ContactUs" method="post">
  <div class="sec-title">
    <h2> Contact Us</h2>
  </div>
  <label> Full Name:</label>
  <input type="text" name="fullName" value="" placeholder="Enter your Full name*" autocomplete="off" />
  <span id="fullNameError" class="error-message"></span><br>

  <label>Email ID:</label>
  <input type="email" name="email" value="" placeholder="Enter your email id*" autocomplete="off"/>
  <span id="emailError" class="error-message"></span><br>

  <label>Phone Number:</label>
  <input type="tel" id="phone" name="phone" placeholder="Enter your phone number*" autocomplete="off" >
  <span id="phoneError" class="error-message"></span><br>

  <label>Message:</label>
  <textarea name="message" placeholder="Enter your message*" autocomplete="off"></textarea>
  <span id="messageError" class="error-message"></span><br>

  <button type="submit" class="form-submit"> Send </button>
  </form>
  </div>
    </section>


 <button id="scroll-to-top-btn"><i class="fa fa-arrow-up"></i></button>
    

    <script>
    function validateForm() {
        var fullName = document.forms["contact-form"]["fullName"].value;
        var email = document.forms["contact-form"]["email"].value;
        var phone = document.forms["contact-form"]["phone"].value;
        var message = document.forms["contact-form"]["message"].value;
        var isValid = true;

        // Validate full name
        if (fullName.trim() == "") {
          document.getElementById("fullNameError").innerHTML = "Please enter your full name*";
          isValid = false;
        } else {
          document.getElementById("fullNameError").innerHTML = "";
        }

        // Validate email
        if (email.trim() == "") {
          document.getElementById("emailError").innerHTML = "Please enter your email address*";
          isValid = false;
        } else if (!isValidEmail(email)) {
          document.getElementById("emailError").innerHTML = "Please enter a valid email address([test@example.com]-formate*)*";
          isValid = false;
        } else {
          document.getElementById("emailError").innerHTML = "";
        }

        // Validate phone number
        if (phone.trim() == "") {
          document.getElementById("phoneError").innerHTML = "Please enter your phone number*";
          isValid = false;
        } else if (!isValidPhoneNumber(phone)) {
          document.getElementById("phoneError").innerHTML = "Please enter a valid phone number (e.g. 1234567890)*";
          isValid = false;
        } else {
          document.getElementById("phoneError").innerHTML = "";
        }

        // Validate message
        if (message.trim() == "") {
          document.getElementById("messageError").innerHTML = "Please enter your message*";
          isValid = false;
        } else {
          document.getElementById("messageError").innerHTML = "";
        }

        return isValid;
      }

      function isValidEmail(email) {
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
      }

      function isValidPhoneNumber(phone) {
        var phoneRegex = /^[0-9]{10}$/;
        return phoneRegex.test(phone);
      }
  
        
     // Get the button
        var scrollToTopButton = document.getElementById("scroll-to-top-btn");

        // When the user scrolls down from the top of the document, show the button
        window.onscroll = function() {
          if (document.body.scrollTop > window.innerHeight || document.documentElement.scrollTop > window.innerHeight) {
            scrollToTopButton.style.display = "block";
          } else {
            scrollToTopButton.style.display = "none";
          }
        };

        // When the user clicks on the button, scroll to the top of the document
        scrollToTopButton.onclick = function() {
          document.body.scrollTop = 0;
          document.documentElement.scrollTop = 0;
        };
        
    </script>

</body>

</html>