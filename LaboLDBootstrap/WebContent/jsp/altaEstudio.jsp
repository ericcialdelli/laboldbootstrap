<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/agregarModificarMedico.js'/>"></script>

<!-- Nuevo Estilo -->
<!-- 
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>

<link rel="stylesheet" href="<html:rewrite page='/css/jquery-ui_1_11_3.css'/>" type="text/css">
-->

<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/PacienteFachada.js'/>"></script>

<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/MedicoFachada.js'/>"></script>

<!-- Estilo Viejo -->
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

<link rel="stylesheet" href="<html:rewrite page='https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css'/>"
	type="text/css">
<!-- Estilo Viejo -->

<script type="text/javascript">

	$(function() {
		$( "#datepicker" ).datepicker({ dateFormat: 'dd/mm/yy'});
		$( "#datepicker2" ).datepicker({ dateFormat: 'dd/mm/yy'});		
	});

	function submitir(){
		validarForm("estudioFormId","../estudio","validarEstudioForm","EstudioForm");
	}

	function exp(sec) {
		   
		 $("#e"+sec).toggle();
		 $("#c"+sec).toggle();		   
	}

	function col(sec) {

		$("#e"+sec).toggle();
		$("#c"+sec).toggle();
	}

	function expSubItem(sec){

		$("#esi"+sec).toggle();
		$("#csi"+sec).toggle();		
	}

	function colSubItem(sec){

		$("#esi"+sec).toggle();
		$("#csi"+sec).toggle();		
	}

	function expandirGrupo(idGrupo){
				
		$("#trGrupo"+idGrupo).toggle();
	}

	function pintarFila(tag,id){
		
		$('#'+tag+id).attr("class", "verdeSubtitulo");	
	}

	function despintarFila(tag,id){

		$('#'+tag+id).attr("class", "grisSubtitulo");
			
	}

	function pintarPractica(ind){
		
		$('#trPractica'+ind).addClass("verdeClaroSubtituloCenter");
	}	

	function despintarPractica(ind){
		if(!$('#checkPractica'+ind).is(':checked')){
			$('#trPractica'+ind).removeClass("verdeClaroSubtituloCenter");
		}	
	}	
	
	/*function clickCheck(grupo, practica){

		if($('#checkG'+grupo+"P"+practica).is(':checked')){
			$('#trG'+grupo+"P"+practica).addClass("verdeClaroSubtituloCenter");
			$('#hiddenG'+grupo+"P"+practica).val($('#checkG'+grupo+"P"+practica).val());	
		}
		else{
			$('#trG'+grupo+"P"+practica).removeClass("verdeClaroSubtituloCenter");
			$('#hiddenG'+grupo+"P"+practica).val(0);
		}
	}

	function clickCheckPracticaSubItem(grupo, subItem, practica){

		if($('#checkG'+grupo+"S"+subItem+"P"+practica).is(':checked')){
			$('#trG'+grupo+"S"+subItem+"P"+practica).addClass("verdeClaroSubtituloCenter");
			$('#hiddenG'+grupo+"S"+subItem+"P"+practica).val($('#checkG'+grupo+"S"+subItem+"P"+practica).val());		
		}
		else{
			$('#trG'+grupo+"S"+subItem+"P"+practica).removeClass("verdeClaroSubtituloCenter");
			$('#hiddenG'+grupo+"S"+subItem+"P"+practica).val(0);
		}		
	}*/

	function clickCheckFila(ind){
		if(!$('#checkPractica'+ind).is(':checked')){
		
			$('#checkPractica'+ind).prop('checked', true);
			//$('#checkPractica'+ind).attr('checked','checked');
		}
		else{
			$('#checkPractica'+ind).prop('checked', false);		
			//$('#checkPractica'+ind).removeAttr('checked');
		}
		clickCheck(ind);
	}
	
	function clickCheck(ind){

		if($('#checkPractica'+ind).is(':checked')){
			$('#trPractica'+ind).addClass("verdeClaroSubtituloCenter");
			$('#hiddenPractica'+ind).val($('#checkPractica'+ind).val());	
		}
		else{
			$('#trPractica'+ind).removeClass("verdeClaroSubtituloCenter");
			$('#hiddenPractica'+ind).val(0);
		}
	}
	
	function seleccionarTodos(nroGrupo){

		$('.checkG'+nroGrupo).prop('checked', true);
		//$('.checkG'+nroGrupo).attr('checked','checked');
		//$('.trG'+nroGrupo).addClass("verdeClaroSubtituloCenter");

		$('.grupo'+nroGrupo).each(
			function(){
				clickCheck($(this).val());
			}
		);	
	}

	function desSeleccionarTodos(nroGrupo){

		$('.checkG'+nroGrupo).prop('checked', false);
		//$('.checkG'+nroGrupo).removeAttr('checked');
		//$('.trG'+nroGrupo).removeClass("verdeClaroSubtituloCenter");

		$('.grupo'+nroGrupo).each(
			function(){
				clickCheck($(this).val());
			}
		);		
	}

	function seleccionarTodosSubItem(nroGrupo,nroSubItem){

		$('.checkSI'+nroGrupo+"-"+nroSubItem).prop('checked', true);
		//$('.checkSI'+nroGrupo+"-"+nroSubItem).attr('checked','checked');		

		$('.subItem'+nroGrupo+"-"+nroSubItem).each(
			function(){
				clickCheck($(this).val());
			}
		);	
	}

	function desSeleccionarTodosSubItem(nroGrupo,nroSubItem){

		$('.checkSI'+nroGrupo+"-"+nroSubItem).prop('checked', false);
		//$('.checkSI'+nroGrupo+"-"+nroSubItem).removeAttr('checked');		

		$('.subItem'+nroGrupo+"-"+nroSubItem).each(
			function(){
				clickCheck($(this).val());
			}
		);		
	}

