<%-- 
    Document   : add_user
    Created on : Nov 13, 2019, 3:43:30 PM
    Author     : NGUYEN NGOC CUONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <jsp:include page="/view/admin/include/css.jsp"></jsp:include>
    </head>
    <body>
        <c:url var= "url" value ="/admin/user/add"></c:url>
        <form action="${url}" method="post">
            <div class="container">
                <section  class="panel panel-default">
                    <div class="panel-heading"> 
                        <h3 class="panel-title">Add user</h3>
                    </div> 
                    <div class="panel-body">
                       
                         <!-- form-group name // -->
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Name</label>
                            <div class="col-sm-9">
                                <input type="text"  class="form-control" name="yourname" value="${user.name}">
                                <i> ${message[0]}</i>
                            </div>
                        </div> 
                        
                         <!-- form-group username // -->
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">User name</label>
                            <div class="col-sm-9">
                                <input type="text"  class="form-control" name="username" value="${user.username}">
                                <i> ${message[1]}</i>
                            </div>
                        </div>
                        
                        <!-- form-group password // -->
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Password</label>
                            <div class="col-sm-9">
                                <input type="text"  class="form-control" name="password" value="${user.password}">
                                <i> ${message[2]}</i>
                            </div>
                        </div> 
                        
                            <!-- form-group role // -->
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Role</label>
                            <div class="col-sm-9">
                            <select name="role" class="form-control" value="${user.role}">
                                <c:choose>
                                    <c:when test="${user.role=='ADMIN' }">
                                         <option value="MEMBER">MEMBER</option>
                                         <option value="ADMIN" selected>ADMIN</option>
                                     </c:when>
                                     <c:when test="${user.role=='MEMBER' }">
                                         <option value="MEMBER" selected>MEMBER</option>
                                         <option value="ADMIN">ADMIN</option>
                                     </c:when>
                                     <c:otherwise>
                                        <option value="MEMBER">MEMBER</option>
                                        <option value="ADMIN">ADMIN</option>
                                     </c:otherwise>
                                 </c:choose>
                             </select>
                            </div>
                        </div> 
                         <!-- form-group button -->       
                        <div class="form-group">
			    <div class="col-sm-offset-3 col-sm-9">
			      <button type="submit" class="btn btn-primary">Add User</button>
			    </div>
			</div> 
                    </div>
                </section>
            </div>
        </form>
    </body>
</html>
