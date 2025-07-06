<%@ page import="java.util.*" %>
<%
    List<Map<String, String>> perfumeList = (List<Map<String, String>>) request.getAttribute("perfumeList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Perfume</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f5f5f5;
            margin: 30px;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            border-collapse: collapse;
            width: 90%;
            margin: 0 auto;
            background: white;
        }
        th, td {
            padding: 12px;
            border: 1px solid #aaa;
            text-align: center;
        }
        th {
            background-color: #333;
            color: white;
        }
        form {
            margin: 0;
        }
        input[type=submit] {
            background-color: black;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #555;
        }
        .back-btn {
            margin-top: 40px;
            text-align: center;
        }
        .back-btn a button {
            background-color: black;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }
        .back-btn a button:hover {
            background-color: #333;
        }
    </style>
</head>
<body>

<h1>Edit Perfume</h1>

<table>
    <tr>
        <th>ID</th><th>Name</th><th>Category ID</th><th>Price</th><th>Stock</th><th>Action</th>
    </tr>
    <%
        for (Map<String, String> perfume : perfumeList) {
    %>
        <tr>
            <td><%= perfume.get("id") %></td>
            <td><%= perfume.get("name") %></td>
            <td><%= perfume.get("category") %></td>
            <td><%= perfume.get("price") %></td>
            <td><%= perfume.get("stock") %></td>
            <td>
                <form method="post" action="EditPerfumeDetailsServlet">
                    <input type="hidden" name="perfume_id" value="<%= perfume.get("id") %>">
                    <input type="submit" value="Edit">
                </form>
            </td>
        </tr>
    <%
        }
    %>
</table>

<div class="back-btn">
    <a href="admin.jsp">
        <button>Back to Dashboard</button>
    </a>
</div>

</body>
</html>
