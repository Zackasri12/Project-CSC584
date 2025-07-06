    <%-- 
        Document   : oderHistory
        Created on : Jul 6, 2025, 4:08:54 PM
        Author     : asria
    --%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, java.sql.*, dao.OrderDao, bean.OrderBean" %>
    <%
        List<OrderBean> orders = new ArrayList<OrderBean>();
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Perfume", "Perfume1", "app");

            OrderDao orderDao = new OrderDao(conn);
            orders = orderDao.getOrdersByUserId(1); // Hardcoded user ID
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <!DOCTYPE html>
    <html>
    <head>
        <title>Order History</title>
        
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 30px;
                background-color: #f5f5f5;
            }

            h2 {
                text-align: center;
                color: #333;
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


            table {
                width: 80%;
                margin: auto;
                background-color: #fff;
                border-collapse: collapse;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }

            th, td {
                padding: 15px;
                border-bottom: 1px solid #ddd;
                text-align: center;
            }

            th {
                background-color: #ff9a9e;
                color: white;
            }

            tr:hover {
                background-color: #f2f2f2;
            }

            .btn {
                background-color: #ff6f91;
                color: white;
                padding: 8px 14px;
                border: none;
                border-radius: 20px;
                text-decoration: none;
            }

        </style>
    </head>
    <body>
<a class="back-btn" href="customer_dashboard.jsp"> Home</a>
    <h2>Your Order History</h2>

    <% if (orders.isEmpty()) { %>
        <p style="text-align:center;">You have not placed any orders yet.</p>
    <% } else { %>
        <table>
            <tr>
                <th>Order ID</th>
                <th>Date</th>
                <th>Total Amount (RM)</th>
                <th>Payment Method</th>
                <th>Action</th>
            </tr>
            <% for (OrderBean order : orders) { %>
                <tr>
                    <td><%= order.getId() %></td>
                    <td><%= order.getDate() %></td>
                    <td><%= String.format("%.2f", order.getAmount()) %></td>
                    <td><%= order.getMethod() %></td>
                    <td>
                        <a class="btn" href="viewOrderItems.jsp?orderId=<%= order.getId() %>">View Items</a>
                    </td>
                </tr>
            <% } %>
        </table>
    <% } %>

    </body>
    </html>

