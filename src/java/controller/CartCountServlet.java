package controller;

import dao.CartDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

@WebServlet("/cart-count")
public class CartCountServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = 1; // Fixed user
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/Perfume", "Perfume1", "app");
            CartDAO dao = new CartDAO(conn);

            int count = dao.countItemsInCart(userId);
            out.print(count);

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.print("0"); // Default to 0 if error
        }
    }
}
