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

	/*function recuperarPaciente(id){

		parent.location=contextRoot() + "/paciente.do?metodo=recuperarPaciente&id="+id;
	}*/

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

	function cargarPaciente(){

		var idPaciente = $("#selectPacientes").val();		
		$('#bloquePacientes').html("");

		if(idPaciente != "" && idPaciente != "-1"){
			$('#bloquePacientes').load("../../paciente.do?metodo=recuperarPaciente&id="+idPaciente+"&forward="+"${forward}");
			$('#bloquePacientes').hide();
			$('#bloquePacientes').fadeIn(600);
				
		}else{
			$('#bloquePacientes').hide(600);
			$('#bloquePacientes').html("");			
		}		
	}
	
</script>

<!--  <div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>-->

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

 
<table border="0" class="cuadrado" align="center" width="80%"
	cellpadding="2">
	<tr>
		<td class="azulAjustado" colspan="2">
			<c:if test="${forward=='modificacionPaciente'}">
				Modificación de Pacientes
			</c:if>
			<c:if test="${forward=='eliminarPaciente'}">
				Eliminar Paciente
			</c:if>				
		</td>
	</tr>
	<tr>
		<td height="20" colspan="2"></td>
	</tr>
	<tr>
		<td width="40%" class="botoneralNegritaRight">Paciente</td>
		<td align="left">
			<select id="selectPacientes" class="botonerab" onchange="cargarPaciente();">
				<option value="-1">
					Seleccione un Paciente...
				</option>		
				<c:forEach items="${listaPacientes}" var="paciente">
					<option value="${paciente.id}">
						<c:out value="${paciente.nombreApellidoDni}"></c:out>
					</option>
				</c:forEach>										
			</select>
		</td>
	</tr>	
	
	<tr>
		<td height="10" colspan="2"></td>
	</tr>	
	
	<tr>
		<td colspan="2">
			<div id="bloquePacientes"></div>
		</td>
	</tr>	
	<tr>
		<td height="10" colspan="2"></td>
	</tr>	
</table>

<!-- Nuevo Estilo -->
<!-- 
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="65%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">			
					<tr>
						<td class="tituloTabla" colspan="2">
							<c:if test="${forward=='modificacionPaciente'}">
								Modificaciï¿½n de Pacientes
							</c:if>
							<c:if test="${forward=='eliminarPaciente'}">
								Eliminar Paciente
							</c:if>				
						</td>
					</tr>
					<tr>
						<td height="20" colspan="2"></td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Paciente</td>
						<td align="left">
							<select id="selectPacientes" class="botonerab" onchange="cargarPaciente();">
								<option value="-1">
									Seleccione un Paciente...
								</option>		
								<c:forEach items="${listaPacientes}" var="paciente">
									<option value="${paciente.id}">
										<c:out value="${paciente.nombreApellidoDni}"></c:out>
									</option>
								</c:forEach>										
							</select>
						</td>
					</tr>	
					
					<tr>
						<td height="10" colspan="2"></td>
					</tr>	
					
					<tr>
						<td colspan="2">
							<div id="bloquePacientes"></div>
						</td>
					</tr>	
					<tr>
						<td height="10" colspan="2"></td>
					</tr>	
				</table>
			</div>
		</td>
	</tr>
	</table>		
-->		