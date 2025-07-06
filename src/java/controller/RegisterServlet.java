/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import bean.RegisterBean;
import dao.RegisterDao;

/**
 *
 * @author asria
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String errorMsgs = "";
        String user_username = request.getParameter("user_username");
        String user_password = request.getParameter("user_password");
        String user_name = request.getParameter("user_name");
        String user_email = request.getParameter("user_email");
        String cpassword = request.getParameter("cpassword");
        

        RegisterBean rb = new RegisterBean();
        rb.setUser_username(user_username);
        rb.setUser_password(user_password);
        rb.setUser_name(user_name);
        rb.setUser_email(user_email);
       

        if ((user_name == null) || user_name.length() == 0) {
            errorMsgs = "Please enter your name";
        }

        if (!user_password.equals(cpassword)) {
            errorMsgs = "Password does not match!";
        }
        
        if(errorMsgs.isEmpty()){
            
        }

        RegisterDao rd = new RegisterDao();

        String register = rd.registerUser(rb);
        
        if(register.equalsIgnoreCase("SUCCESS")){
            request.setAttribute("user_username", user_username);
            request.getRequestDispatcher("UserLogin.jsp").forward(request, response);
        }
        else {
            request.setAttribute("errorMsgs", errorMsgs);
            request.getRequestDispatcher("registration.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
