package controller.admin;

import data.CartData;
import java.util.List;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

@WebServlet(urlPatterns = "/admin/cart/search")
public class CartListController extends HttpServlet {

    CartData cartData = new CartData();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Cart> carts = cartData.getListCart();
        req.setAttribute("cartList", carts);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/cart_list.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userInput = req.getParameter("search");
        List<Cart> carts = cartData.search(userInput);
        req.setAttribute("cartList", carts);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/cart_list.jsp");
        dispatcher.forward(req, resp);
    }
    
    
}
