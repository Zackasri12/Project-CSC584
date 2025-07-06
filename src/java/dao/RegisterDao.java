/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.LoginBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import util.DBConnection;
import bean.RegisterBean;

/**
 *
 * @author asria
 */
public class RegisterDao {

    public String registerUser(RegisterBean registerBean) {
        int user_id = 0;
        String user_name = registerBean.getUser_name();
        String user_email = registerBean.getUser_email();
        String user_username = registerBean.getUser_username();
        String user_password = registerBean.getUser_password();


        Connection con = null;
        ResultSet rs = null;
        Statement stmt = null;
        PreparedStatement prstmt = null;

        try {
            con = DBConnection.createConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("Select * from users ");

            while (rs.next()) {
                user_id = rs.getInt("USER_ID");
            }
            user_id++;
            prstmt = con.prepareStatement("INSERT INTO users (user_username, user_password, user_name, user_email) VALUES (?, ?, ?, ? )");
            prstmt.setString(1, user_username);
            prstmt.setString(2, user_password);
            prstmt.setString(3, user_name);
            prstmt.setString(4, user_email);


            
            prstmt.executeUpdate();
            return "SUCCESS";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Failed";
        }
    }
}
