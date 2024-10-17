package thai.dev.data.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import thai.dev.data.dao.UserDAO;
import thai.dev.data.driver.MySQLDriver;
import thai.dev.data.model.User;

public class UserImpl implements UserDAO {

    Connection con = MySQLDriver.getInstance().getConnection();

    // Constructor to initialize connection
//     public UserImpl() {
//        this.con = MySQLDriver.getInstance().getConnection();
//        if (this.con == null) {
//            throw new IllegalStateException("Failed to create connection to the database.");
//        }
//    }
    @Override
    public boolean insert(User user) {
        String sql = "INSERT INTO `USER` (EMAIL, PASSWORD, ROLE,confirmationCode, isConfirmed) VALUES (?, ?, ?,?,?)";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getRole());
            stmt.setString(4, user.getConfirmationCode());
            stmt.setBoolean(5, user.isConfirmed());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

//    @Override
//    public boolean update(User user) {
//        String sql = "UPDATE `USER` SET EMAIL = ?, PASSWORD = ?, ROLE = ?,isConfirmed = ? WHERE ID = ?";
//        try (PreparedStatement stmt = con.prepareStatement(sql)) {
//            stmt.setString(1, user.getEmail());
//            stmt.setString(2, user.getPassword());
//            stmt.setString(3, user.getRole());
//            stmt.setInt(4, user.getId());
//            stmt.setBoolean(5, user.isConfirmed());
//            stmt.executeUpdate();
//            return true;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
    @Override
    public boolean update(User user) {
        String sql = "UPDATE `USER` SET EMAIL = ?, PASSWORD = ?, ROLE = ?,isConfirmed = ? WHERE ID = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getRole());
            stmt.setBoolean(4, user.isConfirmed()); // This should be at position 4
            stmt.setInt(5, user.getId()); // This should be at position 5
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM `USER` WHERE ID = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User find(int id) {
        String sql = "SELECT * FROM `USER` WHERE ID = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String role = rs.getString("role");
                    String confirmationCode = rs.getString("confirmationCode");
                    int isConfirmed = rs.getInt("isConfirmed");
                    return new User(id, email, password, role, confirmationCode, true);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM `USER`";
        try (PreparedStatement stmt = con.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String role = rs.getString("role");
                String confirmationCode = rs.getString("confirmationCode");
                int isConfirmed = rs.getInt("isConfirmed");
                users.add(new User(id, email, password, role, confirmationCode, true));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public User find(String email, String password) {
        String sql = "SELECT * FROM `USER` WHERE EMAIL = ? AND PASSWORD = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, password); // Use the hashed password here
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String role = rs.getString("role");
                    String confirmationCode = rs.getString("confirmationCode");
                    int isConfirmed = rs.getInt("isConfirmed");
                    return new User(id, email, password, role, confirmationCode, true);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // If the user is not found
    }

    @Override
    public User find(String email) {
        String sql = "SELECT * FROM `USER` WHERE EMAIL = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String password = rs.getString("password");
                    String role = rs.getString("role");
                    String confirmationCode = rs.getString("confirmationCode");
                    int isConfirmed = rs.getInt("isConfirmed");
                    return new User(id, email, password, role, confirmationCode, true);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // New method to count total users
    public int countAll() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM `USER`";
        try (PreparedStatement stmt = con.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    // New method to fetch users with pagination
    public List<User> findPaginated(int page, int pageSize) {
        List<User> users = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String sql = "SELECT * FROM `USER` LIMIT ? OFFSET ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, pageSize);
            stmt.setInt(2, offset);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String role = rs.getString("role");
                    String confirmationCode = rs.getString("confirmationCode");
                    int isConfirmed = rs.getInt("isConfirmed");
                    users.add(new User(id, email, password, role, confirmationCode, true));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

//  @Override
    public User findByConfirmationCode(String confirmationCode) {
        User user = null;
        String sql = "SELECT * FROM `USER` WHERE confirmationCode = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, confirmationCode);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User(rs.getInt("id"), rs.getString("email"), rs.getString("password"),
                            rs.getString("role"), rs.getString("confirmationCode"), rs.getBoolean("isConfirmed"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

}
