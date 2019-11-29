/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import data.ProductData;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author NGUYEN NGOC CUONG
 */
@WebServlet(urlPatterns = "/admin/product/delete")
public class DeleteProductController extends HttpServlet{
    
    ProductData productData = new ProductData();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String pid = req.getParameter("pid");
       Product product = productData.get(Integer.parseInt(pid));
       req.setAttribute("product", product);
       
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/delete_product.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pid = req.getParameter("pid");

        productData.delete(Integer.parseInt(pid));
        resp.sendRedirect(req.getContextPath() + "/admin/product/search");
    }
}
