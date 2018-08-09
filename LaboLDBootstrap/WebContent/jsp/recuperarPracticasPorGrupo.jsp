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

	function recuperarPractica(id){
		//var urlSeleccionGuia = $('#paramUrlSeleccionGuia').val();
		//parent.location=contextRoot() + "/guia.do?metodo="+urlSeleccionGuia+"&id="+id;
		parent.location=contextRoot() + "/practica.do?metodo=recuperarPractica&id="+id;
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

	function cargarPracticas(){

		var idGrupo = $("#selectGrupoPractica").val();		
		$('#bloquePracticas').html("");

		if(idGrupo != "" && idGrupo != "-1"){
			$('#bloquePracticas').load("../../practica.do?metodo=recuperarPracticasPorGrupo&idGrupo="+idGrupo);
			$('#bloquePracticas').hide();
			$('#bloquePracticas').fadeIn(600);
				
		}else{
			$('#bloquePracticas').hide(600);
			$('#bloquePracticas').html("");			
		}		
	}
	
</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<table border="0" class="cuadrado" align="center" width="60%"
	cellpadding="2">
	<tr>
		<td class="azulAjustado" colspan="2">Modificación de Prácticas</td>
	</tr>
	<tr>
		<td height="20" colspan="2"></td>
	</tr>
	
	<tr>
		<td width="40%" class="botoneralNegritaRight">Grupo Practica</td>
		<td align="left">
			<select id="selectGrupoPractica" class="botonerab" onchange="cargarPracticas();">
				<option value="-1">
					Seleccione un Grupo...
				</option>		
				<c:forEach items="${listaGrupos}" var="grupo">
					<option value="${grupo.id}">
						<c:out value="${grupo.nombre}"></c:out>
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
			<div id="bloquePracticas"></div>
		</td>
	</tr>
	<tr>
		<td height="10" colspan="2"></td>
	</tr>	
	
</table>

<script type="text/javascript">
	var idGrupoParam = ${idGrupo};
	$("#selectGrupoPractica").val(idGrupoParam);
	cargarPracticas();
</script>
