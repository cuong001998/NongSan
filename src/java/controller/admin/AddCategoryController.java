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

@WebServlet(urlPatterns = "/admin/category/add")
public class AddCategoryController extends HttpServlet {

    CategoryData categoryData = new CategoryData();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher
                = req.getRequestDispatcher("/view/admin/add_category.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String descrip = req.getParameter("description");
        
        String[] message = new String[2];
        String url = "";
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
        category.setName(name);
        category.setDescription(descrip);
        
        if(filled){
            categoryData.add(category);
          //  url="admin/category/search";
            resp.sendRedirect(req.getContextPath()+"/admin/category/search");
        }else{
            req.setAttribute("category", category);
            req.setAttribute("message", message);
            //url = "/view/admin/add_category.jsp";
            req.getRequestDispatcher("/view/admin/add_category.jsp").forward(req, resp);
//            RequestDispatcher dispatcher
//                = req.getRequestDispatcher("/view/admin/add_category.jsp");
//            dispatcher.forward(req, resp);
        }
        // chuyen tran        
     //   req.getRequestDispatcher(url).forward(req, resp);
    }
}
