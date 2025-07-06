package controller;

import dao.CartDAO;
import bean.CartItem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.sql.*;
import java.util.*;

@WebServlet("/cart-data")
public class CartDataServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = 1; // fixed for demo

        response.setContentType("text/javascript");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Perfume", "Perfume1", "app");
            CartDAO cartDAO = new CartDAO(conn);
            List<CartItem> items = cartDAO.getCartItems(userId);

            out.println("const syncedCart = {};");
            for (CartItem item : items) {
                out.printf("syncedCart[%d] = %d;%n", item.getPerfumeId(), item.getQuantity());
            }
            out.println("localStorage.setItem('cart', JSON.stringify(syncedCart));");
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
