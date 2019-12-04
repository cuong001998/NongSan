<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>login</title>
        <jsp:include page="/view/client/include/css.jsp"></jsp:include>

        </head>
        <body>
            <div class="wrapper" id="wrapper">
                <section class="my_account_area pt--80 pb--55 bg--white">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 col-12">
                                <div class="my__account__wrapper">
                                    <h3 class="account__title">Đăng nhập</h3>
                                    <form action="/NongSan/login" method = "post">
                                        <div class="account__form">
                                            <div class="input__box">
                                                <label>Tên người dùng<span>*</span></label>
                                                <input type="text" name = "username" value="${user.username}">
                                            <i>${message[0]}</i>
                                        </div>
                                        <div class="input__box">
                                            <label>Mật khẩu<span>*</span></label>
                                            <input type="password" name= "password"  value="${user.password}">
                                            <i>${message[1]}</i>
                                        </div>
                                        <div class="form__btn">
                                            <button>Đăng nhập</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End My Account Area -->

            
            </div>
        <jsp:include page="/view/client/include/js.jsp"></jsp:include>
    </body>
</html>