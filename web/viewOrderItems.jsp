<%@ page import="java.util.*, java.sql.*, bean.OrderBean" %>
<%@ page import="dao.OrderDao" %>

<%
    String username = (String) session.getAttribute("user_username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List orders = new ArrayList(); // ? Use raw types for Java 1.5 compatibility

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Perfume", "Perfume1", "app");
        OrderDao orderDao = new OrderDao(conn);
        orders = orderDao.getOrdersByUserId(1); // Replace 1 with session-based user_id if available
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    
    <title>Order History</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            background-color: #fdfdfd;
        }
        h2 {
            color: #333;
        }
        table {
            width: 90%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
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
        
        th, td {
            padding: 14px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #ffe4e1;
            color: #222;
        }
        tr:nth-child(even) {
            background-color: #fafafa;
        }
    </style>
</head>
<body>
    <a class="back-btn" href="customer_dashboard.jsp"> Home</a>

<h2>Your Order History</h2>

<% if (orders.isEmpty()) { %>
    <p>No orders found.</p>
<% } else { %>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Date</th>
            <th>Total Amount (RM)</th>
            <th>Payment Method</th>
        </tr>

        <% 
            for (int i = 0; i < orders.size(); i++) {
                OrderBean order = (OrderBean) orders.get(i);
        %>
            <tr>
                <td><%= order.getId() %></td>
                <td><%= order.getDate() %></td>
                <td><%= order.getAmount() %></td>
                <td><%= order.getMethod() %></td>
            </tr>
        <% } %>
    </table>
<% } %>

</body>
</html>
