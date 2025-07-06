package bean;

public class CartItem {
    private int userId;
    private int perfumeId;
    private String name;
    private double price;
    private int quantity;
    private String image;

    public CartItem(int userId, int perfumeId, String name, double price, int quantity, String image) {
        this.userId = userId;
        this.perfumeId = perfumeId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
    }

    public int getUserId() { return userId; }
    public int getPerfumeId() { return perfumeId; }
    public String getName() { return name; }
    public double getPrice() { return price; }
    public int getQuantity() { return quantity; }
    public String getImage() { return image; }

    public double getTotalPrice() {
        return price * quantity;
    }
}
