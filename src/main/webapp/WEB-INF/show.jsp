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
    <title>Show me a book!</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
		
		<div>
			<h2>Details for: <c:out value="${book.title}"></c:out></h2>
			<a href="/home">Back to shelves</a>
		</div>
		<div>
			<h3>
				<c:out value="${book.user.userName}"></c:out> read 
				<c:out value="${book.title}"></c:out> by 
				<c:out value="${book.author.fName}"></c:out> <c:out value="${book.author.lName}"></c:out>.
			</h3>
			<h4>Here are <c:out value="${book.user.userName}"></c:out>'s thoughts:</h4>
		</div>
		<hr />
		<div>
			<p><c:out value="${book.thoughts}"></c:out></p>
		</div>
		<hr />
		
	</div>
	<div>
		<a href="/books/edit/${book.book_id}"><button>Edit Me</button></a>
   		<form action="/books/${book.book_id}" method="post">
    		<input type="hidden" name="_method" value="delete">
    		<input type="submit" value="Delete">
		</form>
	</div>
   	
</body>
</html>
