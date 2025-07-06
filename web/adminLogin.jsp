<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login | Luxury Perfume</title>
    <style>
        body {
            margin: 0;
            font-family: 'Georgia', serif;
            background: linear-gradient(to right, #f3e7e9, #e3eeff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-box {
            background: #fffaf3;
            padding: 35px 50px;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.1);
            border: 2px solid #d4af37;
            text-align: center;
        }

        .login-box h2 {
            margin-bottom: 25px;
            color: #4b3832;
            font-size: 26px;
            letter-spacing: 1px;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
        }

        input[type=submit] {
            background-color: #d4af37;
            color: #fff;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type=submit]:hover {
            background-color: #bfa036;
        }

        .error {
            color: #b00020;
            background: #ffe6e6;
            border: 1px solid #ffb3b3;
            border-radius: 5px;
            padding: 8px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <form class="login-box" action="AdminLoginServlet" method="post">
        <h2>Admin Panel – Luxury Perfume</h2>
        <% 
            String error = (String) request.getAttribute("errMessage");
            if (error != null) {
        %>
            <div class="error"><%= error %></div>
        <% 
            } 
        %>
        <input type="text" name="admin_username" placeholder="Admin Username" required>
        <input type="password" name="admin_password" placeholder="Password" required>
        <input type="submit" value="Login">
    </form>
</body>
</html>