//------Modificar Paciente---------//
	
	function abrirVentantModificarPaciente(){
		PacienteFachada.getPaciente($('#idPaciente').val(),mostrarPacienteModificacionCallback);
		
	}
		
	function mostrarPacienteModificacionCallback(paciente){
		
		$('#textoError').text("");
		$('#tdAceptar').hide();
		$('#tdModificar').show();
		$('#dialogo').dialog({title: 'Modificar Paciente', height: 450, width: 600, modal: true});
		
		$('#paciente').val(paciente.id);
		$('#nombre').val(paciente.nombre);
		$('#apellido').val(paciente.apellido);
		$('#fechaNacimiento').val(paciente.fechaNacimientoString);
		$('#dni').val(paciente.dni);
		$('#direccion').val(paciente.direccion);
		$('#telefono').val(paciente.telefono);
		$('#email').val(paciente.email);		
		$('#nroCarnetObraSocial').val(paciente.nroCarnetObraSocial);
		$('#observaciones').val(paciente.observaciones);
		
		if(paciente.obraSocial == null){
			$('#obraSocial').val("-1");	
		}else{
			$('#obraSocial').val(paciente.obraSocial.id);	
		}			
	}

	function modificarPaciente(){
		
		var form = $('#pacienteFormId').serialize(); 
		var url = '../../paciente.do?metodo=validar&validador=validarPacienteForm&form=PacienteForm&formJsp=pacienteFormId';		
		$.post(url,form,validarModificacionPacienteFormCallBack);		
	}

	function validarModificacionPacienteFormCallBack(xmlDoc){

	   	var nodos = xmlDoc.getElementsByTagName('error');
	    if (nodos.length==0){

			PacienteFachada.modificarPacienteDesdeAltaEstudio($('#paciente').val(),$('#nombre').val(),$('#apellido').val(),$('#fechaNacimiento').val(),
					$('#dni').val(),$('#direccion').val(),$('#telefono').val(),$('#email').val(),$('#obraSocial').val(),$('#nroCarnetObraSocial').val(),
					$('#observaciones').val(),cerrarVentanaAgregarPaciente);
				    	
	    } else {
	    	$('#textoError').text("");
		    for(var i=0; i < nodos.length; i++) { 
			    $('#textoError').append( '<div>* ' + nodos[i].firstChild.nodeValue + '</div>');
		    }
		    $('#textoError').show();
	    }
	}
//------Fin Modificar Paciente---------//
	
	function cambioPaciente(){

		if($('#idPaciente').val()!=-1){
			$('#botonModificar').removeAttr("disabled");
		}else{
			$('#botonModificar').attr("disabled","disabled");
		}
	}	
	
