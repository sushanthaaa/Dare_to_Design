<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
  response.setHeader("Pragma", "no-cache"); 
  response.setHeader("Expires", "0");
 
  Object email = session.getAttribute("email"); 
  if (email == null) { 
    response.sendRedirect("login1.jsp"); 
  } 
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dare to Design | Home</title>
    <link rel="stylesheet" href="style.css">
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
                    <li class="nav__item"><a href="buildupload.jsp" class="nav__link">Upload</a></li> 
                    <li class="nav__item"><a href="requestquote.jsp" class="nav__link">Request Quotation</a></li>                     
                </ul>
                <ul class="nav__list">
                    <li class="nav__item">
                        <a href="blogout.jsp" class="nav__link">Logout</a>
                    </li>
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
            <%
    String msg=request.getParameter("msg");
    if("valid".equals(msg))
    {%>
    	<h2>Successfully Registered</h2>
    <% }%>
    <% 
    if("invalid".equals(msg))
    { %>
    	<h2>Unsuccessfully Registered</h2>
    	 <% }%>
            
            <h2>We help you achieve your interior goals</h2>
        </div>
    </section>


    <!-- ----------------------------- Contact Us ------------------------------ -->
    <section style="height: 80vh; margin-top: 150px;" id="contact">

        <div class="form-column">
            <form class="form" name="contact-form" onsubmit="return validateForm()" action="ContactUs" method="post">
                <div class="sec-title">
                    <h2> Contact Us</h2>
                </div>
                <label> Full Name</label>
                <input type="text" name="fullName" value="" placeholder="Enter your Full name" autocomplete="off" />


                <label>Email ID *</label>
                <input type="email" name="email" value="" placeholder="Enter your email id" autocomplete="off" />
 
                <label>Phone Number *</label>
                <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" pattern="[0-9]{3}[0-9]{3}[0-9]{4}">

                <label>Message*</label>
                <textarea name="message" placeholder="Enter your message"></textarea>

                <button type="submit" class="form-submit"> Send </button>
            </form>
        </div>
    </section>




    <script>
        function validateForm() {

            var fullname = document.forms["contact-form"]["fullName"].value;
            if (email == "") {
                alert("Enter your full name");
                document.forms["contact-form"]["fullName"].focus();
                return false;
            }

            var email = document.forms["contact-form"]["email"].value;
            if (email == "") {
                alert("Email must be filled out");
                document.forms["contact-form"]["email"].focus();
                return false;
            }
            
            var phoneField = document.getElementById("phone");
            var phonePattern = /^[0-9]{3}[0-9]{3}[0-9]{4}$/;
            if (!phonePattern.test(phoneField.value)) {
              alert("Please enter a valid phone number");
              return false;
            }
            
            var message = document.forms["contact-form"]["message"].value;
            if (message == "") {
                alert("Message field should not be empty");
                document.forms["contact-form"]["message"].focus();
                return false;
            }


        }

    </script>

</body>

</html>