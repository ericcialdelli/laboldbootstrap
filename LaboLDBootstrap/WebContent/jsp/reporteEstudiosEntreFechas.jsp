<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<!--  
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>
<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">
-->

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script>
	$(function() {
		$( "#idFechaDesde" ).datepicker({ dateFormat: 'dd/mm/yy'});
		$( "#idFechaHasta" ).datepicker({ dateFormat: 'dd/mm/yy'});
		
	});
</script>

<script type="text/javascript"> 

var type;
if (navigator.userAgent.indexOf("Opera")!=-1 && document.getElementById) type="OP"; 
if (document.all) type="IE"; 
if (!document.all && document.getElementById) type="MO";


function generarReporte(){

	var fechaDesde = $("#idFechaDesde").val();
	var fechaHasta = $("#idFechaHasta").val();
	var metodo = $("#idMetodo").val();
	
	alert(metodo);
	
	if(fechaDesde != "" && fechaHasta != ""){
		$("#error").html("");
		$("#error").hide();
		var especificaciones = 'top=0,left=0,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable';
		if(type == "IE"){
			window.open("./reporte.do?metodo="+metodo+"&fechaDesde="+fechaDesde+"&fechaHasta="+fechaHasta,"",especificaciones);
		}else{
			window.open("../../reporte.do?metodo="+metodo+"&fechaDesde="+fechaDesde+"&fechaHasta="+fechaHasta,"",especificaciones);
		}
	}
	else{
		$("#error").html("");
		var textoError1 = (fechaDesde == "")?"<b>* Fecha Desde es un dato obligatorio<br></b>":"";
		var textoError2 = (fechaHasta == "")?"<b>* Fecha Hasta es un dato obligatorio</b>":"";
		$("#error").html(textoError1 + textoError2);
		$("#error").show();
	}
}

</script>
   

<!-- Estilo Nuevo -->
	<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="65%" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<div id="error" class="alert alert-danger" style="display: none"></div>
			</td>
		</tr>
	</table>	
<!-- Estilo Nuevo -->

<html:hidden styleId="idMetodo" value="${metodo}" property=""/>

<!-- Nuevo Estilo --> 
	
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="65%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="4" class="tituloTablaBoots">
							<c:choose>
								<c:when test="${metodo=='generarReporteFacturacionEntreFechas'}">
									Reporte Facturacion Entre Fechas
								</c:when>
								<c:when test="${metodo=='generarReporteFacturacionEntreFechasPorObraSocial'}">
									Reporte Facturacion Entre Fechas Por Obra Social
								</c:when>								
								<c:otherwise>
									Reporte de Estudios a Realizar Entre Fechas	
								</c:otherwise>
							</c:choose>						
						</td>
					</tr>
					<tr>
						<td height="45" colspan="4"></td>
					</tr>
					<tr>
						<td width="35%" align="right" class="labelForm">Fecha Desde</td>
						<td align="left">
							<input id="idFechaDesde" class="form-control form-control-sm" type="text" size="23">
						</td>	
						<td width="5%" align="left"><img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'></td>
						<td width="25%"></td>
					</tr>
					<tr>
						<td width="35%" align="right" class="labelForm">Fecha Hasta</td>
						<td align="left">						
							<input id="idFechaHasta" class="form-control form-control-sm" type="text" size="23">
						</td>	
						<td width="5%" align="left"><img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'></td>
						<td width="25%"></td>
					</tr>
					<tr>
						<td height="15" colspan="4"></td>
					</tr>
				</table>	

				<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">					
					<tr>
						<td height="10" colspan="3"></td>
					</tr>			
					<tr>
						<td width="45%"></td>
						<td align="center">							
							<input type="button" class="btn btn-primary btn-block" value="Generar Reporte" onclick="generarReporte();">
						</td>
						<td width="45%"></td>
					</tr>
					<tr>
						<td height="20" colspan="3"></td>
					</tr>					
				</table>
			</div>
		</td>
	</tr>
	</table>	