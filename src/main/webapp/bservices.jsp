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
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dare to Design | Home</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/5119d0d9b6.js"></script>
    
<style>
	body {
			font-family: Arial, sans-serif;
			background-image: url('images/image-3.jpg');
		}

*{
 margin: 0px;
 padding: 0px;
}
 .main{
 padding-left: 10%;
 top-margin: 2%;
 }
#title{
   text-align: center;
   font-size: 20px;
   font-family: Times New Roman;
   font-weight: bold;
   text-shadow: 10px 10px 9px;
   color: black;
   font-size:36px;
   text-align:justify;
}
.main .title{
color:black;
text-shadow:none;
}

 /* Styling for card gallery */

 .card {
  width:25% ;
  height:18%;
  border: 1px solid black;
  margin: 2%;
  display: inline-block;
  text-align: center;
 box-shadow: 1px 2px 20px black;
 border-radius: 10px;
  background: white;
}
/*.card{
     width: 25%;
     border: 4px solid black;
     display: inline-block;
     
       box-shadow: 0px 2px 5px rgba(0,0,0,0.5);
     border-radius: 10px; 
     margin: 2%;
    }*/
/*.card:hover{
   transform: scale(1.15) ;
   transition: all 1s ease;
   box-shadow: 0 0 40px -10px rgba(0,0,0,0.25);
   background: white;
}*/

.card img {
  width: 100%;
  height: 180px;
  border-radius: 10px;
  object-fit: cover;
}

.card h3 {
  margin-top: 10px;
  font-weight: italic;
  font-size: 18px;
  
 
}

.card p {
  margin-top: 2px;
  font-size: 15px;
  font-weight: italic;
   text-align: justify;
}

/* Styling for view more button */

.view-more-button {
  display: block;
  margin: 10px auto;
  padding: 5px 10px;
  font-size: 15px;
  font-weight:italic;
  border: 2px solid #ccc;
  border-radius: 10px;
  background-color: #fff;
  cursor: pointer;
  box-shadow: 0px 2px 5px rgba(0,0,0,0.3);
}

.view-more-button:hover {
  background-color: #ccc;
  color: #fff;
}

/* Styling for popup box */

.popup-box {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.8);
  z-index: 9999;
}

.popup-content {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #fff;
  width: 60%;
  height:60%;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0px 2px 5px rgba(0,0,0,0.3);
}

.popup-content p {
  font-size: 20px;
  font-weight: bold;
}

.close {
  position: absolute;
  top: 20px;
  right: 20px;
  font-size: 30px;
  font-weight: bold;
  color: #ccc;
  cursor: pointer;
}

.scrollBtn {
  position: fixed;
  bottom: 20px;
  right: 20px;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background-color: #222;
  color: #fff;
  font-size: 20px;
  border: none;
  outline: none;
  cursor: pointer;
  opacity: 0.5;
  transition: opacity 0.3s ease-in-out;
}

.scrollBtn:hover {
  opacity: 1;
}

/*----------------------------------------resolution--------------------------------------------------*/
@media screen and (max-width:1204px){
   .main .card{
      width:33%
   }

}
@media screen and (max-width:768px){
   .main .card{
      width:50%
   }
   .title{
      font-size: 30px;
      height: 60px;
      text-align: center;
   }   
   
}

