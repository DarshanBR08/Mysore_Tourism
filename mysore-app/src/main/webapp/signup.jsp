<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
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
        .Signup-container {
            background: linear-gradient(to right, #f5deb3, #f5deb3);
            padding: 10px 30px;
            position:absolute;
            top:20px;
            left:33%;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            height:500px;
            max-width: 400px;
        }

        .Signup-container h2 {
            text-align: center;
            margin-bottom: 10px;
            color: #825a5a;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-size: 14px;
            color: #555;
        }

        input[type="text"], input[type="email"], input[type="password"], input[type="tel"] {
            width: 100%;
            padding: 7px;
            margin-top: 2px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color:  #825a5a;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #825a5a;
        }

        .form-footer {
            text-align: center;
            margin-top: 20px;
        }

        .form-footer a {
            color:  #825a5a;
            text-decoration: none;
        }

        .form-footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<form action="signup" method="post">
    <div class="Signup-container">
        <h2>Signup Form</h2>
        <%if(request.getAttribute("signupfailed")!=null){ %>
        <h5 class="failed"><%=request.getAttribute("signupfailed") %></h5>
        <%} %>
        
            <div class="form-group">
                <label for="name">Enter Your Name:</label>
                <input type="text" name="name" id="name" required>
            </div>

            <div class="form-group">
                <label for="phone">Enter Your Phone Number:</label>
                <input type="tel" name="phone" id="phone" required>
            </div>

            <div class="form-group">
                <label for="email">Enter Your Email:</label>
                <input type="email" name="email" id="email" required>
            </div>

            <div class="form-group">
                <label for="password">Enter Your Password:</label>
                <input type="password" name="password" id="password" required>
            </div>

            <div class="form-group">
                <label for="conpassword">Enter Your Confirm Password:</label>
                <input type="password" name="conpassword" id="conpassword" required>
            </div>

            <input type="submit" value="Signup">
        
        <div class="form-footer">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>
</form>
</body>
</html>