package model;

public class Payment {
    private String orderId;
    private String paymentDate;
    private double amount;
    private String paymentMethod;
    private String status;

    public Payment() {}

    public Payment(String orderId, String paymentDate, double amount, String paymentMethod, String status) {
        this.orderId = orderId;
        this.paymentDate = paymentDate;
        this.amount = amount;
        this.paymentMethod = paymentMethod;
        this.status = status;
    }

    public String getOrderId() { 
        return orderId; 
    }
    public void setOrderId(String orderId) { 
        this.orderId = orderId; 
    }

    public String getPaymentDate() { 
        return paymentDate;
    }
    public void setPaymentDate(String paymentDate) { 
        this.paymentDate = paymentDate; 
    }

    public double getAmount() { 
        return amount; 
    }
    public void setAmount(double amount) { 
        this.amount = amount; 
    }

    public String getPaymentMethod() { 
        return paymentMethod; 
    }
    public void setPaymentMethod(String paymentMethod) { 
        this.paymentMethod = paymentMethod;
    }

    public String getStatus() { 
        return status;
    }
    public void setStatus(String status) { 
        this.status = status; 
    }
}
