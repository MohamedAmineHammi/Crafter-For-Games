<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <title>Your Games</title>
	    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	    <link href='https://fonts.googleapis.com/css?family=Press Start 2P' rel='stylesheet'>
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
        					<li class="nav-item active">
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
			<div class="d-flex align-items-center justify-content-around h-75 my-5">
				<div class="h-75 w-75 d-flex align-items-center justify-content-center" id="gameTable">
					<div class="w-100 px-3 pt-3 overflow-auto">
						<table class="table text-white">
							<thead>
								<tr>
									<th>Title</th>
									<th>Genre</th>
									<th>Language</th>
									<th>Co-Op?</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="game" items="${ games }">
									<c:if test="${user.id==game.user.id }">
										<tr>
											<td><c:out value="${game.title }"/></td>
											<td><c:out value="${game.genre}"/></td>
											<td><c:out value="${game.language }"/></td>
											<td>
												<c:if test="${game.multiplayer==true }">Yes</c:if>
												<c:if test="${game.multiplayer==false }">No</c:if>
											</td>
											<td>
											<a href="/games/view/${game.id}" class="btn btn-primary infoButton">View</a> 
											<a href="/games/edit/${game.id}" class="btn btn-success goButton">Edit</a> 
											<a href="/games/${game.id}/delete" class="btn btn-danger delButton">Delete</a>
											
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="h-25 w-50 d-flex flex-column align-items-center justify-content-around" style="font-family: 'Press Start 2P';">
					<h1>Your Games</h1>
					<a href="/games/new">
						<button class="btn btn-success goButton">New Game</button>
					</a>
				</div>
			</div>
		</div>
	</body>
</html>
