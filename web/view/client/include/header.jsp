<%-- 
    Document   : header
    Created on : Nov 28, 2019, 1:50:47 AM
    Author     : NGUYEN NGOC CUONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Header -->
<header id="wn__header" class="oth-page header__area header__absolute sticky__header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 col-sm-4 col-7 col-lg-2">
                <div class="logo">
                    <a href="/NongSan/home">
                        <img src="/NongSan/static/client/images/logo/logoBia.png" alt="logo images">
                    </a>
                </div>
            </div>
            <div class="col-lg-8 d-none d-lg-block">
                <nav class="mainmenu__nav">
                    <ul class="meninmenu d-flex justify-content-start">
                        <li class="drop with--one--item"><a href="#">Home</a></li>

                        <li class="drop"><a href="#">About</a>
<!--                            <div class="megamenu mega02">
                                <ul class="item item02">
                                    <li class="title">Categories</li>
                                    <li><a href="shop-grid.html">Biography </a></li>
                                    <li><a href="shop-grid.html">Business </a></li>
                                    <li><a href="shop-grid.html">Cookbooks </a></li>
                                    <li><a href="shop-grid.html">Health & Fitness </a></li>
                                    <li><a href="shop-grid.html">History </a></li>
                                </ul>
                            </div>-->
                        </li>
                        <li class="drop"><a href="#">Blog</a>
<!--                            <div class="megamenu mega02">
                                <ul class="item item02">
                                    <li class="title">Top Collections</li>
                                    <li><a href="shop-grid.html">American Girl</a></li>
                                    <li><a href="shop-grid.html">Diary Wimpy Kid</a></li>
                                    <li><a href="shop-grid.html">Finding Dory</a></li>
                                    <li><a href="shop-grid.html">Harry Potter</a></li>
                                    <li><a href="shop-grid.html">Land of Stories</a></li>
                                </ul>
                                <ul class="item item02">
                                    <li class="title">More For Kids</li>
                                    <li><a href="shop-grid.html">B&N Educators</a></li>
                                    <li><a href="shop-grid.html">B&N Kids' Club</a></li>
                                    <li><a href="shop-grid.html">Kids' Music</a></li>
                                    <li><a href="shop-grid.html">Toys & Games</a></li>
                                    <li><a href="shop-grid.html">Hoodies</a></li>
                                </ul>
                            </div>-->
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-8 col-sm-8 col-5 col-lg-2">
                <ul class="header__sidebar__right d-flex justify-content-end align-items-center">
                    <li class="shop_search"><a class="search__active" href="#"></a></li>
                    <li class="wishlist"><a href="#"></a></li>
                    <li class="shopcart"><a class="cartbox_active" href="#"><span class="product_qun">${sessionScope.cart.size()}</span></a>
                        <!-- Start Shopping Cart -->
                        <div class="block-minicart minicart__active">
                            <div class="minicart-content-wrapper">
                                <div class="micart__close">
                                    <span>close</span>
                                </div>
                                <div class="items-total d-flex justify-content-between">
                                    <span>${sessionScope.cart.size()} items</span>
                                    <span>Cart Subtotal</span>
                                </div>
                                <div class="total_amount text-right">
                                    <span>Total money</span>
                                </div>
                                <div class="mini_action checkout">
                                    <a class="checkout__btn" href="/NongSan/view/client/cart.jsp">Go to Checkout</a>
                                </div>
                                <div class="single__items">
                                    <div class="miniproduct">
                                        <c:forEach items="${sessionScope.cart}" var="map">
                                            <div class="item01 d-flex">
                                                <div class="thumb">
                                                    <a href="/NongSan/product/detail?productId=${map.value.product.id}"><img src="/NongSan/downloadProduct?filename=${map.value.product.imageName}" alt="product images"></a>
                                                </div>
                                                <div class="content">
                                                    <h6><a href="/NongSan/product/detail?productId=${map.value.product.id}">${map.value.product.name}</a></h6>
                                                    <span class="prize">$${map.value.unitPrice}</span>
                                                    <div class="product_prize d-flex justify-content-between">
                                                        <span class="qun">Qty: ${map.value.quantity}</span>
                                                        <ul class="d-flex justify-content-end">
                                                            <li><a href="#"><i class="zmdi zmdi-settings"></i></a></li>
                                                            <li><a href="/NongSan/remove_cartitem?key=${map.key}"><i class="zmdi zmdi-delete"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="mini_action cart">
                                    <a class="cart__btn" href="/NongSan/view/client/cart.jsp">View and edit cart</a>
                                </div>
                            </div>
                        </div>
                        <!-- End Shopping Cart -->
                    </li>
                    <li class="setting__bar__icon"><a class="setting__active" href="#"></a>
                        <div class="searchbar__content setting__block">
                            <div class="content-inner">
                                <div class="switcher-currency">
                                    <strong class="lAccountabel switcher-label">
                                        <c:if test="${loginMember!=null}">
                                            <span>Xin chao, ${loginMember.username}</span>
                                        </c:if>
                                    </strong>
                                    <div class="switcher-options">
                                        <div class="switcher-currency-trigger">
                                            <div class="setting__menu">
                                                <c:choose>
                                                    <c:when test="${loginMember==null}">
                                                        <span><a href="/NongSan/login">Sign In</a></span>
                                                    </c:when>
                                                </c:choose>
                                                <span><a href="/NongSan/signout">Log out</a></span>
                                                <span><a href="/NongSan/register">Create An Account</a></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Start Mobile Menu -->
        <!-- End Mobile Menu -->
        <div class="mobile-menu d-block d-lg-none">
        </div>
        <!-- Mobile Menu -->	
    </div>		
</header>
                                    
<div class="box-search-content search_active block-bg close__top">
    <form action="/NongSan/search" method="post" id="search_mini_form" class="minisearch">
        <div class="field__search">
            <input type="text" placeholder="Tim kiem theo ten hoac the loai.." name="userinput">
            <div class="action">
                <a href="#"><i class="zmdi zmdi-search"></i></a>
            </div>
        </div>
    </form>
    <div class="close__wrap">
        <span>close</span>
    </div>
</div>