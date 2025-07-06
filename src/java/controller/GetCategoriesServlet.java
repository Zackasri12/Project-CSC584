package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

public class GetCategoriesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        List<String[]> categories = new ArrayList<>();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/Perfume", "Perfume1", "app");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT category_id, category_name FROM Category");

            while (rs.next()) {
                String[] cat = new String[2];
                cat[0] = rs.getString("category_id");
                cat[1] = rs.getString("category_name");
                categories.add(cat);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Hantar ke JSP
        request.setAttribute("categoryList", categories);
        RequestDispatcher rd = request.getRequestDispatcher("add_perfume.jsp");
        rd.forward(request, response);
    }
}
