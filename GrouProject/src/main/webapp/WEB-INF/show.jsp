<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	    <title><c:out value="${game.title }" /></title>
	    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="/css/style.css">
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body id="newBackground">
		<div class="container vh-100">
			<nav class="navbar navbar-expand-xl navbar-dark">
				<div class="container-fluid">
					<a href="/home" class="navbar-brand">From GitHub to Gamers</a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarBasic" aria-controls="navbarBasic" aria-expanded="false" aria-label="Toggle navigation">
      					<span class="navbar-toggler-icon"></span>
    				</button>
   					<div class="collapse navbar-collapse" id="navbarBasic">
      					<ul class="navbar-nav me-auto mb-2 mb-xl-0 offset-7">
        					<li class="nav-item">
          						<a class="nav-link" aria-current="page" href="/games">Your Games</a>
        					</li>
        					<li class="nav-item">
        						<a class="nav-link" href="/games/community">Community</a>
        					</li>
        					<li class="nav-item">
        						<a class="nav-link" href="/aboutUs">About Us</a>
        					</li>
        					<li class="nav-item">
        						<a class="nav-link" href="/logout">Logout</a>
        					</li>
        				</ul>
        			</div>
				</div>
			</nav>
			<div class="d-flex flex-column align-items-center" style="font-family: 'Press Start 2P';">
				<h1>${game.title}</h1>
			</div>
			<div class="d-flex align-items-center justify-content-around h-75 my-5">
				<div class="h-100 w-50 d-flex flex-column align-items-center justify-content-around" id="gameTable" style="font-family: 'Press Start 2P';">
					<div class="row mb-3">Language: ${game.language}</div>
					<c:choose>
						<c:when test="${game.multiplayer == true}">
							<div class="row mb-3">Co-Op? Yes!</div>
						</c:when>
						<c:otherwise>
							<div class="row mb-3">Co-Op? No</div>
						</c:otherwise>
					</c:choose>
					<div class="row mb-3">Genre: ${game.genre}</div>
				</div>
				<div class="h-100 w-50 d-flex flex-column align-items-start justify-content-between">
					<!--list of comments -->
					<c:if test="${game.comments.size() > 0}">
						<div class="mx-4 my-5 p-3 w-75 overflow-auto" id="gameTable">
							<c:forEach var="comment" items="${game.comments }">
								<div class="mb-3">
									<c:out value="${comment.content }"/>
									-<c:out value="${comment.user.userName }"/>
									<fmt:formatDate value="${comment.createdAt}" pattern="MM/dd/yyyy hh:mm:ss a" />
									<!-- Delete Comment functionality -->
									<c:if test="${comment.user.id == user.id }">
										<form action="/games/${game.id}/comment/${comment.id}/delete" method="post">
											<input type="hidden" name="_method" value="delete"> 
											<input type="submit" class="btn btn-link" value="Delete Your Comment">
										</form>
									</c:if>
								</div>
							</c:forEach>
						</div>
					</c:if>
					
								<!--Comment Box-->
					<div class="mx-3 my-5 p-3" style="font-family: 'Press Start 2P';">
						<form:form action="/games/${game.id }/addcomment" method="post" modelAttribute="newComment">
							<form:textarea placeholder="add comment here" path="content"/>
							<form:errors path="content"/>
							<form:input type="hidden" path="game" value="${game.id }"/>
							<form:input type="hidden" path="user" value="${user.id }"/>
							<input type="submit" class="btn btn-success goButton" value="add comment">
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
