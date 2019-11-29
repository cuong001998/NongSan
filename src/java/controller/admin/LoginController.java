package controller.admin;

import data.UserData;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
@WebServlet(urlPatterns = "/admin-lg/login")
public class LoginController extends HttpServlet {
    UserData userData = new UserData();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher
                = req.getRequestDispatcher("/view/admin/login_admin.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        User user = getUserByUsername(username, password);
        if (user != null) {
            System.out.println("Thanh cong");
            HttpSession session = req.getSession();
            session.setAttribute("loginUser", user);
           // session.setMaxInactiveInterval(30);

            resp.sendRedirect(req.getContextPath() + "/admin/user/search");
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin-lg/login");
        }

    }

    private User getUserByUsername(String username, String password) {
        User user = userData.getUserByUsername(username);
        if (user != null) {
            if (user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }
}
