/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OrderDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Coupon;
import model.Product;

/**
 *
 * @author Admin
 */
public class AddCouponController extends BaseRequiredAdminLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("addcoupon.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAO db = new OrderDAO();
        Coupon c = new Coupon();
        if (request.getParameter("type").equals("0") && Integer.parseInt(request.getParameter("discount")) >= 100) {
            request.setAttribute("invalid", "Coupon which is percent minus cant have discount more than 100!");
            request.getRequestDispatcher("addcoupon.jsp").forward(request, response);
        } else if (Date.valueOf(request.getParameter("from")).compareTo(Date.valueOf(request.getParameter("to"))) > 0) {
            request.setAttribute("invalid", "Date from have to occur before date to!");
            request.getRequestDispatcher("addcoupon.jsp").forward(request, response);
        } else {
            c.setCode(request.getParameter("code"));
            Boolean type;
            type = request.getParameter("type").equals("0");
            c.setType(type);
            c.setDiscount(Integer.parseInt(request.getParameter("discount")));
            c.setFrom(Date.valueOf(request.getParameter("from")));
            c.setTo(Date.valueOf(request.getParameter("to")));
            db.createCoupon(c);
            request.setAttribute("success", "Coupon is added successfully!");
            request.getRequestDispatcher("addcoupon.jsp").forward(request, response);
        }
    }

}
