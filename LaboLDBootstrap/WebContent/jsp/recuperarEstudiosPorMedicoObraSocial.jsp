<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>

<!--  
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>

<link rel="stylesheet" href="<html:rewrite page='/css/jquery-ui_1_11_3.css'/>" type="text/css">
-->

<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

<script type="text/javascript">

	function volverRecuperarEstudiosPorMedicoObraSocial(){

		parent.location=contextRoot() + "/estudio.do?metodo=cargarRecuperarEstudiosPorMedicoObraSocial";
	}

	function recuperarEstudio(nroProtocolo){

		var fechaDesde = $('#fechaDesde').val();
		var fechaHasta = $('#fechaHasta').val();
		var idMedico = $('#idMedico').val();
		var idObraSocial = $('#idObraSocial').val();

		/*alert(fechaDesde);
		alert(fechaHasta);
		alert(idMedico);
		alert(idObraSocial);*/
		

		parent.location=contextRoot() + "/estudio.do?metodo=recuperarEstudioParaConsulta&nroProtocolo="+nroProtocolo+"&fechaDesde="+fechaDesde+"&fechaHasta="+fechaHasta+"&idMedico="+idMedico+"&idObraSocial="+idObraSocial;
		
		//alert(volver);
		//alert(nroProtocolo);
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

<br>
		<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="80%" cellpadding="2">
			<tr>
				<td class="fontNegritaRightBootstrap">Cantidad de estudios: <c:out value='${cantEstudios}'></c:out></td>
			</tr>
		</table>
		<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">					
			<tr>
				<td class="grisSubtituloCenter">Número</td>
				<td class="grisSubtituloCenter">Paciente</td>
				<td class="grisSubtituloCenter">Fecha</td>
				<td class="grisSubtituloCenter">Estado</td>
				<td class="grisSubtituloCenter"></td>
			</tr>
			<%String clase=""; %>
			<c:forEach items="${estudios}" var="estudio" varStatus="i">
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

<%-- 

	<c:if test="${exitoGrabado != null}">
		<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="65%" cellpadding="2" cellspacing="0">
			<tr>
				<td>
					<div class="alert alert-success">
					  <strong>${exitoGrabado}</strong>
					</div>
				</td>
			</tr>
		</table>		
	</c:if>

<div id="errores" class="rojoAdvertencia">${error}</div>
	<input id="volver" type="hidden" value="<c:out value='${volver}'></c:out>">
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="65%" cellpadding="2" cellspacing="0">
	<tr><td>
	<div class="well well-sm">

		<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2" cellspacing="0">
			<tr>
				<td colspan="2"  class="azulAjustado" >Recuperar Estudios</td>
			</tr>
			<tr>
				<td height="20" colspan="2"></td>
			</tr>				
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap"><b>Fecha Desde</b></td>
				<td align="left">
					<input id="fechaDesde" class="botonerab" type="text" size="15" value="<c:out value='${fechaDesde}'></c:out>" readonly="readonly">						
					<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
				</td>
			</tr>	
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap"><b>Fecha Hasta</b></td>
				<td  align="left">
					<input id="fechaHasta" class="botonerab" type="text" size="15" value="<c:out value='${fechaHasta}'></c:out>" readonly="readonly">						
					<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>			
				</td>
			</tr>
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap">
					<b>Medicos</b>
				</td>
				<td align="left">					
					<input class="botonerab" type="text" size="30" value="<c:out value='${medico}'></c:out>" readonly="readonly">				
				</td>
			</tr>			
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap">
					<b>Obra Social</b>
				</td>
				<td  align="left">
					<input class="botonerab" type="text" size="30" value="<c:out value='${obraSocial}'></c:out>" readonly="readonly">			
				</td>
			</tr>
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap">
					<b>Cantidad de Estudios</b>
				</td>
				<td  align="left">
					<input class="botonerab" type="text" size="30" value="<c:out value='${cantEstudios}'></c:out>" readonly="readonly">			
				</td>
			</tr>								
			<tr>
				<td height="20" colspan="2"></td>
			</tr>									
		</table>

		<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
			<tr>
				<td class="grisSubtituloCenter">Número</td>
				<td class="grisSubtituloCenter">Paciente</td>
				<td class="grisSubtituloCenter">Fecha</td>
				<td class="grisSubtituloCenter">Estado</td>
				<td class="grisSubtituloCenter"></td>
			</tr>
			<%String clase=""; %>
			<c:forEach items="${estudios}" var="estudio" varStatus="i">
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

		<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">
			<tr>
				<td height="10"></td>
			</tr>			
			<tr>
				<td align="center">				
					<input type="button" class="botonerab" value="Volver" id="enviar" onclick="javascript:volverRecuperarEstudiosPorMedicoObraSocial();">
				</td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>										
		</table>
	</div>
	</td></tr>
	</table>
--%>