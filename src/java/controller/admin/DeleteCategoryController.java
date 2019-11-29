/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import data.CategoryData;
import java.io.IOException;
import javax.servlet.*;
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
@WebServlet(urlPatterns = "/admin/category/delete")
public class DeleteCategoryController extends HttpServlet {
    
     CategoryData categoryData = new CategoryData();
     
     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String id = req.getParameter("cid");

        Category category = categoryData.getCategory(Integer.parseInt(id));
        
        req.setAttribute("category",category);
        // chuyen huong trang
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/delete_category.jsp");
        dispatcher.forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cid = req.getParameter("cid");

        categoryData.delete(Integer.parseInt(cid));
        resp.sendRedirect(req.getContextPath() + "/admin/category/search");
    }
}
