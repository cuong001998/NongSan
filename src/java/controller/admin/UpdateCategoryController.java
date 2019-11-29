package controller.admin;

import data.CategoryData;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;

@WebServlet(urlPatterns = "/admin/category/update")

public class UpdateCategoryController extends HttpServlet {
    
    CategoryData categoryData = new CategoryData();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String cid = req.getParameter("cid");
        Category category = categoryData.getCategory(Integer.parseInt(cid));
        
        req.setAttribute("category", category);
        RequestDispatcher dispatcher
                = req.getRequestDispatcher("/view/admin/update-category.jsp");
        dispatcher.forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String descrip = req.getParameter("description");
        
        String[] message = new String[2];
        boolean filled = true;
        
         if (name.isEmpty()) {
            message[0] = "You must enter a name for the category.";
            filled = false;
        }
        if (descrip.isEmpty()) {
            message[1] = "You must enter a description for the category.";
            filled = false;
        }
        
        Category category = new Category();
        category.setId(Integer.parseInt(id));
        category.setName(name);
        category.setDescription(descrip);
        
        
        if(filled){
            categoryService(category);
           // categoryData.add(category);
            resp.sendRedirect(req.getContextPath()+"/admin/category/search");
        }else{
            req.setAttribute("category", category);
            req.setAttribute("message", message);
            req.getRequestDispatcher("/view/admin/add_category.jsp").forward(req, resp);
        } 
        //categoryService(category);
        // chuyen trang
        //resp.sendRedirect(req.getContextPath() + "/admin/category/search");
        
    }
    
    private void categoryService(Category category) {
        Category oldCategory = categoryData.getCategory(category.getId());
        
        if (oldCategory != null) {
            oldCategory.setName(category.getName());
            oldCategory.setDescription(category.getDescription());
            
            categoryData.update(oldCategory);
            // chuyen trang
        }
    }
}
