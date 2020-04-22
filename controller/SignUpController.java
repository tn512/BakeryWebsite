/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Admin
 */
public class SignUpController extends HttpServlet {

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
        request.getRequestDispatcher("signup.jsp").forward(request, response);
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
        UserDAO db = new UserDAO();
        if (!request.getParameter("password").equals(request.getParameter("repassword"))) {
            request.setAttribute("invalid", "Repassword is not equal to password!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else if (!request.getParameter("phone").matches("(09|01[2|6|8|9])+([0-9]{8})")) {
            request.setAttribute("invalid", "Phone number is invalid!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else if(!db.checkEmail(request.getParameter("email"))){
            request.setAttribute("invalid", "This email has already existed!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            User user = new User();
            user.setEmail(request.getParameter("email"));
            user.setPassword(request.getParameter("password"));
            user.setFirstName(request.getParameter("firstName"));
            user.setLastName(request.getParameter("lastName"));
            user.setPhone(request.getParameter("phone"));
            user.setBirthdate(Date.valueOf(request.getParameter("birthdate")));
            user.setAddress(request.getParameter("address"));
            user.setRole(true);
            db.createUser(user);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
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
