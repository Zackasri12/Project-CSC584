

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String error = (String) request.getAttribute("errorMsgs");
            if (error != null) {%>
        <p style="color:red;"><%= error%></p>
        <% }%>
        <h1>Register User</h1>
        <form action="RegisterServlet" method="post">
            <label for="user_name">Name</label>
            <input type="text" id="user_name" name="user_name" required><br><br>
            
            <label for="user_email">Email</label>
            <input type="text" id="user_email" name="user_email" required><br><br>
            
            <label for="user_username">Username</label>
            <input type="text" id="user_username" name="user_username" required><br><br>
            
            <label for="user_password">Password</label>
            <input type="text" id="user_password" name="user_password" required><br><br>
               
            <label for="user_password">Confirm Password</label>
            <input type="text" id="cpassword" name="cpassword" required><br><br>

            <input type="submit" value="Confirm Registration">
            <input type="reset" value="Reset">
        </form>
    </body>
</html>
