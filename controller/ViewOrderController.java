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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;
import model.Product;
import model.User;

/**
 *
 * @author Admin
 */
public class ViewOrderController extends BaseRequiredLoginController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        OrderDAO db = new OrderDAO();
        //get the value of page index from url
        String page_index = request.getParameter("pageIndex");
        //if page index doesn't display in url, default page current = 1
        if (page_index == null) {
            page_index = "1";
        }
        int pageIndex = Integer.parseInt(page_index);
        //a page has 3 products
        int pageSize = 10;
        //get total products from database
        int rowCount = db.getTotalOrdersByUser(user);
        //calculate max page
        int maxPage = rowCount / pageSize;
        //increase page if surplus < 3 products 
        if (rowCount % pageSize != 0) {
            maxPage = maxPage + 1;
        }
        //get list products paging
        ArrayList<Order> orders = db.getOrders(user, pageIndex, pageSize);
        session.setAttribute("orders", orders);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("activeList", "activeList");
        request.getRequestDispatcher("viewOrder.jsp").forward(request, response);
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ViewOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ViewOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
