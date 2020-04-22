/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.sun.faces.config.DbfFactory;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;
import model.Category;
import model.Coupon;
import model.Order;
import model.Product;
import model.User;

/**
 *
 * @author Admin
 */
public class ProductDAO extends BaseDAO {

    public List<Product> getAllCakes(int pageIndex, int pageSize, Integer category_id, Integer order, String proName) throws Exception {
        ArrayList<Product> list = new ArrayList<>();
        String cid = " ", orderBY = "order by product_id ASC", name = " ";
        try {
            if (category_id != null && category_id != 0) {
                cid = " and category_id = " + category_id;
            }
            if (proName != null && proName != "") {
                name = " and product_name LIKE '%" + proName + "%'";
            }
            if (order != null && order != 0) {
                if (order == 1) {
                    orderBY = "order by price ASC";
                } else if (order == 2) {
                    orderBY = "order by price DESC";
                }
            }
            String sql = "select * from\n"
                    + "( select *, ROW_NUMBER() over (" + orderBY + ")"
                    + " as row_num from Product where 1 = 1  " + cid + name + ")as xn\n"
                    + "where row_num between (? - 1)*? +1"
                    + " and ?*?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, pageIndex);
            statement.setInt(2, pageSize);
            statement.setInt(3, pageIndex);
            statement.setInt(4, pageSize);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getInt("product_id"));
                product.setCategory_id(rs.getInt("category_id"));
                product.setProductName(rs.getString("product_name"));
                product.setImage_alt(rs.getString("image_alt"));
                product.setPrice(rs.getInt("price"));
                product.setDescription(rs.getString("description"));
                if (rs.getBlob("image") != null) {
                    product.setBase64Image(convertBlobToString(rs.getBlob("image")));
                }
                list.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalProducts(Integer category_id, String proName) throws Exception {
        int count = 0;
        try {
            String sql = "select count(*) from Product where 1=1 ";
            if (category_id != null && category_id != 0) {
                sql += " and category_id = " + category_id;
            }
            if (proName != null && proName != "") {
                sql += " and product_name LIKE '%" + proName + "%'";
            }
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public Product getProduct(int product_id) throws Exception {
        Product p = new Product();
        try {
            String sql = "select * from Product where product_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, product_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                p.setProduct_id(rs.getInt("product_id"));
                p.setCategory_id(rs.getInt("category_id"));
                p.setProductName(rs.getString("product_name"));
                p.setImage_alt(rs.getString("image_alt"));
                p.setPrice(rs.getInt("price"));
                p.setDescription(rs.getString("description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public ArrayList<Category> getCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String sql = "select * from [Category]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategory_id(rs.getInt("category_id"));
                c.setName(rs.getString("category_name"));
                list.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void createProduct(Product product) throws IOException {
        try {
            String sql = "INSERT INTO [Product] ([product_name], [category_id], [price],"
                    + " [quantity], [description], [image], [image_alt])\n"
                    + "VALUES ("
                    + "?,"
                    + "?,"
                    + "?,"
                    + "30,"
                    + "?,"
                    + "?,"
                    + "NULL)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, product.getProductName());
            statement.setInt(2, product.getCategory_id());
            statement.setInt(3, product.getPrice());
            statement.setString(4, product.getDescription());
            statement.setBytes(5, convertImage(product.getPart()));
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public byte[] convertImage(Part part) throws IOException {
        InputStream is = part.getInputStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = is.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        return outputStream.toByteArray();
    }

    public String convertBlobToString(Blob blob) throws SQLException, IOException {
        ByteArrayOutputStream outputStream;
        String base64Image;
        try (InputStream inputStream = blob.getBinaryStream()) {
            outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = outputStream.toByteArray();
            base64Image = Base64.getEncoder().encodeToString(imageBytes);
        }
        outputStream.close();
        return base64Image;
    }
    
}
