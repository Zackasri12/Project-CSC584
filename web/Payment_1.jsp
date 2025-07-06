<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Submit Payment</title>
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
        background: linear-gradient(to bottom right, #2e2e2e, #1c1c1c);
        color: #fff;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        padding: 40px 20px;
    }

    h1 {
        color: #f1c40f;
        font-size: 2.5rem;
        margin-bottom: 30px;
        text-shadow: 1px 1px 4px #000;
    }

    form {
        background-color: #2b2b2b;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
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
        margin-bottom: 15px;
    }

    input:focus, select:focus {
        outline: none;
        box-shadow: 0 0 8px #f1c40f;
    }

    input[type="submit"] {
        background-color: #f1c40f;
        color: #1c1c1c;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s ease;
        margin-top: 10px;
    }

    input[type="submit"]:hover {
        background-color: gold;
        transform: scale(1.03);
        box-shadow: 0 0 12px gold;
    }
</style>

</head>
<body>
    <h1>Submit Payment</h1>
    <form action="PaymentServlet" method="post">
        <label for="orderId">Order ID:</label><br>
        <input type="text" id="orderId" name="orderId" required><br><br>

        <label for="paymentDate">Payment Date:</label><br>
        <input type="date" id="paymentDate" name="paymentDate" required><br><br>

        <label for="amount">Amount:</label><br>
        <input type="number" id="amount" name="amount" step="0.01" min="0" required><br><br>

        <label for="paymentMethod">Payment Method:</label><br>
        <select id="paymentMethod" name="paymentMethod" required>
            <option value="Credit Card">Credit Card</option>
            <option value="Debit Card">Debit Card</option>
            <option value="PayPal">PayPal</option>
            <option value="Bank Transfer">Bank Transfer</option>
            <option value="Cash on Delivery">Cash on Delivery</option>
        </select><br><br>

        <label for="status">Status:</label><br>
        <select id="status" name="status" required>
            <option value="Pending">Pending</option>
            <option value="Completed">Completed</option>
            <option value="Failed">Failed</option>
            <option value="Refunded">Refunded</option>
        </select><br><br>

        <input type="submit" value="Submit Payment">
    </form>
</body>
</html>
