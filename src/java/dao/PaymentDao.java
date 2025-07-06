package dao;
import java.sql.*;
import bean.PaymentBean;

public class PaymentDao {
    private Connection conn;

    public PaymentDao(Connection conn) {
        this.conn = conn;
    }

    public void addPayment(int orderId, double amount, String method) throws SQLException {
        String sql = "INSERT INTO Payment(order_id, amount, method) VALUES (?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, orderId);
        ps.setDouble(2, amount);
        ps.setString(3, method);
        ps.executeUpdate();
    }
}

