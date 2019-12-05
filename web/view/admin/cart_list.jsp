
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/view/admin/include/css.jsp"></jsp:include>
    </head>
    <body>
        <div class="container">
            <jsp:include page="/view/admin/include/header.jsp"></jsp:include>
            <c:url var= "url" value ="/admin/cart/search"></c:url>
                    <form action="${url}" method="post">                       
                        <div class="row">
                            <div class="col-md-3 col-sm-12"></div>
                            <div class="col-md-6 ">
                                <input type="text" class="form-control" name="search"  placeholder="Enter name or username of cart...">
                            </div>
                            <div class="col-md-3">
                                <button type="submit" class="btn btn-success">Search</button>
                            </div>
                        </div>
                    </form>
            <br>
            <div class ="row">
                <div class="col-md-3 col-sm-12">
                    <jsp:include page="/view/admin/include/menu.jsp"></jsp:include>		
                </div>
                <div class="col-md-9 col-sm-12">
                    <!-- EXPRESSION LANGUAGE -->

                    <table class="table table-hover">
                        <tr class = "table-header">
                            <th>ID</th>
                            <th>User</th>
                            <th>BuyDate</th>
                          
                        </tr>
                        <tr>
                            <c:forEach items="${cartList}" var = "cart">
                            <tr>
                                <td>${cart.id }</td>
                                <td>${cart.buyer.name }</td>
                                <td>${cart.buyDate }</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>	
    </body>
</html>