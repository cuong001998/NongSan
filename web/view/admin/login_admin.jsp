<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Login Form</title>
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <link rel = "stylesheet" href = "../static/admin/css/login_admin.css">
    </head>
    <body>
       <c:url var= "url" value ="/admin-lg/login"></c:url>
       <div class="wrap">
        <form class="login-form" action="${url}" method="post">
            <div class="form-header">
                <h3>Login Form</h3>
                <p>Login admin</p>
            </div>
            <!--Email Input-->
            <div class="form-group">
                <input type="text" name="username" class="form-input" placeholder="username">
            </div>
            <!--Password Input-->
            <div class="form-group">
                <input type="password" name="password" class="form-input" placeholder="password">
            </div>
            <!--Login Button-->
            <div class="form-group">
                <button class="form-button" type="submit">Login</button>
            </div>
        </form>
    </div><!--/.wrap-->
    </body>
</html>