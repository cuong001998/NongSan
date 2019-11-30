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
import model.Category;
import model.Product;

/**
 *
 * @author NGUYEN NGOC CUONG
 */
@WebServlet(urlPatterns = "/products_by_category")
public class ProductsByCategory extends HttpServlet {
    
    ProductData productData = new ProductData();
    CategoryData categoryData = new CategoryData();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cid = req.getParameter("cid");
        List<Product> products = productData.getRelatedProduct(Integer.parseInt(cid));
        List<Category> categories = categoryData.search("");
        req.setAttribute("categories", categories);
        req.setAttribute("products", products);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/home.jsp");
        dispatcher.forward(req, resp);
    }
    
    
}
