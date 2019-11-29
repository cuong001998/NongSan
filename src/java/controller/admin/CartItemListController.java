package controller.admin;

import data.CartItemData;
import java.util.List;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

@WebServlet(urlPatterns = "/admin/cartitem/search")
public class CartItemListController extends HttpServlet {

    CartItemData cartItemData = new CartItemData();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<CartItem> cartItems = cartItemData.getListCartItem();
        req.setAttribute("cartItemList", cartItems);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/cartitem_list.jsp");
        dispatcher.forward(req, resp);
    }
}
