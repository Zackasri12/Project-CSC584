package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddPerfumeServlet extends HttpServlet {

    // Kalau admin tersalah buka URL ni direct (GET), redirect ke form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.sendRedirect("GetCategoriesServlet"); // Form add perfume
    }

    // Bila admin submit form, data dihantar sebagai POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // Ambil data dari form
        String name = request.getParameter("perfume_name");
        String category = request.getParameter("category_id");
        String price = request.getParameter("price");
        String stock = request.getParameter("stock");
        String description = request.getParameter("description");
        String image = request.getParameter("image_url");

        try {
            // Load database driver Derby
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            // Sambung ke perfumeDB
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/Perfume", "Perfume1", "app");

            // SQL untuk insert perfume baru
            String sql = "INSERT INTO Perfume (perfume_name, category_id, price, stock, description, image_url) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setInt(2, Integer.parseInt(category));
            stmt.setDouble(3, Double.parseDouble(price));
            stmt.setInt(4, Integer.parseInt(stock));
            stmt.setString(5, description);
            stmt.setString(6, image);

            // Execute
            stmt.executeUpdate();

            // Redirect lepas berjaya
            response.sendRedirect("AddPerfumeServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
