<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Migrando Servlets a Spring MVC</title>
	<link href="css/style.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<div class="content-form">
        <h1>Migrando Servlets a Spring MVC</h1>
        <p>Ingrese su nombre y usuario para loguearse</p>

        <form action="login" method=post>
        
          <fieldset>
            <legend>Información de contacto:</legend>
            <label for="nombre">User:</label>
            <input type="text" name="name" data-ng-model="name">
            <label for="nombre">Pass:</label>
            <input type="password" name="pass" data-ng-model="pass">
            <input type="submit" data-ng-disabled="!(name && pass)" name="action" value="login">
            
            <c:if test="${usuarioMal == true}">
            	<span>El usuario o la contraseña son incorrectos</span>
            </c:if>
            
            <%  if ( Boolean.valueOf(String.valueOf(request.getAttribute("showRecoveryLink"))) ){ %>
        	
        	<p> Olvido su contraseña? <br>
        		Haga click en el siguiente link para restablecerla...<a href="/showRecoveryUser">AQUÍ</a>
        	</p>
           <% } %>
           <p>No tiene usuario?<br>
           	  Haga click en el siguiente link para Crearlo...<a href="/createUser">AQUÍ</a>
           </p>
            
          </fieldset>
        </form>
        
    </div>


</body>
</html>