/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author asria
 */
public class AdminLoginBean {
    public String admin_username;
    public String admin_email;
    public String admin_name;
    public String admin_password;

    public AdminLoginBean(String admin_username, String admin_email, String admin_name, String admin_password) {
        this.admin_username = admin_username;
        this.admin_email = admin_email;
        this.admin_name = admin_name;
        this.admin_password = admin_password;
    }
    
    public AdminLoginBean() {
        this.admin_username = "";
        this.admin_email = "";
        this.admin_name = "";
        this.admin_password = "";
    }

    public String getAdmin_username() {
        return admin_username;
    }

    public String getAdmin_email() {
        return admin_email;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_username(String admin_username) {
        this.admin_username = admin_username;
    }

    public void setAdmin_email(String admin_email) {
        this.admin_email = admin_email;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }
    
    
    
}
