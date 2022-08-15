<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css"> 
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<div class = "container">
		<div>
			<h1>Add a Book</h1>
			<a href="/home">Go home</a>
		</div>
		<div>
			<form:form action = "/book/${book.id }/edit" method= "post" modelAttribute="book">
				<input type= "hidden" name="_method" value="put"/>
				<div class="mb-3">
					<form:label class="form-label" path = "title">Title</form:label>
					<form:input class="form-control" type = "text" path = "title"/>
					<div>
						<form:errors class= "errors"  path = "title"/>
					</div>
				</div>
				<div class="mb-3">
					<form:label class="form-label" path = "author">Author</form:label>
					<form:input class="form-control" type = "text" path = "author"/>
					<div>
						<form:errors class= "errors"  path = "author"/>
					</div>
				</div>
				<div class="mb-3" style="display: flex; align-items: center; ">
					<form:label class="form-label" path = "thoughts">My thoughts</form:label>
					<form:textarea class="form-label" path = "thoughts" id ="textarea"></form:textarea>
					<div>
						<form:errors class= "errors"  path = "thoughts"/>
					</div>
				</div>
				<form:hidden path="user" value="${book.user.id }"/>
					<button  class="btn btn-outline-success" type= "submit">Update book</button>
			</form:form>
		</div>
	</div>
</body>
</html>