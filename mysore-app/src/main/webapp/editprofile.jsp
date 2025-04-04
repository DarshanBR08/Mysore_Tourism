<%@page import="com.mysore.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<style>
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
    .main{
           display: flex;
           flex-direction: column;
           border-radius: 10px;
           width:500px;
           box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
           position:absolute;
           top:10%;
           left:30%;
           align-items: center;
           backdrop-filter: blur(100px);
           z-index: 1;
           background: linear-gradient(to top,rgb(0,0,0,0.15),rgb(255,255,255,0.15));
    }
    .maingrandchild{
      margin:20px;
      width:100%;
      display: flex;
            justify-content: space-between;
    }
    .top{
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      align-items: center;
    }
    .bottom{
      display:flex;
      align-items: center;
    }
    .mainchild{
    	padding:10px;
    }
    .maingrandchild input{
      background-color:transparent;
      border-top: none;
      border-right: none;
      border-left: none;
    }
    input[type="submit"]{
		padding:10px 20px;
		background-color:#825a5a;
		border-radius:10px;
		color:white;
		}
		button{
      margin:10px;
		padding:10px 20px;
		background-color:#825a5a;
		border-radius:10px;
		color:white;
		}
		.success{
		color:green;
		}
        .failed{
		color:red;
		}
		a{
		color:white;
		text-decoration:none;
		}
  </style>
</head>
<body>
<form action="update_profile" method="post">
<%User user=(User)session.getAttribute("loginsuccess"); 
    if(user!=null){%>
<div class="main">
  <div class="mainchild top"> 
    <h1>Update Profile</h1>
    <%if(request.getAttribute("updatesuccess")!=null){ %>
      <h3 class="success"><%=request.getAttribute("updatesuccess") %></h3>
      <%} %>
    <%if(request.getAttribute("updatefailed")!=null){ %>
      <h3 class="failed"><%=request.getAttribute("updatefailed") %></h3>
      <%} %>
  </div>
    <div class="mainchild middle">
       
       <div class="maingrandchild g1">
      <label>Name</label><input type="text" name="name" value="<%=user.getUsername()%>">
       </div>
        <div class="maingrandchild g2">
      <label>Phone number</label><input type="tel" name="phone" value="<%=user.getPhone()%>">
       </div>
        <div class="maingrandchild g3">
      <label>Email</label><input type="email" name="email" value="<%=user.getEmail()%>">
       </div>
        <div class="maingrandchild g4">
      <label>Address</label><input type="text" name="address" value="<%=user.getAddress()%>">
       </div>
    </div>
    <div class="mainchild bottom">
      <input type="submit" name="Update" value="SUBMIT">
      <button><a href="profile.jsp">BACK</a></button>
    </div>
   
</div>
<%} %>
</form>

</body>
</html>