@media screen and (max-width:568px){
   .main .card{
      width:100%
   }
   .title{
      font-size: 30px;
      height: 60px;
      text-align: center;
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
                    <li class="nav__item"><a href="home.jsp" class="nav__link">Home</a></li>
                    <li class="nav__item"><a href="bservices.jsp" class="nav__link">Services</a></li>
                    <li class="nav__item"><a href="buildupload.jsp" class="nav__link">Upload</a></li> 
                </ul>
                <ul class="nav__list">
                    <li class="nav__item">
                        <a href="blogout.jsp" class="nav__link">Logout</a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
    
	<div id="title">
	<center><i><h4>Our Services</h4></i></center>
	</div>
	
	<button id="scrollToTopBtn" class="scrollBtn">
  <i class="fa fa-arrow-up"></i>
</button>

<button id="scrollToBottomBtn" class="scrollBtn">
  <i class="fa fa-arrow-down"></i>
</button>
	  

  <div class="main">

 <!-------------------------------------------------cards1 ---------------------------------------------------------------------->

<div class="card">
   <img src="images\texture painting.jpg" alt="card Image 1">
 <h3>Texture Painting</h3>
<p>Textured finishes that redefine luxury & rough patterned effect.Interiorr offers an array of special effects for the interior walls of your interiors.</p>
<button  class="view-more-button" >View More...</button>
  <div class="popup-box">
        <div class="popup-content">
          <span class="close">&times;</span>
          <p>This is the popup content for Card 1!</p>
        </div>
      </div>
</div>

<!----------------------cards2 ---------------------------------------------------------------------------------------->

<div class="card">
   <img src="images\wooden flooring.jpg" alt="card Image 1">
 <h3>Wooden Flooring</h3>
<p>Interior as largest collections of wooden floors from across the world, and installation by trained and certified specialists.</p>
<button  class="view-more-button" >View More...</button>
  <div class="popup-box">
        <div class="popup-content">
          <span class="close">&times;</span>
          <p>This is the popup content for Card 2!</p>
        </div>
      </div>
</div>

<!--cards3 -->
<div class="card">
    <img src="images\Interior Curtains.jpg" alt="card Image 1">
  <h3>Interior Curtains</h3>
 <p>Curtains are form of window decor & much like works of art—make a home look finished; they truly are a decoration in and of themselves.</p>
 <button  class="view-more-button" >View More...</button>
   <div class="popup-box">
         <div class="popup-content">
           <span class="close">&times;</span>
           <p>This is the popup content for Card 3!</p>
         </div>
       </div>
 </div>

<!--cards4 -->
<div class="card">
    <img src="images\Furniture Work.jpg" alt="card Image 1">
  <h3>Furniture Work</h3>
 <p>At Interior, Furniture are designed for industrial, commercial and  innovation, aesthetic appeal and functionality are taken care.</p>
 <button  class="view-more-button" >View More...</button>
   <div class="popup-box">
         <div class="popup-content">
           <span class="close">&times;</span>
           <p>This is the popup content for Card 4!</p>
         </div>
       </div>
 </div>


<!--cards5-->
<div class="card">
    <img src="images\lighting.jpg" alt="card Image 1">
  <h3>Lighting Works</h3>
 <p>We plan lighting and electrical systems which aims for lighting companies, architecture or interior design firms and service clients.</p>
 <button  class="view-more-button" >View More...</button>
   <div class="popup-box">
         <div class="popup-content">
           <span class="close">&times;</span>
           <p>This is the popup content for Card 5!</p>
         </div>
       </div>
 </div>


<!--cards6 -->
<div class="card">
    <img src="images\wall design work.jpg" alt="card Image 1">
  <h3>Wall-designing Works</h3>
 <p>Interior chooses your favorite colors, patterns and designs that match your personality and that positively affect your mood.</p>
 <button  class="view-more-button" >View More...</button>
   <div class="popup-box">
         <div class="popup-content">
           <span class="close">&times;</span>
           <p>This is the popup content for Card 5!</p>
         </div>
       </div>
 </div>


</div>
 
 <script>
 // Get all the view-more-button elements
 const viewMoreButtons = document.querySelectorAll(".view-more-button");

 // Loop through each button and add a click event listener
 viewMoreButtons.forEach((button) => {
   button.addEventListener("click", () => {
     // Get the popup-box element that is a sibling of the clicked button
     const popupBox = button.nextElementSibling;

     // Display the popup box
     popupBox.style.display = "block";

     // Get the close button element inside the popup-box
     const closeButton = popupBox.querySelector(".close");

     // Add a click event listener to the close button to hide the popup box
     closeButton.addEventListener("click", () => {
       popupBox.style.display = "none";
     });
   });
 });
 
//Get the buttons
 var scrollToTopBtn = document.getElementById("scrollToTopBtn");
 var scrollToBottomBtn = document.getElementById("scrollToBottomBtn");

 // Add click event listeners
 scrollToTopBtn.addEventListener("click", function() {
   document.documentElement.scrollTop = 0;
 });

 scrollToBottomBtn.addEventListener("click", function() {
   document.documentElement.scrollTop = document.documentElement.scrollHeight;
 });

 // Show/hide buttons based on scroll position
 window.addEventListener("scroll", function() {
   if (document.documentElement.scrollTop > 100) {
     scrollToTopBtn.style.display = "block";
   } else {
     scrollToTopBtn.style.display = "none";
   }
   
   if (document.documentElement.scrollTop < (document.documentElement.scrollHeight - window.innerHeight - 100)) {
     scrollToBottomBtn.style.display = "block";
   } else {
     scrollToBottomBtn.style.display = "none";
   }
 });

    </script>
    </body>
    </html>
    