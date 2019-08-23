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
	    	$('#errores').show();//Estilo Nuevo
	    }	
	}
	
	var clase;
	function pintarFila(idTr){
		
		clase = $('#'+idTr).attr("class");
		$('#'+idTr).removeClass(clase);
		//$('#'+idTr).addClass("verdeSeleccionFila");
		$('#'+idTr).addClass("verdeSeleccionFilaLista");
	}

	function despintarFila(idTr){
		
		$('#'+idTr).addClass(clase);
		//$('#'+idTr).removeClass("verdeSeleccionFila");
		$('#'+idTr).removeClass("verdeSeleccionFilaLista");
	}	
	
</script>

<c:if test="${exitoGrabado != null}">
	<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="70%" cellpadding="0" cellspacing="0" id="tablaExitoGrabado">
		<tr>
			<td>
				<div id="exitoGrabado" class="alert alert-success"><b>${exitoGrabado}</b></div>
			</td>
		</tr>
	</table>
</c:if>	

<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="70%" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<div id="errores" class="alert alert-danger" style="display: none"></div>
		</td>
	</tr>
</table>

<input type="hidden" value="${forward}" id="forward">

<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="70%" cellpadding="2" cellspacing="0">
<tr>
	<td>
		<div class="well-sm-bootstrap well-bootstrap">
		
			<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
				<tr>
					<td class="tituloTablaBoots">${titulo}</td>
				</tr>
				<tr>
					<td height="20"></td>
				</tr>
				<tr>
					<td>		
						<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
							<tr>
								<td height="20" colspan="5"></td>
							</tr>
							<tr>
								<td width="30%" align="right" class="labelForm">
									Nro de Protocolo
								</td>
								<td width="3%"></td>						
								<td align="left">
								  <div class="input-group-append">
									  <input type="text" class="form-control form-control-sm" aria-describedby="button-addon2" 
									  		 onkeypress="javascript:esNumerico(event); return evitarAutoSubmit(event)" id="nroProtocolo" name="estudioDTO.numero" >								  
								    <button class="btn btn-sm btn-primary" type="button" id="button-addon2" onclick="javascript:submitir();">Buscar</button>
								  </div>								
								</td>	
								<td width="25%"></td>			
							</tr>				
							<tr>
								<td height="20" colspan="5"></td>
							</tr>
						</table>						
					</td>
				</tr>
				<tr>
					<td>	
						<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">
							<tr>
								<td height="20" colspan="4"></td>
							</tr>				
							
							<tr>
								<td width="30%" align="right" class="labelForm">
									Paciente
								</td>
								<td width="3%">
									
								</td>						
								<td align="left">
									<select id="selectPacientes" class="custom-select custom-select-sm" onchange="cargarEstudios()">
										<option value="-1">Seleccione un Paciente...</option>
										<c:forEach items="${listaPacientes}" var="paciente" varStatus="i">
											<option value="${paciente.id}">
												${paciente.apellido}, ${paciente.nombre}
											</option>									
										</c:forEach>
									</select>
								</td>	
								<td width="22%"></td>			
							</tr>				
							<tr>
								<td height="20" colspan="4"></td>
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
					<td height="20"></td>
				</tr>	
			</table>

		</div>
	</td>
</tr>
</table>

<script type="text/javascript">

	$('#nroProtocolo').focus();

</script>