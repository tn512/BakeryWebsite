package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

public class SignInController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDAO db = new UserDAO();
        User user = db.getUserByEmailAndPassword(email, password);
        if (user != null) {//Login successfully
            String remember = request.getParameter("remember");
            if (remember != null) {
                Cookie c_userEmail = new Cookie("email", email);
                Cookie c_userPassword = new Cookie("password", password);
                Cookie c_userId = new Cookie("id", String.valueOf(user.getUser_id()));
                c_userEmail.setMaxAge(3600 * 24 * 30);
                c_userPassword.setMaxAge(3600 * 24 * 30);
                c_userId.setMaxAge(3600 * 24 * 30);
                response.addCookie(c_userEmail);
                response.addCookie(c_userPassword);
                response.addCookie(c_userId);
            }
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else //Login fail
        {
            request.setAttribute("invalid", "Email/Password is incorrect.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
