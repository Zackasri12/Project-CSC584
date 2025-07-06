<%@ page import="java.util.*, bean.Product" %>
<%
    List<Product> products = new ArrayList<Product>();
    products.add(new Product(1, "Blue Ocean", "Men", 99.90, "image1.webp"));
    products.add(new Product(2, "Night Storm", "Men", 89.90, "image2.webp"));
    products.add(new Product(3, "Wood Leather", "Men", 109.90, "image3.avif"));
    products.add(new Product(4, "Fierce Blaze", "Men", 120.00, "image4.webp"));

    products.add(new Product(6, "Rose Delight", "Women", 89.90, "image5.jpeg"));
    products.add(new Product(7, "Vanilla Bloom", "Women", 99.90, "image6.jpg"));
    products.add(new Product(8, "Silk Musk", "Women", 105.00, "image7.jpg"));
    products.add(new Product(9, "Blush Pink", "Women", 120.00, "image8.webp"));

    products.add(new Product(11, "Sweet Harmony", "Couple", 179.90, "image9.webp"));
    products.add(new Product(12, "Dual Bloom", "Couple", 189.90, "image10.webp"));
    products.add(new Product(13, "Lovers? Bond", "Couple", 199.00, "image11.jpg"));
    products.add(new Product(14, "Sunset Duo", "Couple", 209.00, "image12.jpeg"));
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Perfume Paradise</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body { font-family: 'Segoe UI', sans-serif; margin: 0; padding: 0; background: #f9f9f9; }
        header {
            background: linear-gradient(to right, #ff9a9e, #fad0c4);
            color: white;
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo { font-size: 28px; font-weight: bold; }
        .nav-links a {
            color: white;
            margin-left: 20px;
            text-decoration: none;
        }
        .nav-links span#cart-count {
            background: red;
            color: white;
            padding: 2px 8px;
            border-radius: 50%;
            margin-left: 5px;
        }
        .category-buttons { text-align: center; padding: 20px; }
        .category-button {
            background: #fff;
            border: 2px solid #ff6f91;
            color: #ff6f91;
            padding: 10px 20px;
            border-radius: 20px;
            margin: 0 10px;
            cursor: pointer;
        }
        .products {
            display: none;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            padding: 20px;
        }
        .products.active { display: grid; }
        .card {
            background: #fff;
            padding: 16px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
        }
        .qty-controls {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
        }
        .qty-controls button {
            background: #ff6f91;
            border: none;
            color: white;
            padding: 5px 10px;
            font-size: 16px;
            border-radius: 5px;
            margin: 0 5px;
            cursor: pointer;
        }
    </style>

    <script>
        let cart = {};

        function showCategory(category) {
            document.querySelectorAll('.products').forEach(p => p.classList.remove('active'));
            document.getElementById('section-' + category).classList.add('active');
        }

        function increaseQty(id) {
            cart[id] = (cart[id] || 0) + 1;
            document.getElementById("qty-" + id).textContent = cart[id];
            updateCartCount();
            localStorage.setItem("cart", JSON.stringify(cart));
        }

        function decreaseQty(id) {
            if (cart[id]) {
                cart[id]--;
                if (cart[id] <= 0) delete cart[id];
                document.getElementById("qty-" + id).textContent = cart[id] || 0;
                updateCartCount();
                localStorage.setItem("cart", JSON.stringify(cart));
            }
        }

        function updateCartCount() {
            let total = Object.values(cart).reduce((a, b) => a + b, 0);
            document.getElementById("cart-count").textContent = total;
        }

        function loadCartFromLocalStorage() {
            const savedCart = JSON.parse(localStorage.getItem("cart") || "{}");
            cart = savedCart;
            for (let id in cart) {
                const qtyElem = document.getElementById("qty-" + id);
                if (qtyElem) {
                    qtyElem.textContent = cart[id];
                }
            }
            updateCartCount();
        }

        function redirectToCartOnly() {
            const cart = JSON.parse(localStorage.getItem("cart") || "{}");

            const form = document.createElement("form");
            form.method = "POST";
            form.action = "CartSyncServlet";

            for (let id in cart) {
                if (cart[id] > 0) {
                    const input = document.createElement("input");
                    input.type = "hidden";
                    input.name = "qty_" + id;
                    input.value = cart[id];
                    form.appendChild(input);
                }
            }

            document.body.appendChild(form);
            form.submit(); // POST to CartSyncServlet ? then redirected to cart.jsp
        }

        window.onload = () => {
            showCategory('Men');
            loadCartFromLocalStorage();
        };
    </script>
</head>
<body>
<header>
    <div class="logo">Luxury Perfume</div>
    <div class="nav-links">
        <a href="customer_dashboard.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="javascript:void(0);" onclick="redirectToCartOnly()">
            <i class="fas fa-shopping-cart"></i> Cart <span id="cart-count">0</span>
        </a>
    </div>
</header>

<div class="category-buttons">
    <button class="category-button" onclick="showCategory('Men')">Men</button>
    <button class="category-button" onclick="showCategory('Women')">Women</button>
    <button class="category-button" onclick="showCategory('Couple')">Couple</button>
</div>

<%
    String[] categories = {"Men", "Women", "Couple"};
    for (String category : categories) {
%>
    <div class="products" id="section-<%= category %>">
    <%
        for (Product p : products) {
            if (p.getCategory().equals(category)) {
    %>
        <div class="card">
            <img src="images/<%= p.getImage() %>" alt="<%= p.getName() %>">
            <h3><%= p.getName() %></h3>
            <p>RM <%= p.getPrice() %></p>
            <div class="qty-controls">
                <button onclick="decreaseQty(<%= p.getId() %>)">-</button>
                <span id="qty-<%= p.getId() %>">0</span>
                <button onclick="increaseQty(<%= p.getId() %>)">+</button>
            </div>
        </div>
    <%
            }
        }
    %>
    </div>
<% } %>

</body>
</html>
