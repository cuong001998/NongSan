/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartItem;

/**
 *
 * @author NGUYEN NGOC CUONG
 */
@WebServlet(urlPatterns = "/remove_cartitem")
public class RemoveCartItem extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String key = req.getParameter("key");
        HttpSession session = req.getSession();
        Object obj = session.getAttribute("cart");
        if (obj != null) {
            Map<Integer, CartItem> map
                    = (Map<Integer, CartItem>) obj;
            //xoa theo key
            map.remove(Integer.parseInt(key));
            //update
            session.setAttribute("cart", map);
        }
        //	resp.sendRedirect(req.getContextPath()+"/gio-hang");
        resp.sendRedirect(req.getContextPath() + "/home");
    }

}