//------Agregar Paciente---------//
	
	function abrirVentantAgregarPaciente(){

		$('#textoError').text("");
		$('#tdAceptar').show();
		$('#tdModificar').hide();
		$('#paciente').val("");
		$('#nombre').val("");
		$('#apellido').val("");
		$('#fechaNacimiento').val("");
		$('#dni').val(0);
		$('#direccion').val("");
		$('#telefono').val("");
		$('#email').val("");
		$('#obraSocial').val("-1");
		$('#nroCarnetObraSocial').val("");
		$('#observaciones').val("");			
		$('#dialogo').dialog({title: 'Agregar Paciente', height: 450, width: 600, modal: true, position: {my: "center", at: "center", of: window}});			
	}

	function cerrarVentanaAgregarPaciente(){

		$('#textoError').hide();		
		$('#dialogo').dialog( "close" );
	}

	function agregarPaciente(){
			
		var form = $('#pacienteFormId').serialize(); 
		var url = '../../paciente.do?metodo=validar&validador=validarPacienteForm&form=PacienteForm&formJsp=pacienteFormId';		
		$.post(url,form,validarPacienteFormCallBack);		
	}

	function validarPacienteFormCallBack(xmlDoc){

	   	var nodos = xmlDoc.getElementsByTagName('error');
	    if (nodos.length==0){
    	   	//var nodos = xmlDoc.getElementsByTagName('formId');
    	   	//var idForm = nodos[0].firstChild.nodeValue;
	    	//$('#pacienteFormId').submit();
	 
			PacienteFachada.altaPacienteDesdeAltaEstudio($('#nombre').val(),$('#apellido').val(),$('#fechaNacimiento').val(),
					$('#dni').val(),$('#direccion').val(),$('#telefono').val(),$('#email').val(),$('#obraSocial').val(),$('#nroCarnetObraSocial').val(),
					$('#observaciones').val(),mostrarPacienteCallback);
				    	
	    } else {
	    	$('#textoError').text("");
		    for(var i=0; i < nodos.length; i++) { 
			    $('#textoError').append( '<div>* ' + nodos[i].firstChild.nodeValue + '</div>');
		    }
		    $('#textoError').show();
	    }
	}

	function mostrarPacienteCallback(paciente){

		$('#comboPacientes').hide();
		$('#comboPacientes').html("");
		$('#inputPaciente').show();
		$('#idPacienteAgregado').val(paciente.id);		
		$('#nombrePacienteAgregado').val(paciente.apellido+","+paciente.nombre);

		cerrarVentanaAgregarPaciente();
	}

//------Fin Agregar Paciente---------//

