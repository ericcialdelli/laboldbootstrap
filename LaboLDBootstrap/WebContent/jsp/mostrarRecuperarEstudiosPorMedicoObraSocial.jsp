<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

	function recuperarEstudios(){

		var fechaDesde = $('#fechaDesde').val();
		var fechaHasta = $('#fechaHasta').val();
		var idMedico = $('#idMedico').val();
		var idObraSocial = $('#idObraSocial').val();

		//parent.location=contextRoot() + "/estudio.do?metodo=recuperarEstudiosPorMedicoObraSocial&fechaDesde="+fechaDesde+"&fechaHasta="+fechaHasta+"&idMedico="+idMedico+"&idObraSocial="+idObraSocial;
		$('#divModificacion').load("../../estudio.do?metodo=recuperarEstudiosPorMedicoObraSocial&fechaDesde="+fechaDesde+"&fechaHasta="+fechaHasta+"&idMedico="+idMedico+"&idObraSocial="+idObraSocial);
	}

	$(function() {
		$("#fechaDesde").datepicker({ dateFormat: 'dd/mm/yy'});
		$("#fechaHasta").datepicker({ dateFormat: 'dd/mm/yy'});		
	});

</script>

<br>
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
					<input id="fechaDesde" class="botonerab" type="text" size="15">						
					<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
				</td>
			</tr>	
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap"><b>Fecha Hasta</b></td>
				<td  align="left">
					<input id="fechaHasta" class="botonerab" type="text" size="15" name="pacienteDTO.fechaNacimiento">						
					<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>			
				</td>
			</tr>
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap">
					<b>Medicos</b>
				</td>
				<td  align="left">					
					<select id="idMedico" class="botonerab">
						<option value="-1">
							-Seleccione un médico-
						</option>		
						<c:forEach items="${medicos}" var="m">
							<option value="${m.id}">
								<c:out value="${m.apellido}"></c:out>, <c:out value="${m.nombre}"></c:out> - <c:out value="${m.matricula}"></c:out> 
							</option>
						</c:forEach>										
					</select>					
				</td>
			</tr>			
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap">
					<b>Obra Social</b>
				</td>
				<td  align="left">
					<select id="idObraSocial" class="botonerab">
						<option value="-1">
							-Seleccione una Obra Social-
						</option>		
						<c:forEach items="${obrasSociales}" var="os">
							<option value="${os.id}">
								<c:out value="${os.nombre}"></c:out>
							</option>
						</c:forEach>										
					</select>			
				</td>
			</tr>
								
			<tr>
				<td height="20" colspan="2"></td>
			</tr>									
		</table>

		<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">
			<tr>
				<td height="10"></td>
			</tr>			
			<tr>
				<td align="center">				
					<input type="button" class="botonerab" value="Aceptar" id="enviar" onclick="javascript:recuperarEstudios();">
				</td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>									
		</table>
		
		<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">
			<tr>
				<td height="20"></td>
			</tr>
			<tr>
				<!--  <td id="divCargando" style="display: none">
					<img src="<html:rewrite page='/imagenes/cargando.gif'/>">
				</td>-->
			</tr>	
			<tr>
				<td>
					<div id="divModificacion"></div>
				</td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>		
		</table>		
		
		
	</div>
	</td></tr>	
				
	</table>
	
	<input type="hidden" value="<c:out value='${fDesde}'></c:out>" id="fDesde"/>
	<input type="hidden" value="<c:out value='${fHasta}'></c:out>" id="fHasta"/>
	<input type="hidden" value="<c:out value='${idMed}'></c:out>" id="idMed"/>
	<input type="hidden" value="<c:out value='${idOS}'></c:out>" id="idOS"/>	
	
<script type="text/javascript">
	//var idGrupoParam = ${idGrupo};
	var fDesde = $('#fDesde').val();
	var fHasta = $('#fHasta').val();
	var idMed = $('#idMed').val();
	var idOS = $('#idOS').val();
	
	if(idMed != null && idMed != ""){

		$('#fechaDesde').val(fDesde);
		$('#fechaHasta').val(fHasta);
		$('#idMedico').val(idMed);
		$('#idObraSocial').val(idOS);	
		
		recuperarEstudios();
	}
		
	//$("#selectGrupoPractica").val(idGrupoParam);
	//cargarPracticas();
</script>	
