<%@page import="com.mysore.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>My Profile</title>
	<style>
	* {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
	
		body{
			margin: 0px;
			padding:0px;
			background: linear-gradient(to right, #f5deb3, #ffffff);
            width:100%;
            height:100vh;
		}
		nav{
			position:absolute;
			top:10px;
			right:20px;
		}
		.main{
		
			width:25%;
			display:flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
			position:absolute;
			top:5%;
			left:35%;
			z-index: 1;
    background: linear-gradient(to top,rgb(0,0,0,0.15),rgb(255,255,255,0.15));
    border-radius: 12px;
    backdrop-filter: blur(100px);
		}
		.profilephoto{
			with:150px;
			height:150px;
			border-radius: 50%;
		}
		.profilephoto img{
			width:100%;
			height:100%;
		}
		.mainchild{
			display:flex;
			flex-direction: column;
			padding:20px;
       }
		.bottom .favourite,.theme,.updatepassword{
			display:flex;
			  align-items: center;
			  justify-content: space-between;
        width:200px;
        height:30px;
        letter-spacing:1px;
        background:none;
        margin:5px;
        border:none;
        text-transform: uppercase;
        text-decoration: none;
		}
   .top h3,a{
   	  text-align: center;
      align-items: center;
      justify-content: center;
      padding:5px;
      margin:0px;
   }
   button{
   	background-color: #825a5a;
   }
   .top button{
   color:white;
   	border-radius: 7px;
            border:none;
            padding:5px;
   }
   .logout{
        display:flex;
			  align-items: center;
			  justify-content: space-between;
        width:100px;
        height:30px;
        letter-spacing:1px;
        background:none;
        margin:5px;
        border:none;
        text-transform: uppercase;
        text-decoration: none;
   }
   button{
   	cursor: pointer;
   }
   button:hover{
		transform: scale(1.1);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
		}
a{
	text-decoration: none;
}
h3 {
    font-size: 16px;
    font-weight: 500;
    color: #333; /* Darker for better readability */
    text-align: center;
    padding: 5px;
}


	</style>

</head>
<body>
	<nav>
		<a href="Home.jsp"><button>BACK</button></a>
	</nav>
<div class="main">
      <div class="mainchild top">
      <%User u=(User)session.getAttribute("loginsuccess");
      if(u!=null){ %>
          <div class="profilephoto">
          	<img src="Images/user.png" alt="prifile_photo">
          </div>
          <h3 id="mail" class="usermail"><%=u.getUsername()%></h3>
          <h3 id="phone" class="userphone"><%=u.getPhone() %></h3>
          <a href="editprofile.jsp"><button class="editprofile">EDIT PROFILE</button></a>
          <%} %>
      </div>
      <div class="mainchild bottom">
          <a href=""><button class="favourite">Booking Details<img src="Images/right.png" width=25px ></button></a>
          <a href=""><button id="theme-toggle" class="theme">Transactions<img src="Images/right.png" width=25px></button></a>
          <a href="updatepassword.jsp"><button class="updatepassword">Update Password<img src="Images/right.png" width=25px></button></a>
          <a  href="logout"><button class="logout"><img src="Images/logout.png" width=25px>LOGOUT</button></a>
      </div>
</div>

</body>
</html>