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
        <title>Delete product</title>
    </head>
    <body>
        <h1>Are you sure you want to delete this product?</h1>
        <table cellspacing="5" cellpadding="5" border="1">
            <tr>
                <td>Product Id</td>
                <td>${product.id}</td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>${product.name}</td>
            </tr>
            <tr>
                <td>Price</td>
                <td>${product.price}$</td>
            </tr>
            <tr>
                <td>Weight</td>
                <td>${product.weight}g</td>
            </tr>
            <tr>
                <td>Description</td>
                <td>${product.description}</td>
            </tr>
            <tr>
                <td>Category</td>
                <td>${product.category.name}</td>
            </tr>
            <tr>
                <td>Image</td>
                <td><img style="width:100px" src="/NongSan/downloadProduct?filename=${product.imageName}"></td>
            </tr>
        </table>
        <br>
         <c:url var= "url" value ="/admin/product/delete"></c:url>
        <form action="${url}" method="post">
            <input type="hidden" name="pid" value="${product.id}" />
            <input type="submit" value="Yes" />
            <a href="/NongSan/admin/product/search"><button type="button">No</button></a>
        </form>
    </body>
</html>
