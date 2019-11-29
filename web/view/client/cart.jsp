<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<jsp:include page="/view/client/include/css.jsp"></jsp:include>

</head>
<body>
	<div class="wrapper" id="wrapper">
	<jsp:include page="/view/client/include/header.jsp"></jsp:include>
		<!-- Start Search Popup -->
		<!-- End Search Popup -->
       <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area bg-image--3">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="bradcaump__inner text-center">
                        	<h2 class="bradcaump-title">Shopping Cart</h2>
                            <nav class="bradcaump-content">
                              <a class="breadcrumb_item" href="index.html">Home</a>
                              <span class="brd-separetor">/</span>
                              <span class="breadcrumb_item active">Shopping Cart</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
         <!-- cart-main-area start -->
        <div class="cart-main-area section-padding--lg bg--white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 ol-lg-12">
                        <form action="#">               
                            <div class="table-content wnro__table table-responsive">
                                <table id="table">
                                    <thead>
                                        <tr class="title-top">
                                            <th class="product-thumbnail">Image</th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Total</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${sessionScope.cart}" var="map">
                                    		<tr>
                                            <td class="product-thumbnail"><a href="#"><img src="/NongSan/downloadProduct?filename=${map.value.product.imageName }" alt="product img"></a></td>
                                            <td class="product-name"><a href="#">${ map.value.product.name }</a></td>
                                            <td class="product-price"><span class="amount" id="amountId">${map.value.unitPrice }</span></td>
                                            <td class="product-quantity"><input type="number" id="valueNumber" value="${map.value.quantity}" onchange="clickQty()"></td>
                                            <td class="product-subtotal">${map.value.unitPrice * map.value.quantity }</td>
                                            <td class="product-remove"><a href="/NongSan/remove_cartitem?key=${map.key }">X</a></td>
                                       		</tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </form> 
                        <div class="cartbox__btn">
                            <ul class="cart__btn__list d-flex flex-wrap flex-md-nowrap flex-lg-nowrap justify-content-between">
                                <li><a href="#">Coupon Code</a></li>
                                <li><a href="#">Apply Code</a></li>
                                <li><a href="#">Update Cart</a></li>
                                <li><a href="/NongSan/member/pay">Check Out</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 offset-lg-6">
                        <div class="cartbox__total__area">
                            <div class="cartbox-total d-flex justify-content-between">
                                <ul class="cart__total__list">
                                    <li>Cart total</li>
                                   <!-- <li>Tax</li> -->
                                </ul>
                                <ul class="cart__total__tk">
                                    <li id="totalCart"></li>
                                   <!--  <li id ="tax">5000</li>--> 
                                </ul>
                            </div>
                            <div class="cart__total__amount">
                                <span>Grand Total</span>
                                <span id="totalFinal"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
        <!-- cart-main-area end -->
	<script >
		var table =  document.getElementById("table");
		var sumVal =0;
		for(var i=1 ;i<table.rows.length;i++){
			sumVal= sumVal + parseInt(table.rows[i].cells[4].innerHTML);
		}
		//console.log(sumVal);
		var cartTotal = document.getElementById("totalCart");
		cartTotal.innerHTML=sumVal;
		
		//var totalFinal = document.getElementById("totalFinal");
		//totalFinal.innerHTML=sumVal+document.getElementById("tax");
		function clickQty(){
			var qty = document.getElementById("valueNumber").value;
			var amo = document.getElementById("amountId").innerHTML;
			var total =  qty*amo;
			console.log(total);
			//cartTotal.innerHTML=total;
		}
	</script>
	<jsp:include page="/view/client/include/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="/view/client/include/js.jsp"></jsp:include>
</body>
</html>