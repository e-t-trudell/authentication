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
    <title>Land</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
		<h2>Welcome <c:out value="${user.userName}"/></h2>
   		<h5>Did you come for the cookies?</h5>
   </div>
   
   <div>
   <form:form action="/register" method="post" modelAttribute="newUser">
   		<div>
   			<form:label path="userName">User Name:</form:label>
   			<form:input path="userName"></form:input>
   			<form:errors path="userName"></form:errors>
   		</div>
   		<div>
   			<form:label path="email">Email:</form:label>
   			<form:input path="email"></form:input>
   			<form:errors path="email"></form:errors>
   		</div>
   		<div>
   			<form:label path="password">Password:</form:label>
   			<form:input path="password" type="password"></form:input>
   			<form:errors path="password"></form:errors>
   		</div>
   		<div>
   			<form:label path="confirm">Confirm Password:</form:label>
   			<form:input path="confirm" type="password"></form:input>
   			<form:errors path="confirm"></form:errors>
   		</div>
   		<button>Create User</button>
   </form:form>
   </div>
   <div>
   <form:form action="/login" method="post" modelAttribute="newLogin">
   		<div>
   			<form:label path="email">Email:</form:label>
   			<form:input path="email"></form:input>
   			<form:errors path="email"></form:errors>
   		</div>
   		<div>
   			<form:label path="password">Password:</form:label>
   			<form:input path="password" type="password"></form:input>
   			<form:errors path="password"></form:errors>
   		</div>
   		<button>Login</button>
   </form:form>
   </div>
   <div>
   		<h3>Users:</h3>
   		<c:forEach var="user" items="${allUsers}">
   			<ul>
   				<li><a href="/home/{user.id}"><c:out value="${user.userName}"></c:out></a></li>
   			</ul>
   		</c:forEach>
   		
   </div>
</body>
</html>
