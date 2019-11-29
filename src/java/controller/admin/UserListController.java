/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import data.UserData;
import java.io.IOException;
import java.util.List;
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
@WebServlet(urlPatterns = "/admin/user/search")
public class UserListController extends HttpServlet {
    UserData userData = new UserData();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> users = userData.search("");
        req.setAttribute("userList", users);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/admin/user_list.jsp");
        dispatcher.forward(req, resp);
    }
}
