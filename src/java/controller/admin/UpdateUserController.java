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

/**
 *
 * @author NGUYEN NGOC CUONG
 */
@WebServlet(urlPatterns = "/admin/user/update")
public class UpdateUserController extends HttpServlet {

    UserData userData = new UserData();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uid = req.getParameter("uid");
        User user = userData.getUser(Integer.parseInt(uid));

        req.setAttribute("user", user);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/update_user.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("yourname");
        String username = req.getParameter("username");
        String pass = req.getParameter("password");
        String role = req.getParameter("role");

        User user = new User();
        user.setId(Integer.parseInt(id));
        user.setName(name);
        user.setUsername(username);
        user.setPassword(pass);
        user.setRole(role);

        // xu ly update
        userService(user);
        resp.sendRedirect(req.getContextPath() + "/admin/user/search");

    }

    private void userService(User user) {
        User oldUser = userData.getUser(user.getId());
        if (oldUser != null) {
            oldUser.setName(user.getName());
            oldUser.setPassword(user.getPassword());
            oldUser.setRole(user.getRole());

            userData.update(oldUser);
        }
    }
}
