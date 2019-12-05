<%-- 
    Document   : user_list
    Created on : Nov 12, 2019, 4:58:05 PM
    Author     : NGUYEN NGOC CUONG
--%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/view/admin/include/css.jsp"></jsp:include>
     </head>
     <body>
            <div class="container">
                <jsp:include page="/view/admin/include/header.jsp"></jsp:include>
                    <c:url var= "url" value ="/admin/user/search"></c:url>
                    <form action="${url}" method="post">                       
                        <div class="row">
                            <div class="col-md-3 col-sm-12"></div>
                            <div class="col-md-6 ">
                                <input type="text" class="form-control" name="search"  placeholder="Enter name or username of user...">
                            </div>
                            <div class="col-md-3">
                                <button type="submit" class="btn btn-success">Search</button>
                            </div>
                        </div>
                    </form>
                <br>

                <div class ="row">
                    <div class="col-md-2 col-sm-12">							
                        <jsp:include page="/view/admin/include/menu.jsp"></jsp:include>
                    </div>
                    <div class="col-md-10 col-sm-12">
                        <table class="table table-hover">
                            <tr class = "table-header">
                                <th>ID</th>
                                <th>Name</th>
                                <th>UserName</th>
                                <th>Password</th>
                                <th>Role</th>
                                <th>Option</th>
                            </tr>
                            <tr>
                            <c:forEach items="${userList }" var = "user">
                            <tr>
                                <td>${user.id }</td>
                                <td>${user.name }</td>
                                <td>${user.username }</td>
                                <td>${user.password }</td>
                                <td>${user.role }</td>
                                <td>
                                    <a class="btn btn-success" href="/NongSan/admin/user/update?uid=${ user.getId()}">Edit</a> |
                                    <a class="btn btn-danger" href= "/NongSan/admin/user/delete?uid=${ user.getId()}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
