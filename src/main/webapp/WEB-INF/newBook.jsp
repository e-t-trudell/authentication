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
    <title>New Book</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
		<h2>Add a book!</h2>
		<a href="/home">Home</a>
	</div>
   <form:form action="/books/create" method="post" modelAttribute="book">
   		<div>
   			<form:hidden path="book_id" />
   		</div>
   		
   		<div>
   			<form:label path="title">Title: </form:label>
   			<form:input path="title"></form:input>
   			<form:errors path="title"></form:errors>
		</div>
		<div>
   			<form:label path="author">Author: </form:label>
   			<form:input path="author"></form:input>
   			<form:errors path="author"></form:errors>
		</div>
		<div>
   			<form:label path="thoughts">My thoughts: </form:label>
   			<form:input path="thoughts"></form:input>
   			<form:errors path="thoughts"></form:errors>
		</div>
		<div>
   			<form:hidden path="user.id" />
   		</div>
   		<button>Add Me!</button>
   </form:form>
</body>
</html>
