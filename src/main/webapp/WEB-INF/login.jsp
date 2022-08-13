<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css"> 
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<div class = "container">
		<div class = "forms">
			<form:form action="/register" method = "post" modelAttribute="newUser">
				<h1>Register</h1>
				<div class="mb-3">
					<form:label class="form-label" path = "userName">UserName</form:label>
					<form:input class="form-control" type = "text" path = "userName"/>
					<div>
						<form:errors class= "errors" path = "userName"/>
					</div>
				</div>
				<div class="mb-3">
					<form:label class="form-label" path = "email">Email</form:label>
					<form:input class="form-control" type = "email" path = "email"/>
					<div>
						<form:errors class= "errors"  path = "email"/>
					</div>
				</div>
				<div class="mb-3">
					<form:label class="form-label" path = "password">Password</form:label>
					<form:input class="form-control" type = "text" path = "password"/>
					<div>
						<form:errors class= "errors" path = "password"/>
					</div>
				</div>
				<div class="mb-3">
					<form:label class="form-label" path = "confirmPassword">Confirm Password</form:label>
					<form:input class="form-control" type = "text" path = "confirmPassword"/>
					<div>
						<form:errors class= "errors" path = "confirmPassword"/>
					</div>
				</div>
				<button class="btn btn-outline-success" type= "submit">Submit</button>
			</form:form>
			<div>
				<form:form action = "/login" method = "post" modelAttribute="newLogin">
					<h1>Login</h1>
					<div class="mb-3">
						<form:label class="form-label" path = "email">Email</form:label>
						<form:input class="form-control" type = "email" path = "email"/>
						<div>
							<form:errors class= "errors" path = "email"/>
						</div>
					</div>
					<div class="mb-3">
						<form:label class="form-label" path = "password">Password</form:label>
						<form:input class="form-control" type = "password" path = "password"/>
						<div>
							<form:errors class= "errors" path = "password"/>
						</div>
					</div>
					<button class="btn btn-outline-success" type= "submit">Login</button>
				</form:form>
		    </div>
		</div>
	</div>
</body>
</html>