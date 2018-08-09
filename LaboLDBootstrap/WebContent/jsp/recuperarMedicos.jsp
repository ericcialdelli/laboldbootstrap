<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/jquery-1.3.2.min.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/Concurrent.Thread-full-20090713.js'/>"></script>

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>

<script>

	function recuperarMedico(id){
		parent.location=contextRoot() + "/medico.do?metodo=recuperarMedico&id="+id;
	}

	var clase;
	function pintarFila(idTr){
		
		clase = $('#'+idTr).attr("class");
		$('#'+idTr).removeClass(clase);
		$('#'+idTr).addClass("verdeSeleccionFila");		
	}

	function despintarFila(idTr){
		
		$('#'+idTr).addClass(clase);
		$('#'+idTr).removeClass("verdeSeleccionFila");
	}
	
</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<table border="0" class="cuadrado" align="center" width="70%"
	cellpadding="2">
	<tr>
		<td class="azulAjustado">Modificación de Médicos</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td>
			<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">
				<tr>
					<td class="azulAjustado">Apellido</td>
					<td class="azulAjustado">Nombre</td>
					<td class="azulAjustado">Matricula</td>
					<td class="azulAjustado"></td>
				</tr>
				<%String clase=""; %>
				<c:forEach items="${medicos}" var="medico" varStatus="i">
					<%clase=(clase.equals("")?"par":""); %>

					<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${i.index}'></c:out>');"
						onmouseout="javascript:despintarFila('idTr<c:out value='${i.index}'></c:out>');"
						id="idTr<c:out value='${i.index}'></c:out>">					
										
						<td>${medico.apellido}</td>
						<td>${medico.nombre}</td>
						<td>${medico.matricula}</td>
						<td>
							<a href="javascript:recuperarMedico(${medico.id});">
								Seleccionar
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10"></td>
	</tr>	
</table>