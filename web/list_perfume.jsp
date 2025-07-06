<%@ page import="java.util.*, java.text.DecimalFormat" %>
<%
    List<Map<String, Object>> perfumes = (List<Map<String, Object>>) request.getAttribute("perfumes");
    DecimalFormat df = new DecimalFormat("0.00");
%>
<!DOCTYPE html>
<html>
<head>
    <title>View All Perfumes</title>
    <style>
        body {
            font-family: Arial;
            background-color: #fff;
            color: #111;
            margin: 30px;
        }
        h1 {
            text-align: center;
        }
        table {
            margin: auto;
            border-collapse: collapse;
            width: 90%;
        }
        th, td {
            padding: 10px;
            border: 1px solid #333;
            text-align: center;
        }
        th {
            background-color: #000;
            color: #fff;
        }
        img {
            width: 100px;
        }
        .back-button {
            text-align: center;
            margin-top: 30px;
        }
        .back-button a {
            text-decoration: none;
            background-color: black;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
        }
        .back-button a:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
    <h1>All Perfumes</h1>

    <%
        if (perfumes != null && !perfumes.isEmpty()) {
    %>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category ID</th>
                <th>Price (RM)</th>
                <th>Stock</th>
                <th>Description</th>
                <th>Image</th>
            </tr>
            <%
                for (Map<String, Object> p : perfumes) {
            %>
            <tr>
                <td><%= p.get("id") %></td>
                <td><%= p.get("name") %></td>
                <td><%= p.get("category") %></td>
                <td>RM <%= df.format(p.get("price")) %></td>
                <td><%= p.get("stock") %></td>
                <td><%= p.get("description") %></td>
                <td><img src="<%= p.get("image") %>" alt="Image"></td>
            </tr>
            <% } %>
        </table>
    <% } else { %>
        <p style="text-align:center;">No perfumes available.</p>
    <% } %>

    <div class="back-button">
        <a href="admin.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
