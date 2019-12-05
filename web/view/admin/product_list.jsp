<%-- 
    Document   : product_list
    Created on : Nov 19, 2019, 3:43:22 PM
    Author     : NGUYEN NGOC CUONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/view/admin/include/css.jsp"></jsp:include>
        </head>
        <body>
            <div class="container">
            <jsp:include page="/view/admin/include/header.jsp"></jsp:include>
            <c:url var= "url" value ="/admin/product/search"></c:url>
            <form action="${url}" method="post">                       
                <div class="row">
                    <div class="col-md-3 col-sm-12"></div>
                    <div class="col-md-6 ">
                        <input type="text" class="form-control" name="search"  placeholder="Enter name or category...">
                    </div>
                    <div class="col-md-3">
                        <button type="submit" class="btn btn-success">Search</button>
                    </div>
                </div>
            </form>
            <br>

            <div class="row">
                <div class="col-md-2 col-sm-12">							
                    <jsp:include page="/view/admin/include/menu.jsp"></jsp:include>
                    </div>

                    <div class="col-md-10 col-sm-12">
                        <table class="table table-hover">
                            <tr class = "table-header">
                                <th>ID</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Weight</th>
                                <th>Description</th>
                                <th>Category</th>
                                <th>Image</th>
                                <th>Option</th>
                            </tr>
                            <tr>
                            <c:forEach items="${products }" var = "product">
                            <tr>
                                <td>${product.id }</td>
                                <td>${product.name }</td>
                                <td>${product.price }$</td>
                                <td>${product.weight }g</td>
                                <td>${product.description }</td>
                                <td>${product.category.name}</td>
                                <td><img style="width:100px" src="/NongSan/downloadProduct?filename=${product.imageName}"></td>
                                <td>
                                    <a class="btn btn-success" href="/NongSan/admin/product/update?pid=${product.id}">Edit</a> |
                                    <a class="btn btn-danger" href= "/NongSan/admin/product/delete?pid=${product.id}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

        </div>
    </body>
</html>
