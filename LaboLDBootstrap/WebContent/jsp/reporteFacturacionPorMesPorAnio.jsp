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

	var anio = $("#selectAnioEstudio").val();

	var especificaciones = 'top=0,left=0,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable';
	if(type == "IE"){
		window.open("./reporte.do?metodo=generarReporteFacturacionPorMesPorAnio&anio="+anio,"",especificaciones);
	}else{
		window.open("../../reporte.do?metodo=generarReporteFacturacionPorMesPorAnio&anio="+anio,"",especificaciones);
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
							Reporte Facturacion por Mes por Año						
						</td>
					</tr>
					<tr>
						<td height="45" colspan="3"></td>
					</tr>
					<tr>
						<td width="40%" align="right" class="labelForm">Año</td>
						<td align="left">
							<select id="selectAnioEstudio" class="custom-select custom-select-sm">		
								<c:forEach items="${anioEstudios}" var="anio">
									<option value="${anio}">
										<c:out value="${anio}"></c:out>
									</option>
								</c:forEach>										
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