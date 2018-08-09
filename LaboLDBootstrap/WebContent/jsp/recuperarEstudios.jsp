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
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>

<script>

	function cargarEstudios(){

		var idPaciente = $("#selectPacientes").val();		
		$('#bloqueEstudios').html("");

		if(idPaciente != "" && idPaciente != "-1"){
			$('#bloqueEstudios').load("../../estudio.do?metodo=recuperarEstudios&idPaciente="+idPaciente);
			$('#bloqueEstudios').hide();
			$('#bloqueEstudios').fadeIn(600);
				
		}else{
			$('#bloqueEstudios').hide(600);
			$('#bloqueEstudios').html("");			
		}		
	}

	function recuperarEstudio(nroProtocolo){
		//var urlSeleccionGuia = $('#paramUrlSeleccionGuia').val();
		//parent.location=contextRoot() + "/guia.do?metodo="+urlSeleccionGuia+"&id="+id;
		
		var forward = $("#forward").val();
		parent.location=contextRoot() + "/estudio.do?metodo="+forward+"&nroProtocolo="+nroProtocolo;
	}

	function submitir(){

		var nroProtocolo = $("#nroProtocolo").val();
		var url = '../../estudio.do?metodo=validarNroProtocolo&nroProtocolo='+nroProtocolo;
		$.post(url,null,validarNroProtocoloCallBack);		
	}

	function validarNroProtocoloCallBack(xmlDoc){

	   	var nodos = xmlDoc.getElementsByTagName('error');
	    if (nodos.length==0){
		    
			var forward = $("#forward").val();
			var nroProtocolo = $("#nroProtocolo").val();
			parent.location=contextRoot() + "/estudio.do?metodo="+forward+"&nroProtocolo="+nroProtocolo;
			
	    } else {
	    	$('#errores').text(nodos[0].firstChild.nodeValue);		 	
	    }	
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
	
</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<div id="errores" class="rojoAdvertencia"></div>
<input type="hidden" value="${forward}" id="forward">
<table border="0" class="cuadrado" align="center" width="60%"
	cellpadding="2">
	<tr>
		<td class="azulAjustado">${titulo}</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	
	<tr>
		<td>		
			<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">
				<tr>
					<td height="20"></td>
				</tr>
				<tr>
					<td width="30%" class="botoneralNegritaRight">
						Nro de Protocolo
					</td>
					<td width="10%">
						
					</td>						
					<td align="left">
						<input class="botonerab" type="text" size="20" name="estudioDTO.numero" 
								onkeypress="javascript:esNumerico(event); return evitarAutoSubmit(event)" id="nroProtocolo">
						<input class="botonerab" type="button" value="Buscar" onclick="javascript:submitir();">
					</td>	
								
				</tr>				
				<tr>
					<td height="20"></td>
				</tr>
			</table>						
		</td>
	</tr>
	
	<tr>
		<td>	
			<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">
				<tr>
					<td height="20"></td>
				</tr>				
				
				<tr>
					<td width="30%" class="botoneralNegritaRight">
						Paciente
					</td>
					<td width="10%">
						
					</td>						
					<td align="left">
						<select id="selectPacientes" class="botonerab" onchange="cargarEstudios()">
							<option value="-1">Seleccione un Paciente...</option>
							<c:forEach items="${listaPacientes}" var="paciente" varStatus="i">
								<option value="${paciente.id}">
									${paciente.apellido}, ${paciente.nombre}
								</option>									
							</c:forEach>
						</select>
					</td>	
								
				</tr>				
				<tr>
					<td height="20"></td>
				</tr>				
			</table>		
		</td>
	</tr>	
	
	<tr>
		<td height="10"></td>
	</tr>	
	
	<tr>
		<td>
			<div id="bloqueEstudios"></div>
		</td>
	</tr>
	<tr>
		<td height="10"></td>
	</tr>	
</table>
<%-- <br>
<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
	<tr>
		<td class="azulAjustado" colspan="4">Ultimos Estudios</td>
	</tr>
	<tr>
		<td height="5"></td>
	</tr>
	
	<tr>
		<td class="grisSubtituloCenter">Número</td>
		<td class="grisSubtituloCenter">Paciente</td>
		<td class="grisSubtituloCenter">Fecha</td>
		<td class="grisSubtituloCenter"></td>
	</tr>
	<%String clase=""; %>
	<c:forEach items="${listaUltimosEstudios}" var="estudio" varStatus="i">
		<%clase=(clase.equals("")?"par":""); %>
		
		<tr class="<%=clase%>" 
			onmouseover="javascript:pintarFila('idTrUE<c:out value='${i.index}'></c:out>');"
			onmouseout="javascript:despintarFila('idTrUE<c:out value='${i.index}'></c:out>');"
			id="idTrUE<c:out value='${i.index}'></c:out>">					
		
			<td>${estudio.numero}</td>
			<td>${estudio.paciente.apellido}, ${estudio.paciente.nombre}</td>
			
			<td>
				<fmt:formatDate	value='${estudio.fecha}' pattern='dd/MM/yyyy' />
			</td>
			<td>
				<a href="javascript:recuperarEstudio(${estudio.numero});">
					Seleccionar
				</a>
			</td>
		</tr>
	</c:forEach>		
</table>
<br>--%>
<script type="text/javascript">

	$('#nroProtocolo').focus();

</script>