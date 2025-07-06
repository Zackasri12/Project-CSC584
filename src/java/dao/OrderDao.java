package dao;

import java.sql.*;
import java.util.*;
import bean.OrderBean;
import bean.OrderItemBean;

public class OrderDao {
    private Connection conn;

    public OrderDao(Connection conn) {
        this.conn = conn;
    }

    public int createOrder(int userId, double amount, boolean couponApplied) throws SQLException {
        String sql = "INSERT INTO Orders(user_id, order_date) VALUES (?, CURRENT_TIMESTAMP)";
        PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1, userId);
        ps.executeUpdate();

        ResultSet rs = ps.getGeneratedKeys();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }

    public List<OrderBean> getOrdersByUserId(int userId) throws SQLException {
        List<OrderBean> orders = new ArrayList<OrderBean>();

        String sql = "SELECT o.id, o.order_date, p.amount, p.method " +
                     "FROM Orders o " +
                     "JOIN Payment p ON o.id = p.order_id " +
                     "WHERE o.user_id = ? " +
                     "ORDER BY o.order_date DESC";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            OrderBean order = new OrderBean();
            order.setId(rs.getInt("id"));
            order.setDate(rs.getTimestamp("order_date"));
            order.setAmount(rs.getDouble("amount"));
            order.setMethod(rs.getString("method"));
            orders.add(order);
        }

        return orders;
    }

    public List<OrderItemBean> getItemsByOrderId(int orderId) throws SQLException {
        List<OrderItemBean> items = new ArrayList<OrderItemBean>();

        String sql = "SELECT oi.perfume_id, oi.quantity, oi.price, p.name, p.image " +
                     "FROM Order_Items oi " +
                     "JOIN Perfume p ON oi.perfume_id = p.id " +
                     "WHERE oi.order_id = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, orderId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            OrderItemBean item = new OrderItemBean();
            item.setPerfumeId(rs.getInt("perfume_id"));
            item.setQuantity(rs.getInt("quantity"));
            item.setPrice(rs.getDouble("price"));
            item.setPerfumeName(rs.getString("name"));
            item.setPerfumeImage(rs.getString("image"));
            items.add(item);
        }

        return items;
    }
}
