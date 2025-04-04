<%@page import="java.util.ArrayList"%>
<%@page import="com.mysore.dao.PlacesDAOImpl"%>
<%@page import="com.mysore.dao.PlacesDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.mysore.dto.Places"%>
<%@page import="com.mysore.dto.User"%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Place Details</title>
	<style>
		 * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

		body {
    background: linear-gradient(to right, #f5deb3, #ffffff);
    height: 100vh;
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
            position: fixed;
}
nav div{
	width:30%;
	display: flex;
	justify-content: right;
	align-items: center;
	margin:0px 20px;
}
nav div button{
margin:10px}

		.main{
			width:100%;
			display:flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
		}
		.main-child-top{
		position:absolute;
		top:10%;
		 display: flex;
    justify-content: center;
    align-items: center;
    gap: 15px;
    padding: 15px;
   background: linear-gradient(to right, #f5deb3, #ffffff);
    backdrop-filter: blur(12px);
    border-radius: 15px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    width: 90%;
    margin: 20px auto;
      }
      .main-child-top button{
       padding: 12px 18px;
    background:#825a5a;
    color: white;
    border: none;
    border-radius: 8px;
    font-weight: bold;
    font-size: 16px;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
      }
       .main-child-top button:hoover{
       background: #e65c00;
    transform: scale(1.05);
       }
      
      .main-child-bottom{
      	width:95%;
      	display:flex;
      	flex-direction: column;
      	position:absolute;
        top:28%;
        background: linear-gradient(to right, #f5deb3, #ffffff);
        border-radius: 12px;
        backdrop-filter: blur(100px);
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
      }
      .food-container{
      	display:grid;
      	grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 20px;
        max-height:400px;
        overflow-y:auto;
        padding: 20px;
      }
      .food-container::-webkit-scrollbar{
display:none;
}
      .food{
      	display:flex;
      	flex-direction: column;
      	align-items: center;
      	justify-content: space-between;
      	max-width:300px;
      	
        background-color:#fff ;
        
        padding:15px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        text-align: center;
         transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
      }
     

.food:hover {
    transform: translateY(-5px);
    box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.5);
}

.food img{
    object-fit: cover;
   width:250px;
}
.food button{
margin:5px;
width:100%;
}
.foodname {
    font-size: 18px;
    margin-top: 10px;
    color: #333;
}

.details {
    font-size: 14px;
    color: #666;
    margin: 5px 0;
}

.price {
    font-size: 16px;
    font-weight: bold;
    margin: 8px 0;
}

button {
    padding: 10px;
    margin-bottom:5px;
    background:#825a5a;
    color: white;
    border: none;
    border-radius: 3px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background 0.3s ease-in-out;
}

button:hover {
    background: #825a5a;
}
select{
 padding: 10px 12px;
    border-radius: 3px;
    border: none;
    background: white;
    font-size: 16px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3);
    cursor: pointer;
}
	</style>
</head>
<body>
	<nav>
 		<div>
 		<%User u=(User)session.getAttribute("loginsuccess");
 				if(u!=null){ %>
 					<% if(u.getUserid()==1){%>
 		<h1>Places that are added</h1>
 		<%}else{ %>
 	    <h1>Places You can Visit In Mysore</h1>
 	    <%} %>
 	</div>
 	<div>
 	<% if(u.getUserid()==1){%>
 		<button type="button" onclick="window.location.href='addplaces.jsp'">ADD PLACES</button>
    <%}%>
 		<button type="button" onclick="window.location.href='Home.jsp'">BACK</button>
 	</div>
 	</nav>
 <div class="main">
 <div class="main-child-top">
 <form action="place_filter" method="get">
  <label for="month">Best Month To Visit :</label>
    <select name="month">
        <option value="all">All</option>
        <option value="OctToMar">October to March</option>
        <option value="AprToJun">April to June</option>
        <option value="JulToSep">July  to September</option>
        <option value="AnyTime">Any Time</option>
    </select>
    
     <label>Category:</label>
    <select name="category">
        <option value="all" >Any</option>
        <option value="historical">Historical</option>
        <option value="palace">Palaces</option>
        <option value="garden">Gardens</option>
        <option value="temple">Temples</option>
        <option value="musium">Musiums</option>
        <option value="adventure">Adventure</option>
        <option value="wildlife">WildLife Santuries</option>
    </select>
    
    
    <button type="submit">Apply Filter</button>
    </form>
 </div>
 	<div class="main-child-bottom">
 	
 	<% 
    Boolean isAddedToCart = (Boolean) request.getAttribute("isAddedToCart");
    Integer addedFoodId = (Integer) request.getAttribute("foodId");
%>
 	
 	<div class="food-container">
    <%
        List<Places> PlacesList = (List<Places>) request.getAttribute("filteredPlaces");
        if (PlacesList != null) {
            for (Places places : PlacesList) {
    %>
        <div class="food">
 				<img src="Images/<%=places.getPlaceimage() %>" alt="food"  height="220px" class="places">
 				<p class="foodname"><%=places.getPlacename() %></p>
 				<button type="button" onclick="window.location.href='viewplace.jsp'">VIEW PLACE</button>
 				
 				
 		<!..button value will get change once after adding the food..>	
 		
 		
 	<!-- 	make changes if you want addto Fovourites -->
 		
 <%-- <form action="add_to_cart" method="post">
    <input type="hidden" name="foodId" value="<%=places.getPlaceid()%>">
    
 
    <% 
    Boolean isAddedToCartFood = (Boolean) session.getAttribute("isAddedToCart_" + places.getPlaceid());
    isAddedToCartFood = (isAddedToCartFood != null) ? isAddedToCartFood : false;
    %>

 
                
   <button type="submit">
                    <%= isAddedToCartFood ? "Added" : "Add to Cart" %>
                </button>
</form>  
 		 --%>		    
 				
 				<% if(u.getUserid()==1){%>
 				<form action="delete_places" method="post">
 				<input type="hidden" name="id" value="<%= places.getPlaceid()%>">
 				<button type="submit" class="delete-btn">Delete</button>
 				</form>
 				<% }%>
 			</div>
    
    <% }
            }else{ %>
 	
 		 <%  PlacesDAO pdao=new PlacesDAOImpl();
 		 ArrayList<Places> list=pdao.getPlaces(); 
 		    for(Places p:list){ %>
 		    <form action="viewplace" method="post">
 			<div class="food">
 				<img src="Images/<%=p.getPlaceimage() %>" alt="food" width="200px" height="250px" class="places">
 				<p class="foodname"><%=p.getPlacename() %></p>
 				<input type="hidden" value=<%=p.getPlaceid() %> name="placeid">
 				<button type="submit" onclick="window.location.href='viewplaces.jsp'">VIEW PLACE</button>
 				
 				</form>
 				
 				<!..button value will get change once after adding the food..>
 				<%-- <form action="add_to_cart" method="post">
    <input type="hidden" name="foodId" value="<%=p.getPlaceid()%>">
    
    <% 
Boolean isAddedToCartFood = (Boolean) session.getAttribute("isAddedToCart_" + p.getPlaceid());
isAddedToCartFood = (isAddedToCartFood != null) ? isAddedToCartFood : false;
%>

                
    <button type="submit">
                    <%= isAddedToCartFood ? "Added" : "Add to Cart" %>
                </button>
</form> --%>
 				
 				
 				<% if(u.getUserid()==1){%>
 				<form action="delete_food" method="post">
 				<input type="hidden" name="id" value="<%= p.getPlaceid()%>">
 				<button type="submit" class="delete-btn">Delete</button>
 				</form>
 				<% }%>
 			</div>
           <% } }}%>
 			
 		</div>
 	</div>
 </div>
</body>
</html>