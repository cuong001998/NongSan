<%@page import="model.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <jsp:include page="/view/admin/include/css.jsp"></jsp:include>
        </head>
        <body>
        <c:url var= "url" value ="/admin/category/update"></c:url>
        <form action="${url}" method="post">
            <div class="container">
                <section class="panel panel-default">
                    <div class="panel-heading"> 
                        <h3 class="panel-title">Edit category</h3> 
                    </div> 

                    <div class="panel-body">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Id</label>
                            <div class="col-sm-9">
                                <input type="text" readonly="readonly" class="form-control" name="id" id="id" 
                                        value = "${category.id }">
                            </div>
                        </div> <!-- form-group // -->

                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="name" id="name" value = "${category.name}">
                                <i> ${message[0]}</i>
                            </div>
                        </div> <!-- form-group // -->

                        <div class="form-group">
                            <label for="descrip" class="col-sm-3 control-label">Description</label>
                            <div class="col-sm-9">
                                <textarea name="description" class="form-control" id="description" >${category.description}</textarea>
                                <i> ${message[1]}</i>
                            </div>
                        </div> <!-- form-group // -->

                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div> <!-- form-group // -->

                    </div><!-- panel-body // -->
                </section><!-- panel// -->

            </div> <!-- container// -->
        </form>
    </body>
</html>