//------Agregar Medico---------//
/*	
	function abrirVentantAgregarMedico(){

		$('#textoErrorMedico').text("");
		$('#tdAceptarMedico').show();
		$('#tdModificarMedico').hide();
		$('#medico').val("");
		$('#nombreMedico').val("");
		$('#apellidoMedico').val("");
		$('#telefonoMedico').val("");
		$('#matriculaMedico').val("");
		$('#especialidadMedico').val("");			
		$('#dialogoMedico').dialog({title: 'Agregar Médico', height: 350, width: 500, modal: true});
	}

	function agregarMedico(){
			
		var form = $('#medicoFormId').serialize(); 
		var url = '../../medico.do?metodo=validar&validador=validarMedicoForm&form=MedicoForm&formJsp=medicoFormId';		
		$.post(url,form,validarMedicoFormCallBack);		
	}

	function validarMedicoFormCallBack(xmlDoc){

	   	var nodos = xmlDoc.getElementsByTagName('error');
	    if (nodos.length==0){

			MedicoFachada.altaMedicoDesdeAltaEstudio($('#nombreMedico').val(),$('#apellidoMedico').val(),$('#telefonoMedico').val(),
													 $('#matriculaMedico').val(),$('#especialidadMedico').val(),mostrarMedicoCallback);
	    	
	    } else {
	    	$('#textoErrorMedico').text("");
		    for(var i=0; i < nodos.length; i++) { 
			    $('#textoErrorMedico').append( '<div>* ' + nodos[i].firstChild.nodeValue + '</div>');
		    }
		    $('#textoErrorMedico').show();
	    }
	}

	function mostrarMedicoCallback(medico){

		$('#comboMedicos').hide();
		$('#comboMedicos').html("");
		$('#inputMedico').show();
		$('#idMedicoAgregado').val(medico.id);		
		$('#nombreMedicoAgregado').val(medico.apellido+", "+medico.nombre+" - "+medico.matricula);

		cerrarVentanaAgregarMedico();
	}

//------Fin Agregar Medico---------//

//------Modificar Medico---------//
	
	function abrirVentantModificarMedico(){
		MedicoFachada.getMedico($('#idMedico').val(),mostrarMedicoModificacionCallback);
		
	}

	function mostrarMedicoModificacionCallback(medico){
		
		$('#textoErrorMedico').text("");
		$('#tdAceptarMedico').hide();
		$('#tdModificarMedico').show();
		$('#dialogoMedico').dialog({title: 'Modificar Medico', height: 350, width: 500, modal: true});
		
		$('#medico').val(medico.id);
		$('#nombreMedico').val(medico.nombre);
		$('#apellidoMedico').val(medico.apellido);
		$('#telefonoMedico').val(medico.telefono);
		$('#matriculaMedico').val(medico.matricula);
		$('#especialidadMedico').val(medico.especialidad);		
	}

	function modificarMedico(){
		
		var form = $('#medicoFormId').serialize(); 
		var url = '../../medico.do?metodo=validar&validador=validarMedicoForm&form=MedicoForm&formJsp=medicoFormId';		
		$.post(url,form,validarModificacionMedicoFormCallBack);		
	}

	function validarModificacionMedicoFormCallBack(xmlDoc){

	   	var nodos = xmlDoc.getElementsByTagName('error');
	    if (nodos.length==0){

			MedicoFachada.modificarMedicoDesdeAltaEstudio($('#medico').val(),$('#nombreMedico').val(),$('#apellidoMedico').val(),$('#telefonoMedico').val(),
					$('#matriculaMedico').val(),$('#especialidadMedico').val(),cerrarVentanaAgregarMedico);
				    	
	    } else {
	    	$('#textoErrorMedico').text("");
		    for(var i=0; i < nodos.length; i++) { 
			    $('#textoErrorMedico').append( '<div>* ' + nodos[i].firstChild.nodeValue + '</div>');
		    }
		    $('#textoErrorMedico').show();
	    }
	}

	function cerrarVentanaAgregarMedico(){

		$('#textoErrorMedico').hide();		
		$('#dialogoMedico').dialog( "close" );
	}
		
//------Fin Modificar Paciente---------//

	function cambioPaciente(){

		if($('#idPaciente').val()!=-1){
			$('#botonModificar').removeAttr("disabled");
		}else{
			$('#botonModificar').attr("disabled","disabled");
		}
	}

	function cambioMedico(){

		if($('#idMedico').val()!=-1){
			$('#botonModificarMedico').removeAttr("disabled");
		}else{
			$('#botonModificarMedico').attr("disabled","disabled");
		}
	}
	*/
</script>

<div id="exitoGrabado" class="verdeExito"><br>${exitoGrabado}<br></div>
<div id="errores" class="rojoAdvertencia"><br>${error}<br></div>

<!--
	<div id="exitoGrabado" class="verdeExito"><br>${exitoGrabado}<br></div>
	<div id="errores" style="display: none;" class="alert alert-danger">${error}</div>
-->

