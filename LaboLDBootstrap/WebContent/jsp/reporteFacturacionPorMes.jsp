<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>


  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript"> 

var type;
if (navigator.userAgent.indexOf("Opera")!=-1 && document.getElementById) type="OP"; 
if (document.all) type="IE"; 
if (!document.all && document.getElementById) type="MO";


function generarReporte(){

	var mes = $("#selectMesEstudio").val();

	var especificaciones = 'top=0,left=0,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable';
	if(type == "IE"){
		window.open("./reporte.do?metodo=generarReporteFacturacionPorMes&mes="+mes,"",especificaciones);
	}else{
		window.open("../../reporte.do?metodo=generarReporteFacturacionPorMes&mes="+mes,"",especificaciones);
	}
}

</script>


<!-- Nuevo Estilo --> 
	
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="65%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="3" class="tituloTablaBoots">
							Reporte Facturacion por Mes
						</td>
					</tr>
					<tr>
						<td height="45" colspan="3"></td>
					</tr>
					<tr>
						<td width="40%" align="right" class="labelForm">Mes</td>
						<td align="left">
							<select id="selectMesEstudio" class="custom-select custom-select-sm">		
								<option value="1">
									Enero
								</option>
								<option value="2">
									Febrero
								</option>
								<option value="3">
									Marzo
								</option>
								<option value="4">
									Abril
								</option>
								<option value="5">
									Mayo
								</option>
								<option value="6">
									Junio
								</option>
								<option value="7">
									Julio
								</option>
								<option value="8">
									Agosto
								</option>
								<option value="9">
									Septiembre
								</option>
								<option value="10">
									Octubre
								</option>
								<option value="11">
									Noviembre
								</option>
								<option value="12">
									Diciembre
								</option>																		
							</select>
						</td>	
						<td width="40%"></td>
					</tr>
					<tr>
						<td height="15" colspan="3"></td>
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