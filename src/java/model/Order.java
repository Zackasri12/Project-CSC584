package model;

public class Order {
    private String orderDate;
    private double totalOrder;
    private String userId;
    private String couponId;
    private String orderStatus;

    public Order() {}

    public Order(String orderDate, double totalOrder, String userId, String couponId, String orderStatus) {
        this.orderDate = orderDate;
        this.totalOrder = totalOrder;
        this.userId = userId;
        this.couponId = couponId;
        this.orderStatus = orderStatus;
    }

    public String getOrderDate() { 
        return orderDate; 
    }
    public double getTotalOrder() { 
        return totalOrder; 
    }
    public String getUserId() { 
        return userId; 
    }
    public String getCouponId() { 
        return couponId; 
    }
    public String getOrderStatus() { 
        return orderStatus; 
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate; 
    }
    public void setTotalOrder(double totalOrder) { 
        this.totalOrder = totalOrder; 
    }
    public void setUserId(String userId) { 
        this.userId = userId; 
    }
    public void setCouponId(String couponId) { 
        this.couponId = couponId; 
    }
    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
}
