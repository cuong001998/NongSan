<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <jsp:include page="/view/admin/include/css.jsp"></jsp:include>
        <title>Add Category</title>
    </head>
        <body>
        <c:url var= "url" value ="/admin/category/add"></c:url>
        <form action="${url}" method="post">
            <div class="container">

                <section class="panel panel-default">
                    <div class="panel-heading"> 
                        <h3 class="panel-title">Add category</h3> 
                    </div> 
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="name" id="name" value="${category.name}">
                                <i> ${message[0]}</i>
                            </div>
                        </div> <!-- form-group // -->

                        <div class="form-group">
                            <label for="descrip" class="col-sm-3 control-label">Description</label>
                            <div class="col-sm-9">
                                <textarea name="description" class="form-control" id="description">${category.description}</textarea>
                                <i> ${message[1]}</i>
                            </div>
                        </div> <!-- form-group // -->

                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
                        </div> <!-- form-group // -->

                    </div><!-- panel-body // -->
                </section><!-- panel// -->
            </div> <!-- container// -->
        </form>
    </body>
</html>