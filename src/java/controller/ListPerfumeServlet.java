package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

public class ListPerfumeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, Object>> perfumeList = new ArrayList<>();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/Perfume", "Perfume1", "app");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Perfume");

            while (rs.next()) {
                Map<String, Object> perfume = new HashMap<>();
                perfume.put("id", rs.getInt("perfume_id"));
                perfume.put("name", rs.getString("perfume_name"));
                perfume.put("category", rs.getInt("category_id"));
                perfume.put("price", rs.getDouble("price"));
                perfume.put("stock", rs.getInt("stock"));
                perfume.put("description", rs.getString("description"));
                perfume.put("image", rs.getString("image_url"));
                perfumeList.add(perfume);
            }

            conn.close();
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
        }

        request.setAttribute("perfumes", perfumeList);
        RequestDispatcher rd = request.getRequestDispatcher("list_perfume.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}