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
    <title>Author</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   	<div>
		<h2>Add an author!</h2>
		<a href="/home">Home</a>
	</div>
   <form:form action="/author/create" method="post" modelAttribute="author" class="col-lg-6 offset-lg-3">
   		<div>
   			<form:label path="fName">First Name: </form:label>
   			<form:input path="fName"></form:input>
   			<form:errors path="fName"></form:errors>
		</div>
		<div>
   			<form:label path="lName">Last Name: </form:label>
   			<form:input path="lName"></form:input>
   			<form:errors path="lName"></form:errors>
		</div>
		<div>
   			<form:label path="age">Age: </form:label>
   			<form:input path="age"></form:input>
   			<form:errors path="age"></form:errors>
		</div>
		<div >
   			<form:label path="books">Books:</form:label>
   			<form:select path="books">
   				<c:forEach var="oneBook" items="${books}">
   					<form:option value="${oneBook.book_id}" path="books">
   						<c:out value="${oneBook.title}"/>
   					</form:option>
   				</c:forEach>
   			</form:select>
   			<form:errors path="books"></form:errors>
   		</div>
   		<button>Add Me!</button>
   </form:form>
   <div>
   		<h3>Authors:</h3>
   		<c:forEach var="author" items="${allAuth}">
   			<ul>
   				<li><c:out value="${author.fName}"></c:out><c:out value="${author.lName}"></c:out></li>
   			</ul>
   		</c:forEach>
   		
   </div>
</body>
</html>
