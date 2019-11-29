<%-- 
    Document   : add_product
    Created on : Nov 19, 2019, 4:33:04 PM
    Author     : NGUYEN NGOC CUONG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <jsp:include page="/view/admin/include/css.jsp"></jsp:include>
        <title>JSP Page update product</title>
    </head>
    <body>
       <c:url var= "url" value ="/admin/product/update"></c:url>
       <form action="${url}" method="post" enctype = "multipart/form-data">
            <div class="container">
                <section  class="panel panel-default">
                    <div class="panel-heading"> 
                        <h3 class="panel-title">Update product</h3>
                    </div> 
                    <div class="panel-body">
                        <!-- id -->
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">ID</label>
                            <div class="col-sm-9">
                                <input readonly class="form-control" name="id" value="${product.id}">
                            </div>
                        </div> 
                            
                         <!-- form-group name // -->
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Name</label>
                            <div class="col-sm-9">
                                <input type="text"  class="form-control" name="name" value="${product.name}">
                            </div>
                        </div> 
                        
                         <!-- form-group username // -->
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Price</label>
                            <div class="col-sm-9">
                                <input type="text"  class="form-control" name="price" value="${product.price}">       
                            </div>
                        </div>
                        
                        <!-- form-group weight // -->
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Weight</label>
                            <div class="col-sm-9">
                                <input type="text"  class="form-control" name="weight" value="${product.weight}">
                            </div>
                        </div> 
                        
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Description</label>
                            <div class="col-sm-9">
                                <input type="text"  class="form-control" name="description" value="${product.description}">
                            </div>
                        </div> 
                        
                            <!-- form-group category // -->
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Category</label>
                            <div class="col-sm-9">
<!--                                <select name="category" class="form-control">-->
                                <select name="category" class="form-control" value="${product.category.id}">
                                    <c:forEach items= "${categories}" var = "c">
                                        <c:choose>
                                            <c:when test="${product.category.id.equals(c.id)}">
                                                <option value="${c.id}" selected>${c.name}</option>
                                            </c:when>
                                            <c:otherwise>
                                                 <option value="${c.id}">${c.name}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                        </div> 
                            
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Select image</label>
                            <div class="col-sm-9">
                                <input type="file"  class="form-control" name="imageFile"  accept="image/*">
                                <img style="width : 100px" src="/NongSan/downloadProduct?filename=${product.imageName}">
                            </div>
                        </div>  
                         <!-- form-group button -->       
                        <div class="form-group">
			    <div class="col-sm-offset-3 col-sm-9">
			      <button type="submit" class="btn btn-primary">Update Product</button>
			    </div>
			</div> 
                    </div>
                </section>
            </div>
        </form>
    </body>
</html>
