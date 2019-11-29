/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import data.CategoryData;
import data.ProductData;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import model.Category;

/**
 *
 * @author NGUYEN NGOC CUONG
 */
@WebServlet(urlPatterns = "/product/detail")
public class DetailController extends HttpServlet {

    ProductData productData = new ProductData();
    CategoryData categoryData = new CategoryData();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("productId");
        Product product = productData.get(Integer.parseInt(id));
//        Category category = categoryData.getCategory(product.getCategory().getId());
        List<Product> products = productData.getRelatedProduct(product.getCategory().getId());
        List<Category> categories = categoryData.search("");
        req.setAttribute("product", product);
//        req.setAttribute("category", category);
        req.setAttribute("products", products);
        req.setAttribute("categories", categories);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/single_product.jsp");
        dispatcher.forward(req, resp);
    }

}
