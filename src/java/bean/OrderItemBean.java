package bean;

public class OrderItemBean {
    private int orderId;
    private int perfumeId;
    private int quantity;
    private double price;

    private String perfumeName;
    private String perfumeImage;

    // ✅ No-argument constructor
    public OrderItemBean() {}

    // Optional all-args constructor
    public OrderItemBean(int orderId, int perfumeId, int quantity, double price, String perfumeName, String perfumeImage) {
        this.orderId = orderId;
        this.perfumeId = perfumeId;
        this.quantity = quantity;
        this.price = price;
        this.perfumeName = perfumeName;
        this.perfumeImage = perfumeImage;
    }

    // Getters and setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getPerfumeId() {
        return perfumeId;
    }

    public void setPerfumeId(int perfumeId) {
        this.perfumeId = perfumeId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPerfumeName() {
        return perfumeName;
    }

    public void setPerfumeName(String perfumeName) {
        this.perfumeName = perfumeName;
    }

    public String getPerfumeImage() {
        return perfumeImage;
    }

    public void setPerfumeImage(String perfumeImage) {
        this.perfumeImage = perfumeImage;
    }
}
