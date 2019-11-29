
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <jsp:include page="/view/admin/include/css.jsp"></jsp:include>

        </head>
        <body>
            <div class="container">
                <jsp:include page="/view/admin/include/header.jsp"></jsp:include>
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
                                <th>Quantity</th>
                                <th>UnitPrice</th>
                                <th>IdProduct</th>
                                <th>IdCart</th>
                                <th>Option</th>
                            </tr>
                            <tr>
                            <c:forEach items="${cartItemList}" var = "cartitem">
                            <tr>
                                <td>${cartitem.id}</td>
                                <td>${cartitem.quantity }</td>
                                <td>${cartitem.unitPrice }</td>
                                <td>${cartitem.product.name }</td>
                                <td>${cartitem.cart.id}</td>
                                <td>
                                    <a class="btn btn-success" href="#">Sua</a> |
                                    <a class="btn btn-danger" href= "#">Xoa</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>	
    </body>
</html>