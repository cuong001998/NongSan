
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
            <div class="row">

                <div class="col-md-3 col-sm-12">
                </div>
                <div class="col-md-6 col-sm-12">
                    <input type="text" class="form-control" name="search"  placeholder="nhap ten nguoi dung muon tim">
                </div>
                <div class="col-md-3 col-sm-12">
                    <button type="button" class="btn btn-success" href ="#">Tim kiem</button>
                </div>

            </div>
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
                            <th>Status</th>
                            <th>Option</th>
                        </tr>
                        <tr>
                            <c:forEach items="${cartList}" var = "cart">
                            <tr>
                                <td>${cart.id }</td>
                                <td>${cart.buyer.name }</td>
                                <td>${cart.buyDate }</td>
                                <td>${cart.status }</td>
                                <td>
                                    <a class="btn btn-success" href="/Farming/cart/update?cid=${ cart.id}">Sua</a> |
                                    <a class="btn btn-danger" href= "/Farming/cart/delete?cid=${ carts.id}">Xoa</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>	
    </body>
</html>