<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css"> 
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<div class = "container">
		<div style="display: flex; justify-content: space-between; align-items: center;">
			<h1>Welcome <c:out value="${userName}"></c:out></h1>
				<a href="/create/book">Add a Book to Your library</a>
		</div>
		<div>
			<table class = "table table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>Title</th>
						<th>Author Name</th>
						<th>Posted By</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${bookList}">
						<c:choose>
							<c:when test="${book.borrower.id != userId}">
								<tr>
									<td>${book.id }</td>
									<td><a href="/book/${book.id}">${book.title }</a></td>
									<td>${book.author }</td>
									<td>${book.user.userName}</td>
									<td>
										<c:choose>
											<c:when test="${book.user.id == userId }">
												<div style= "display: flex; gap: 5px;">
													<a class = "btn btn-outline-warning" href="/book/${book.id}/edit">Edit</a>
													<form action = "/book/${book.id }/delete" method = "post">
														<input type= "hidden" name= "_method" value="delete"/>
														<button class="btn btn-outline-danger" type= "submit">Delete</button>
									 				</form>
												</div>
											</c:when>
											<c:otherwise>
												<form action="/book/${book.id}/borrow" method="post">
													<input type= "hidden" name= "_method" value = "put"/>
													<button type="submit">Borrow</button>
												</form>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:when>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
		<!-- // use list of borrowedBooks to check if the borrowed value is true. If true display table. -->
			<c:if test="${borrowedBooks == true }"> 
				<table class = "table table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>Title</th>
							<th>Author Name</th>
							<th>Posted By</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="book" items="${bookList}">
							<c:choose>
								<c:when test="${book.borrower.id == userId}">
									<tr>
										<td>${book.id }</td>
										<td><a href="/book/${book.id}">${book.title }</a></td>
										<td>${book.author }</td>
										<td>${book.user.userName}</td>
										<td>
											<form action="/book/${book.id}/return" method="post">
												<input type= "hidden" name= "_method" value = "put"/>
												<button type="submit">Return</button>
											</form>
										</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>