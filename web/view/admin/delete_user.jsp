<%-- 
    Document   : delete_user
    Created on : Nov 13, 2019, 2:46:10 PM
    Author     : NGUYEN NGOC CUONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete user</title>
    </head>
    <body>
        <h1>Are you sure you want to delete this account?</h1>
        <table cellspacing="5" cellpadding="5" border="1">
            <tr>
                <td>User Id</td>
                <td>${user.id}</td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>${user.name}</td>
            </tr>
            <tr>
                <td>Username</td>
                <td>${user.username}</td>
            </tr>
            <tr>
                <td>Password</td>
                <td>${user.password}</td>
            </tr>
            <tr>
                <td>Role</td>
                <td>${user.role}</td>
            </tr>
        </table>
        <br>
         <c:url var= "url" value ="/admin/user/delete"></c:url>
        <form action="${url}" method="post">
            <input type="hidden" name="uid" value="${user.id}" />
            <input type="submit" value="Yes" />
            <a href="/NongSan/admin/user/search"<button type="button">No</button></a>
        </form>
    </body>
</html>
