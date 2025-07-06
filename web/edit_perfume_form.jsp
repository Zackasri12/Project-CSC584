<%@ page import="java.util.*" %>
<%
    Map<String, String> perfume = (Map<String, String>) request.getAttribute("perfume");
    List<Map<String, String>> categories = (List<Map<String, String>>) request.getAttribute("categories");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Perfume</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f8f8f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .edit-box {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
            width: 400px;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
        }
        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #aaa;
            border-radius: 5px;
        }
        input[type=submit] {
            background-color: black;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form class="edit-box" action="UpdatePerfumeServlet" method="post">
        <h2>Edit Perfume</h2>
        <input type="hidden" name="perfume_id" value="<%= perfume.get("id") %>">

        <input type="text" name="perfume_name" value="<%= perfume.get("name") %>" placeholder="Name" required>

        <select name="category_id" required>
            <% for (Map<String, String> category : categories) { 
                String selected = category.get("id").equals(perfume.get("category")) ? "selected" : "";
            %>
                <option value="<%= category.get("id") %>" <%= selected %>><%= category.get("name") %></option>
            <% } %>
        </select>

        <div class="input-wrapper">
    <span class="prefix">RM</span>
    <input type="text" name="price" value="<%= perfume.get("price") %>" placeholder="Price" required>
</div>

        <input type="number" name="stock" value="<%= perfume.get("stock") %>" placeholder="Stock" required>
        <textarea name="description" rows="3" placeholder="Description"><%= perfume.get("description") %></textarea>
        <input type="text" name="image_url" value="<%= perfume.get("image") %>" placeholder="Image URL">

        <input type="submit" value="Update">
    </form>
</body>
</html>
