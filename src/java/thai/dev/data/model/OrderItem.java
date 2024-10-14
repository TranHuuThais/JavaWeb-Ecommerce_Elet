package thai.dev.data.model;

import thai.dev.data.dao.DatabaseDao;

public class OrderItem {

    private int id;
    private int quantity;
    private double price;
    private int orderId;
    private int productId;

    // Constructor không có ID, sử dụng khi ID chưa có (tạo mới)
    public OrderItem(int quantity, double price, int orderId, int productId) {
        this.quantity = quantity;
        this.price = price;
        this.orderId = orderId;
        this.productId = productId;
    }

    // Constructor đầy đủ với ID, sử dụng khi ID đã có (từ cơ sở dữ liệu)
    public OrderItem(int id, int quantity, double price, int orderId, int productId) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.orderId = orderId;
        this.productId = productId;
    }

    // Getters và setters cho các thuộc tính

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    // Lấy Product liên kết với OrderItem. Kiểm tra null để tránh lỗi.
    public Product getProduct() {
        return DatabaseDao.getInstance().getProductDao().find(this.productId);
    }

    // Lấy Order liên kết với OrderItem. Kiểm tra null để tránh lỗi.
    public Order getOrder() {
        return DatabaseDao.getInstance().getOrderDao().find(this.orderId);
    }

    // Phương thức kiểm tra tính hợp lệ của OrderItem nếu cần
    public boolean isValid() {
        return quantity > 0 && price >= 0 && productId > 0 && orderId > 0;
    }

}
