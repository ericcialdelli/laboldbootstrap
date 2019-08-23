<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
	
<!-- Estilo Viejo 
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

<link rel="stylesheet" href="<html:rewrite page='https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css'/>"
	type="text/css">
 Estilo Viejo -->

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

	function confirmar(){
		$("#confirmacionEliminar").dialog({title:'Atención!',resizable: false, modal: true ,buttons: {
				    "send":{
				      text:'Aceptar',click: function() {submitir();$(this).dialog("close");} 
				    },		
				    "cancel":{
				      text:'Cancelar',click:function() {$(this).dialog("close"); }
				    }
				 }});
		 
	}

	function submitir(){
		validarForm("estudioFormId","../estudio","validarPasarEstudiosAHistoricoForm","EstudioForm");
	}
	
	$(function() {
		$( "#datepicker" ).datepicker({ dateFormat: 'dd/mm/yy'});
		$( "#datepicker2" ).datepicker({ dateFormat: 'dd/mm/yy'});		
	});	
	
</script>

<div id="confirmacionEliminar" style="display: none">
	Esta seguro que desea pasar los Estudios a Historico?
</div>

<c:if test="${exitoGrabado != null}">
	<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="60%" cellpadding="0" cellspacing="0" id="tablaExitoGrabado">
		<tr>
			<td>
				<div id="exitoGrabado" class="alert alert-success"><b>${exitoGrabado}</b></div>
			</td>
		</tr>
	</table>
</c:if>	

<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="60%" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<div id="errores" class="alert alert-danger" style="display: none"></div>
		</td>
	</tr>
</table>
	  
<html:form action="estudio" styleId="estudioFormId">
	<html:hidden property="metodo" value="pasarEstudiosAHistorico"/>	  

	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="60%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="4" class="tituloTablaBoots">
							Pasar Estudios a Historico
						</td>
					</tr>
					<tr>
						<td height="20" colspan="4"></td>
					</tr>
					<tr>
						<td width="35%" align="right" class="labelForm">Fecha Desde</td>
						<td align="left">			
							<input id="datepicker" type="text" name="fechaDesde" class="form-control form-control-sm">
						</td>	
						<td width="5%" align="left"><img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'></td>
						<td width="25%"></td>
					</tr>
					<tr>	
						<td width="35%" align="right" class="labelForm">Fecha Hasta</td>
						<td align="left">			
							<input id="datepicker2" type="text" name="fechaHasta" class="form-control form-control-sm">
						</td>	
						<td width="5%" align="left"><img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'></td>
						<td width="25%"></td>
					</tr>		
					
					<tr>
						<td height="20" colspan="4"></td>
					</tr>
				</table>	
				<table border="0" class="cuadradoSinBorde" align="center" width="100%" cellpadding="2" cellspacing="0">
					<tr>
						<td height="10" colspan="3"></td>
					</tr>			
					<tr>
						<td width="45%"></td>
						<td align="center">							
							<input type="button" class="btn btn-primary btn-block" value="Aceptar" onclick="javascript:confirmar();">
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

</html:form>

