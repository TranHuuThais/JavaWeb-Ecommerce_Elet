package thai.dev.data.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import thai.dev.data.dao.ProductDao;
import thai.dev.data.driver.MySQLDriver;
import thai.dev.data.model.Product;
import thai.dev.util.Constants;

public class ProductImpl implements ProductDao {
    // gọi hàm kết nối csdl

    Connection con = MySQLDriver.getInstance().getConnection();

   @Override
public int insert(Product product) {
    String sql = "INSERT INTO `PRODUCTS`(ID, NAME, DESCRIPTION, THUMBNAIL, PRICE, QUANTITY, CATEGORY_ID) VALUES(NULL, ?, ?, ?, ?, ?, ?)";
    try (PreparedStatement stmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
        stmt.setString(1, product.getName());
        stmt.setString(2, product.getDescription());
        stmt.setString(3, product.getThumbnail());
        stmt.setDouble(4, product.getPrice());
        stmt.setInt(5, product.getQuantity());
        stmt.setInt(6, product.getCategoryId());

        stmt.execute();

        try (ResultSet rs = stmt.getGeneratedKeys()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Use logging instead
    }
    return 0;
}


    @Override
    public boolean update(Product product) {
        String sql = "UPDATE `PRODUCTS` SET name = ?, description = ?, thumbnail=?, price = ?, quantity = ?, category_id = ? WHERE id = ?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setString(3, product.getThumbnail());
            stmt.setDouble(4, product.getPrice());
            stmt.setInt(5, product.getQuantity());
            stmt.setInt(6, product.getCategoryId());
            stmt.setInt(7, product.getId());

            return stmt.execute();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        // TODO Auto-generated method stub
        String sql = "DELETE FROM `PRODUCTS` WHERE ID = ?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Product find(int id) {
        // TODO Auto-generated method stub
        String sql = "SELECT * FROM `PRODUCTS` WHERE ID = ?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                int view = rs.getInt("view");
                int categoryId = rs.getInt("category_id");
                Timestamp createdAt = rs.getTimestamp("created_at");

                return new Product(id, name, description, thumbnail, price, quantity, view, categoryId, createdAt);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Product> findAll() {
        // TODO Auto-generated method stub
        List<Product> proList = new ArrayList<>();
        String sql = "SELECT * FROM `PRODUCTS` ORDER BY VIEW DESC ";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                int view = rs.getInt("view");
                int categoryId = rs.getInt("category_id");
                Timestamp createdAt = rs.getTimestamp("created_at");

                proList.add(new Product(id, name, description, thumbnail, price, quantity, view, categoryId, createdAt));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return proList;
    }

    public List<Product> findByCategory(int categoryId, int offset, int limit) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE category_id = ? LIMIT ? OFFSET ?";

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, categoryId);
            stmt.setInt(2, limit);
            stmt.setInt(3, offset);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    // Retrieve the product attributes from ResultSet
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    String thumbnail = rs.getString("thumbnail");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    int view = rs.getInt("view");
                    int retrievedCategoryId = rs.getInt("category_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    // Create a Product object and add it to the list
                    Product product = new Product(id, name, description, thumbnail, price, quantity, view, retrievedCategoryId, createdAt);
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging this exception instead of printing
        }

        return products;
    }

    @Override
    public List<Product> hot(int limit) {
        List<Product> proList = new ArrayList<>();
        String sql = "SELECT * FROM `PRODUCTS` WHERE VIEW>12 ORDER BY  VIEW DESC LIMIT ?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, limit);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                int view = rs.getInt("view");
                int categoryId = rs.getInt("category_id");
                Timestamp createdAt = rs.getTimestamp("created_at");

                proList.add(new Product(id, name, description, thumbnail, price, quantity, view, categoryId, createdAt));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return proList;
    }

    @Override
    public List<Product> findByName(String key) {
        List<Product> proList = new ArrayList<>();
        String sql = "SELECT * FROM `PRODUCTS` WHERE NAME LIKE ? ORDER BY VIEW DESC ";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, "%" + key + "%");

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                int view = rs.getInt("view");
                int categoryId = rs.getInt("category_id");
                Timestamp createdAt = rs.getTimestamp("created_at");

