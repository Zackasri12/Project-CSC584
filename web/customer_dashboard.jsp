<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("user_username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard | Luxury Perfume</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #fef9f5, #fceee3);
            color: #3b2f2f;
        }

        .header {
            background-color: #c7a17a;
            color: white;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h2 {
            margin: 0;
        }

        .logout {
            background-color: white;
            color: #c7a17a;
            padding: 10px 20px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-weight: bold;
        }

        .navbar {
            background-color: #fff4ea;
            display: flex;
            justify-content: center;
            padding: 15px 0;
            gap: 30px;
            border-bottom: 2px solid #f2d3b3;
        }

        .navbar a {
            text-decoration: none;
            color: #6a4e42;
            font-weight: bold;
            font-size: 16px;
            transition: color 0.3s;
        }

        .navbar a:hover {
            color: #c7a17a;
        }

        .slideshow {
            position: relative;
            width: 100%;
            max-width: 800px;
            height: 400px;
            margin: 40px auto;
            overflow: hidden;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        .slideshow .slide {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0;
            transition: opacity 1s ease-in-out;
        }

        .slideshow .active {
            opacity: 1;
        }

        .container {
            padding: 40px;
            text-align: center;
        }

        .welcome {
            font-size: 24px;
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 20px;
            margin-top: 40px;
            margin-bottom: 15px;
            border-bottom: 1px solid #c7a17a;
            padding-bottom: 5px;
            width: fit-content;
            margin-left: auto;
            margin-right: auto;
        }

        .perfume-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 20px;
            text-align: center;
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card img {
            width: 100px;
            height: 100px;
            object-fit: contain;
            margin-bottom: 10px;
        }

        .card h4 {
            margin: 10px 0;
        }

        .card p {
            font-size: 14px;
            color: #777;
        }

        .order-status {
            font-size: 16px;
            color: #555;
        }

        h1 {
            font-size: 2.5rem;
            color: #4a148c;
            margin-bottom: 20px;
            font-weight: normal;
        }

        p.description {
            font-size: 1.1rem;
            color: #5d4037;
            margin-bottom: 40px;
        }
    </style>
</head>
<body>

<div class="header">
    <h2>Luxury Perfume</h2>
    <form action="LogoutServlet" method="post">
        <input class="logout" type="submit" value="Logout">
    </form>
</div>

<div class="navbar">
    <a href="customer_dashboard.jsp">Home</a>
    <a href="order.jsp">Order</a>
    <a href="DisplayPerfume.jsp">Perfume</a>
    <a href="oderHistory.jsp">History</a>
    <a href="viewOrderItems.jsp">View Order</a>
    <a href="about.jsp">About Us</a>
</div>

<!-- Slideshow Section -->
<div class="slideshow">
    <img src="images/Perfume1.jpg" class="slide active">
    <img src="images/Perfume2.avif" class="slide">
    <img src="images/Perfume3.jpg" class="slide">
</div>

<div class="container">
    <h1>Welcome to the Luxury Shop</h1>
    <p class="description">Indulge in timeless elegance. Discover fragrances that define luxury.</p>
    <div class="welcome">Welcome, <strong><%= username %></strong> 👋</div>

    <div class="section-title">Featured Perfumes</div>
    <div class="perfume-grid">
        <div class="card">
            <img src="images/image5.jpeg" alt="Rose Delight">
            <h4>Rose Delight</h4>
            <p>Elegant floral fragrance with soft musk.</p>
        </div>
        <div class="card">
            <img src="images/image6.jpg" alt="Vanilla Bloom">
            <h4>Vanilla Bloom</h4>
            <p>Warm, sweet and sophisticated scent.</p>
        </div>
        <div class="card">
            <img src="images/image8.webp" alt="Silk Musk">
            <h4>Silk Musk</h4>
            <p>Luxurious blend with powdery finish.</p>
        </div>
    </div>

    <div class="section-title">Your Order Status</div>
    <div class="order-status">
         Order  — Shipped (Expected Delivery: 3–5 days)<br>
         
    </div>
</div>

<!-- Slideshow Script -->
<script>
    let currentSlide = 0;
    const slides = document.querySelectorAll(".slide");

    setInterval(() => {
        slides[currentSlide].classList.remove("active");
        currentSlide = (currentSlide + 1) % slides.length;
        slides[currentSlide].classList.add("active");
    }, 3000);
</script>

</body>
</html>
