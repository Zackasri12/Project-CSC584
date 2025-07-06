<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Perfume Shop - Welcome</title>
</head>
<body>
    <h2>Welcome to the Perfume Shop, ${sessionScope.username}!</h2>
    <p>Use the links below to explore and manage your fragrance collection:</p>

    <ul>
        <li><a href="order.jsp">Order</a></li>
        <li><a href="cart.jsp">Add to Cart</a></li>
        <li><a href="collection.jsp">View Perfume Collection</a></li>
        <li><a href="UserLogout.jsp">Logout</a></li>
    </ul>
</body>
</html>
