package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import dao.CartDAO;
import dao.OrderDao;
import dao.PaymentDao;

public class PaymentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = 1; // Assume static user
        boolean applyCoupon = "on".equals(request.getParameter("applyCoupon"));
        String method = request.getParameter("method");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Perfume", "Perfume1", "app");

            CartDAO cartDao = new CartDAO(conn);
            double total = cartDao.getTotalAmount(userId);
            int quantity = cartDao.countItemsInCart(userId);

            if (applyCoupon && quantity >= 3) {
                total *= 0.9; // Apply 10% discount
            }

            OrderDao orderDao = new OrderDao(conn);
            int orderId = orderDao.createOrder(userId, total, applyCoupon);

            PaymentDao paymentDao = new PaymentDao(conn);
            paymentDao.addPayment(orderId, total, method);

            // Clear cart
            cartDao.clearCart(userId);

            conn.close();

            response.sendRedirect("success.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
