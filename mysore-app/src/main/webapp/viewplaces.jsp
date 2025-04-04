<%@page import="com.mysore.dto.Places"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>View Place</title>
	<style>
		
			 * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

       
      body {
      	height:100vh;
      	width:100%;
    background: linear-gradient(to right, #f5deb3, #ffffff);
}
nav{
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
}
 button{
        padding:10px 20px;
		background-color:#825a5a;
		border-radius:10px;
		border:none;
		color:#ffff;
        	height:30px;
			margin:10px;
			border-radius: 12px;
			transition: all 0.3s;
			align-items:center;
			text-align:center;
		}
		
		button:hover{
		transform: scale(1.1);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
		}
.main{
	width:100%;
	position:absolute;
	top:10%;
	display: flex;
	flex-direction: column;
	align-items: center;
}
<%if(request.getAttribute("placedetails")!=null){
	Places p=(Places)request.getAttribute("placedetails");%>

.main-top1 {
    position: relative;
    width: 90%;
    height: 650px;
    display: flex;
    flex-direction: column;
    align-items: center;
    overflow: hidden; /* Prevents blur from overflowing */
}

.main-top1::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-image: url("Images/<%=p.getPlaceimage() %>");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    filter: blur(10px); /* Adjust blur intensity */
    z-index: -1;
}
.main-top{
	width:60%;
	height:550px;
	background-size: cover;
			background-position: center;
			background-repeat: no-repeat;
}
.fancy-heading {
    position: absolute;
    top: 80%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 70px;
    font-style: italic;
    font-weight: bold;
    font-family: "Dancing Script", cursive;
    color: white;
    text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.6);
    z-index: 2; /* Keeps text above everything */
}
.main div{
	margin:30px;
}
p{
	padding:10px;
}
		
	</style>
</head>
<body>


<nav>
	<h2><%=p.getPlacename() %></h2>
	<a href="placedetails.jsp"><button>BACK</button></a>
</nav>
<div class="main">
<div class="main-top1">
<center><h1 class="fancy-heading"><%= p.getPlacename() %></h1></center>
    <div class="main-top">
    	<img src="Images/<%=p.getPlaceimage() %>"  alt="<%=p.getPlacename() %>" height="400px" width="100%">
    </div>
    </div>
    <div class="gapdiv">
    </div>
    <div class="main-middle">
    	<h3>History About <%=p.getPlacename() %></h3>
    	<p><%=p.getPlacehistory() %></p>
    </div>
    <div class="main-bottom">
        <h3>What to see in <%=p.getPlacename() %></h3>
        <p><%=p.getPlacedescription() %></p>
    </div>
</div>
<%} %>
</body>
</html>