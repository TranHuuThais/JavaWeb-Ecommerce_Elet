package thai.dev.data.dao;

import java.util.List;

import thai.dev.data.model.Order;
import thai.dev.data.model.Product;

public interface OrderDao {

    public boolean insert(Order order);

    public boolean update(Order order);

    public boolean delete(int id);

    public Order find(int id);

    public List<Order> findAll();

    public List<Order> findByUser(int userId);

    public Order findByCode(String code);

    public List<Order> findByStatus(String status);

    public int countOrderByDay(String date);

    public double earningOrderByDay(String date);

    public int countAll();

    public List<Order> findPaginated(int page, int pageSize);

    public List<Product> findProductsByOrder(int orderId);

}
