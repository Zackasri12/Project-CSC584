/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;
import java.sql.*;
/**
 *
 * @author asria
 */
public class PaymentBean {
    public int id;
    public int orderId;
    public int amount;
    public String method;
    public Timestamp paymentDate;

    public PaymentBean(int id, int orderId, int amount, String method, Timestamp paymentDate) {
        this.id = id;
        this.orderId = orderId;
        this.amount = amount;
        this.method = method;
        this.paymentDate = paymentDate;
    }

    public int getId() {
        return id;
    }

    public int getOrderId() {
        return orderId;
    }

    public int getAmount() {
        return amount;
    }

    public String getMethod() {
        return method;
    }

    public Timestamp getPaymentDate() {
        return paymentDate;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public void setPaymentDate(Timestamp paymentDate) {
        this.paymentDate = paymentDate;
    }
    
    
}
