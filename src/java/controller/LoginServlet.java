    /*
     * To change this license header, choose License Headers in Project Properties.
     * To change this template file, choose Tools | Templates
     * and open the template in the editor.
     */

    //default construcctor == pkai setter()

    /*normal consttructor
    LoginBean loginBean = new LoginBean(username,password);
    */
    package controller;
    import bean.LoginBean;
    import dao.LoginDao;

    import java.io.IOException;
    import java.io.PrintWriter;
    import javax.servlet.ServletException;
    import javax.servlet.annotation.WebServlet;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    import javax.servlet.http.HttpSession;

    /**
     *
     * @author aria
     */

    public class LoginServlet extends HttpServlet {

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
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            String user_username = request.getParameter("user_username");
            String user_password = request.getParameter("user_password");

            LoginBean loginBean = new LoginBean();
            loginBean.setUser_username(user_username);
            loginBean.setUser_password(user_password);


            LoginDao loginDao = new LoginDao();

            String userValidate = loginDao.authenticate(loginBean);
            HttpSession session = request.getSession();

            System.out.println("userValidate = " + userValidate);

            if(userValidate.equals("SUCCESS")){
    session.setAttribute("user_username", user_username);  // <-- This is important
    request.setAttribute("user_username", user_username);  // optional
    request.getRequestDispatcher("customer_dashboard.jsp").forward(request,response);       
}

            else{
                request.setAttribute("errMessage", userValidate);
                request.getRequestDispatcher("login.jsp").forward(request, response);
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
