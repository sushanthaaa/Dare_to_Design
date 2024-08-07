<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dare to Design | Sign Up</title>
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
      function validateFormu() {
    	  var fullName = document.getElementById("unm").value;
    	  var email = document.getElementById("uemail").value;
    	  var password = document.getElementById("upassword").value;
    	  var address = document.getElementById("uaddress").value;
    	  var phoneNumber = document.getElementById("uphonenumber").value;
    	  var languages = document.querySelectorAll('input[name="languages"]:checked');
    	  var terms = document.getElementById("uterms").checked;

    	  // Validate Full Name--------------
    	  if (!/^[a-zA-Z ]+$/.test(fullName)) {
           alert("Please enter a valid full name (No digits!)");
           return false;
           }
    	 
    	  
    	// Validate Email
    	  if (email == "") {
    	    alert("Please enter your email address");
    	    return false;
    	  } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    	    alert("Please enter a valid email address");
    	    return false;
    	  }
    	
    	
    	// Validate Password
    	
    	  if (!/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{6,}/.test(password)) {
    		    alert("Please enter a valid password with at least 6 characters, 1 uppercase letter, 1 special character and 1 number");
    		    return false;
    		  }


    	  // Validate Address
    	  if (address == "") {
		  alert("Please enter your address.");
		  return false;
		} else if (address.length > 100) {
		  alert("Address should be no more than 100 characters.");
		  return false;
		}
    	  
    	  // Validate Phone Number
    	   if (phoneNumber == "") {
            alert("Please enter your phone number");
           return false;
          } else if (!/^[0-9]{10}$/.test(phoneNumber)) {
           alert("Please enter a valid 10 digit phone number");
           return false;
           }

    	  // Validate Languages Known
    	  if (languages.length == 0) {
    	    alert("Please select at least one language known");
    	    return false;
    	  }

    	  // Validate Terms and Conditions
    	  if (!terms) {
    	    alert("Please accept the terms and conditions");
    	    return false;
    	  }

    	  return true;
    	}
