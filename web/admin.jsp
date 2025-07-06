<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String admin = (String) session.getAttribute("admin_username");
    if (admin == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Luxury Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Georgia', serif;
            background: linear-gradient(to right, #fff8f0, #f7f1e1);
            color: #4b3621;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 70px 20px;
        }

        .container {
            background-color: #fffdf7;
            padding: 50px;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 1000px;
            border: 3px solid #d4af37;
            animation: fadeIn 0.6s ease;
            position: relative;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(20px);}
            to {opacity: 1; transform: translateY(0);}
        }

        h1 {
            text-align: center;
            font-size: 34px;
            margin-bottom: 30px;
            color: #8b6b4e;
        }

        .nav {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }

        .nav a {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 18px;
            border: 2px solid #d4af37;
            border-radius: 14px;
            text-decoration: none;
            background: #fefbf7;
            font-weight: bold;
            color: #4b3621;
            transition: 0.3s ease;
            box-shadow: 0 4px 12px rgba(212, 175, 55, 0.15);
        }

        .nav a:hover {
            background-color: #d4af37;
            color: #fff;
            transform: scale(1.05);
        }

        .nav i {
            font-size: 28px;
            margin-bottom: 10px;
            color: #c8a13f;
        }

        .summary {
            text-align: center;
            margin-top: 40px;
        }

        .summary h2 {
            font-size: 26px;
            color: #7a5c3e;
            margin-bottom: 20px;
            border-bottom: 2px solid #d4af37;
            display: inline-block;
            padding-bottom: 6px;
        }

        .summary ul {
            list-style: none;
            padding: 0;
            font-size: 19px;
            margin-top: 20px;
        }

        .summary li {
            margin: 12px 0;
            color: #5e4b3c;
        }

        .logout {
            margin-top: 50px;
            display: flex;
            justify-content: center;
        }

        .logout input {
            background: linear-gradient(to right, #d4af37, #c29e34);
            color: white;
            padding: 14px 36px;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .logout input:hover {
            background: #b49730;
            transform: scale(1.03);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= admin %> </h1>

        <div class="nav">
            <a href="AddPerfumeServlet"><i class="fas fa-plus-circle"></i> Add New Perfume</a>
            <a href="EditPerfumeServlet"><i class="fas fa-edit"></i> Edit Perfume</a>
            <a href="ListPerfumeServlet"><i class="fas fa-list"></i> View All Perfumes</a>
            <a href="ManageCategoriesServlet"><i class="fas fa-tags"></i> Manage Categories</a>
            <a href="ManageUserServlet"><i class="fas fa-users"></i> Manage Users</a>
            <a href="AddCouponServlet"><i class="fas fa-gift"></i> Add New Coupon</a>
            <a href="ViewCouponServlet"><i class="fas fa-ticket-alt"></i> View/Delete Coupons</a>
        </div>

        <div class="summary">
            <%
                int totalUsers = 0, totalPerfumes = 0, totalCategories = 0;
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn = DriverManager.getConnection(
                        "jdbc:derby://localhost:1527/Perfume", "Perfume1", "app");

                    Statement stmt = conn.createStatement();
                    ResultSet rs1 = stmt.executeQuery("SELECT COUNT(*) FROM Users");
                    if (rs1.next()) totalUsers = rs1.getInt(1);

                    ResultSet rs2 = stmt.executeQuery("SELECT COUNT(*) FROM Perfume");
                    if (rs2.next()) totalPerfumes = rs2.getInt(1);

                    ResultSet rs3 = stmt.executeQuery("SELECT COUNT(*) FROM Category");
                    if (rs3.next()) totalCategories = rs3.getInt(1);

                    conn.close();
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                }
            %>
            <h2>Dashboard Summary</h2>
            <ul>
                <li><strong>Total Users:</strong> <%= totalUsers %></li>
                <li><strong>Total Perfumes:</strong> <%= totalPerfumes %></li>
                <li><strong>Total Categories:</strong> <%= totalCategories %></li>
            </ul>
        </div>

        <div class="logout">
            <form action="AdminLogoutServlet" method="post">
                <input type="submit" value="Logout">
            </form>
        </div>
    </div>
</body>
</html>
