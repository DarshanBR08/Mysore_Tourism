<%@page import="com.mysore.dto.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mysore.dao.userDAO"%>
<%@page import="com.mysore.dao.userDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Customer Details</title>
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
            background-size: cover;
		}
    .main{
    position:absolute;
    top:5%;
      width:100%;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }
    .main-child{
    position:absolute;
    top:10%;
      width:100%;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }
    table{
      width:80%;
      text-align: center;  
           z-index: 1;
          backdrop-filter: blur(100px);
     background: linear-gradient(to top,rgb(0,0,0,0.15),rgb(255,255,255,0.15));
     box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }
    thead{
      height: 35px;
      color:#ffff;
      background-color: #825a5a;
    }
    tbody{
    color:black;
    }
   .back{
      position: absolute;
      top: 20px;
      right: 50px; 
    }
    button{
       padding:10px 20px;
		background-color:#825a5a;
		border-radius:10px;
		border:none;
		color:#ffff;
		}
		button:hover{
		transform: scale(1.1);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
		}
		tr {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}
		tr:hover{
		transform: scale(0.99);
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
		} 
		thead:hover{
		transform: scale(1.0);
		}
		.search-bar{
		display:flex;
		justify-content:center;
		align-item:center;
		}
		.search-bar{
		width:30%;
		display:flex;
		justify-content:space-between;
		align-item:center;
		padding:10px;
		}
		select,input{
		height:35px;
		}
  </style>
</head>
<body>
      <div class="main">
    <div class="main-child">
        <h3>User Details</h3>
        <%if(request.getAttribute("deletesuccess")!=null){%>
                 <h4 class="success"><%=request.getAttribute("deletesuccess")%> </h4>
        <% }%>
        <%if(request.getAttribute("deletefailed")!=null){%>
                 <h4 class="success"><%=request.getAttribute("deletefailed")%> </h4>
        <% }%>
        <div class="search-bar">
    <form action="searchuser" method="post" id="searchForm">
        <input style= type="search" name="search" id="search" placeholder="Search here..." 
               value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
        
        <select name="sortBy" id="sortBy" onchange="submitForm()">
            <option value="">Sort By</option>
            <option value="recent" <%= "recent".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Recently Registered</option>
            <option value="previous" <%= "previous".equals(request.getParameter("sortBy")) ? "selected" : "" %>>Previously Registered</option>
        </select>
    </form>
</div>
        
        <table>
          <thead>
            <th>Name</th>
            <th>Phone</th>
            <th>Mail</th>
            <th>Address</th>
            <th>Account Created</th>
          </thead>
          <tbody>
          <%ArrayList<User> list1=(ArrayList)request.getAttribute("search");
          if(list1!=null){
          for(User u1:list1){%>
          <tr>
          <td><%=u1.getUsername()%></td>
          <td><%=u1.getPhone()%></td>
          <td><%=u1.getEmail()%></td>
          <td><%=u1.getAddress()%></td>
           <td><%=u1.getDate()%></td>
           <td>
         <form action="delete_customer" method="post">
          <input type="hidden" name="id" value="<%=u1.getUserid() %>">
          <button type="submit" class="delete-btn">Delete</button>
          </form>
          </td>
          </tr>
          
          <%}}else{ %>
         <%userDAO udao=new userDAOImpl();
          ArrayList<User> ulist=udao.getUser();  
          for(User u:ulist){%>
          <tr>
         <td><%=u.getUsername()%></td>
          <td><%=u.getPhone()%></td>
          <td><%=u.getEmail()%></td>
          <td><%=u.getAddress()%></td>
           <td><%=u.getDate()%></td>
           <td>
         <form action="delete_customer" method="post">
          <input type="hidden" name="id" value="<%=u.getUserid() %>">
          <button type="submit" class="delete-btn">Delete</button>
          </form>
          </td>
          </tr>
          <%} }%>
          </tbody>
        </table>
      </div>
      </div>
      <div class="back">
      <a href="Home.jsp"><button>Back</button></a>
      </div>
      <script>
    function submitForm() {
        document.getElementById("searchForm").submit(); // Auto-submit form when sorting changes
    }
</script>
</body>
</html>