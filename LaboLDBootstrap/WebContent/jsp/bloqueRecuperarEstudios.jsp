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
	
</script>
	<c:choose>
		<c:when test="${fn:length(listaEstudios)>0}">
			<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
				<tr>
					<td class="grisSubtituloCenter">Número</td>
					<td class="grisSubtituloCenter">Paciente</td>
					<td class="grisSubtituloCenter">Fecha</td>
					<td class="grisSubtituloCenter">Estado</td>
					<td class="grisSubtituloCenter"></td>
				</tr>
				<%String clase=""; %>
				<c:forEach items="${listaEstudios}" var="estudio" varStatus="i">
					<%clase=(clase.equals("")?"par":""); %>
					
					<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${i.index}'></c:out>');"
						onmouseout="javascript:despintarFila('idTr<c:out value='${i.index}'></c:out>');"
						id="idTr<c:out value='${i.index}'></c:out>">					
					
						<td>${estudio.numero}</td>
						<td>${estudio.paciente.apellido}, ${estudio.paciente.nombre}</td>
						
						<td>
							<fmt:formatDate	value='${estudio.fecha}' pattern='dd/MM/yyyy' />
						</td>
						<td>
							${estudio.estadoStr}
						</td>						
						<td>
							<a href="javascript:recuperarEstudio(${estudio.numero});">
								Seleccionar
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			No existen estudios para este paciente
		</c:otherwise>		
	</c:choose>