package dao;

import bean.AdminLoginBean;
import java.sql.*;

public class AdminDao {
    public String authenticate(AdminLoginBean loginBean) {
        String admin_username = loginBean.getAdmin_username();
        String admin_password = loginBean.getAdmin_password();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/Perfume", "Perfume1", "app");

            String sql = "SELECT * FROM ADMIN WHERE ADMIN_USERNAME = ? AND ADMIN_PASSWORD = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, admin_username);
            stmt.setString(2, admin_password);

            rs = stmt.executeQuery();

            if (rs.next()) {
                return "SUCCESS";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return "Invalid credentials";
    }
}
