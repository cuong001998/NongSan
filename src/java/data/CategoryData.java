package data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author NGUYEN NGOC CUONG
 */
public class CategoryData extends JDBCConnection {

    public void add(Category category) {
        Connection conn = super.getConnection();
        try {
            String sql = "INSERT INTO category(name,description) VALUES(?,?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, category.getName());
            preparedStatement.setString(2, category.getDescription());

            preparedStatement.executeUpdate();
        } catch (Exception e) {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public void update(Category category) {
        Connection conn = super.getConnection();
        try {
            String sql = "UPDATE category SET name = ?,description = ? where id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, category.getName());
            preparedStatement.setString(2, category.getDescription());
            preparedStatement.setInt(3, category.getId());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

    }

    public void delete(int id) {
        Connection conn = super.getConnection();
        try {
            String sql = "DELETE FROM category WHERE id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public Category getCategory(int id) {
        String sql = "SELECT * FROM category WHERE id = ?";
        Connection conn = super.getConnection();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));

                return category;
            }
        } catch (Exception e) {
            System.out.println("loi o getcategory " + e);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    public List<Category> search(String name) {
        List<Category> categoryLists = new ArrayList<Category>();

        String sql = "SELECT * FROM category WHERE name LIKE ?";
        Connection conn = super.getConnection();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, "%" + name + "%");

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
                categoryLists.add(category);
            }
        } catch (Exception e) {
            System.out.println("loi o search " + e);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return categoryLists;
    }
}
