package dao;

import bean.CartItem;
import java.sql.*;
import java.util.*;

public class CartDAO {
    private Connection conn;

    public CartDAO(Connection conn) {
        this.conn = conn;
    }

    // Clears all items from the user's cart
    public void clearCart(int userId) throws SQLException {
        PreparedStatement stmt = conn.prepareStatement("DELETE FROM Cart_Items WHERE user_id = ?");
        stmt.setInt(1, userId);
        stmt.executeUpdate();
    }

    // Adds item to cart with proper check for existing item
    public void addToCart(int userId, int perfumeId, int quantity) throws SQLException {
        String checkSql = "SELECT quantity FROM Cart_Items WHERE user_id=? AND perfume_id=?";
        PreparedStatement checkStmt = conn.prepareStatement(checkSql);
        checkStmt.setInt(1, userId);
        checkStmt.setInt(2, perfumeId);
        ResultSet rs = checkStmt.executeQuery();

        if (rs.next()) {
            // Item exists, update quantity
            int newQty = rs.getInt("quantity") + quantity;
            String updateSql = "UPDATE Cart_Items SET quantity=? WHERE user_id=? AND perfume_id=?";
            PreparedStatement updateStmt = conn.prepareStatement(updateSql);
            updateStmt.setInt(1, newQty);
            updateStmt.setInt(2, userId);
            updateStmt.setInt(3, perfumeId);
            updateStmt.executeUpdate();
        } else {
            // Item not in cart, insert new row
            String insertSql = "INSERT INTO Cart_Items (user_id, perfume_id, quantity) VALUES (?, ?, ?)";
            PreparedStatement insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setInt(1, userId);
            insertStmt.setInt(2, perfumeId);
            insertStmt.setInt(3, quantity);
            insertStmt.executeUpdate();
        }

        System.out.println("Added perfumeId " + perfumeId + " with qty " + quantity + " for userId " + userId);
    }

    public void increaseQuantity(int userId, int perfumeId) throws SQLException {
        String sql = "UPDATE Cart_Items SET quantity = quantity + 1 WHERE user_id=? AND perfume_id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, userId);
        stmt.setInt(2, perfumeId);
        stmt.executeUpdate();
    }

    public void decreaseQuantity(int userId, int perfumeId) throws SQLException {
        String getQtySql = "SELECT quantity FROM Cart_Items WHERE user_id=? AND perfume_id=?";
        PreparedStatement getQtyStmt = conn.prepareStatement(getQtySql);
        getQtyStmt.setInt(1, userId);
        getQtyStmt.setInt(2, perfumeId);
        ResultSet rs = getQtyStmt.executeQuery();

        if (rs.next()) {
            int currentQty = rs.getInt("quantity");
            if (currentQty <= 1) {
                removeItem(userId, perfumeId);
            } else {
                String sql = "UPDATE Cart_Items SET quantity = quantity - 1 WHERE user_id=? AND perfume_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, userId);
                stmt.setInt(2, perfumeId);
                stmt.executeUpdate();
            }
        }
    }

    public void removeItem(int userId, int perfumeId) throws SQLException {
        String sql = "DELETE FROM Cart_Items WHERE user_id=? AND perfume_id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, userId);
        stmt.setInt(2, perfumeId);
        stmt.executeUpdate();
    }

    public List<CartItem> getCartItems(int userId) throws SQLException {
        List<CartItem> cart = new ArrayList<>();

        String sql = "SELECT c.perfume_id, c.quantity, p.name, p.price, p.image " +
                     "FROM Cart_Items c JOIN Perfume p ON c.perfume_id = p.id " +
                     "WHERE c.user_id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, userId);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            int perfumeId = rs.getInt("perfume_id");
            int quantity = rs.getInt("quantity");
            String name = rs.getString("name");
            double price = rs.getDouble("price");
            String image = rs.getString("image");

            cart.add(new CartItem(userId, perfumeId, name, price, quantity, image));
        }

        return cart;
    }

    public int countItemsInCart(int userId) throws SQLException {
        String sql = "SELECT SUM(quantity) AS total FROM Cart_Items WHERE user_id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, userId);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            return rs.getInt("total");
        }
        return 0;
    }
    public double getTotalAmount(int userId) throws SQLException {
    String sql = "SELECT SUM(c.quantity * p.price) AS total FROM Cart_Items c JOIN Perfume p ON c.perfume_id = p.id WHERE c.user_id=?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setInt(1, userId);
    ResultSet rs = stmt.executeQuery();
    if (rs.next()) {
        return rs.getDouble("total");
    }
    return 0.0;
}
    
    
}
