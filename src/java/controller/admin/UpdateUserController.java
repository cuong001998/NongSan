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
        
        String[] message = new String[2];
        boolean filled = true;
        
         if (name.isEmpty()) {
            message[0] = "You must enter a name for the user.";
            filled = false;
        }
        if (pass.isEmpty()) {
            message[1] = "You must enter a pass for the category.";
            filled = false;
        }
        
        User user = new User();
        user.setId(Integer.parseInt(id));
        user.setName(name);
        user.setUsername(username);
        user.setPassword(pass);
        user.setRole(role);
        
        if(filled){
            userService(user);
            resp.sendRedirect(req.getContextPath() + "/admin/user/search");
        }else{
            req.setAttribute("user", user);
            req.setAttribute("message", message);
            req.getRequestDispatcher("/view/admin/update_user.jsp").forward(req, resp);
        }

        // xu ly update

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
