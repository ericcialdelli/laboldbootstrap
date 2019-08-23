<%@page contentType="text/html; charset=ISO-8859-1"
	pageEncoding='ISO-8859-1'%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<!-- Bootstrap -->
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">-->

<!--  <link rel="stylesheet" href="<html:rewrite page='/css/bootstrap-theme.css'/>" type="text/css">
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
-->	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<style type="text/css">
	.bs-example{
    	margin: 20px;
    }
</style>

<script type="text/javascript">

function cambiarColor(item,colorFondo,colorFont){
		
	$('#'+item).css("background-color",colorFondo);
	$('#'+item).css("color",colorFont);	
}

function mostrarMenu(boton){
	$('#'+boton).click();
}

</script> 

</head>
<body>
<!--  
	<div class="btn-group">
		<c:forEach items="${listaMenu}" var="menu" varStatus="iPractica">
	        <div class="btn-group">
	            <button type="button" data-toggle="dropdown" class="btn btn-primary dropdown-toggle">${menu.item} <span class="caret"></span></button>
	            <ul class="dropdown-menu">
	            	<c:forEach items="${menu.hijos}" var="hijo" varStatus="i">
	            		<li><a href="/LaboLDBootstrap${hijo.url}">${hijo.item}</a></li>
	            	</c:forEach>
	            </ul>
	        </div>			
		</c:forEach>
	</div>
-->

<div class="btn-group">
	<c:forEach items="${listaMenu}" var="menu" varStatus="iPractica">
	        <div class="btn-group">
	            <button id="boton${iPractica.index}" type="button" data-toggle="dropdown" class="btn btn-primary dropdown-toggle"
	            	onmouseover="mostrarMenu('boton${iPractica.index}')">${menu.item}</button>
	            <c:choose>
		            <c:when test="${iPractica.index > 8}">
				    <div class="dropdown-menu dropdown-menu-right" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 38px, 0px);">
		            	<c:forEach items="${menu.hijos}" var="hijo" varStatus="i">
		            		<a class="dropdown-item" href="/LaboLDBootstrap${hijo.url}" id="item${iPractica.index}${i.index}"
		            			onmouseover="cambiarColor('item${iPractica.index}${i.index}','#0069d9','#ffffff');"
		            			onmouseout="cambiarColor('item${iPractica.index}${i.index}','#ffffff','#212529');">${hijo.item}</a>
		            	</c:forEach>			    			      
				    </div>		            
		            </c:when>
		            <c:otherwise>
				    <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 38px, 0px);">
		            	<c:forEach items="${menu.hijos}" var="hijo" varStatus="i">
		            		<a class="dropdown-item" href="/LaboLDBootstrap${hijo.url}" id="item${iPractica.index}${i.index}" 
		            			onmouseover="cambiarColor('item${iPractica.index}${i.index}','#0069d9','#ffffff');"
		            			onmouseout="cambiarColor('item${iPractica.index}${i.index}','#ffffff','#212529');">${hijo.item}</a>
		            	</c:forEach>			    			      
				    </div>		            
		            </c:otherwise>
	            </c:choose>
			</div>      	
	</c:forEach>
</div>
	
	
	
	
	
	
	
</body>
</html>
