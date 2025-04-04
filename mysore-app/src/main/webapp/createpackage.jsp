<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Create Package</title>
	<style>
		* {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

      
      body {
      	width:100%;
      	height:100vh;
    background: linear-gradient(to right, #f5deb3, #ffffff);
}

nav{
     width:100%;
    display: flex;
    justify-content: right;
    align-items: center;
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    padding: 15px 20px;
    height:60px;
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
section{
	position:absolute;
	top:15%;
	width:100%;
	display: flex;
	justify-content: center;
	align-items: center;
	background: linear-gradient(to right, #f5deb3, #ffffff);
}
.main{
	width:90%;
	height:auto;
	border-radius: 12px;
	display:flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;

}
.main-child{
	display:flex;
	flex-direction: column;
	width:50%;
	gap:10px;
}
.main-child div{
	display:flex;
	justify-content: space-between;
}
input,select,textarea{
	width:50%;
	border-top:none;
	border-left: none;
	border-right: none;
	color:#825a5a;
}
input,select{
	height:30px;
	background: transparent;
}
textarea{
	padding: 3px;
}
input:hover,select:hover,textarea:hover,option:hover{
	border: none;
	background:#825a5a;
	color:white;
	text-align: center;
}
input:hover::placeholder,textarea:hover::placeholder{
color:white;
}
input:focus,textarea:focus,select:focus{
	border: 1px solid #825a5a; 
    outline: none;
}
label{
font-size: 14px;
}
	</style>



</head>
<body>
      <nav>
      	<a href="packagedetails.jsp"><button>Package Details</button></a>
      	<a href="Home.jsp"><button>BACK</button></a>
      </nav>
<form action="createpackage" method="post">
      <section>
      	<div class="main">
      		<div class="main-child top">
      			<center><h3>CREATE PACKAGE</h3></center>
      			<div>
      			<label for="name">Package Name</label><input type="text" name="name" placeholder="Package Name">
                </div>
                <div>
      			<label for="category">Category</label><select name="category">
      				<option value="Heritage">Heritage & Cultural Tours</option>
                    <option value="wildlife">Nature & Wildlife Tours</option>
                    <option value="Pilgrimage">Pilgrimage & Spiritual Tours</option>
                    <option value="wildlife">Nature & Wildlife Tours</option>
                    <option value="Adventure">Adventure & Trekking Tours</option>
                    <option value="Weekend">Mysore Weekend Escape</option>
                    <option value="Festival">Festival & Special Event Packages</option>
                    <option value="Oneday">Mysore Express Tour</option>
                    <option value="Twoday">Mysore Weekend Escape</option>
                    <option value="Threeday">The Complete Mysore Experience</option>
      			</select>
                </div>
                <div>
      			<label for="amount">Amount Per Person</label><input type="number" name="amount" placeholder="Per person Charge">
                 </div>
                 <div>
      			<label for="start_date">Starts From</label><input type="date" name="start_date" placeholder="Start Date">
                </div>
                <div>
      			<label for="end_date">Ends On</label><input type="date" name="end_date" placeholder="End Date">
                 </div>
                 <div>
      			<label for="days">Number of Days</label><input type="number" name="days" placeholder="Number of Days">
                 </div>
                 <div>
      			<label for="nights">Number of Nights</label><input type="number" name="nights" placeholder="Number of Nights">
                 </div>
                 <div>
      			<label for="last_date">Register Before</label><input type="date" name="last_date" placeholder="Last Date to register">
                 </div>
                 <div>
      			<label for="description">Details</label><textarea  name="description" placeholder="details" rows="5"></textarea>
      		</div>
      		<div>
      			<label for="image">Package Image</label><input type="text" name="image" placeholder="Image name">
                </div>
      		</div>

      		<div class="main-child">
      			<button type="submit">Create</button>
      			<%if(request.getAttribute("Package_created")!=null){ %>
      			<p class="success"><%=request.getAttribute("Package_created") %></p>
      			<%} %>
      			<%if(request.getAttribute("Package_not_created")!=null){ %>
      			<p class="failure"><%=request.getAttribute("Package_not_created") %></p>
      			<%} %>
      		</div>
      	</div>
      </section>
      </form>
</body>
</html>