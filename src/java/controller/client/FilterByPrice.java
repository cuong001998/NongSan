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
@WebServlet(urlPatterns = "/filterByPrice")
public class FilterByPrice extends HttpServlet{
    
    ProductData productData = new ProductData();
    CategoryData categoryData = new CategoryData();
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String minValue = req.getParameter("amount1");
        String maxValue = req.getParameter("amount2");
        List<Product> products = productData.getProductByPrice(Float.parseFloat(minValue), Float.parseFloat(maxValue));
        req.setAttribute("products", products);
        List<Category> categories = categoryData.search("");
        req.setAttribute("categories", categories);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/home.jsp");
        dispatcher.forward(req, resp);
        
    }
    
}
