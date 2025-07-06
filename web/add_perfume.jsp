<%@ page import="java.util.*" %>
<%
    List<String[]> categoryList = (List<String[]>) request.getAttribute("categoryList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Perfume</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 50px;
        }
        .form-box {
            background-color: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
            width: 100%;
            max-width: 500px;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #111;
        }
        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #aaa;
        }
        input[type=submit],
        .back-button {
            background-color: black;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px;
            font-weight: bold;
            border-radius: 5px;
            width: 100%;
        }
        input[type=submit]:hover,
        .back-button:hover {
            background-color: #333;
        }
        .back-button-link {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="form-box">
        <h2>Add New Perfume</h2>
        <form action="AddPerfumeServlet" method="post">
            <input type="text" name="perfume_name" placeholder="Perfume Name" required>

            <select name="category_id" required>
                <option value="">-- Select Category --</option>
                <% for (String[] cat : categoryList) { %>
                    <option value="<%= cat[0] %>"><%= cat[1] %></option>
                <% } %>
            </select>

            <input type="text" name="price" placeholder="Price (e.g. 99.99)" required>
            <input type="text" name="stock" placeholder="Stock (e.g. 100)" required>
            <textarea name="description" placeholder="Description" rows="3" required></textarea>
            <input type="text" name="image_url" placeholder="Image URL (or path)" required>
            <input type="submit" value="Add Perfume">
        </form>

        <br>
        <a href="admin.jsp" class="back-button-link">
            <button class="back-button">Back to Dashboard</button>
        </a>
    </div>
</body>
</html>
