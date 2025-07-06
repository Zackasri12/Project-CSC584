<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Luxury Perfume Collection</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>  
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f6f6f9;
        color: #333;
    }

    header {
        background-color: #1e1e2f;
        color: #fff;
        padding: 2rem 1rem 1.5rem;
        text-align: center;
        box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        position: relative;
    }

    .back-btn {
        position: absolute;
        top: 20px;
        left: 20px;
        background-color: #fff;
        color: #1e1e2f;
        border: none;
        padding: 8px 16px;
        border-radius: 5px;
        font-weight: bold;
        cursor: pointer;
        text-decoration: none;
        transition: background 0.3s;
    }

    .back-btn:hover {
        background-color: #e0e0e0;
    }

    .category-title {
        text-align: center;
        font-size: 1.8rem;
        margin-top: 2.5rem;
        color: #1e1e2f;
    }

    .perfume-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 1.5rem;
        padding: 1rem 2rem 2rem;
    }

    .perfume-card {
        background: #fff;
        border-radius: 16px;
        padding: 1rem;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        text-align: center;
    }

    .perfume-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 15px rgba(0,0,0,0.2);
    }

    .perfume-card img {
        width: 100%;
        height: 200px;
        border-radius: 12px;
        object-fit: cover;
    }

    .perfume-card h3 {
        font-size: 1.2rem;
        margin: 0.6rem 0 0.4rem;
        color: #1e1e2f;
    }

    .price {
        color: #e67e22;
        font-weight: bold;
        font-size: 1.1rem;
    }

    .stock {
        font-size: 0.9rem;
        color: #777;
    }

    .desc {
        font-size: 0.95rem;
        margin-top: 0.5rem;
        color: #555;
    }
    </style>
</head>
<body>
    <header>
        <a class="back-btn" href="customer_dashboard.jsp">← Home</a>
        <h1>Luxury Perfume Collection</h1>
    </header>

    <!-- MEN Section -->
    <section>
        <h2 class="category-title">For Men</h2>
        <div class="perfume-grid">
            <div class="perfume-card">
                <img src="images/image1.webp" alt="Blue Ocean">
                <h3>Blue Ocean</h3>
                <p class="price">RM 85.00</p>
                <p class="stock">Stock: 10</p>
                <p class="desc">Aqua freshness with citrus zest and sea breeze notes.</p>
            </div>

            <div class="perfume-card">
                <img src="images/image2.webp" alt="Night Storm">
                <h3>Night Storm</h3>
                <p class="price">RM 92.00</p>
                <p class="stock">Stock: 8</p>
                <p class="desc">Dark leather, spice, and cool mint combine for power.</p>
            </div>

            <div class="perfume-card">
                <img src="images/image3.avif" alt="Wood Leather">
                <h3>Wood Leather</h3>
                <p class="price">RM 99.00</p>
                <p class="stock">Stock: 12</p>
                <p class="desc">Earthy cedarwood, smoky leather, and a hint of oud.</p>
            </div>

            <div class="perfume-card">
                <img src="images/image4.webp" alt="Fierce Blace">
                <h3>Fierce Blace</h3>
                <p class="price">RM 105.00</p>
                <p class="stock">Stock: 9</p>
                <p class="desc">Intense amber with pepper and warm tobacco musk.</p>
            </div>
        </div>
    </section>

    <!-- WOMEN Section -->
    <section>
        <h2 class="category-title">For Women</h2>
        <div class="perfume-grid">
            <div class="perfume-card">
                <img src="images/image5.jpeg" alt="Rose Delight">
                <h3>Rose Delight</h3>
                <p class="price">RM 88.00</p>
                <p class="stock">Stock: 11</p>
                <p class="desc">Romantic rose petals, lychee, and a silky trail.</p>
            </div>

            <div class="perfume-card">
                <img src="images/image6.jpg" alt="Vanilla Bloom">
                <h3>Vanilla Bloom</h3>
                <p class="price">RM 78.00</p>
                <p class="stock">Stock: 10</p>
                <p class="desc">Warm vanilla, caramel, and soft floral notes.</p>
            </div>

            <div class="perfume-card">
                <img src="images/image7.jpg" alt="Silk Musk">
                <h3>Silk Musk</h3>
                <p class="price">RM 81.00</p>
                <p class="stock">Stock: 13</p>
                <p class="desc">Powdery musk and floral whispers, elegant and smooth.</p>
            </div>

            <div class="perfume-card">
                <img src="images/image8.webp" alt="Blush Pink">
                <h3>Blush Pink</h3>
                <p class="price">RM 90.00</p>
                <p class="stock">Stock: 7</p>
                <p class="desc">Sweet berries, rose water, and a playful pink aura.</p>
            </div>
        </div>
    </section>

    <!-- COUPLE Section -->
    <section>
        <h2 class="category-title">For Couples</h2>
        <div class="perfume-grid">
            <div class="perfume-card">
                <img src="images/image9.webp" alt="Sweet Harmony">
                <h3>Sweet Harmony</h3>
                <p class="price">RM 110.00</p>
                <p class="stock">Stock: 10</p>
                <p class="desc">Balanced blend of floral, musk, and spice for two.</p>
            </div>

            <div class="perfume-card">
                <img src="images/image10.webp" alt="Dual Bloom">
                <h3>Dual Bloom</h3>
                <p class="price">RM 112.00</p>
                <p class="stock">Stock: 8</p>
                <p class="desc">His and hers floral burst with citrus and amber core.</p>
            </div>

            <div class="perfume-card">
                <img src="images/image11.jpg" alt="Lovers Bond">
                <h3>Lovers Bond</h3>
                <p class="price">RM 115.00</p>
                <p class="stock">Stock: 6</p>
                <p class="desc">Passionate vanilla, musk, and harmony in a bottle.</p>
            </div>

            <div class="perfume-card">
                <img src="images/image12.jpeg" alt="Sunset Duo">
                <h3>Sunset Duo</h3>
                <p class="price">RM 118.00</p>
                <p class="stock">Stock: 9</p>
                <p class="desc">Golden hour vibes of fruits, woods, and warmth.</p>
            </div>
        </div>
    </section>
</body>
</html>
    