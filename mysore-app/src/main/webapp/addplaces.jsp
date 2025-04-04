<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Add Places</title>
	<style>
		*{
			padding:0px;
			margin: 0px;
		}
		body{
			font-family: 'Poppins', sans-serif;
			width:100%;
			height:100vh;
			 background: linear-gradient(to right, #f5deb3, #ffffff);
		}
		.main{
			width:70%;
			height:90vh;
			position:absolute;
			top:7%;
			left:17%;
			display:flex;
			z-index: 1;
            background: linear-gradient(to top,rgb(0,0,0,0.15),rgb(255,255,255,0.15));
            border-radius: 12px;
            backdrop-filter: blur(100px);
             box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		}
		.main-child1{
			width:35%;
			display: flex;
            justify-content: center; 
            align-items: center; 
		}
		.main-child{
            width:60%;
			display:flex;
			flex-direction:column;
			justify-content:center;
			text-align: left;
		}
		.main-grandchild div{
         padding:10px;
         display: flex;
         justify-content: space-between;
         align-items: center;
		}
        input{
        	width:60%;
        	height: 25px;
        	background: transparent;
        	border-top:none;
        	border-left:none;
        	border-right: none;
        }
         textarea{
        	width:60%;
        	background: transparent;
        	
        }
        select{
        	width:20%;
        	height: 25px;
        	background: transparent;
        	border-top:none;
        	border-left:none;
        	border-right: none;
        }
         input[type="radio"]{
         	width:15%;
         	height:15px;
         }
        input:hover{
        	border:2px solid black;
        }
        button{
        padding:10px 20px;
		background-color:#825a5a;
		border-radius:10px;
		border:none;
		color:#ffff;
        	height:35px;
			margin:10px;
			transition: all 0.3s;
			align-items:center;
			text-align:center;
		}
		
		button:hover{
		transform: scale(1.1);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
		}
		
		nav{
		width:100%;
		display: flex;
    justify-content: space-between;
    align-items: center;
		position:fixed;
		top:0%;
		}
		h2 {
    font-size: 28px; 
    font-weight: bold;
    color: #825a5a; 
    text-align: center;
    text-transform: uppercase;
    margin-bottom: 20px;
        padding: 10px;
    border-bottom: 2px solid #333;
}

	</style>
</head>
<body>
<nav>
<a href="placedetails.jsp"><button>Place Details</button></a>
<a href="placedetails.jsp" class="back"><button>Back</button></a>

</nav>

	<form method="post" action="addplace">
<div class="main">
	<div class="main-child1">
		<img src="Images/mysore.png" width="150px">
	</div>
	<div class="main-child">
		<div class="main-grandchild top">
			<h2>Add Place</h2>
			<%if(request.getAttribute("added")!=null){ %>
			<p class="success"><%=request.getAttribute("added") %></p>
			<%} %>
			<%if(request.getAttribute("failed")!=null){ %>
			<p class="fail"><%=request.getAttribute("failed") %></p>
			<%} %>
		</div>
		<div class="main-grandchild middle">
			<div>
			<label for="name">Place Name</label><input type="text" name="name" required>
            </div>
            <div>
            	<label for="category">Category</label>
            	<select name="category" required>
            		<option value="" disabled selected>Select</option>
            		<option value="historical">Historical</option>
            		<option value="palace">Palaces</option>
            		<option value="hotel">Hotel</option>
            		<option value="garden">Gardens</option>
            		<option value="temple">Temples</option>
            		<option value="musium">Musiums</option>
            		<option value="adventure">Adventure</option>
            		<option value="wildlife">WildLife Santhuries</option>
            		</select>

            		<label for="month">Best Months to Visit</label>
            	<select name="month" required>
            		<option value="" disabled selected>Select</option>
            		<option value="OctToMar">October to March</option>
            		<option value="AprToJun">April to June</option>
            		<option value="JulToSep">July  to September</option>
            		<option value="AnyTime">Any Time</option>
            		</select>
		</div>
		
		<div>
			<label for="image">Place Name</label><input type="text" name="image" required>
            </div>
		
		<div>
			<label for="description">Enter Description:</label>
<textarea id="description" name="description" rows="5" cols="50" placeholder="Write place description here..."></textarea>

		</div>
		<div>
			<label for="history">History about the place:</label>
<textarea id="description" name="history" rows="5" cols="50" placeholder="Write Histroy of the place here..."></textarea>
		</div>
		<div>
			 <button type="submit">ADD</button>
		</div> 
	</div>
</div>
</div>
</form>
</body>
</html>