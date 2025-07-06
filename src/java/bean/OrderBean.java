package bean;

import java.sql.Timestamp;

public class OrderBean {
    private int id;
    private int user_id;
    private Timestamp date;
    private double amount;
    private String method;

    // Constructors
    public OrderBean() {}

    public OrderBean(int id, int user_id, Timestamp date, double amount, String method) {
        this.id = id;
        this.user_id = user_id;
        this.date = date;
        this.amount = amount;
        this.method = method;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }
}
