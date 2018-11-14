<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>
<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

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
   
<!--  <div id="error" class="rojoAdvertencia"></div>--> <!-- Estilo Viejo -->

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

<%-- 
<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">
	<tr>
		<td class="azulAjustado">
			Reporte de Estudios a Realizar Entre Fechas
		</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td>
			<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
				<tr>
					<td height="10" colspan="2"></td>
				</tr>		
				<tr>
					<td width="40%" class="botoneralNegritaRight">Fecha Desde</td>
					<td align="left">			
						<input id="idFechaDesde" class="botonerab" type="text" size="23" readonly="readonly">
						<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>				 
					</td>				
				</tr>
				<tr>
					<td width="40%" class="botoneralNegritaRight">Fecha Hasta</td>
					<td align="left">			
						<input id="idFechaHasta" class="botonerab" type="text" size="23" readonly="readonly">
						<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>				 
					</td>				
				</tr>				
				<tr>
					<td height="10" colspan="2"></td>
				</tr>								
			</table>
		</td>
	</tr>
	<tr>
		<td height="10"></td>
	</tr>	
	<tr>
		<td>
			<input type="button" value="Generar Reporte" class="botonerab" onclick="generarReporte();">
		</td>
	</tr>	
	<tr>
		<td height="20"></td>
	</tr>
</table>
--%>

<!-- Nuevo Estilo -->  
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="65%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="2" class="tituloTabla">
							Reporte de Estudios a Realizar Entre Fechas
						</td>
					</tr>
					<tr>
						<td height="45" colspan="2"></td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Fecha Desde</td>
						<td align="left">
							<input id="idFechaDesde" class="botonerab" type="text" size="23" readonly="readonly">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
						</td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Fecha Hasta</td>
						<td align="left">						
							<input id="idFechaHasta" class="botonerab" type="text" size="23" readonly="readonly">
							<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>						
						</td>
					</tr>
					<tr>
						<td height="15" colspan="2"></td>
					</tr>
				</table>	

				<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">
					<tr>
						<td height="10"></td>
					</tr>			
					<tr>
						<td align="center">							
							<input type="button" class="btn btn-primary-bootstrap btn-sm" value="Generar Reporte" onclick="generarReporte();">
						</td>
					</tr>
					<tr>
						<td height="20"></td>
					</tr>									
				</table>
			</div>
		</td>
	</tr>
	</table>