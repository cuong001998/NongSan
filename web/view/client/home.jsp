<%-- 
    Document   : home
    Created on : Nov 28, 2019, 10:02:04 AM
    Author     : NGUYEN NGOC CUONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <jsp:include page="/view/client/include/css.jsp"></jsp:include>
        </head>
        <body>
            <!-- Main wrapper -->
            <div class="wrapper" id="wrapper">

                <!-- Header -->
            <jsp:include page="/view/client/include/header.jsp"></jsp:include>
                <!-- //Header -->
                <!-- Start Search Popup -->
                <!-- End Search Popup -->
                <!-- Start Bradcaump area -->
                <div class="ht__bradcaump__area bg-image--6">
                </div>
                <!-- End Bradcaump area -->
                <!-- Start Shop Page -->
                <div class="page-shop-sidebar left--sidebar bg--white section-padding--lg">
                    <div class="container">
                        <div class="row">
                        <jsp:include page="/view/client/include/sidebar.jsp"></jsp:include>
                        <div class="col-lg-9 col-12 order-1 order-lg-2">
                            <div class="row">
                                <div class="col-lg-12">

                                </div>
                            </div>
                            <div class="tab__container">
                                <div class="shop-grid tab-pane fade show active" id="nav-grid" role="tabpanel">

                                    <div class="row">
                                        <c:forEach items="${products}" var="product">
                                            <!-- Start Single Product -->
                                            <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                                <div class="product__thumb">
                                                    <a class="first__img" href="/NongSan/product/detail?productId=${product.id}"><img src="/NongSan/downloadProduct?filename=${product.imageName }" alt="product image"></a>
                                                    <a class="second__img animation1" href="/NongSan/product/detail?productId=${product.id }"><img src="/NongSan/downloadProduct?filename=${product.imageName }" alt="product image"></a>
                                                </div>
                                                <div class="product__content content--center">
                                                    <h4><a href="/NongSan/product/detail?productId=${product.id }">${ product.name }</a></h4>
                                                    <ul class="prize d-flex">
                                                        <li>${product.price} $</li>

                                                    </ul>
                                                    <div class="action">
                                                        <div class="actions_inner">
                                                            <ul class="add_to_links">
                                                                <li><a class="cart" href="/NongSan/add_to_cart?productId=${product.id}"><i class="bi bi-shopping-bag4"></i></a></li>

                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="product__hover--content">
                                                        <ul class="rating d-flex">
                                                            <li class="on"><i class="fa fa-star-o"></i></li>
                                                            <li class="on"><i class="fa fa-star-o"></i></li>
                                                            <li class="on"><i class="fa fa-star-o"></i></li>
                                                            <li><i class="fa fa-star-o"></i></li>
                                                            <li><i class="fa fa-star-o"></i></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Single Product -->
                                        </c:forEach>
                                    </div>

                                    <ul class="wn__pagination">
                                        <li class="active"><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Shop Page -->
            <!-- Footer Area -->
            <jsp:include page="/view/client/include/footer.jsp"></jsp:include>
                <!-- //Footer Area -->

            </div>
            <!-- //Main wrapper -->

            <!-- JS Files -->
        <jsp:include page="/view/client/include/js.jsp"></jsp:include>
    </body>
</html>
