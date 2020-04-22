/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class MenuController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ProductDAO db = new ProductDAO();
            //get the value of page index from url
            String page_index = request.getParameter("pageIndex");
            String order = request.getParameter("order");
            String proName = (String) request.getSession().getAttribute("productName");
            if (order == null) {
                order = (String) request.getSession().getAttribute("order");
            }
            String category = request.getParameter("category");
            if (category == null) {
                category = (String) request.getSession().getAttribute("category");
            }
            //if page index doesn't display in url, default page current = 1
            if (page_index == null) {
                page_index = "1";
            }
            Integer proOrder = (order != null && order != "0") ? new Integer(order) : null;
            Integer proCategory = (category != null && category != "0") ? new Integer(category) : null;
            int pageIndex = Integer.parseInt(page_index);
            //a page has 3 products
            int pageSize = 6;
            //get total products from database
            int rowCount = db.getTotalProducts(proCategory, proName);
            //calculate max page
            int maxPage = rowCount / pageSize;
            //increase page if surplus < 3 products
            if (rowCount % pageSize != 0) {
                maxPage = maxPage + 1;
            }
            //get list products paging
            List<Product> cakes = db.getAllCakes(pageIndex, pageSize, proCategory, proOrder, proName);
            ArrayList<Category> list = db.getCategories();
            request.getSession().setAttribute("order", order);
            request.getSession().setAttribute("categories", list);
            request.getSession().setAttribute("category", category);
            request.getSession().setAttribute("cakes", cakes);
            request.setAttribute("maxPage", maxPage);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("activeList", "activeList");
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(MenuController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            ProductDAO db = new ProductDAO();
            //get the value of page index from url
            String page_index = request.getParameter("pageIndex");
            String order = request.getParameter("order");
            if (order == null) {
                order = (String) request.getSession().getAttribute("order");
            }
            String category = request.getParameter("category");
            if (category == null) {
                category = (String) request.getSession().getAttribute("category");
            }
            //if page index doesn't display in url, default page current = 1
            if (page_index == null) {
                page_index = "1";
            }
            Integer proOrder = (order != null && order != "0") ? new Integer(order) : null;
            Integer proCategory = (category != null && category != "0") ? new Integer(category) : null;
            int pageIndex = Integer.parseInt(page_index);
            //a page has 3 products
            int pageSize = 6;
            //get total products from database
            int rowCount = db.getTotalProducts(proCategory, null);
            //calculate max page
            int maxPage = rowCount / pageSize;
            //increase page if surplus < 3 products
            if (rowCount % pageSize != 0) {
                maxPage = maxPage + 1;
            }
            //get list products paging
            List<Product> cakes = db.getAllCakes(pageIndex, pageSize, proCategory, proOrder, null);
            request.getSession().setAttribute("order", order);
            request.getSession().setAttribute("category", category);
            request.getSession().setAttribute("cakes", cakes);
            request.getSession().setAttribute("productName", null);
            request.setAttribute("maxPage", maxPage);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("activeList", "activeList");
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(MenuController.class.getName()).log(Level.SEVERE, null, ex);
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
