/*
 * LoginDao.java - Handles user authentication from database
 */
package dao;

import bean.LoginBean;
import java.sql.*;
import util.DBConnection;

public class LoginDao {

    public String authenticate(LoginBean loginBean) {
        String username = loginBean.getUser_username();
        String password = loginBean.getUser_password();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Create database connection
            con = DBConnection.createConnection();

            // Use PreparedStatement to avoid SQL injection
            String query = "SELECT user_password FROM users WHERE user_username = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                String passwordDB = rs.getString("user_password");
                if (password.equals(passwordDB)) {
                    return "SUCCESS";
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Always close ResultSet, PreparedStatement, and Connection
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return "Invalid user credentials";
    }
}
