/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import data.CategoryData;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;

/**
 *
 * @author NGUYEN NGOC CUONG
 */
@WebServlet(urlPatterns = "/admin/category/search")
public class CategoryListController extends HttpServlet {
    
    CategoryData categoryData = new CategoryData();
    
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryData.search("");
        req.setAttribute("categoryList", categories);

        RequestDispatcher dispatcher
                = req.getRequestDispatcher("/view/admin/category_list.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userInput = req.getParameter("search");
        List<Category> categories = categoryData.search(userInput);
        req.setAttribute("categoryList", categories);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/category_list.jsp");
        dispatcher.forward(req, resp);
    }
}
