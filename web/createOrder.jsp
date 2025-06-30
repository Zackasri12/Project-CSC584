<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Order</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Georgia', serif;
            background: linear-gradient(to bottom, #1c1c1c, #2e2e2e);
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            justify-content: center;
        }

        h1 {
            color: gold;
            font-size: 2.5rem;
            margin-bottom: 30px;
            text-shadow: 1px 1px 5px #000;
        }

        form {
            background-color: #2b2b2b;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.6);
            width: 90%;
            max-width: 500px;
        }

        label {
            font-weight: bold;
            color: #f7d774;
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
        }

        input, select {
            width: 100%;
            padding: 10px 15px;
            border: none;
            border-radius: 10px;
            background-color: #444;
            color: #fff;
            font-size: 1rem;
            margin-bottom: 10px;
        }

        input:focus, select:focus {
            outline: none;
            box-shadow: 0 0 8px #d4af37;
        }

        input[type="submit"] {
            background-color: #d4af37;
            color: #1c1c1c;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: gold;
            transform: scale(1.03);
        }
    </style>
</head>
<body>
    <h1>Create Order</h1>
    <form action="OrderServlet" method="post">
        <label for="orderDate">Order Date:</label>
        <input type="date" id="orderDate" name="orderDate" required>

        <label for="totalOrder">Total Order Amount:</label>
        <input type="number" id="totalOrder" name="totalOrder" step="0.01" min="0" required>

        <label for="userId">User ID:</label>
        <input type="text" id="userId" name="userId" required>

        <label for="couponId">Coupon ID (optional):</label>
        <input type="text" id="couponId" name="couponId">

        <label for="orderStatus">Order Status:</label>
        <select id="orderStatus" name="orderStatus" required>
            <option value="Pending">Pending</option>
            <option value="Processing">Processing</option>
            <option value="Shipped">Shipped</option>
            <option value="Delivered">Delivered</option>
            <option value="Cancelled">Cancelled</option>
        </select>

        <input type="submit" value="Create Order">
    </form>
</body>
</html>
