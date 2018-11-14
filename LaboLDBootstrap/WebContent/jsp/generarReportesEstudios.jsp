<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>
	
<script type="text/javascript">

	function generarReportesEstudios(){
		
		var desde = $("#desde").val();
		var hasta = $("#hasta").val();
		
		var especificaciones = 'top=0,left=0,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable';
		if(type == "IE"){
			window.open("./reporte.do?metodo=generarReportesEstudios&desde="+desde+"&hasta="+hasta,"",especificaciones);		
		}else{
			window.open("../../reporte.do?metodo=generarReportesEstudios&desde="+desde+"&hasta="+hasta,"",especificaciones);				
		}		
	}
	
</script>

<%-- 
	<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
		<tr>
			<td colspan="2" class="azulAjustado">
				Generar Reportes Estudios
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight">Nro Protocolo Desde</td>
			<td align="left">
				<input type="text" class="botonerab" id="desde" onkeypress="javascript:esNumerico(event);"/>
			</td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight">Nro Protocolo Hasta</td>
			<td align="left">
				<input type="text" class="botonerab" id="hasta" onkeypress="javascript:esNumerico(event);"/>
			</td>
		</tr>
		
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td height="20" colspan="2">
				<input type="button" class="botonerab" value="Aceptar" id="enviar" onclick="javascript:generarReportesEstudios();"> 
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
	</table>
--%>
		
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="65%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2" cellspacing="0">
					<tr>
						<td colspan="2"  class="tituloTabla" >Generar Reportes Estudios</td>
						</tr>		
					<tr>
						<td height="30" colspan="2"></td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Nro Protocolo Desde</td>
						<td align="left">
							<input type="text" class="botonerab" id="desde" onkeypress="javascript:esNumerico(event);"/>
						</td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Nro Protocolo Hasta</td>
						<td align="left">
							<input type="text" class="botonerab" id="hasta" onkeypress="javascript:esNumerico(event);"/>
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
							<input type="button" class="btn btn-primary-bootstrap btn-sm" value="Generar Reporte" id="enviar" onclick="javascript:generarReportesEstudios();">									
						</td>
					</tr>
					<tr>
						<td height="15"></td>
					</tr>									
				</table>					
			</div>
		</td>
	</tr>
	</table>

<script type="text/javascript">

	$('#desde').focus();

</script>
