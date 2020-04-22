/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Coupon;
import model.Item;
import model.Order;
import model.Product;
import model.User;

/**
 *
 * @author Admin
 */
public class OrderDAO extends BaseDAO {

    public ArrayList<Order> getOrders(User u, int pageIndex, int pageSize) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            String sql = "select * from\n"
                    + "( select *, ROW_NUMBER() over (order by order_id DESC )"
                    + " as row_num from [Order] where user_id = ?)as xn\n"
                    + "where row_num between (? - 1)*? +1"
                    + " and ?*?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, u.getUser_id());
            statement.setInt(2, pageIndex);
            statement.setInt(3, pageSize);
            statement.setInt(4, pageIndex);
            statement.setInt(5, pageSize);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrder_id(rs.getInt("order_id"));
                o.setUser(u);
                o.setCoupon(getCouponByID(rs.getInt("coupon_id")));
                o.setStatus(rs.getBoolean("order_status"));
                o.setCreateddate(rs.getDate("order_date"));
                o.setRequiredDate(rs.getDate("required_date"));
                o.setPayment_id(rs.getInt("payment_id"));
                o.setShippingAddress(rs.getString("shipping_address"));
                o.setContactPhone(rs.getString("contact_phone"));
                o.setContactEmail(rs.getString("contact_email"));
                o.setContacName(rs.getString("contact_name"));
                o.setTotal(rs.getDouble("total"));
                list.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Order getOrder(int order_id) {
        Order o = new Order();
        UserDAO userdao = new UserDAO();
        try {
            String sql = "select * from [Order] where order_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, order_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                o.setOrder_id(order_id);
                o.setUser(userdao.getUserByID(rs.getInt("user_id")));
                o.setCoupon(getCouponByID(rs.getInt("coupon_id")));
                o.setStatus(rs.getBoolean("order_status"));
                o.setCreateddate(rs.getDate("order_date"));
                o.setRequiredDate(rs.getDate("required_date"));
                o.setPayment_id(rs.getInt("payment_id"));
                o.setShippingAddress(rs.getString("shipping_address"));
                o.setContactPhone(rs.getString("contact_phone"));
                o.setContactEmail(rs.getString("contact_email"));
                o.setContacName(rs.getString("contact_name"));
                o.setTotal(rs.getDouble("total"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }

    public Coupon getCoupon(String code) {
        Coupon c = new Coupon();
        try {
            String sql = "select * from Coupon where coupon_code = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, code);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                c.setCode(code);
                c.setCoupon_id(rs.getInt("coupon_id"));
                c.setDiscount(rs.getInt("discount"));
                c.setType(rs.getBoolean("coupon_type"));
                c.setFrom(rs.getDate("date_from"));
                c.setTo(rs.getDate("date_to"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public void createOrder(Order o) {
        try {
            String sql = "INSERT INTO [Order] (user_id, coupon_id, order_status,"
                    + " [order_date], [required_date], [payment_id], [shipping_address],"
                    + " [contact_phone], [contact_email], [contact_name], [total])\n"
                    + "VALUES ("
                    + "?,"
                    + "?,"
                    + "1,"
                    + "GETDATE(),"
                    + "?,"
                    + "?,"
                    + "?,"
                    + "?,"
                    + "?,"
                    + "?,"
                    + "?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, o.getUser().getUser_id());
            if (o.getCoupon() != null) {
                statement.setInt(2, o.getCoupon().getCoupon_id());
            } else {
                statement.setNull(2, Types.INTEGER);
            }
            statement.setDate(3, o.getRequiredDate());
            statement.setInt(4, o.getPayment_id());
            statement.setString(5, o.getShippingAddress());
            statement.setString(6, o.getContactPhone());
            statement.setString(7, o.getContactEmail());
            statement.setString(8, o.getContacName());
            statement.setDouble(9, o.getTotal());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Coupon getCouponByID(int id) {
        Coupon c = new Coupon();
        try {
            String sql = "select * from Coupon where coupon_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                c.setCode(rs.getString("coupon_code"));
                c.setCoupon_id(id);
                c.setDiscount(rs.getInt("discount"));
                c.setType(rs.getBoolean("coupon_type"));
                c.setFrom(rs.getDate("date_from"));
                c.setTo(rs.getDate("date_to"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public void createOrderItem(Item i) {
        try {
            String sql = "INSERT INTO [Order_item] ([order_id], [item_id], [product_id],"
                    + " [quantity], [price])\n"
                    + "VALUES ("
                    + "?,"
                    + "?,"
                    + "?,"
                    + "?,"
                    + "?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, getCurrentOrderID());
            statement.setInt(2, i.getItem_id());
            statement.setInt(3, i.getProduct().getProduct_id());
            statement.setInt(4, i.getQuantity());
            statement.setDouble(5, i.getPrice());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Item> getItems(int order_id) throws Exception {
        ArrayList<Item> list = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        try {
            String sql = "select * from [Order_item] where order_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, order_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Item item = new Item();
                item.setItem_id(rs.getInt("item_id"));
                item.setOrder(getOrder(order_id));
                item.setPrice(rs.getInt("price"));
                item.setProduct(productDAO.getProduct(rs.getInt("product_id")));
                item.setQuantity(rs.getInt("quantity"));
                list.add(item);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getCurrentOrderID() {
        int id = 0;
        try {
            String sql = "SELECT  MAX([order_id])\n"
                    + "  FROM [BakeryWebsite].[dbo].[Order]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public List<Order> getAllOrders(int pageIndex, int pageSize) throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        UserDAO userdao = new UserDAO();
        try {
            String sql = "select * from\n"
                    + "( select *, ROW_NUMBER() over (order by order_id DESC )"
                    + " as row_num from [Order])as xn\n"
                    + "where row_num between (? - 1)*? +1"
                    + " and ?*?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, pageIndex);
            statement.setInt(2, pageSize);
            statement.setInt(3, pageIndex);
            statement.setInt(4, pageSize);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrder_id(rs.getInt("order_id"));
                o.setUser(userdao.getUserByID(rs.getInt("user_id")));
                o.setCoupon(getCouponByID(rs.getInt("coupon_id")));
                o.setStatus(rs.getBoolean("order_status"));
                o.setCreateddate(rs.getDate("order_date"));
                o.setRequiredDate(rs.getDate("required_date"));
                o.setPayment_id(rs.getInt("payment_id"));
                o.setShippingAddress(rs.getString("shipping_address"));
                o.setContactPhone(rs.getString("contact_phone"));
                o.setContactEmail(rs.getString("contact_email"));
                o.setContacName(rs.getString("contact_name"));
                o.setTotal(rs.getDouble("total"));
                list.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalOrders() throws Exception {
        int count = 0;
        try {
            String sql = "select count(*) from [Order]";
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
    
    public int getTotalOrdersByUser(User u) throws Exception {
        int count = 0;
        try {
            String sql = "select count(*) from [Order] where user_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, u.getUser_id());
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public void deleteOrder(int order_id) {
        try {
            String sql = "DELETE FROM [Order] WHERE order_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, order_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void createCoupon(Coupon coupon) throws IOException {
        try {
            String sql = "INSERT INTO [Coupon] ([coupon_code], [coupon_type], [discount],"
                    + " [date_from], [date_To])\n"
                    + "VALUES ("
                    + "?,"
                    + "?,"
                    + "?,"
                    + "?,"
                    + "?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, coupon.getCode());
            statement.setBoolean(2, coupon.getType());
            statement.setInt(3, coupon.getDiscount());
            statement.setDate(4, coupon.getFrom());
            statement.setDate(5, coupon.getTo());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
