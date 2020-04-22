/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OrderDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Coupon;
import model.Item;
import model.Order;
import model.User;

/**
 *
 * @author Admin
 */
public class CheckoutController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("cart")==null) {
            request.setAttribute("invalid", "You do not have any product in your shopping cart!");
            request.getRequestDispatcher("shoppingcart.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            processGet(request, response);
        } else {
            if (action.equalsIgnoreCase("coupon")) {
                try {
                    doPostCoupon(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (action.equalsIgnoreCase("order")) {
                doPostCheckout(request, response);
            }
        }
    }

    private void doPostCoupon(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        OrderDAO db = new OrderDAO();
        Coupon c = db.getCoupon(request.getParameter("coupon"));
        session.setAttribute("coupon", c);
        response.sendRedirect("checkout");
    }

    private void doPostCheckout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        OrderDAO db = new OrderDAO();
        Order o = new Order();
        o.setUser((User) session.getAttribute("user"));
        if (session.getAttribute("coupon") != null) {
            o.setCoupon((Coupon) session.getAttribute("coupon"));
        } else {
            o.setCoupon(null);
        }
        o.setRequiredDate(Date.valueOf(request.getParameter("date")));
        o.setPayment_id(Integer.parseInt(request.getParameter("payment")));
        o.setShippingAddress(request.getParameter("address"));
        o.setContactPhone(request.getParameter("phone"));
        o.setContactEmail(request.getParameter("email"));
        o.setContacName(request.getParameter("lastName") + " " + request.getParameter("firstName"));
        o.setTotal(Double.parseDouble(request.getParameter("total")));
        db.createOrder(o);
        ArrayList<Item> cart = (ArrayList<Item>) session.getAttribute("cart");
        ArrayList<Item> items = new ArrayList<>();
        int item_id = 1;
        for (Item item : cart) {
            item_id++;
            item.setItem_id(item_id);
            item.setOrder(o);
            item.setPrice(item.getProduct().getPrice() * item.getQuantity());
            items.add(item);
            db.createOrderItem(item);
        }
        session.setAttribute("cart", null);
        session.setAttribute("coupon", null);
        request.setAttribute("order", db.getOrder(db.getCurrentOrderID()));
        request.setAttribute("items", items);
        request.getRequestDispatcher("confirmation.jsp").forward(request, response);
    }

}
