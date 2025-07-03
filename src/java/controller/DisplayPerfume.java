package controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Servlet to display perfumes from DB and send to JSP.
 */
public class DisplayPerfume extends HttpServlet {

    // Perfume data model
    public static class Perfume {
        public String name, image, description, category;
        public double price;
        public int stock;

        public Perfume(String name, double price, int stock, String description, String image, String category) {
            this.name = name;
            this.price = price;
            this.stock = stock;
            this.description = description;
            this.image = image;
            this.category = category;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Update with your DB credentials
        String jdbcURL = "jdbc:mysql://localhost:3306/myresume?useSSL=false&serverTimezone=UTC";
        String dbUser = "root";
        String dbPassword = "yourpassword";

        ArrayList<Perfume> perfumes = new ArrayList<>();

        try {
            // Load JDBC driver (for MySQL 8.x)
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String sql = "SELECT p.perfume_name, p.price, p.stock, p.description, p.image_url, c.category_name " +
                         "FROM Perfume p JOIN Category c ON p.category_id = c.category_id";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Perfume p = new Perfume(
                    rs.getString("perfume_name"),
                    rs.getDouble("price"),
                    rs.getInt("stock"),
                    rs.getString("description"),
                    rs.getString("image_url"),
                    rs.getString("category_name")
                );
                perfumes.add(p);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Send data to display.jsp
        request.setAttribute("perfumes", perfumes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
        dispatcher.forward(request, response);
    }

    // POST redirects to GET
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Displays all perfumes with stock from DB";
    }
}
