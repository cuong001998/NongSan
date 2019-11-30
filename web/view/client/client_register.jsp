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
                                    <h3 class="account__title">Register</h3>
                                    <c:url var="url"  value="/register"/>
                                     <form action="${url}" method="post">
                                    <div class="account__form">
                                        <div class="input__box">
                                            <label>First name <span>*</span></label>
                                            <input type="text" name="name" value="${user.name}">
                                            <i>${message[0]}</i>
                                        </div>
                                        <div class="input__box">
                                            <label>Username <span>*</span></label>
                                            <input type="text" name="username" value="${user.username}">
                                            <i>${message[1]}</i><i>${message[3]}</i>
                                        </div>
                                        <div class="input__box">
                                            <label>Password<span>*</span></label>
                                            <input type="password" name="password" value="${user.password}">
                                            <i>${message[2]}<i>
                                        </div>
                                        <div class="form__btn">
                                            <button>Register</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            </div>
        <jsp:include page="/view/client/include/js.jsp"></jsp:include>
    </body>
</html>