<html:form action="estudio" styleId="estudioFormId">
	<html:hidden property="metodo" value="altaEstudio"/>

	<table border="0" class="cuadrado" align="center" width="85%" cellpadding="2" cellspacing="0">
		<tr>
			<td colspan="4"  class="azulAjustado" >Alta de Estudio</td>
		</tr>
		<tr>
			<td height="20" colspan="4"></td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="12%" >Número</td>
			<td align="left" width="40%">			
				<html:text property="estudioDTO.numero" value="${nroEstudio}" styleClass="botonerab" size="10"  
					onkeypress="javascript:esNumerico(event);" readonly="readonly"/>
			</td>
			
			<td class="botoneralNegritaRight" width="12%" >Paciente</td>
			<td align="left">
				<div style="display: " id="comboPacientes">			
					<select id="idPaciente" class="botonerab" name="estudioDTO.paciente.id" onchange="cambioPaciente()">
						<option value="-1">
							Seleccione un paciente...
						</option>		
						<c:forEach items="${pacientes}" var="p">
							<option value="${p.id}">
								<c:out value="${p.apellido}"></c:out>, <c:out value="${p.nombre}"></c:out>
							</option>
						</c:forEach>										
					</select>
					
					<input type="button" value="Agregar" class="botonerab" onclick="abrirVentantAgregarPaciente()">
					<input id="botonModificar" disabled="disabled" type="button" value="Modificar" class="botonerab" 
						onclick="abrirVentantModificarPaciente()">					
					
					<!-- Nuevo Estilo -->
					<!--<button type="button" class="btn btn-primary-bootstrap btn-xs" onclick="abrirVentantAgregarPaciente()">Agregar</button>
					<button type="button" class="btn btn-primary-bootstrap btn-xs" onclick="abrirVentantModificarPaciente()" 
						id="botonModificar" disabled="disabled">Modificar</button>-->
										
				</div>
				<div style="display: none" id="inputPaciente">
					<input type="text" value="" id="nombrePacienteAgregado" readonly="readonly">
					<input type="hidden" name="estudioDTO.paciente.id" value="" id="idPacienteAgregado">
				</div>	
			</td>			
		</tr>	
		
		<tr>
			<td class="botoneralNegritaRight" width="12%" >Solicitado Por</td>
			<td align="left" width="40%">
				<div style="display: " id="comboMedicos">	
					<select id="idMedico" class="botonerab" onchange="cambioMedico()" name="estudioDTO.medico.id">
						<option value="-1">
							Seleccione un médico...
						</option>		
						<c:forEach items="${medicos}" var="m">
							<option value="${m.id}">
								<c:out value="${m.apellido}"></c:out>, <c:out value="${m.nombre}"></c:out> - <c:out value="${m.matricula}"></c:out> 
							</option>
						</c:forEach>										
					</select>
					
					<input type="button" value="Agregar" class="botonerab" onclick="abrirVentantAgregarMedico()">
					<input id="botonModificarMedico" disabled="disabled" type="button" value="Modificar" class="botonerab" onclick="abrirVentantModificarMedico();">					
					
					<!-- Nuevo Estilo -->
					<!--  
					<button type="button" class="btn btn-primary btn-xs" onclick="abrirVentantAgregarMedico()">Agregar</button>
					<button type="button" class="btn btn-primary btn-xs" onclick="abrirVentantModificarMedico()" 
						id="botonModificarMedico" disabled="disabled">Modificar</button>-->																	
					
				</div>	
				<div style="display: none" id="inputMedico">
					<input type="text" value="" id="nombreMedicoAgregado" readonly="readonly" size="25">
					<input type="hidden" value="" id="idMedicoAgregado" name="estudioDTO.medico.id">
				</div>					
			</td>
			
			<td class="botoneralNegritaRight" width="12%" >Fecha</td>
			<td align="left">			
				<input id="datepicker" type="text" name="estudioDTO.fecha" readonly="readonly" class="botonerab">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>				
			</td>					
		</tr>
		
		<tr>
			<td class="botoneralNegritaRight" width="12%" >Monto Adeudado $</td>
			<td align="left" width="30%">			
				<input type="text" class="botonerab" size="30" name="estudioDTO.montoAdeudado" onkeypress="javascript:esNumericoConDecimal(event);"/>
			</td>
						
			<td class="botoneralNegritaRight" width="12%" >Fecha Entrega</td>
			<td align="left">			
				<input id="datepicker2" type="text" name="estudioDTO.fechaEntrega" readonly="readonly" class="botonerab">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>				
			</td>		
		</tr>
					
		<tr>
			<td class="botoneralNegritaCenter" width="12%" >Observaciones del Estudio</td>
			<td align="left" colspan="3">			
				<textarea class="botonerab" rows="3" cols="110" name="estudioDTO.observaciones"></textarea>
			</td>
		</tr>									
							
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
	</table>
	
	<table border="0" class="cuadrado" align="center" width="85%" cellpadding="2" cellspacing="2">
		<tr>
			<td height="20"></td>
		</tr>
		<%int i=0; %>
		<c:forEach items="${gruposPracticas}" var="grupo" varStatus="iGrupo">
			<tr onclick="expandirGrupo(<c:out value='${iGrupo.index}'></c:out>)" class="grisSubtitulo"
					id="grupo<c:out value='${iGrupo.index}'></c:out>" width="85%" 									
					onmouseover="javascript:pintarFila('grupo',<c:out value='${iGrupo.index}'></c:out>);"
					onmouseout="javascript:despintarFila('grupo',<c:out value='${iGrupo.index}'></c:out>);">
					
				<td id="grupo<c:out value='${iGrupo.index}'></c:out>" width="85%">					
					${grupo.nombre}									
					<c:if test="${grupo.codigoFaba != null && grupo.codigoFaba != ''}">					
						- (${grupo.codigoFaba})
					</c:if>							
				</td>									
			</tr>	
			<tr style="display: none" id="trGrupo<c:out value='${iGrupo.index}'></c:out>">
				<td>
					<table border="0" class="cuadrado" align="left" width="100%" cellpadding="2" >
						<tr>
							<td height="5" colspan="4" align="right">
								<a href="javascript:seleccionarTodos(<c:out value='${iGrupo.index}'></c:out>)">Seleccionar Todos</a>
								/
								<a href="javascript:desSeleccionarTodos(<c:out value='${iGrupo.index}'></c:out>)">Deseleccionar Todos</a>
							</td>
						</tr>				
						<c:forEach items="${grupo.practicas}" var="practica" varStatus="iPractica">
							<c:if test="${practica.subItemPractica == null}">
								<tr id="trPractica<%=i%>"
									class="trG<c:out value='${iGrupo.index}'></c:out>" 
									onmouseover="javascript:pintarPractica(<%=i%>);"
									onmouseout="javascript:despintarPractica(<%=i%>);">
									
									<td width="5%">
										<input type="hidden" class="grupo<c:out value='${iGrupo.index}'></c:out>" value="<%=i%>">									
										<input type="hidden" name="listaPracticas[<%=i%>].id" 
											id="hiddenPractica<%=i%>">
											
										<input type="checkbox" class="checkG<c:out value='${iGrupo.index}'></c:out>"
											onchange="clickCheck(<%=i%>)" 
											id="checkPractica<%=i%>"
											value="${practica.id}">
									</td>
									<td align="left" width="65%" onclick="javascript:clickCheckFila(<%=i%>);">
										${practica.nombre}
									</td>
									<td align="right" width="25%">
										<c:if test="${practica.codigoFaba != null && practica.codigoFaba != ''}">
											Codigo Faba
										</c:if>	
									</td>
									<td align="left" width="5%">
										${practica.codigoFaba}
									</td>																						
								</tr>	
								<%i++; %>	
							</c:if>											
						</c:forEach>
						
						<c:forEach items="${grupo.subItemsPractica}" var="subItem" varStatus="iSubItem">
							<tr>
								<td colspan="4" height="10">&nbsp;</td>							
							</tr>
							<tr>
								<td width="5%">
								</td>
								<td width="65%" class="negritaLeft">
									${subItem.nombre}	
									<c:if test="${subItem.codigoFaba != null && subItem.codigoFaba != ''}">					
										- (${subItem.codigoFaba})										
									</c:if>	
								</td>
								<td colspan="2" align="right">
									<a href="javascript:seleccionarTodosSubItem(<c:out value='${iGrupo.index},${iSubItem.index}'></c:out>)">Seleccionar Todos</a>
									/
									<a href="javascript:desSeleccionarTodosSubItem(<c:out value='${iGrupo.index},${iSubItem.index}'></c:out>)">Deseleccionar Todos</a>									
								</td>															
							</tr>
							<tr>
								<td width="5%">
								</td>
								<td width="95%" colspan="3">
									<table border="0" class="cuadrado" align="left" width="100%" cellpadding="2" >
										<tr>
											<td height="5" colspan="2"></td>
										</tr>															
										<c:forEach items="${subItem.practicas}" var="prac" varStatus="iPrac">											
											<tr id="trPractica<%=i%>"
												class="trG<c:out value='${iGrupo.index}'></c:out>"
												onmouseover="javascript:pintarPractica(<%=i%>);"
												onmouseout="javascript:despintarPractica(<%=i%>);">
												
												<td width="5%">	
													<input type="hidden" class="grupo<c:out value='${iGrupo.index}'></c:out>" 
														value="<%=i%>">
													<input type="hidden" class="subItem<c:out value='${iGrupo.index}'></c:out>-<c:out value='${iSubItem.index}'></c:out>" 
														value="<%=i%>">															
																																							
													<input type="hidden" name="listaPracticas[<%=i%>].id" 
														id="hiddenPractica<%=i%>">												
									
													<input type="checkbox" 
														class="checkG<c:out value='${iGrupo.index}'></c:out> checkSI<c:out value='${iGrupo.index}'></c:out>-<c:out value='${iSubItem.index}'></c:out>"
														onchange="clickCheck(<%=i%>)" 
														id="checkPractica<%=i%>"
														value="${prac.id}">													
												</td>														
												<td align="left" width="80%" onclick="javascript:clickCheckFila(<%=i%>);">
													${prac.nombre}
												</td>
												<td align="left" width="10%">
													<c:if test="${prac.codigoFaba != null && prac.codigoFaba != ''}">
														Codigo Faba
													</c:if>	
												</td>
												<td align="left" width="5%">
													${prac.codigoFaba}
												</td>																
											</tr>
											<%i++; %>						
										</c:forEach>																		
									</table>							
								</td>							
							</tr>							
						</c:forEach>
						
					</table>	
				</td>
			</tr>					
		</c:forEach>		
		<tr>
			<td height="20"></td>
		</tr>		
	</table>		
	
	<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>			
		<tr>
			<td align="center">
				<!-- Nuevo Estilo -->
				<!--  <button type="button" class="btn btn-primary btn-sm" onclick="javascript:submitir();">Aceptar</button>-->				
				
				<input type="button" class="botonerab" value="Aceptar" id="enviar" onclick="javascript:submitir();">
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>									
	</table>

