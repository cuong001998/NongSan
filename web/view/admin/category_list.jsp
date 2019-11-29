<%-- 
    Document   : category_list
    Created on : Nov 13, 2019, 4:00:27 PM
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
                <div class="row">
                    <div class="col-md-3 col-sm-12">
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <input type="text" class="form-control" name="search"  placeholder="nhap ten the loai">
                    </div>
                    <div class="col-md-3 col-sm-12">
                        <button type="button" class="btn btn-success" href ="#">Tim kiem</button>
                    </div>
                </div>
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
                            <th>Description</th>
                            <th>Option</th>
                        </tr>
                        <tr>
                            <c:forEach items="${categoryList}" var= "category">
                                <td>${category.id }</td>
                                <td>${category.name }</td>
                                <td>${category.description }</td>
                                <td> 
                                    <a class="btn btn-success" href="/NongSan/admin/category/update?cid=${category.getId() }">Sua</a> |
                                    <a class="btn btn-danger" href= "/NongSan/admin/category/delete?cid=${category.getId() }">Xoa</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
