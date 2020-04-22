/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Product;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class AddProductController extends BaseRequiredAdminLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ProductDAO db = new ProductDAO();
        session.setAttribute("categories", db.getCategories());
        request.getRequestDispatcher("addproduct.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO db = new ProductDAO();
        Product p = new Product();
        Part part = request.getPart("image");
        p.setProductName(request.getParameter("productName"));
        p.setPrice(Integer.parseInt(request.getParameter("price")));
        p.setCategory_id(Integer.parseInt(request.getParameter("category")));
        p.setPart(part);
        p.setDescription(request.getParameter("description"));
        db.createProduct(p);
        response.sendRedirect("menu");
    }

}
