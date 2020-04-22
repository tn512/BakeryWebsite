/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Order {

    int order_id, payment_id;
    boolean status;
    double total;
    String shippingAddress, contactPhone, contactEmail, contacName;
    Date requiredDate, createddate;
    User user;
    Coupon coupon;
    
    public Order() {
    }

    public Order(int order_id, boolean status, int payment_id, String shippingAddress, String contactPhone, String contactEmail, String contacName, Date requiredDate, Date createddate, User user, Coupon coupon) {
        this.order_id = order_id;
        this.status = status;
        this.payment_id = payment_id;
        this.shippingAddress = shippingAddress;
        this.contactPhone = contactPhone;
        this.contactEmail = contactEmail;
        this.contacName = contacName;
        this.requiredDate = requiredDate;
        this.createddate = createddate;
        this.user = user;
        this.coupon = coupon;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getContacName() {
        return contacName;
    }

    public void setContacName(String contacName) {
        this.contacName = contacName;
    }

    public Date getRequiredDate() {
        return requiredDate;
    }

    public void setRequiredDate(Date requiredDate) {
        this.requiredDate = requiredDate;
    }

    public Date getCreateddate() {
        return createddate;
    }

    public void setCreateddate(Date createddate) {
        this.createddate = createddate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Coupon getCoupon() {
        return coupon;
    }

    public void setCoupon(Coupon coupon) {
        this.coupon = coupon;
    }
    
}
