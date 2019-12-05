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
        <title>Delete category</title>
    </head>
    <body>
        <h1>Are you sure you want to delete this category?</h1>
        <table cellspacing="5" cellpadding="5" border="1">
            <tr>
                <td>Category Id</td>
                <td>${category.id}</td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>${category.name}</td>
            </tr>
            <tr>
                <td>Description</td>
                <td>${category.description}</td>
            </tr>
        </table>
        <br>
         <c:url var= "url" value ="/admin/category/delete"></c:url>
        <form action="${url}" method="post">
            <input type="hidden" name="cid" value="${category.id}" />
            <input type="submit" value="Yes" />
            <a href="/NongSan/admin/category/search"<button type="button">No</button></a>
        </form>
    </body>
</html>
