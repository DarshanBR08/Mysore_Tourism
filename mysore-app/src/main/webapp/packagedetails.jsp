 <%@page import="com.mysore.dto.Packages"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mysore.dto.Packages"%>
<%@page import="com.mysore.dao.PackageDAOImpl"%>
<%@page import="com.mysore.dao.PackageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		border:none;
		color:#ffff;
		width:100px;
        	
			margin:10px;
			border-radius: 4px;
			transition: all 0.3s;
			align-items:center;
			text-align:center;
		}
		
		button:hover{
		transform: scale(0.99);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
		}
		.main{
		width:100%;
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
		gap:40px;
		position:absolute;
		top:15%;
		}
		.package{
		padding:10px;
		display:flex;
		flex-direction:column;
		width:40%;
		background-color:white;
		}
		.package-details{
		width:100%;
		
		}
		a{
		text-decoration:none;
		color:black;
		}
		.package-image{
			width:100%;
		}
		.package-details-left{
		padding:10px 0px;
		
		}
		.package-details-left *{
		margin:5px 0px;
		}
		
		.package-details-left,.package-details-right{
		display:flex;
		flex-direction:column;
		align-items:center;
		justify-content:space-between;
		margin:0px;
		}
		.pak{
		width:100%;
		border-radius:0px;
		margin-right:20px;
		}
		
</style>
</head>
<body>
<nav>
	<h2>Package Name</h2>
	<a href="Home.jsp"><button>BACK</button></a>
</nav>
<form action="viewpackage" method="post"> 
<section>
<div class="main">
          <%PackageDAO pdao=new PackageDAOImpl();
          ArrayList<Packages> plist=pdao.getPackages();
          for(Packages p:plist){%>
          
          
          <div class="package">
           <div class="package-image">  <img src="Images/<%=p.getPackageimage()%>" width="100%" height="200px"> </div>
          <div class="package-name">  <h3><%=p.getPackagename()%></h3>   </div>
          <div class="package-details">
          <div class="package-details-left">
           <% DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy"); %>
<p>From :  <%=p.getStartdate().format(formatter) %> || To :<%=p.getEnddate().format(formatter) %></p>
<p>Register Before: <%=p.getLastdate().format(formatter) %></p>
            <h4>&#8377 <%=p.getAmount() %></h4>
          </div>
         <div class="package-details-right">
           <a href="viewpackage.jsp" class="pak"><button class="pak" type="submit">VIEW MORE...</button></a>
           <input type="hidden" name="packageid" value=<%=p.getPackageid() %>/>
          <a href="#" class="pak"><button class="pak">Contact Us</button></a>
         </div>
          
          </div>
          </div>
          <%} %>
</div>
</section>
</form>
</body>
</html>