/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import data.CartData;
import data.CartItemData;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;

/**
 *
 * @author NGUYEN NGOC CUONG
 */
@WebServlet(urlPatterns = "/member/pay")
public class MemberPay extends HttpServlet {

    CartData cartData = new CartData();
    CartItemData cartItemData = new CartItemData();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User loginUser = (User) session.getAttribute("loginMember");

        Cart cart = new Cart();
        cart.setBuyer(loginUser);
        cart.setStatus(1);
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        cart.setBuyDate(sdf.format(now));
        cartData.add(cart);
        
        Object obj = session.getAttribute("cart");
        if(obj!=null){
            Map<Integer, CartItem> map = (Map<Integer, CartItem>) obj;
            
            for(Entry<Integer,CartItem> entry:map.entrySet()){
                CartItem cartItem = entry.getValue();
                cartItem.setCart(cart);
                
                cartItemData.add(cartItem);
            }
        }
        session.removeAttribute("cart");
        resp.sendRedirect(req.getContextPath()+"/home");
    }

}
