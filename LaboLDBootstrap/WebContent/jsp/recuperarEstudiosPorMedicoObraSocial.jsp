<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>


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


		<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="80%" cellpadding="2">
			<tr>
				<td class="fontNegritaRightBootstrap">Cantidad de estudios: <c:out value='${cantEstudios}'></c:out></td>
			</tr>
		</table>
		
		<!-- Nuevo Estilo -->  
		<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="80%" cellpadding="2" cellspacing="0">
		<tr>
			<td>
				<div class="well-sm-bootstrap well-bootstrap">
		
					<!--  <table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">-->
					<table border="0" class="cuadrado" align="center" width="100%" cellpadding="2">							
					<tr>
						<td class="subTituloTabla">Número</td>
						<td class="subTituloTabla">Paciente</td>
						<td class="subTituloTabla">Fecha</td>
						<td class="subTituloTabla">Estado</td>
						<td class="subTituloTabla"></td>
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
			</div>
		</td>
	</tr>
	</table>

<%-- 
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
--%>
