package controller;

import dao.CartDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.sql.*;
import java.util.*;

@WebServlet("/CartController")
public class CartController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = 1; // fixed user ID

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/Perfume", "Perfume1", "app"
            );
            CartDAO cartDAO = new CartDAO(conn);

            String action = request.getParameter("action");

            if ("addMultiple".equals(action)) {
                // Handle bulk add from form
                Map<String, String[]> paramMap = request.getParameterMap();
                for (String key : paramMap.keySet()) {
                    if (key.startsWith("qty_")) {
                        int perfumeId = Integer.parseInt(key.substring(4));
                        int quantity = Integer.parseInt(request.getParameter(key));
                        if (quantity > 0) {
                            cartDAO.addToCart(userId, perfumeId, quantity);
                        }
                    }
                }
            } else {
                // Handle single item add/increase/decrease/remove
                int perfumeId = Integer.parseInt(request.getParameter("id"));
                switch (action) {
                    case "add":
                        cartDAO.addToCart(userId, perfumeId, 1);
                        break;
                    case "increase":
                        cartDAO.increaseQuantity(userId, perfumeId);
                        break;
                    case "decrease":
                        cartDAO.decreaseQuantity(userId, perfumeId);
                        break;
                    case "remove":
                        cartDAO.removeItem(userId, perfumeId);
                        break;
                }
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("cart.jsp");
    }
}
