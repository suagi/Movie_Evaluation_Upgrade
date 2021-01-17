<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="resources/css/style.css">
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
  <link href="resources/css/clean-blog.css" rel="stylesheet">
  <title>Movie Evaluation</title>
</head>
<body>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
%>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">MovieEval</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="index.jsp">Home</a></li>
					<li class="nav-item">
						<a class="nav-link" href="index.jsp?rp=movie">Movie</a></li>
					<li class="nav-item">
						<a class="nav-link" href="drama.jsp">Drama</a></li>
					<li class="nav-item">
						<a class="nav-link" href="Animation.jsp">Animation</a></li>
				</ul>
			</div>
			<%
				if (userID == null) {
			%>
    		<div class="collapse navbar-collapse" id="navbarResponsive">
        		<ul class="navbar-nav ml-auto">
           		 	<li class="nav-item">
						<a class="nav-link" href="#" data-toggle="modal" data-target="#loginModal">
						<i class="fa fa-user"></i> Login</a></li>
            		<li class="nav-item">
            			<a class="nav-link" href="#" data-toggle="modal" data-target="#createModal">
            			<i class="fa fa-user"></i> Create</a></li>
        		</ul>
    		</div>
    		<%
				} else {
			%>
    		<div class="collapse navbar-collapse" id="navbarResponsive">
        		<ul class="navbar-nav ml-auto">
           		 	<li class="nav-item">
						<a class="nav-link" href="index.jsp?rp=logout">
						<i class="fa fa-user"></i> Logout</a></li>
        		</ul>
    		</div>
    		<%
				}
			%>
		</div>
	</nav>
	<!-- The Login Modal -->
	<div class="modal" id="loginModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title" id="modal">Login</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
					<!-- Modal body -->
					<div class="modal-body">
					<form action="views/user/loginAction.jsp" method="post">
						<div class="form-group">
							<input type="text" name="userID" class="form-control" placeholder="ID" maxlength="20">
						</div>
						<div class="form-group">
							<input type="password" name="userPassword" class="form-control" placeholder="Password" maxlength="20">
						</div>
					<!-- Modal footer -->
						<div class="modal-footer">
							<button type="submit" class="btn btn-secondary">Login</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- The Create Modal -->
	<div class="modal" id="createModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title" id="modal">Create</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
					<!-- Modal body -->
					<div class="modal-body">
					<form action="views/user/createAction.jsp" method="post">
						<div class="form-group">
							<input type="text" name="userID" class="form-control" placeholder="ID" maxlength="20">
						</div>
						<div class="form-group">
							<input type="password" name="userPassword" class="form-control" placeholder="Password" maxlength="20">
						</div>
						<div class="form-group">
							<input type="password" name="rePassword" class="form-control" placeholder="Re-Password" maxlength="20">
						</div>
						<div class="form-group">
							<input type="text" name="userNick" class="form-control" placeholder="NickName" maxlength="20">
						</div>
						<div class="form-group">
							<input type="email" name="userEmail" class="form-control" placeholder="E-mail" maxlength="30">
						</div>
					<!-- Modal footer -->
						<div class="modal-footer">
							<button type="submit" class="btn btn-secondary">Create</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>