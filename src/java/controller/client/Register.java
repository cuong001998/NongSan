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
import model.User;
/**
 *
 * @author NGUYEN NGOC CUONG
 */

@WebServlet(urlPatterns = "/register")
public class Register extends HttpServlet{
    
    UserData userData = new UserData();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher
                = req.getRequestDispatcher("/view/client/client_register.jsp");
        dispatcher.forward(req, resp);
    }
    
    

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String [] message = new String [4];
        boolean filled = true;
        
        if(name.isEmpty()){
            message[0]="enter a username";
            filled=false;
        }
        
        if(username.isEmpty()){
            message[1]="enter a username";
            filled=false;
        }
        if(password.isEmpty()){
            message[2]="enter a password";
            filled=false;
        }
        if(userData.checkUsername(username)){
            message[3] = "That username is taken. Try another";
            filled=false;
        }
        
        User user = new User();
        user.setName(name);
        user.setUsername(username);
        user.setPassword(password);
        user.setRole("MEMBER");
        if(filled){
            userData.add(user);
            resp.sendRedirect(req.getContextPath()+"/login");
        }else{
            req.setAttribute("user", user);
            req.setAttribute("message", message);
            req.getRequestDispatcher("/view/client/client_register.jsp").forward(req, resp);
        }
        
    }
    
}
