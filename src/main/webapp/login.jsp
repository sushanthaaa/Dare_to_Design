<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dare to Design | Login</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <style>
    a.nav__link {
    color: darkorange;
    text-decoration: none;
    text-transform: uppercase;
    }
     a.nav__link:hover {
      opacity: 0.50;
     }
    
    #activelogin{
    background: darkorange;
    color: #fff;
    padding: 0.45em 2em;
    border-radius: 10rem;
}
        /* Center the images and text */
        .center {
          display: flex;
          justify-content: center;
          align-items: center;
          height: 60vh;
        }

        .container1 {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        
        /* Style the images */
        .round-image {
          width: 200px;
          height: 200px;
          border-radius: 50%;
          margin: 20px;
          cursor: pointer;
          box-shadow: 0 0 10px rgba(0,0,0,0.5);
          align-items: center;
          transition: transform 0.3s ease-in-out;
        }

        .round-image:hover{
            transform: scale(1.2);
            box-shadow: 0 0 20px rgba(0,0,0,0.8);
        }
        

        
        /* Style the text */
        .text {
          font-size: 24px;
          font-weight: bold;
          margin-bottom: 20px;
        }
        
        #click{
        margin-left: 2em;
    color: darkorange;
    font-weight: 700;
        }
        
   h1{
    text-align:center;
      font-size:50px;  
      font-style: italic;
      color:darkorange;
       font-family: Times New Roman;
   font-weight: bold;
   text-shadow: 10px 10px 9px;
   color: black;
    }
      </style>
          <script>
          
          /*-------------------------------------User script------------------------------------------------*/
  function validateFormus() {
  const email = document.getElementById("uemail").value;
  const password = document.getElementById("upassword").value;

  // Email validation
    if (email == "") {
       	  alert("Please enter your email.");
       	  return false;
       	} else {
       	  // Regular expression to check email format
       	  var emailRegex = /^\S+@\S+\.\S+$/;
       	  if (!emailRegex.test(email)) {
       	    alert("Please enter a valid email address.");
       	    return false;
       	  }
       	}

	  
  
  // Password validation
    if (password == "") {
       	    alert("Please enter your password.");
       	    return false;
       	}

       	// Regular expression pattern to validate password
       	var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/;

       	if (!password.match(passwordPattern)) {
       	    alert("Password should contain minimum 6 characters, at least one uppercase letter, one lowercase letter, one number, and one special character.");
       	    return false;
       	}

  return true;
}
      
          /*-------------------------------------Builder script------------------------------------------------*/
        
       function validateFormbd() {
  const email = document.getElementById("bemail").value;
  const password = document.getElementById("bpassword").value;

  // Email validation
    if (email == "") {
       	  alert("Please enter your email.");
       	  return false;
       	} else {
       	  // Regular expression to check email format
       	  var emailRegex = /^\S+@\S+\.\S+$/;
       	  if (!emailRegex.test(email)) {
       	    alert("Please enter a valid email address.");
       	    return false;
       	  }
       	}

	  
  
  // Password validation
    if (password == "") {
       	    alert("Please enter your password.");
       	    return false;
       	}

       	// Regular expression pattern to validate password
       	var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/;

       	if (!password.match(passwordPattern)) {
       	    alert("Password should contain minimum 6 characters, at least one uppercase letter, one lowercase letter, one number, and one special character.");
       	    return false;
       	}

  return true;
}
        
    </script>
      </head>
  <body>
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
    
    <% if(request.getAttribute("errorMessage") != null) { %>
    <script>
        alert("<%= request.getAttribute("errorMessage") %>");
    </script>
<% } %>
    
     <h1>Login</h1>
    <div class="center">
        <div class="container1">
          <img src="images/user.jpeg" alt="Image 1" class="round-image" data-toggle="modal" data-target="#popup1" title="Click here for user login">
          <div class="text">USER</div>
        </div>
        <div class="container1">
          <img src="images/Builder.jpeg" alt="Image 2" class="round-image" data-toggle="modal" data-target="#popup2" title="Click here for builder login">
          <div class="text">BUILDER</div>
        </div>
      </div>
          <div class="modal fade" id="popup1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">User Login</h5>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            <div class=" form-column">
            <form class="form" name="loginForm" action='<%=request.getContextPath()%>/login' method='post' onsubmit="return validateFormus()">
            <div class="sec-title">
                <h2> Login</h2>
            </div>
            <label>Email ID *</label>
            <input type="email" name="email" id="uemail" value="" placeholder="Enter your email id" autocomplete="off" />

            <label>Password *</label>
            <input type="password" name="password" id="upassword" value="" placeholder="Enter your password" autocomplete="off" />

            <button type="submit" class="form-submit"> Login</button>
            <p> Don't have an account <a href="signup.jsp">Sign Up </a> Here </p>
			<p> Forgot your password? <a href="forgotpassword.jsp">Click here</a> to reset it</p>
        </form>
                    </div>
                  </div>
        </div>
      </div>

    </div>
    
        <div class="modal fade" id="popup2">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Builder Login</h5>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            <div class="form-column">
                    <form class="form" name="loginForm2" action='blogin' method='post' onsubmit="return validateFormbd()">
            <div class="sec-title">
                <h2> Login</h2>
            </div>
            <label>Email ID *</label>
            <input type="email" name="bemail" id="bemail" value="" placeholder="Enter your email id" autocomplete="off" />

            <label>Password *</label>
            <input type="password" name="passwords" id="bpassword" value="" placeholder="Enter your password" autocomplete="off" />

            <button type="submit" class="form-submit"> Login</button>
            <p> Don't have an account <a href="signup.jsp">Sign Up </a> Here </p>
			<p> Forgot your password? <a href="forgotpassword.jsp">Click here</a> to reset it</p>
        </form>
                    </div>
            </div>
        </div>
      </div>
    </div>
    
    <!-- Add Bootstrap JS (requires jQuery) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.3/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
  </body>
</html>