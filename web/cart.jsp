<%@ page import="java.util.*, bean.CartItem" %>
<%@ page import="dao.CartDAO" %>
<%@ page import="java.sql.*" %>

<%
    List<CartItem> cart = new ArrayList<CartItem>();
    double total = 0;

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Perfume", "Perfume1", "app");
        CartDAO cartDAO = new CartDAO(conn);
        cart = cartDAO.getCartItems(1); // Hardcoded user_id = 1
        for (CartItem item : cart) {
            total += item.getPrice() * item.getQuantity();
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart - Luxury Perfume </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #fefefe;
            margin: 0;
            padding: 0;
        }

        header {
            background: linear-gradient(to right, #ff9a9e, #fad0c4);
            color: white;
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo { font-size: 26px; font-weight: bold; }

        .container {
            max-width: 960px;
            margin: 30px auto;
            padding: 20px;
        }

        .cart-title {
            font-size: 28px;
            margin-bottom: 20px;
            color: #444;
        }

        .cart-item {
            display: flex;
            align-items: center;
            background: #fff;
            border-radius: 12px;
            padding: 16px;
            margin-bottom: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .cart-item img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 10px;
            margin-right: 20px;
        }

        .item-details {
            flex: 1;
        }

        .item-details h3 {
            margin: 0;
            font-size: 20px;
        }

        .item-details p {
            margin: 5px 0;
            color: #666;
        }

        .qty-controls {
            display: flex;
            align-items: center;
        }

        .qty-controls button {
            background: #ff6f91;
            border: none;
            color: white;
            font-size: 16px;
            padding: 5px 10px;
            border-radius: 5px;
            margin: 0 5px;
            cursor: pointer;
        }

        .qty-controls span {
            font-size: 16px;
            padding: 0 5px;
        }

        .remove-btn {
            color: #ff4d4f;
            background: none;
            border: none;
            font-size: 18px;
            cursor: pointer;
            margin-left: 10px;
        }

        .summary {
            text-align: right;
            margin-top: 30px;
        }

        .summary h3 {
            font-size: 22px;
            color: #333;
        }

        .actions {
            text-align: right;
            margin-top: 20px;
        }

        .actions a, .actions button {
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 20px;
            margin-left: 10px;
            font-weight: bold;
        }

        .btn-secondary {
            background: #ccc;
            color: #333;
        }

        .btn-primary {
            background: #ff6f91;
            color: white;
            border: none;
        }

        form.checkout-form {
            margin-top: 20px;
            text-align: right;
        }

        form.checkout-form select, form.checkout-form label {
            margin-bottom: 10px;
        }

        .saved-msg {
            text-align: right;
            color: green;
            font-weight: bold;
            margin-top: 5px;
        }
    </style>
</head>
<body>

<header>
    <div class="logo">Perfume Paradise</div>
    <div>
        <a href="#" onclick="syncAndGoBack()" style="color:white; text-decoration:none;"><i class="fas fa-home"></i> Continue Shopping</a>
    </div>
</header>

<div class="container">
    <div class="cart-title">Your Shopping Cart</div>

    <% if (cart.isEmpty()) { %>
        <p>Your cart is empty.</p>
    <% } else { 
        for (CartItem item : cart) {
    %>
        <div class="cart-item">
            <img src="images/<%= item.getImage() %>" alt="<%= item.getName() %>">
            <div class="item-details">
                <h3><%= item.getName() %></h3>
                <p>Price: RM <%= String.format("%.2f", item.getPrice()) %></p>
                <p>Total: RM <%= String.format("%.2f", item.getPrice() * item.getQuantity()) %></p>
            </div>
            <div class="qty-controls">
                <form action="CartController" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= item.getPerfumeId() %>">
                    <input type="hidden" name="action" value="decrease">
                    <button type="submit">&#8722;</button>
                </form>
                <span><%= item.getQuantity() %></span>
                <form action="CartController" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= item.getPerfumeId() %>">
                    <input type="hidden" name="action" value="increase">
                    <button type="submit">+</button>
                </form>
                <form action="CartController" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= item.getPerfumeId() %>">
                    <input type="hidden" name="action" value="remove">
                    <button type="submit" class="remove-btn"><i class="fas fa-trash"></i></button>
                </form>
            </div>
        </div>
    <% }} %>

    <% if (!cart.isEmpty()) { %>
    <div class="summary">
        <h3 id="totalLabel">Total Amount: RM <span id="total"><%= String.format("%.2f", total) %></span></h3>
        <div class="saved-msg" id="savedMessage" style="display:none;">
            You saved 10% with coupon!
        </div>
    </div>

    <div class="actions">
        <a href="#" onclick="syncAndGoBack()" class="btn-secondary">Continue Shopping</a>
    </div>

    <!-- Checkout Form -->
    <form class="checkout-form" action="PaymentServlet" method="post">
        <label>
            <input type="checkbox" name="applyCoupon" value="true" id="couponCheckbox">
            Apply 10% Coupon (if more than 3 items)
        </label>
        <br><br>

        <label>Select Payment Method:</label>
        <select name="method" required>
            <option value="">--Select Payment Method--</option>
            <option value="FPX">FPX</option>
            <option value="QR">QR Code</option>
        </select>
        <br><br>

        <button type="submit" class="btn-primary">Proceed to Checkout</button>
    </form>
    <% } %>
</div>

<script>
    const originalTotal = <%= total %>;
    const totalSpan = document.getElementById("total");
    const savedMsg = document.getElementById("savedMessage");
    const couponCheckbox = document.getElementById("couponCheckbox");

    couponCheckbox.addEventListener("change", function () {
        if (this.checked) {
            const discounted = (originalTotal * 0.9).toFixed(2);
            totalSpan.innerText = discounted;
            savedMsg.style.display = "block";
        } else {
            totalSpan.innerText = originalTotal.toFixed(2);
            savedMsg.style.display = "none";
        }
    });

    function syncAndGoBack() {
        localStorage.removeItem("cart");
        const script = document.createElement("script");
        script.src = "cart-data";
        script.onload = () => {
            window.location.href = "order.jsp";
        };
        document.body.appendChild(script);
    }
</script>

</body>
</html>
    