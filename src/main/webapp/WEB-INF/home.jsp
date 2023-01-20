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
   		<h2>Welcome <c:out value="${userId.userName}"/></h2>
   		<h5>Please check out our books!</h5>
   </div>
   <div>
   		<a href="/logout">Logout</a>
   		<a href="/books/add">+ Add to shelf</a>
   		<a href="/">+ Add new user</a>
   		<a href="/author/new">+ Add new author</a>
   </div>
   <h3>All books that may be borrowed!</h3>
   <table class=" border border-4 border-warning table table responsive table-striped table-bordered table-hover.active p-5">
   		<thead class="container-fluid">
   			<tr >
   				<th class="col-lg-3">ID</th>
   				<th class="col-lg-3">Title</th>
   				<th class="col-lg-3">Author Name</th>
   				<th class="col-lg-3">Owner</th>
   				<th class="col-lg-3">Actions</th>
   						
   			</tr>
   		</thead>
   		<tbody>
   			<c:forEach var="book" items="${allBooks}">
   			<!-- check if logged in user is NOT the borrower -->
   				<c:if test="${user.id != book.borrower.id}">
   					<tr>
   				<td>
   					<c:out value="${book.book_id}"/>
   				</td>
   				<td>
   					<a href="/books/show/${book.book_id}"><c:out value="${book.title}"></c:out></a>
   				</td>
   				<td>
   					<c:out value="${book.author.fName}"></c:out><c:out value="${book.author.lName}"></c:out>
   				</td>
   				<td>
   					<c:out value="${book.user.userName}"></c:out>
   				</td>
   				<c:if test="${user.id==book.user.id}">
   				 <!-- == session.getAttribute("userId") -->
   					<td>
						<a href="/books/edit/${book.book_id}"><button>Edit Me</button></a>
   						<form action="/books/${book.book_id}" method="post">
    						<input type="hidden" name="_method" value="delete">
    						<input type="submit" value="Delete">
						</form>
   					</td>
   					
   				</c:if>
   				<c:if test="${book.user.id != user.id}">
   					<td>
   						<a href="/books/borrow/${book.book_id}">Borrow</a>
   					</td>
   				</c:if>
   			
   					
   			</tr>
   				</c:if>
   			
   			
   			</c:forEach>
   			</tbody>
   	</table>
   	<%-- <div>
   		<form:form action="/book/borrow/${book.book_id}" method="post" modelAttribute="book_id">
		<div>
   			<input type="hidden" name="_method" value="put"/>
   		</div>
		<div >
   			<form:label path="book">Book:</form:label>
   			<form:select path="book">
   				<c:forEach var="book" items="${allBooks}">
   					<form:option value="${book.book_id}" path="book">
   						<c:out value="${book.title}"/> 
   					</form:option>
   				</c:forEach>
   			</form:select>
   			<form:errors path="book"></form:errors>
   		</div>
   		<button>Borrow ME!</button>
   </form:form>
   	</div> --%>
   	<h3>Books I'm borrowing</h3>
   	<table class=" border border-4 border-warning table table responsive table-striped table-bordered table-hover.active p-5">
   		<thead class="container-fluid">
   			<tr >
   				<th class="col-lg-3">ID</th>
   				<th class="col-lg-3">Title</th>
   				<th class="col-lg-3">Author Name</th>
   				<th class="col-lg-3">Owner</th>
   				<th class="col-lg-3">Actions</th>
   						
   			</tr>
   		</thead>
   		<tbody>
   		 <!-- all books populate on the borrowing list first the c:if -->
   			<c:forEach var="bbook" items="${allBooks}">
   			<!-- check if logged in user is the borrower 
   			borrower is a type User 
   			so the comparison needs to compare User types
   			-->
   			<c:if test="${user == bbook.borrower}">
   			<!-- ${book.user.id != user.id} -->
   			<tr>
   				<td>
   					<c:out value="${bbook.book_id}"/>
   				</td>
   				<td>
   					<a href="/books/show/${bbook.book_id}"><c:out value="${bbook.title}"></c:out></a>
   				</td>
   				<td>
   					<c:out value="${bbook.author.fName}"></c:out><c:out value="${bbook.author.lName}"></c:out>
   				</td>
   				<td>
   					<c:out value="${bbook.user.userName}"></c:out>
   				</td>
   				
   				<td>
   					<a href="/books/return/${bbook.book_id}">Give Back</a>
   				</td>
   				<%-- <% %> --%>
   			
   					
   			</tr>
   			</c:if>
   			</c:forEach>
   			</tbody>
   	</table>
</body>
</html>
