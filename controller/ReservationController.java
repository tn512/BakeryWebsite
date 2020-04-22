/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ReservationDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Reservation;
import model.User;

/**
 *
 * @author Admin
 */
public class ReservationController extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ReservationDAO db = new ReservationDAO();
        Reservation reservation = new Reservation();
        reservation.setEmail(request.getParameter("email"));
        reservation.setFirstName(request.getParameter("firstName"));
        reservation.setLastName(request.getParameter("lastName"));
        reservation.setPhone(request.getParameter("phone"));
        reservation.setAttendance(Integer.parseInt(request.getParameter("attendance")));
        reservation.setNote(request.getParameter("note"));
        reservation.setDate(Date.valueOf(request.getParameter("date")));
        reservation.setTime(request.getParameter("hour")+":"+request.getParameter("min"));
        try {
            reservation.setUser_id(user.getUser_id());
        } catch (Exception e) {
            reservation.setUser_id(0);
        }
        db.createReservation(reservation);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
