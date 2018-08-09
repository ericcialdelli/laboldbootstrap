<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>


<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

<link rel="stylesheet" href="<html:rewrite page='https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css'/>"
	type="text/css">

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>

<script>

	function abrirVentanaModificarParametro(clave){
					
		$('#claveForm').val(clave);
		$('#valorForm').val($('#val'+clave).val());
		$('#descripcionForm').val($('#desc'+clave).val());			
					
		$('#dialogo').dialog({title: '', height: 235, width: 800, modal: true, position: {my: "center", at: "center", of: window}});			
	}

	function cerrarVentanaModificarParametro(){

		//$('#textoError').hide();		
		$('#dialogo').dialog( "close" );
	}

	/*function modificarParametro(){
			
		var form = $('#pacienteFormId').serialize(); 
		var url = '../../paciente.do?metodo=validar&validador=validarPacienteForm&form=PacienteForm&formJsp=pacienteFormId';		
		$.post(url,form,validarPacienteFormCallBack);		
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
	
</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<table border="0" class="cuadrado" align="center" width="80%"
	cellpadding="2">
	<tr>
		<td class="azulAjustado">Parametros</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td>
			<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">
				<tr>
					<td class="azulAjustado">Clave</td>
					<td class="azulAjustado">Valor</td>
					<td class="azulAjustado">Descripcion</td>
					<td class="azulAjustado"></td>
				</tr>
				<%String clase=""; %>
				<c:forEach items="${listaParametros}" var="parametro" varStatus="i">
					<%clase=(clase.equals("")?"par":""); %>

					<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${i.index}'></c:out>');"
						onmouseout="javascript:despintarFila('idTr<c:out value='${i.index}'></c:out>');"
						id="idTr<c:out value='${i.index}'></c:out>">					
										
						<td>${parametro.clave}</td>
						<td>${parametro.valor}</td>
						<td>${parametro.descripcion}</td>
						<td>
							<input type="hidden" value="${parametro.valor}" id="val${parametro.clave}">
							<input type="hidden" value="${parametro.descripcion}" id="desc${parametro.clave}">
							<a href="javascript:abrirVentanaModificarParametro(${parametro.clave});">
								Seleccionar
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10"></td>
	</tr>	
</table>

<div id="dialogo" style="display: none" >	
		
	<html:form action="parametros" styleId="parametrosFormId">
		<html:hidden property="metodo" value="modificarParametros"/>
	
		<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
			<tr>
				<td height="20" colspan="2"></td>
			</tr>				
			<tr>
				<td class="botoneralNegritaRight" width="20%">Clave</td>
				<td align="left">
					<html:text property="parametro.clave" value="" styleClass="botonerabGrande" styleId="claveForm" size="80" readonly="true"/>
				</td>
			</tr>	
			<tr>
				<td class="botoneralNegritaRight" width="20%">Valor</td>
				<td  align="left">
					<html:text property="parametro.valor" value="" styleClass="botonerabGrande" styleId="valorForm" size="80"/>			
				</td>
			</tr>
			<tr>
				<td class="botoneralNegritaRight" width="20%">Descripcion</td>
				<td  align="left">
					<html:text property="parametro.descripcion" value="" styleClass="botonerabGrande" styleId="descripcionForm" size="80"/>			
				</td>
			</tr>				
			<tr>
				<td height="20" colspan="2"></td>
			</tr>					
		</table>		
		
		<table border="0" class="cuadradoSinBorde" align="center" width="80%" cellpadding="2">
			<tr>
				<td height="10" colspan="3"></td>
			</tr>	
			<tr>
				<td width="48%" class="botonerab" align="right">
					<input type="submit" class="botonerab" value="Modificar">
				</td>				
				<td width="4%"></td>			
				<td width="48%" class="botonerab" align="left">
					<input type="button" class="botonerab" value="Cancelar" onclick="javascript:cerrarVentanaModificarParametro();">
				</td>							
			</tr>
			<tr>
				<td height="10" colspan="3"></td>
			</tr>		
		</table>
	</html:form>	
</div>