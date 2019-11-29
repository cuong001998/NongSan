/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import data.ProductData;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartItem;
import model.Product;

/**
 *
 * @author NGUYEN NGOC CUONG
 */
@WebServlet(urlPatterns = "/add_to_cart")
public class AddToCart extends HttpServlet {

    ProductData productData = new ProductData();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pId = req.getParameter("productId");
        Product product = productData.get(Integer.parseInt(pId));

        HttpSession session = req.getSession();
        Object obj = session.getAttribute("cart");
        if (obj == null) { 
            
            CartItem cartItem = new CartItem();
            cartItem.setQuantity(1);
            cartItem.setUnitPrice(product.getPrice());
            cartItem.setProduct(product);
            
            Map<Integer, CartItem> map = new HashMap<>();

            map.put(product.getId(), cartItem);
            
            session.setAttribute("cart", map);
        } else {
            Map<Integer, CartItem> map
                    = (Map<Integer, CartItem>) obj;
            
            CartItem cartItem = map.get(product.getId());
            if (cartItem == null) {
                CartItem item = new CartItem();

                item.setQuantity(1);
                item.setUnitPrice(product.getPrice());
                item.setProduct(product);

                map.put(product.getId(), item);
            } else {
                cartItem.setQuantity(cartItem.getQuantity() + 1);
            }
            // update
            session.setAttribute("cart", map);
        }
        
        // them xong mua hang tiep
        resp.sendRedirect(req.getContextPath() + "/home");
    }

}
