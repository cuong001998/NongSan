    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

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

/**
 *
 * @author NGUYEN NGOC CUONG
 */
@WebServlet(urlPatterns = "/login")
public class LoginMember extends HttpServlet {

    UserData userData = new UserData();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher
                = req.getRequestDispatcher("/view/client/client_login.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        String [] message = new String[2];
        boolean filled = true;
        
        if(username.isEmpty()){
            message[0] = "enter a username";
            filled=false;
        }
        if(password.isEmpty()){
            message[1] = "enter a password";
            filled=false;
        }
        
        User user = getUserByUsername(username, password);
        
        if(filled){
            if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("loginMember", user);

                resp.sendRedirect(req.getContextPath() + "/home");
            } else {
                resp.sendRedirect(req.getContextPath() + "/login");
            }   
        }else{
            req.setAttribute("user", user);
            req.setAttribute("message", message);
            req.getRequestDispatcher("/view/client/client_login.jsp").forward(req, resp);
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
