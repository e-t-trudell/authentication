<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
 
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   <div class="col-lg-6 offset-lg-3 border border-4 border-success mt-5 mx-auto p-5" style="width: 500px;">
		<form:form action="/books/update/{book.book_id}" method="post" modelAttribute="book">
   		<div>
			<h2>Editing: <c:out value="${book.title}"></c:out></h2>
			<a href="/home">Back to shelves</a>
		</div>
   		<div>
   			<input type="hidden" name="_method" value="put"/>
   			<form:hidden path="book_id" />
   		</div>
   		
   		<div class="form-group row  align-items-center justify-content-center">
   			<form:label path="title">Title: </form:label>
   			<form:input path="title" value="${book.title}" class="form-control border border-info"></form:input>
   			<form:errors path="title"></form:errors>
		</div>
		<div class="form-group row  align-items-center justify-content-center">
   			<form:label path="author">Author: </form:label>
   			<form:input path="author" value="${book.author}" class="form-control border border-info"></form:input>
   			<form:errors path="author"></form:errors>
		</div>
		<div class="form-group row  align-items-center justify-content-center">
   			<form:label path="thoughts">My thoughts: </form:label>
   			<form:input path="thoughts" value="${book.thoughts}" class="form-control border border-info"></form:input>
   			<form:errors path="thoughts"></form:errors>
		</div>
		<!-- add borrower id to this list for the form -->
		<div>
   			<form:hidden path="user.id" />
   		</div>
   		<div class="btn btn-primary">
   			<button>Update!</button>
   		</div>
   </form:form>
	</div>
	<div>
   		<form action="/language/${dojo.ninjas.id}" method="post">
    		<input type="hidden" name="_method" value="delete">
    		<input type="submit" value="Delete">
		</form>
	</div>
</body>
</html>