/*--------------------------------------builder script------------------------*/
function validateFormbu() {
  var fullName = document.forms["conup"]["fullName"].value;
  var email = document.forms["conup"]["email"].value;
  var password = document.forms["conup"]["password"].value;
  var address = document.forms["conup"]["address"].value;
  var phone = document.forms["conup"]["phone"].value;
  var year = document.forms["conup"]["year"].value;
  var edu = document.querySelector('input[name="edu"]:checked');
  var languages = document.getElementsByName("language");
  var terms = document.forms["conup"]["terms"].checked;

  if (fullName == "") {
    alert("Please enter your full name.");
    return false;
  }

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

	if (address == "") {
		  alert("Please enter your address.");
		  return false;
		} else if (address.length > 100) {
		  alert("Address should be no more than 100 characters.");
		  return false;
		}
	
	
  if (phone == "") {
    alert("Please enter your phone number.");
    return false;
  } else if (!phone.match(/^\d{10}$/)) {
    alert("Please enter a valid 10-digit phone number.");
    return false;
  }

  if (year == "") {
	    alert("Please enter your years of experience.");
	    return false;
	  } else if (isNaN(year)) {
	    alert("Please enter a valid number for years of experience.");
	    return false;
	  }

  if (!edu) {
    alert("Please select your qualification.");
    return false;
  }

  var languageChecked = false;
  for (var i = 0; i < languages.length; i++) {
    if (languages[i].checked) {
      languageChecked = true;
      break;
    }
  }

  if (!languageChecked) {
    alert("Please select at least one language.");
    return false;
  }

  if (!terms) {
    alert("Please agree to the terms and conditions.");
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
                </ul>
                <ul class="nav__list">
                    <li class="nav__item"><a href="login.jsp" class="nav__link">Login</a></li>
                    <li class="nav__item">
                        <a id="active" href="#" class="nav__link">Sign up</a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
      <h1>Signup</h1>
    <div class="center">
        <div class="container1">
          <img src="images/user.jpeg" alt="Image 1" class="round-image" data-toggle="modal" data-target="#popup1" title="Click here for user signup">
          <div class="text">USER</div>
        </div>
        <div class="container1">
          <img src="images/Builder.jpeg" alt="Image 2" class="round-image" data-toggle="modal" data-target="#popup2" title="Click here for builder signup">
          <div class="text">BUILDER</div>
        </div>
      </div>
  
    
    <!------------------------------------------------ Popup 1 content--------------------------------- -->
    <div class="modal fade" id="popup1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">User Sign-Up</h5>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            <div class=" form-column">
                <form class="form" name="signupForm" onsubmit="return validateFormu()" action="usersignup" method="post">
                    <div class="sec-title">Sign Up</div>
                    <label>Full Name *</label>
                    <input type="text" name="fullName" id="unm" placeholder="Enter your full name" autocomplete="off"/>
        
                    <label>Email *</label>
                    <input type="email" name="email" id="uemail" placeholder="Enter your email" autocomplete="off"/>
        
                    <label>Password *</label>
                    <input type="password" name="passwords" id="upassword" placeholder="Enter your password" autocomplete="off"/>
        
                    <label>Address *</label>
                    <textarea name="address" id="uaddress" placeholder="Enter your address" rows="3" autocomplete="off"></textarea>
        
                    <label>Phone Number *</label>
                    <input type="tel" name="phonenumber" id="uphonenumber" placeholder="Enter your phone number" autocomplete="off"/>
                    <label>Languages Known *</label> <br> 
                    <div class="language">
                        <input type="checkbox" name="languages" id="ulag" value="English">English
                        <input type="checkbox" name="languages" id="ulag" value="Kannada"> Kannada
                        <input type="checkbox" name="languages" id="ulag" value="Hindi"> Hindi
                        <input type="checkbox" name="languages" id="ulag" value="Telugu"> Telugu
                        <input type="checkbox" name="languages" id="ulag" value="Tamil"> Tamil
                        
                 <br><br><input type="checkbox" name="terms" id="uterms" value=""> I agree to the terms and conditions. 
                  </div>          
              <input class="form-submit" type="submit" value="Sign Up" onsubmit="return validateFormu();">

                    <p> Already have an account <a href="login.jsp">Login </a> Here </p>
                </form>
        
            </div>
                  </div>
        </div>
      </div>

    </div>
    
    <!-- Popup 2 content -->
    <div class="modal fade" id="popup2">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Builder Sign-Up</h5>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            <div class="form-column">
                <form class="form" name="conup" onsubmit="return validateFormbu()" action="consignup" method="post">
                    <div class="sec-title">Builder Sign-Up</div>
                  <label>Full Name:</label>
                  <input type="text" name="fullName" id="bnm" placeholder="Enter your full name" autocomplete="off"/>
          
                  <label>Email:</label>
                  <input type="email"  name="email" id="bemail" placeholder="Enter your email" autocomplete="off"/>
          
                  <label>Password:</label>
                  <input type="password" name="password" id="bpassword" placeholder="Enter your password" autocomplete="off"/>
          
                  <label>Address:</label>
                  <textarea name="address" id="baddress"  placeholder="Enter your address" autocomplete="off"></textarea>
          
                  <label>Phone Number:</label>
              
                  <input type="text" id="phone" name="phone" id="bphone" placeholder="Enter your phone number" autocomplete="off"/>
                  
                  
                  <label>Extensive Experience:</label>
                  <input type="number" name="year" id="byear" placeholder="Year of Experience" autocomplete="off"/>
                  
                  <label>Qualification: </label>
                  <div class="qualifications">
                  <input type="radio" name="edu" id="bedu1" value=""> Diploma in Interior Design and Space Management<br>
                  <input type="radio" name="edu" id="bedu2" value=""> BSc Interior Design and Decoration<br>
                  <input type="radio" name="edu" id="bedu3" value=""> Associate Diploma in Architecture<br>
                  <input type="radio" name="edu" id="bedu4" value=""> PG Diploma in Furniture Design and Technology<br>
                  <input type="radio" name="edu" id="bedu5" value=""> M.Des in interior and Furniture Design<br><br>
                  </div>
                 
                  <label>Languages Known:</label>
                  <div class="language">
                  <input type="checkbox" name="language" id="blag1" value="English">English
                  <input type="checkbox" name="language" id="blag2" value="Kannada">Kannada
                  <input type="checkbox" name="language" id="blag3" value="Hindi">Hindi
                  <input type="checkbox" name="language" id="blag4" value="Telugu">Telugu
                  <input type="checkbox" name="language" id="blag5" value="Tamil">Tamil
                  
           
               <br><br><input type="checkbox" name="terms" id="bterm" value=""> I agree to the terms and conditions. 
                  </div>          
              <input class="form-submit" type="submit" value="Sign Up" onsubmit="return validateFormbu();">
                 
                  <p> Already have an account <a href="login.jsp">Login </a> Here </p>
                
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