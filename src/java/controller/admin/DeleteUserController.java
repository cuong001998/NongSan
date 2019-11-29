package controller.admin;

import data.UserData;
import java.io.IOException;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

@WebServlet(urlPatterns = "/admin/user/delete")
public class DeleteUserController extends HttpServlet {
    
    UserData userData = new UserData();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String id = req.getParameter("uid");

        User user = userData.getUser(Integer.parseInt(id));
        
        req.setAttribute("user", user);
        // chuyen huong trang
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/delete_user.jsp");
        dispatcher.forward(req, resp);

        // forward : chuyen huong req, resp cua nguoi dung
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uid = req.getParameter("uid");

        userData.delete(Integer.parseInt(uid));
        resp.sendRedirect(req.getContextPath() + "/admin/user/search");
    }
}