</html:form>

<div id="dialogo" style="display: none" >	
	<br>
	<div id="textoError" class="rojoAdvertencia" style="display: none" ></div>
	<br>
		
	<html:form action="paciente" styleId="pacienteFormId">
		<html:hidden property="metodo" value="altaPacienteDesdeAltaEstudio"/>
		<input type="hidden" id="paciente" name="pacienteDTO.id"/>
	
		<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
			<tr>
				<td height="20" colspan="2"></td>
			</tr>				
			<tr>
				<td class="botoneralNegritaRight" width="40%">Nombre</td>
				<td align="left">
					<html:text property="pacienteDTO.nombre" value="" styleClass="botonerabGrande" styleId="nombre"/>
				</td>
			</tr>	
			<tr>
				<td class="botoneralNegritaRight" width="40%">Apellido</td>
				<td  align="left">
					<html:text property="pacienteDTO.apellido" value="" styleClass="botonerabGrande" styleId="apellido"/>			
				</td>
			</tr>
			<tr>
				<td class="botoneralNegritaRight" width="40%">Fecha de Nacimiento</td>
				<td  align="left">
					<input class="botonerab" type="text" size="15" name="pacienteDTO.fechaNacimiento" id="fechaNacimiento">						
					<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>							
				</td>
			</tr>
			<tr>
				<td class="botoneralNegritaRight" width="40%">
					DNI
				</td>
				<td  align="left">
					<html:text property="pacienteDTO.dni" value="" onkeypress="javascript:esNumerico(event);" styleClass="botonerab"
						styleId="dni"/>			
				</td>
			</tr>				
			<tr>
				<td class="botoneralNegritaRight" width="40%">
					Dirección
				</td>
				<td  align="left">
					<html:text property="pacienteDTO.direccion" value="" styleClass="botonerab" styleId="direccion"/>			
				</td>
			</tr>	
			<tr>
				<td class="botoneralNegritaRight" width="40%">
					Telefono
				</td>
				<td  align="left">
					<html:text property="pacienteDTO.telefono" value="" styleClass="botonerab" styleId="telefono"/>			
				</td>
			</tr>
			<tr>
				<td class="botoneralNegritaRight" width="40%">
					E-Mail
				</td>
				<td  align="left">
					<html:text property="pacienteDTO.email" value="" styleClass="botonerab" styleId="email"/>			
				</td>
			</tr>
			<tr>
				<td class="botoneralNegritaRight" width="40%">
					Obra Social
				</td>
				<td  align="left">
					<select id="obraSocial" class="botonerab" name="pacienteDTO.obraSocial.id">
						<option value="-1">
							-Seleccione una Obra Social-
						</option>		
						<c:forEach items="${obrasSociales}" var="os">
							<option value="${os.id}">
								<c:out value="${os.nombre}"></c:out>
							</option>
						</c:forEach>										
					</select>			
				</td>
			</tr>
			<tr>
				<td class="botoneralNegritaRight" width="40%">
					Nro Carnet Obra Social
				</td>
				<td  align="left">
					<html:text property="pacienteDTO.nroCarnetObraSocial" value="" styleClass="botonerab" styleId="nroCarnetObraSocial"/>			
				</td>
			</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">
				Observaciones
			</td>
			<td  align="left">
				<html:text property="pacienteDTO.observaciones" value="" styleClass="botonerab" styleId="observaciones"/>			
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
				<td width="48%" class="botonerab" align="right" id="tdAceptar">
					<input type="button" class="botonerab" value="Aceptar" onclick="javascript:agregarPaciente();">
				</td>
				<td width="48%" class="botonerab" align="right" id="tdModificar" style="display: none;">
					<input type="button" class="botonerab" value="Modificar" onclick="javascript:modificarPaciente();">
				</td>				
				<td width="4%"></td>			
				<td width="48%" class="botonerab" align="left">
					<input type="button" class="botonerab" value="Cancelar" onclick="javascript:cerrarVentanaAgregarPaciente();">
				</td>							
			</tr>
			<tr>
				<td height="10" colspan="3"></td>
			</tr>		
		</table>
	</html:form>	
