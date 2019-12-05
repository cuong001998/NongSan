package controller.admin;

import data.UserData;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;

@WebServlet(urlPatterns = "/admin/user/add")
public class AddUserController extends HttpServlet {

    UserData userData = new UserData();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/form-user.jsp");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/add_user.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("yourname");
        String username = req.getParameter("username");
        String pass = req.getParameter("password");
        String role = req.getParameter("role");

        String[] message = new String[3];
        String url = "";
        boolean filled = true;

        if (name.isEmpty()) {
            message[0] = "You must enter a name for user.";
            filled = false;
        }
        if (username.isEmpty()) {
            message[1] = "You must enter a username for user.";
            filled = false;
        }
        if (pass.isEmpty()) {
            message[2] = "You must enter a pass for user.";
            filled = false;
        }

        User user = new User();

        user.setName(name);
        user.setUsername(username);
        user.setPassword(pass);
        user.setRole(role);

        if (filled) {
            userData.add(user);
            resp.sendRedirect(req.getContextPath() + "/admin/user/search");
        } else {
            req.setAttribute("user", user);
            req.setAttribute("message", message);
            req.getRequestDispatcher("/view/admin/add_user.jsp").forward(req, resp);
        }
    }
}
