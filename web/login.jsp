<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Luxury Perfume Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #fbeee6, #fffaf5);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: white;
            padding: 40px 50px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        .login-container h1 {
            font-family: 'Georgia', serif;
            font-size: 28px;
            color: #3b2f2f;
            margin-bottom: 30px;
            letter-spacing: 1px;
        }

        input[type="text"], input[type="password"] {
            width: 90%;
            padding: 12px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 16px;
            outline: none;
            transition: 0.3s ease;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #c7a17a;
        }

        .login-container input[type="submit"],
        .login-container input[type="reset"] {
            width: 45%;
            padding: 12px;
            margin: 10px 5px;
            font-size: 16px;
            border: none;
            border-radius: 25px;
            background-color: #c7a17a;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .login-container input[type="submit"]:hover,
        .login-container input[type="reset"]:hover {
            background-color: #a57c5b;
        }

        .register-link {
            margin-top: 20px;
            display: block;
            color: #6a4e42;
            font-size: 14px;
            text-decoration: none;
        }

        .register-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Luxury Perfume Login</h1>
        <form action="LoginServlet" method="POST">
            <input type="text" name="user_username" placeholder="Username" required />
            <input type="password" name="user_password" placeholder="Password" required />
            <div>
                <input type="submit" value="Login" />
                <input type="reset" value="Reset" />
            </div>
            <a class="register-link" href="register.jsp">Don't have an account? Register here</a>
            <a class="register-link" href="adminLogin.jsp">Admin</a>
        </form>
    </div>
</body>
</html>

