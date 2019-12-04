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
                                    <h2 class="bradcaump-title">Trang sản phẩm</h2>
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
                                                    <a href="${product.name}"><img src="/NongSan/downloadProduct?filename=${product.imageName}" alt=""></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="product__info__main">
                                                <h1>${product.name}</h1>
                                                <div class="price-box">
                                                    <span>$${product.price}</span>
                                                </div>
                                                <div class="price-box">
                                                    <p>${product.weight} g</p>
                                                </div>
                                                <form action="/NongSan/add_to_cart" method="get">
                                                <div class="box-tocart d-flex">
                                                    <span>Số Lượng</span>
                                                    <input id="qty" class="input-text qty" name="qty" min="1" value="1" title="Qty" type="number">
                                                    <input type="hidden" name="productId" value="${product.id}"/>
                                                    <div class="addtocart__actions">
                                                        <button class="tocart" type="submit" title="Add to Cart">Thêm vào giỏ hàng</button>
                                                    </div>
                                                 </form>
                                                </div>
                                                <div class="product_meta">
                                                    <span class="posted_in">Danh mục:  
                                                       
                                                        <a href="#">${product.category.name}</a>
                                                       
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product__info__detailed">
                                    <div class="pro_details_nav nav justify-content-start" role="tablist">
                                        <a class="nav-item nav-link active" data-toggle="tab" href="#nav-details" role="tab">Miêu tả sản phẩm</a>
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
                            </div>
                            <jsp:include page="/view/client/include/sidebar.jsp"></jsp:include>
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