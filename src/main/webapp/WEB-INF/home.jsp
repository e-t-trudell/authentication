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
    <title>Home</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
   		<h2>Welcome <c:out value="${user.userName}"/></h2>
   		<h5>This is your home page!</h5>
   </div>
   <div>
   		<a href="/logout">Logout</a>
   		<a href="/books/add">+ Add to shelf</a>
   		<a href="/">+ Add new user</a>
   </div>
   <table class=" border border-4 border-warning table table responsive table-striped table-bordered table-hover.active p-5">
   		<thead class="container-fluid">
   			<tr >
   				<th class="col-lg-3">ID</th>
   				<th class="col-lg-3">Title</th>
   				<th class="col-lg-3">Author Name</th>
   				<th class="col-lg-3">Posted By</th>
   						
   			</tr>
   		</thead>
   		<tbody>
   			<c:forEach var="book" items="${allBooks}">
   			<tr>
   				<td>
   					<c:out value="${book.book_id}"/>
   				</td>
   				<td>
   					<a href="/books/show/${book.book_id}"><c:out value="${book.title}"></c:out></a>
   				</td>
   				<td>
   					<c:out value="${book.author}"></c:out>
   				</td>
   				<td>
   					<c:out value="${book.user.userName}"></c:out>
   				</td>
   				<td>
					<a href="/books/edit/${book.book_id}"><button>Edit Me</button></a>
   					<form action="/books/${book.book_id}" method="post">
    					<input type="hidden" name="_method" value="delete">
    					<input type="submit" value="Delete">
					</form>
   				</td>
   			
   					
   			</tr>
   			</c:forEach>
   			</tbody>
   	</table>
</body>
</html>
