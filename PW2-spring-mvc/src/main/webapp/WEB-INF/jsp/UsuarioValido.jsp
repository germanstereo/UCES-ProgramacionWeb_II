<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>	
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Migrando Servlets a Spring MVC</title>
	<link href="css/style.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<div class="content-form">
		<h1>Usuario loggeado: ${sessionScope.user}</h1>
		<a href="/logout">Desloguearse!</a>
	</div>
</body>
</html>