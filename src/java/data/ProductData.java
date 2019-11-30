/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author NGUYEN NGOC CUONG
 */
public class ProductData extends JDBCConnection {

    CategoryData categoryData = new CategoryData();

    public void add(Product product) {
        Connection conn = super.getConnection();
        try {
            String sql = "INSERT INTO product(name,price,weight,description,category_id,imageName) VALUES(?,?,?,?,?,?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setFloat(2, product.getPrice());
            preparedStatement.setInt(3, product.getWeight());
            preparedStatement.setString(4, product.getDescription());
            preparedStatement.setInt(5, product.getCategory().getId());
            preparedStatement.setString(6, product.getImageName());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println("Loi add : " + e);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public void update(Product product) {
        Connection conn = super.getConnection();
        try {
            String sql = "UPDATE product set name = ?, price = ?, weight = ?, description = ?, category_id = ?, imageName = ? WHERE id  = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setFloat(2, product.getPrice());
            preparedStatement.setInt(3, product.getWeight());
            preparedStatement.setString(4, product.getDescription());
            preparedStatement.setInt(5, product.getCategory().getId());
            preparedStatement.setString(6, product.getImageName());
            preparedStatement.setInt(7, product.getId());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println("Loi update : " + e);
        } finally {
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
            String sql = "DELETE FROM product WHERE id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println("Loi delete : " + e);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

    }

    public Product get(int id) {
        Connection conn = super.getConnection();
        try {
            String sql = "SELECT p.id AS 'product_ID', p.name, p.price, p.weight, p.description, p.imageName, c.id AS 'category_ID', c.name AS 'category_Name', c.description "
                    + " FROM product p INNER JOIN category c ON p.category_id = c.id WHERE p.id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("product_ID"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getFloat("price"));
                product.setWeight(rs.getInt("weight"));
                product.setDescription(rs.getString("description"));
                product.setImageName(rs.getString("imageName"));

                Category category = new Category();
                category.setId(rs.getInt("category_ID"));
                category.setName(rs.getString("category_Name"));
                category.setDescription(rs.getString("description"));

                product.setCategory(category);
                //product.setQuantity(rs.getInt("quantity"));

                return product;
            }
        } catch (Exception e) {
            System.out.println("Loi get 1 sp : " + e);
        } finally {

        }
        return null;
    }

    public List<Product> getProductList() {
        List<Product> pList = new ArrayList<Product>();
        String sql = "SELECT product.id, product.name AS p_name, product.price, product.weight, product.description, product.imageName, category.name AS c_name, category.id AS c_id  "
                + "FROM product INNER JOIN category " + "ON product.category_id = category.id";
        Connection conn = super.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Category category = categoryData.getCategory(rs.getInt("c_id"));
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("p_name"));
                product.setPrice(rs.getFloat("price"));
                product.setWeight(rs.getInt("weight"));
                product.setDescription(rs.getString("description"));
                product.setImageName(rs.getString("imageName"));
                product.setCategory(category);

                pList.add(product);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return pList;
    }

    public List<Product> search(String name) {
        List<Product> products = new ArrayList<>();
        Connection conn = super.getConnection();
        try {
            String sql = "SELECT p.id AS 'product_ID', p.name, p.price, p.weight, p.description, p.imageName, c.id AS 'category_ID', c.name AS 'category_Name', c.description "
                    + " FROM product p INNER JOIN category c ON p.category_id = c.id WHERE p.name LIKE ? OR c.name LIKE ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, "%" + name + "%");
            preparedStatement.setString(2, "%" + name + "%");

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("product_ID"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getFloat("price"));
                product.setWeight(rs.getInt("weight"));
                product.setDescription(rs.getString("description"));
                product.setImageName(rs.getString("imageName"));

                Category category = new Category();
                category.setId(rs.getInt("category_ID"));
                category.setName(rs.getString("category_Name"));
                category.setDescription(rs.getString("description"));

                product.setCategory(category);
                products.add(product);
            }
        } catch (Exception e) {
            System.out.println("Loi get search product : " + e);
        } finally {

        }
        return products;
    }

   
    public List<Product> getRelatedProduct(int id) {
        List<Product> products = new ArrayList<>();
        Connection conn = super.getConnection();
        try {
            String sql = "SELECT p.id AS 'product_ID', p.name, p.price,p.weight,p.description ,p.imageName,  c.id AS 'category_ID', c.name AS 'category_Name', c.description "
                    + " FROM product p INNER JOIN category c ON p.category_id = c.id WHERE p.category_id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("product_ID"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getFloat("price"));
                product.setWeight(rs.getInt("weight"));
                product.setImageName(rs.getString("imageName"));
                product.setDescription(rs.getString("description"));
                
                Category category = new Category();
                category.setId(rs.getInt("category_ID"));
                category.setName(rs.getString("category_Name"));
                category.setDescription(rs.getString("description"));

                product.setCategory(category);
                products.add(product);
            }
        } catch (Exception e) {
            System.out.println("Loi get related product: " + e);
        } finally {

        }
        return products;
    }

}
