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
	    <title>About Us</title>
	    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="/css/style.css">
		<link href='https://fonts.googleapis.com/css?family=Press Start 2P' rel='stylesheet'>	
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body id="newBackground">
		<div class="container vh-100 overflow-auto">
			<nav class="navbar navbar-expand-xl navbar-dark">
				<div class="container-fluid">
					<a href="/home" class="navbar-brand">Crafters For Games</a>
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
        					<li class="nav-item active">
        						<a class="nav-link" href="/aboutUs">About Us</a>
        					</li>
        					<li class="nav-item">
        						<a class="nav-link" href="/logout">Logout</a>
        					</li>
        				</ul>
        			</div>
				</div>
			</nav>
			<div class="d-flex align-items-center justify-content-center" style="font-family: 'Press Start 2P';">
				<h1>About Us</h1>
			</div>
			
			<div class="d-flex flex-wrap align-items-center justify-content-evenly h-75 w-100">
				<div class="card mx-5 mb-3 newCard" id="gameTable">
					<div class="card-body d-flex flex-column align-items-center justify-content-evenly">
						<h5 class="card-title">Amine</h5>
						<img alt="profile picture" src="https://avatars.githubusercontent.com/u/125707104?v=4" style="max-width: 5em; height: auto;">
						<div class="d-flex align-items-center justify-content-evenly w-100">
							<a href="https://github.com/MohamedAmineHammi" class="btn" id="githubIcon">
								<img alt="github logo" src="/images/githubPixel.png" style="max-width: 3em; height: auto;">
							</a>
							<a href="https://www.linkedin.com/in/mohamed-amine-hammi/" class="btn" id="linkedInIcon">in</a>
						</div>
					</div>
				</div>
				
				
				
			</div>
		</div>
	</body>
</html>
