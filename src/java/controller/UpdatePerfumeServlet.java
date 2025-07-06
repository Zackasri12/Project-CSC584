package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdatePerfumeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // Ambil parameter dari form
        int perfumeId = Integer.parseInt(request.getParameter("perfume_id"));
        String name = request.getParameter("perfume_name");
        int categoryId = Integer.parseInt(request.getParameter("category_id"));
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String description = request.getParameter("description");
        String imageUrl = request.getParameter("image_url");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/Perfume", "Perfume1    ", "app");

            String sql = "UPDATE Perfume SET perfume_name = ?, category_id = ?, price = ?, stock = ?, description = ?, image_url = ? WHERE perfume_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, name);
            stmt.setInt(2, categoryId);
            stmt.setDouble(3, price);
            stmt.setInt(4, stock);
            stmt.setString(5, description);
            stmt.setString(6, imageUrl);
            stmt.setInt(7, perfumeId);

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect balik ke EditPerfumeServlet
        response.sendRedirect("EditPerfumeServlet");
    }
}
