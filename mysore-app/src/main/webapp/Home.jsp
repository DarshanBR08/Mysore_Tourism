<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mysore.dao.PlacesDAOImpl"%>
<%@page import="com.mysore.dao.PlacesDAO"%>
<%@page import="com.mysore.dto.Places"%>
<%@page import="com.mysore.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Tourism Management System</title>
    <style>
        /* Reset Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        /* Body Styling */
      body {
    background: linear-gradient(to right, #f5deb3, #ffffff);
    opacity: 0;
    animation: fadeIn 0.5s ease-in forwards;
}
@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}
/* Header Styling */
header {
width:100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    padding: 15px 20px;
    height:70px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    position:fixed;
    z-index:1;
transition: all 0.3s ease-in-out;
}

.scrolled {
    height: 50px;
    padding: 10px;
}
/* Left Navigation */
.nav-left a {
    text-decoration: none;
    color: #4a3625; /* Dark Brown for readability */
    font-size: 16px;
    margin: 0 15px;
    padding: 8px 12px;
    border-radius: 5px;
    transition: 0.3s;
    background: rgba(255, 255, 255, 0.7);
}

.nav-left a:hover {
    background: rgba(255, 255, 255, 0.9);
    color: #222;
}

/* Title in Center */
.title {
    font-size: 24px;
    font-weight: bold;
    color: #4a3625; /* Dark Brown */
}

/* Right Authentication Links */
.nav-right a {
    text-decoration: none;
    color: #4a3625; /* Dark Brown */
    font-size: 16px;
    margin: 0 10px;
    padding: 8px 12px;
    border-radius: 5px;
    transition: 0.3s;
    align-items: center;
    background: rgba(255, 255, 255, 0.7);
}

.nav-right a:hover {
    background: rgba(255, 255, 255, 0.9);
    color: #222;
}

        /*middle body part */
        .main-top{
			background-image: url("Images/palace.jpg");
			width:100%;
			height:500px;
			background-size: cover;
			background-position: center;
			position:relative;
		}

        .gapdiv{
	height:70px;
}
.main{
	display: flex;
	flex-direction: column;
	align-items: center;
}
.slogon{
	 position: absolute;
    top: 35%; 
    right: 5%; 
    transform: translateY(-50%); 
    color: #ffff; 
    font-size: 50px;
    font-weight: bold;
    padding: 10px 20px;
    text-align: right;
    max-width: 40%; 
     opacity: 0;
    transform: translateX(50px);
    animation: slideFadeIn 1.5s ease-in-out forwards 0.5s;
}


