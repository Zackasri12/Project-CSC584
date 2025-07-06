<%-- 
    Document   : success
    Created on : Jul 6, 2025, 2:22:01 PM
    Author     : asria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Success | Luxury Perfume</title>
    <meta charset="UTF-8">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #fce3d8, #f6e1e1);
            color: #4e342e;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background-color: #ffffffdd;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            font-size: 32px;
            color: #c7a17a;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin-bottom: 30px;
        }

        .btn {
            padding: 12px 24px;
            background-color: #c7a17a;
            color: white;
            text-decoration: none;
            border-radius: 25px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #a87e59;
        }

        .perfume-icon {
            font-size: 60px;
            color: #c7a17a;
            margin-bottom: 20px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>

    <script>
        // Clear local storage cart on page load
        window.onload = () => {
            localStorage.removeItem("cart");
        };
    </script>
</head>
<body>
    <div class="container">
        <div class="perfume-icon">🌸</div>
        <h2>Thank You for Your Purchase!</h2>
        <p>Your luxury fragrance will arrive soon.</p>
        <a href="customer_dashboard.jsp" class="btn">Back to Home</a>
        <br><br>
        <a href="oderHistory.jsp" class="btn" style="background-color:#8d6e63;">View Order History</a>
    </div>
</body>
</html>

