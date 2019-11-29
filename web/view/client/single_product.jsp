<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
       
        <jsp:include page="/view/client/include/css.jsp"></jsp:include>

    </head>
    <body>
            <div class="wrapper" id="wrapper">
            <jsp:include page="/view/client/include/header.jsp"></jsp:include>
                <!-- Start Bradcaump area -->
                <div class="ht__bradcaump__area bg-image--4">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="bradcaump__inner text-center">
                                    <h2 class="bradcaump-title">Shop Single</h2>
                                    <nav class="bradcaump-content">
                                        <a class="breadcrumb_item" href="index.html">Home</a>
                                        <span class="brd-separetor">/</span>
                                        <span class="breadcrumb_item active">Shop Single</span>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Bradcaump area -->
                <!-- Start main Content -->
                <div class="maincontent bg--white pt--80 pb--55">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-9 col-12">
                                <div class="wn__single__product">
                                    <div class="row">
                                        <div class="col-lg-6 col-12">
                                            <div class="wn__fotorama__wrapper">
                                                <div class="fotorama wn__fotorama__action" data-nav="thumbs">
                                                    <a href="${product.name}"><img src="/NongSan/downloadProduct?filename=${product.imageName }" alt=""></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="product__info__main">
                                                <h1>${product.name}</h1>
                                                <div class="product-reviews-summary d-flex">
                                                    <ul class="rating-summary d-flex">
                                                        <li><i class="zmdi zmdi-star-outline"></i></li>
                                                        <li><i class="zmdi zmdi-star-outline"></i></li>
                                                        <li><i class="zmdi zmdi-star-outline"></i></li>
                                                        <li class="off"><i class="zmdi zmdi-star-outline"></i></li>
                                                        <li class="off"><i class="zmdi zmdi-star-outline"></i></li>
                                                    </ul>
                                                </div>
                                                <div class="price-box">
                                                    <span>$${product.price}</span>
                                                </div>
                                                <div class="price-box">
                                                    <p>${product.weight} g</p>
                                                </div>
                                                <form action="/NongSan/add_to_cart" method="get">
                                                <div class="box-tocart d-flex">
                                                    <span>So Luong</span>
                                                    <input id="qty" class="input-text qty" name="qty" min="1" value="1" title="Qty" type="number">
                                                    <input type="hidden" name="productId" value="${product.id}"/>
                                                    <div class="addtocart__actions">
                                                        <button class="tocart" type="submit" title="Add to Cart">Them vao gio hang</button>
                                                    </div>
                                                 </form>
                                                </div>
                                                <div class="product_meta">
                                                    <span class="posted_in">Categories: 
                                                       
                                                        <a href="#">${product.category.name}</a>
                                                       
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product__info__detailed">
                                    <div class="pro_details_nav nav justify-content-start" role="tablist">
                                        <a class="nav-item nav-link active" data-toggle="tab" href="#nav-details" role="tab">Mieu ta san pham</a>
                                    </div>
                                    <div class="tab__container">
                                        <!-- Start Single Tab Content -->
                                        <div class="pro__tab_label tab-pane fade show active" id="nav-details" role="tabpanel">
                                            <div class="description__attribute">
                                                <p>${product.description}</p>  
                                            </div>
                                        </div>
                                        <!-- End Single Tab Content -->
                                    </div>
                                </div>
                                <div class="wn__related__product pt--80 pb--50">
                                    <div class="section__title text-center">
                                        <h2 class="title__be--2">San pham lien quan</h2>
                                    </div>
                                    <div class="row mt--60">
                                        <div class="productcategory__slide--2 arrows_style owl-carousel owl-theme">
                                            <c:forEach items="${products}" var="pro">
                                            <c:if test="${pro.id != product.id}">
                                            <!-- Start Single Product -->
                                            <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                                <div class="product__thumb">
                                                    <a class="first__img" href="/NongSan/product/detail?productId=${pro.id}"><img src="/NongSan/downloadProduct?filename=${pro.imageName }" alt="product image"></a>
                                                    <a class="second__img animation1" href="/NongSan/product/detail?productId=${pro.id}"><img src="/NongSan/downloadProduct?filename=${pro.imageName }" alt="product image"></a>
                                                    
                                                </div>
                                                <div class="product__content content--center">
                                                    <h4><a href="/NongSan/product/detail?productId=${pro.id}">${pro.name}</a></h4>
                                                    <ul class="prize d-flex">
                                                        <li>$${pro.price}</li>
                                                       
                                                    </ul>
                                                    <div class="action">
                                                        <div class="actions_inner">
                                                            <ul class="add_to_links">
                                                                <li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a></li>
                                  
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
                                            </c:if>
                                            </c:forEach>
                                            <!-- Start Single Product -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-12 md-mt-40 sm-mt-40">
                                <div class="shop__sidebar">
                                    <aside class="wedget__categories poroduct--cat">
                                        <h3 class="wedget__title">Categories</h3>
                                        <ul>
                                            <c:forEach items="${categories}" var="category">
                                                <li><a href="#">${category.name} <span></span></a></li>
                                            
                                            </c:forEach>
                                        </ul>
                                    </aside>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End main Content -->
                <!-- Footer Area -->
                <!-- //Footer Area -->

            <jsp:include page="/view/client/include/footer.jsp"></jsp:include>
            </div>
        <jsp:include page="/view/client/include/js.jsp"></jsp:include>
    </body>
</html>