@keyframes slideFadeIn {
    from {
        opacity: 0;
        transform: translateX(50px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

.main-middle{
	display:flex;
	justify-content: space-between;
	padding:10px;
}
.features{
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	width:30%;
	padding:10px;
	display:flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
}
.features *{
	padding: 15px;
	font-size:larger ;   
}

.features img{
height: 250px;
width: 320px;
}

.categories{
	width:100%;
	margin-bottom:20px;
	padding:17px;
	display:flex;
	justify-content: space-between;	
	overflow-x: auto; 
    overflow-y: hidden;
	 background:#825a5a;
	 color:white;
}
/* .categories .categories-child{
display: inline-block;
    white-space: nowrap; 
    animation: scroll-left 20s linear infinite; 
}

@keyframes scroll-left {
    from {
        transform: translateX(100%);
    }
    to {
        transform: translateX(-100%);
    }
}
 */


.categories::-webkit-scrollbar{
display:none;
}

.categories-child{
    margin:0px 20px;
    width:230px;
	height:250px;
	display:flex;
	flex-direction: column;
	text-align: center;
    opacity: 0;
    transform: translateY(30px);
    transition: all 0.5s ease-in-out;
}

.categories-child.show {
    opacity: 1;
    transform: translateY(0);
}
.categories-child img{
margin:10px 0px;
height:200px;
width: 210px;
border-radius:3px;
 border: 2px solid #f5f1d3;
 transition: transform 0.3s ease-in-out;
}


.categories-child img:hover{
 transform: translateY(-5px);
transform: scale(1.1);
}

        
footer {
    background-color:  #b58f8f; 
    color: white; 
    padding: 20px;
    text-align: center;
}
a {
    text-decoration: none;
    color: inherit; /* Optional: Keeps default text color */
}

	
.foot-top{
	padding:20px;
	width:100%;
	display: flex;
	flex-direction: column;
}

.foot-main{
	width:100%;
	display:flex;
	justify-content: space-between;
}

.foot-main-child{
	padding:0px 20px;
	width:100%;
	display:flex;
	justify-content: space-between;
}

li{
	text-decoration: none;
     list-style: none;
     padding: 3px;
     color:white;
     text-decoration:none;
}

.foot-main-grandchild{
	text-align: center;
}

.foot-bottom{
	width:100%;
 display:flex;
 justify-content: space-around;
}
.foot{
	padding:10px;
}
.footer{
background-color:#ffece6;
}
.foot-bottom{
text-align: center;
            padding: 15px;
            background:#825a5a;
            backdrop-filter: blur(10px);
            color: white;
            position: fixed;
            width: 100%;
            bottom: 0px;
}
.about{
width:100%;
display:flex;
flex-direction:column;
align-items:center;
}
  .about-content{
  width:95%;
  display:flex;
  flex-direction:column;
  gap:15px;
  text-align:center;
    max-width: 1300px;
    margin: 10px auto;
    padding: 20px;
    line-height: 1.5;
    font-size: 16px;
    background: #825a5a;
    color:white;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  }     
    </style>
</head>
<body>
    <header>
        <div class="nav-left">
        <%User u=(User)session.getAttribute("loginsuccess") ;
		if(u!=null){%>
		<%if(u.getUserid()==1){%>
            <a href="Home.jsp">Home</a>
            <a href="createpackage.jsp">Create Package</a>
            <a href="#">Booking Details</a>
            <a href="placedetails.jsp">Places Details</a>
            <a href="userdetails.jsp">User Details</a>
            <% }else{%>
             <a href="Home.jsp">Home</a>
             <a href="placedetails.jsp">Places</a>
            <a href="packagedetails.jsp">Packages</a>
            <a href="#">Booking</a>
            <a href="#">About Us</a>
            <%}} %>
        </div>
       
        
        <div class="nav-right">
           <%if(session.getAttribute("loginsuccess")!=null){ %>
           <a href="profile.jsp"><img src="Images/user.png" width="40px"></a>
		<a href="logout">LOGOUT</a>
		<%} else { %>
			<a href="login.jsp">LOGIN</a>
		<a href="signup.jsp">SIGNUP</a>
			<%} %>
        </div>
    </header>
<div class="main">
	<div class="gapdiv">
	</div>
	<div class=" main-child main-top">
		<!--image at home page-->
		<h1 class="slogon">Discover the Royal Heritage, Experience the Cultural Splendor!</h1>
	</div>
    
    <div class="main-child categories">
   
    	<%PlacesDAO pdao=new PlacesDAOImpl();
    	ArrayList<Places> plist=pdao.getPlaces();
    	for(Places p:plist){%>
    	<div class="categories-child">
    	 <form action="viewplace" method="post" id="autosubmitForm" >	
    		<a href="#" onclick="this.parentNode.submit(); return false;"><img src="Images/<%=p.getPlaceimage() %>" alt="<%=p.getPlacename()%>">
    		<input type="hidden" value="<%=p.getPlaceid() %>" name="placeid" >
    		<p><%=p.getPlacename() %></p></a>
    		</form>
    	</div>
    		<%} %>
    		
    </div>
	<div class="gapdiv">
	</div>
    <div class="main-child about">
<center><div  class="about-us"><h2>About Us</h2></div></center>
<div class="about-content">
<p>Welcome to the Mysore Tourism App, your ultimate travel companion for exploring the rich heritage, vibrant culture, and breathtaking landscapes of Mysore. Known as the "City of Palaces", Mysore is a perfect blend of royal history, spirituality, and modern charm. Whether you're visiting for the first time or rediscovering its beauty, our app provides everything you need to make your journey seamless and memorable.
Our app is designed to be an all-in-one travel guide, offering detailed information about Mysore’s top attractions, including the majestic Mysore Palace, the serene Brindavan Gardens, the sacred Chamundi Hills, and the stunning St. Philomena’s Church. With an interactive map and real-time navigation, you can easily find your way to these famous landmarks, explore hidden gems, and discover local favorites.</p>

<p>Beyond sightseeing, the Mysore Tourism App helps you experience the city like a local. Looking for the best restaurants to try Mysore's signature dishes, such as Mysore Masala Dosa and Mysore Pak? Need help finding a comfortable stay near tourist spots? Our app provides personalized recommendations, travel tips, and booking assistance to ensure a hassle-free experience.</p>

<p>Mysore is not just about history—it is a city of festivals, traditions, and vibrant markets. Our app keeps you updated on events like the grand Mysore Dasara, cultural performances, and shopping hotspots for silk sarees and handicrafts. You can also book tickets for attractions, plan customized itineraries, and get transportation details, making your trip effortless and enjoyable.

With a user-friendly interface, multi-language support, and verified information, the Mysore Tourism App ensures that every traveler, whether a history enthusiast, nature lover, or adventure seeker, enjoys the best of Mysore. Start your journey today and immerse yourself in the royal splendor of this incredible city!</p></div>

</div>
 
<div class="gapdiv">
	</div>
    <div  class="why-us"><h2>Why Us</h2></div>
	<div class="main-child main-middle">
       <div class="features feature1">
            <h3>Explore Mysore's Heritage</h3>
            <img src="Images/heritage.jpg" alt="Mysore Heritage">
            <p>Discover the royal history of Mysore through its palaces, museums, and temples.</p>
       </div>
       <div class="features feature2">
            <h3>Plan Your Trip Easily</h3>
            <img src="Images/trip-planning.jpg" alt="Plan Trip">
            <p>Get personalized itineraries, must-visit spots, and travel tips in one place.</p>
       </div>
       <div class="features feature3">
            <h3>Seamless Travel Experience</h3>
            <img src="Images/travel.jpg" alt="Mysore Travel">
            <p>Navigate Mysore effortlessly with maps, transport guides, and real-time updates...</p>
       </div>
</div>

	</div>
	
	
    <footer>
    <div class="foot foot-top">
		<div class="foot-main">
			
			<div class="foot-main-child">
				<div class="foot-main-grandchild">
				<img src="Images/logo.png" alt="logo" width=70px>
				<h3> &copy 2025 Brand Limited</h3>
			</div>
				<div class="foot-main-grandchild">
                        <ul>
                        	<h3><li>Company</li></h3> 
                        	<a href=""><li>About Us</li></a>
                        	<a href=""><li>Team</li></a>
                        	<a href=""><li>Terms & Condition</li></a>
                        	<a href=""><li>Cookie Policy</li></a>
                        </ul>
				</div>
				<div class="foot-main-grandchild">
					<ul>
                         	<h3><li>Contact Us</li></h3>
                        	<a href=""><li>Healp & support</li></a>
                        	<a href=""><li>Partner With Us</li></a>
                        	<a href=""><li>Ride with Us</li></a>
                        </ul>
				</div>
				<div class="foot-main-grandchild">
					<ul>
                        	<h3><li>Available In</li></h3>
                        	<a href=""><li>Bengaluru</li></a>
                        	<a href=""><li>Mumbai</li></a>
                        	<a href=""><li>Pune</li></a>
                        	<a href=""><li>Hyderabad</li></a>
                        </ul>
				</div>
				<div class=" foot-main-grandchild social">
					<ul>
                        	<h3><li>Social Links</li></h3>
                        <a href=""><li><img src="Images/instagram.png" alt="insta" width="25px"></li></a>
                        	<a href=""><li><img src="Images/linkedin.png" alt="linkedin" width="25px"></li></a>
                        	<a href=""><li><img src="Images/twitter.png" alt="twitter" width="25px"></li></a>
                        	<a href=""><li><img src="Images/facebook.png" alt="facebook" width="25px"></li></a>
                        </ul>
				</div>
			</div>
		</div>
	</div>
	<div class="gapdiv">
	</div>
	<div class="foot foot-bottom">
		&copy; 2025 Online Tourism Management System. All Rights Reserved.
	</div>
        
    </footer>
    <script>
    window.addEventListener("scroll", function() {
        var header = document.querySelector("header");
        if (window.scrollY > 50) {
            header.classList.add("scrolled");
        } else {
            header.classList.remove("scrolled");
        }
    });
    
    document.addEventListener("DOMContentLoaded", function () {
        const categories = document.querySelectorAll(".categories-child");

        const observer = new IntersectionObserver(
            (entries, observer) => {
                entries.forEach((entry) => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add("show");
                    } else {
                        entry.target.classList.remove("show"); // Remove class to allow re-animation
                    }
                });
            },
            { threshold: 0.3 } // Adjust this value to trigger earlier or later
        );

        categories.forEach((category) => {
            observer.observe(category);
        });
    });


    
</script>
</body>
</html>