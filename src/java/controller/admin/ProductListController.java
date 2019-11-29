package controller.admin;

import data.ProductData;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Product;

@WebServlet(urlPatterns = "/admin/product/search")

public class ProductListController extends HttpServlet {

    ProductData productData = new ProductData();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub

        List<Product> products = productData.getProductList();
        req.setAttribute("products", products);

        RequestDispatcher dispatcher
                = req.getRequestDispatcher("/view/admin/product_list.jsp");
        dispatcher.forward(req, resp);
    }
}
