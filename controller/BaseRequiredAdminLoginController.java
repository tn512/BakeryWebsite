/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Admin
 */
public abstract class BaseRequiredAdminLoginController extends HttpServlet {

    private boolean isLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null && user.isRole() == false) { //OK
            return true;
        } else {
            //Check Cookie remember
            Cookie[] cookie = request.getCookies();
            if (cookie == null) { //No Cookie
                return false;
            } else {
                String email = null;
                String password = null;
                for (Cookie cooky : cookie) {
                    if (cooky.getName().equals("email")) {
                        email = cooky.getValue();
                    }
                    if (cooky.getName().equals("password")) {
                        email = cooky.getValue();
                    }
                    if (email != null && password != null) {
                        break;
                    }
                }
                if (email != null && password != null) {
                    UserDAO db = new UserDAO();
                    user = db.getUserByEmailAndPassword(email, password);
                    if (user != null && user.isRole() == false) { //valid user
                        session.setAttribute("user", user);
                        return true;
                    } else { //invalid username /  password 
                        return false;
                    }
                } else {
                    return false;
                }
            }
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
        if (isLoggedIn(request)) {
            processGet(request, response);
        } else {
            request.getRequestDispatcher("checkadminlogin.jsp").forward(request, response);
        }
    }

    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;

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
        if (isLoggedIn(request)) {
            processPost(request, response);
        } else {
            request.getRequestDispatcher("checkadminlogin.jsp").forward(request, response);
        }
    }

    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;

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
