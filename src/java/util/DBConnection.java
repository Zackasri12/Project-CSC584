/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.*;


/**
 *
 * @author asria
 */
public class DBConnection {
    
    public static Connection createConnection() {
    Connection con = null;
    String url = "jdbc:derby://localhost:1527/Perfume";
    String username = "Perfume1";
    String password = "app";
    try {
        try{
            Class.forName("org.apache.derby.ClientDriver");
        }catch(ClassNotFoundException e){
    }
        con = DriverManager.getConnection(url,username,password);
        System.out.println ("Printing connection object" + con);
    }catch (Exception e){
        e.printStackTrace();
    }
    return con;
    }
}
