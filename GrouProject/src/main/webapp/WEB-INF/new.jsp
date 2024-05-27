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
	    <title>New Game</title>
	    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="/css/style.css">
		<link href='https://fonts.googleapis.com/css?family=Press Start 2P' rel='stylesheet'>	
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
			<div class="d-flex align-items-center justify-content-around h-75 my-5">
				<div class="h-25 w-50 d-flex align-items-center justify-content-center" style="font-family: 'Press Start 2P';">
					<h1>New Game</h1>
				</div>
				<div class="h-100 w-50 d-flex align-items-center justify-content-around" id="gameTable">
					<form:form action="/games/new/game" method="POST" modelAttribute="newGame" class="h-75 w-75 d-flex flex-column justify-content-evenly">
						<div class="row mb-3">
							<form:label path="title" class="col-sm-2 col-form-label mx-2">Title</form:label>
							<div class="col-sm-9">
								<form:input type="text" class="form-control" path="title"/>
							</div>
						</div>
						<div class="row mb-1">
							<form:errors path="title" class="text-danger"/>
						</div>
						<div class="row mb-3">
							<form:label path="language" class="col-sm-2 col-form-label mx-2">Language</form:label>
							<div class="col-sm-9">
								<form:input type="text" class="form-control" path="language"/>
							</div>
						</div>
						<div class="row mb-1">
							<form:errors path="language" class="text-danger"/>
						</div>
						<fieldset class="row mb-3">
							<legend class="col-form-label col-sm-3 pt-0 mx-2">Co-Op?</legend>
							<div class="col-sm-8">
								<div class="form-check d-flex justify-content-evenly">
									<div>
										<form:radiobutton path="multiplayer" value="true"/>Yes
									</div>
									<div>
										<form:radiobutton path="multiplayer" value="false"/>No
									</div>
								</div>
							</div>
						</fieldset>
						<div class="row mb-1">
							<form:errors path="multiplayer" class="text-danger"/>
						</div>
						<div class="row mb-3">
							<form:label path="genre" class="col-sm-2 col-form-label mx-2">Genre</form:label>
							<div class="col-sm-9">
								<form:input type="text" class="form-control" path="genre"/>
							</div>
						</div>
						<div class="row mb-1">
							<form:errors path="genre" class="text-danger"/>
						</div>
						<button type="submit" class="btn btn-success goButton">Create Game!</button>
					</form:form>
				</div>
			</div>
			
		</div>
	</body>
</html>