</div>

<div id="dialogoMedico" style="display: none" >	
	<br>
	<div id="textoErrorMedico" class="rojoAdvertencia" style="display: none" ></div>
	<br>
		
	<html:form action="medico" styleId="medicoFormId">
		<html:hidden property="metodo" value="altaMedicoDesdeAltaEstudio"/>
		<input type="hidden" id="medico" name="medicoDTO.id"/>
	
		<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
			<tr>
				<td height="20" colspan="2"></td>
			</tr>				
			<tr>
				<td class="botoneralNegritaRight" width="40%">Nombre</td>
				<td align="left">
					<html:text property="medicoDTO.nombre" value="" styleClass="botonerabGrande" styleId="nombreMedico"/>
				</td>
			</tr>	
			<tr>
				<td class="botoneralNegritaRight" width="40%">Apellido</td>
				<td  align="left">
					<html:text property="medicoDTO.apellido" value="" styleClass="botonerabGrande" styleId="apellidoMedico"/>			
				</td>
			</tr>
			<tr>
				<td class="botoneralNegritaRight" width="40%">Telefono</td>
				<td  align="left">
					<html:text property="medicoDTO.telefono" value="" styleClass="botonerabGrande" styleId="telefonoMedico"/>			
				</td>
			</tr>
			<tr>
				<td class="botoneralNegritaRight" width="40%">Matricula</td>
				<td  align="left">
					<html:text property="medicoDTO.matricula" value="" styleClass="botonerabGrande" styleId="matriculaMedico"/>			
				</td>
			</tr>				
			<tr>
				<td class="botoneralNegritaRight" width="40%">Especialidad</td>
				<td  align="left">
					<html:text property="medicoDTO.especialidad" value="" styleClass="botonerabGrande" styleId="especialidadMedico"/>			
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
				<td width="48%" class="botonerab" align="right" id="tdAceptarMedico">
					<input type="button" class="botonerab" value="Aceptar" onclick="javascript:agregarMedico();">
				</td>
				<td width="48%" class="botonerab" align="right" id="tdModificarMedico" style="display: none;">
					<input type="button" class="botonerab" value="Modificar" onclick="javascript:modificarMedico();">
				</td>				
				<td width="4%"></td>			
				<td width="48%" class="botonerab" align="left">
					<input type="button" class="botonerab" value="Cancelar" onclick="javascript:cerrarVentanaAgregarMedico();">
				</td>							
			</tr>
			<tr>
				<td height="10" colspan="3"></td>
			</tr>		
		</table>
	</html:form>	
</div>

<script type="text/javascript">

	//$('#nombre').focus();

</script>