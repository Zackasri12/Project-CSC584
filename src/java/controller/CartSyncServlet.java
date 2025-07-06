package controller;

import dao.CartDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.sql.*;
import java.util.*;

@WebServlet("/CartSyncServlet")
public class CartSyncServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = 1; // fixed user

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/Perfume", "Perfume1", "app"
            );

            CartDAO cartDAO = new CartDAO(conn);
            cartDAO.clearCart(userId);

            Enumeration<String> paramNames = request.getParameterNames();
            while (paramNames.hasMoreElements()) {
                String param = paramNames.nextElement();
                if (param.startsWith("qty_")) {
                    int perfumeId = Integer.parseInt(param.substring(4));
                    int qty = Integer.parseInt(request.getParameter(param));
                    if (qty > 0) {
                        cartDAO.addToCart(userId, perfumeId, qty);
                    }
                }
            }

            conn.close();
            response.sendRedirect("cart.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp");
        }
    }
}
