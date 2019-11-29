<%-- 
    Document   : update_user
    Created on : Nov 13, 2019, 1:57:20 PM
    Author     : NGUYEN NGOC CUONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/view/admin/include/css.jsp" ></jsp:include>
        </head>
        <body>
        <c:url var= "url" value ="/admin/user/update"></c:url>
        <form action="${url}" method="post">
            <div class="container">
                <section  class="panel panel-default">
                    <div class="panel-heading"> 
                        <h3 class="panel-title">Update user</h3>
                    </div> 
                    <div class="panel-body">
                        
                        <!-- form-group id// -->
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Id</label>
                            <div class="col-sm-9">
                                <input type="text" readonly="readonly" class="form-control" name="id" value = "${user.id}">
                            </div>
                        </div> 
                            
                         <!-- form-group name // -->
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Name</label>
                            <div class="col-sm-9">
                                <input type="text"  class="form-control" name="yourname"
                                       placeholder="your name" value = "${user.name}">
                            </div>
                        </div> 
                        
                         <!-- form-group username // -->
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">User name</label>
                            <div class="col-sm-9">
                                <input type="text"  class="form-control" name="username" value = "${user.username}" readonly>       
                            </div>
                        </div>
                        
                        <!-- form-group password // -->
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Password</label>
                            <div class="col-sm-9">
                                <input type="text"  class="form-control" name="password"
                                       placeholder="password" value = "${user.password}">
                            </div>
                        </div> 
                        
                            <!-- form-group role // -->
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Role</label>
                            <div class="col-sm-9">
                            <select name="role" class="form-control" value = "${user.role}">
                                <c:if test="${user.role=='ADMIN' }">
                                    <option value="MEMBER">MEMBER</option>
                                    <option value="ADMIN" selected>ADMIN</option>
                                </c:if>
                                <c:if test="${user.role=='MEMBER' }">
                                    <option value="MEMBER" selected>MEMBER</option>
                                    <option value="ADMIN">ADMIN</option>
                                </c:if>
                             </select>
                            </div>
                        </div> 
                         <!-- form-group button -->       
                        <div class="form-group">
			    <div class="col-sm-offset-3 col-sm-9">
			      <button type="submit" class="btn btn-primary">Update</button>
			    </div>
			</div> 
                    </div>
                </section>
            </div>
        </form>
    </body>
</html>
