<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Details</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css"> 
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<div class = "container">
		<div style="display: flex; justify-content: space-between; align-items: center;">
			<h1>${oneBook.title }</h1>
			<a href="/home">Go back</a>
		</div>
		<div>
			<c:choose>
				<c:when test="${oneBook.user.id == userId }">
					<h3>You read ${oneBook.title } by ${oneBook.author }</h3>
					<h3>Here are your thoughts:</h3>
				</c:when>
				<c:otherwise>
					<h3>${oneBook.user.userName } read ${oneBook.title } by ${oneBook.author }</h3>
					<h3>Here are ${oneBook.user.userName }'s thoughts:</h3>
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			${oneBook.thoughts }
		</div>
		<div>
			<c:if test="${oneBook.user.id == userId}">
				<a href="/book/${oneBook.id }/edit">Edit</a>
			</c:if>
		</div>
	</div>
</body>
</html>