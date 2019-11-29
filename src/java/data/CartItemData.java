package data;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.CartItem;
import model.Product;

/**
 *
 * @author NGUYEN NGOC CUONG
 */
public class CartItemData extends JDBCConnection {

    public void add(CartItem cartItem) {
        Connection conn = super.getConnection();
        try {
            String sql = "INSERT INTO cart_item(quantity,unitPrice, idProduct,idCart) VALUES(?,?,?,?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, cartItem.getQuantity());
            preparedStatement.setFloat(2, cartItem.getUnitPrice());
            preparedStatement.setInt(3, cartItem.getProduct().getId());
            preparedStatement.setInt(4, cartItem.getCart().getId());

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

    // SUA SO LUONG 
    public void update(CartItem cart) {
        Connection conn = super.getConnection();
        try {
            String sql = "UPDATE  cart_item SET quantity = ? WHERE id = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, cart.getQuantity());
            preparedStatement.setInt(2, cart.getId());

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

    public void delete(int id) {
        Connection conn = super.getConnection();
        try {
            String sql = "DELETE FROM cart_item WHERE idCart = ?";
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

    public List<CartItem> getListCartItem() {
        List<CartItem> carts = new ArrayList<>();
        Connection conn = super.getConnection();
        try {
            String sql = "SELECT * FROM cart_item,product WHERE cart_item.idProduct = product.id";
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setId(rs.getInt("idCart"));

                Product product = new Product();
                product.setId(rs.getInt("idProduct"));
                product.setName(rs.getString("name"));

                CartItem cartItem = new CartItem();
                cartItem.setId(rs.getInt("id"));
                cartItem.setQuantity(rs.getInt("quantity"));
                cartItem.setUnitPrice(rs.getInt("unitPrice"));
                cartItem.setProduct(product);
                cartItem.setCart(cart);
//				cart.setBuyer(user);
                carts.add(cartItem);
            }
        } catch (Exception e) {
            System.out.println("Loi get : " + e);
        } finally {

        }
        return carts;
    }
}