                proList.add(new Product(id, name, description, thumbnail, price, quantity, view, categoryId, createdAt));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return proList;
    }

    @Override
    public List<Product> relatedProductList(Product product) {
        List<Product> proList = new ArrayList<>();
        String sql = "SELECT * FROM `PRODUCTS` WHERE CATEGORY_ID = ? LIMIT ?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, product.getCategoryId());
            stmt.setInt(2, Constants.RELATED_NUMBER);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                int view = rs.getInt("view");
                int categoryId = rs.getInt("category_id");
                Timestamp createdAt = rs.getTimestamp("created_at");

                proList.add(new Product(id, name, description, thumbnail, price, quantity, view, categoryId, createdAt));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return proList;
    }

    @Override
    public List<Product> findByCategoryOfName(int categoryId, String key) {
        List<Product> proList = new ArrayList<>();
        String sql = "SELECT * FROM `PRODUCTS` WHERE CATEGORY_ID = ? AND NAME LIKE ? ORDER BY VIEW DESC";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, categoryId);
            stmt.setString(2, "%" + key + "%");

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                int view = rs.getInt("view");
                Timestamp createdAt = rs.getTimestamp("created_at");

                proList.add(new Product(id, name, description, thumbnail, price, quantity, view, categoryId, createdAt));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return proList;
    }

    @Override
    public boolean updateView(Product product) {
        String sql = "UPDATE `PRODUCTS` SET view = ? WHERE id = ?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1, product.getView() + 1);
            stmt.setInt(2, product.getId());

            return stmt.execute();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Product> news(int limit) {
        List<Product> proList = new ArrayList<>();
        String sql = "SELECT * FROM `PRODUCTS` ORDER BY `CREATED_AT` DESC LIMIT ?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, limit);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                int view = rs.getInt("view");
                int categoryId = rs.getInt("category_id");
                Timestamp createdAt = rs.getTimestamp("created_at");

                proList.add(new Product(id, name, description, thumbnail, price, quantity, view, categoryId, createdAt));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return proList;
    }

    @Override
    public List<Product> filter(int categoryId, String propertyName, String order, int limit) {
        List<Product> proList = new ArrayList<>();
        List<String> validProperties = List.of("name", "price", "created_at", "view");
        List<String> validOrders = List.of("ASC", "DESC");

        // Validate propertyName and order
        if (!validProperties.contains(propertyName)) {
            propertyName = "name"; // Default sorting by name if invalid
        }
        if (!validOrders.contains(order.toUpperCase())) {
            order = "ASC"; // Default to ascending order if invalid
        }

        // Build the SQL query based on categoryId
        String sql;
        if (categoryId == 0) {
            // Nếu categoryId = 0 thì không lọc theo category
            sql = "SELECT * FROM `PRODUCTS` ORDER BY " + propertyName + " " + order + " LIMIT ?";
        } else {
            // Nếu categoryId > 0 thì lọc theo category
            sql = "SELECT * FROM `PRODUCTS` WHERE category_id = ? ORDER BY " + propertyName + " " + order + " LIMIT ?";
        }

        try {
            PreparedStatement stmt = con.prepareStatement(sql);

            if (categoryId == 0) {
                // Chỉ set limit nếu categoryId = 0
                stmt.setInt(1, limit);
            } else {
                // Set cả categoryId và limit nếu categoryId > 0
                stmt.setInt(1, categoryId);
                stmt.setInt(2, limit);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                int view = rs.getInt("view");
                Timestamp createdAt = rs.getTimestamp("created_at");

                // Add sản phẩm vào danh sách
                proList.add(new Product(id, name, description, thumbnail, price, quantity, view, categoryId, createdAt));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return proList;
    }

    @Override
    public List<Product> getProducts(int from, int amount) {
        List<Product> proList = new ArrayList<>();
        String sql = "SELECT * FROM `PRODUCTS` LIMIT ?, ?";
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, from);
            stmt.setInt(2, amount);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String thumbnail = rs.getString("thumbnail");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                int view = rs.getInt("view");
                int categoryId = rs.getInt("category_id");
                Timestamp createdAt = rs.getTimestamp("created_at");

                proList.add(new Product(id, name, description, thumbnail, price, quantity, view, categoryId, createdAt));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return proList;
    }

    @Override
    public int countByCategory(int categoryId) {
        String sql = "SELECT COUNT(*) FROM products WHERE category_id = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, categoryId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;

    }

    @Override
    public int countByCategoryAndFilter(int categoryId, String key) {
        String sql = "SELECT COUNT(*) FROM products WHERE category_id = ? AND name LIKE ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, categoryId);
            stmt.setString(2, "%" + key + "%");
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<Product> findByCategory(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<Product> filter(int categoryId, String propertyName, int order, int limit) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
