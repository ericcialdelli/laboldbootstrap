<%@page contentType="text/html; charset=ISO-8859-1"
	pageEncoding='ISO-8859-1'%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<!-- Bootstrap -->
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">-->

<link rel="stylesheet" href="<html:rewrite page='/css/bootstrap-theme.css'/>" type="text/css">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<style type="text/css">
	.bs-example{
    	margin: 20px;
    }
</style>



</head>
<body>
	<div class="btn-group">
		<c:forEach items="${listaMenu}" var="menu" varStatus="iPractica">
			<!--  <button type="button" class="btn btn-primary">${menu.item}</button>-->
	        <div class="btn-group">
	            <button type="button" data-toggle="dropdown" class="btn btn-primary dropdown-toggle">${menu.item} <span class="caret"></span></button>
	            <ul class="dropdown-menu">
	            	<c:forEach items="${menu.hijos}" var="hijo" varStatus="i">
	            		<li><a href="/LaboLDBootstrap${hijo.url}">${hijo.item}</a></li>
	            	</c:forEach>
	            </ul>
	        </div>			
		</c:forEach>
      	<%-- <ul class="nav navbar-nav navbar-right">
      	<ul>
        	<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        	<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    	</ul>	--%>	
	</div>
</body>
</html>
