<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/agregarModificarMedico.js'/>"></script>

<%-- 
<!-- Nuevo Estilo -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
<link rel="stylesheet" href="<html:rewrite page='/css/jquery-ui_1_11_3.css'/>" type="text/css">
<!-- Nuevo Estilo -->--%>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
    .ui-datepicker{ z-index:1151 !important; }
</style>

<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/PacienteFachada.js'/>"></script>

<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/MedicoFachada.js'/>"></script>

<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/PracticaFachada.js'/>"></script>

<script type="text/javascript">

	$(function() {
		$( "#datepicker" ).datepicker({ dateFormat: 'dd/mm/yy'});
		$( "#datepicker2" ).datepicker({ dateFormat: 'dd/mm/yy'});
		//$( "#fechaNacimiento" ).datepicker({ dateFormat: 'dd/mm/yy'});
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

	/*function pintarFila(tag,id){
		
		$('#'+tag+id).attr("class", "verdeSubtitulo");	
	}

	function despintarFila(tag,id){

		$('#'+tag+id).attr("class", "grisSubtitulo");
			
	}*/

	function pintarFila(tag,id,clase){
		
		$('#'+tag+id).attr("class", clase);
	}	
	
	function pintarFilaEstudioPreSeteado(tag,id){
		
		$('#'+tag+id).attr("class", "verdeClaroSubtituloCenter");	
	}

	function despintarFilaEstudioPreSeteado(tag,id){

		$('#'+tag+id).attr("class", "grisMuyClaroSubtituloCenterLetraChica");
			
	}	
	
	function pintarPractica(ind){
		
		//$('#trPractica'+ind).addClass("verdeClaroSubtituloCenter");
		$('#trPractica'+ind).addClass("verdeClaroSubtituloCenterListaPracticas");
	}	

	function despintarPractica(ind){
		if(!$('#checkPractica'+ind).is(':checked')){
			//$('#trPractica'+ind).removeClass("verdeClaroSubtituloCenter");
			$('#trPractica'+ind).removeClass("verdeClaroSubtituloCenterListaPracticas");
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

		//PRESELECCION 
		//var idPractica = $('#checkPractica'+ind).val();
		//var indicePractica = $('#valorIndice'+idPractica).val();
		

		if($('#checkPractica'+ind).is(':checked')){
			//$('#trPractica'+ind).addClass("verdeClaroSubtituloCenter");
			$('#trPractica'+ind).addClass("verdeClaroSubtituloCenterListaPracticas");
			$('#hiddenPractica'+ind).val($('#checkPractica'+ind).val());	
		}
		else{
			//$('#trPractica'+ind).removeClass("verdeClaroSubtituloCenter");
			$('#trPractica'+ind).removeClass("verdeClaroSubtituloCenterListaPracticas");
			$('#hiddenPractica'+ind).val(0);
		}
	}
	
	/*function preSeleccion(){

		var practicas = ["190", "193", "274","199","376","21","22"];
		var i;
		for (i = 0; i < practicas.length; i++) {
		    preSeleccion1(practicas[i]);
		}			
	}*/
	
	
	
	function obtenerEstudioPreSeteado(idEstudoPreSeteado){
		PracticaFachada.obtenerEstudioPreSeteado(idEstudoPreSeteado,obtenerEstudioPreSeteadoCallback);
	}		
	
	function obtenerEstudioPreSeteadoCallback(lista){
	
		//alert(lista);		
		//alert(lista.length);
		
		var i;
		for (i = 0; i < lista.length; i++) {
		    preSeleccion1(lista[i]);
		}	
	}
	
	//PRESELECCION
	function preSeleccion1(idPractica){
	
		var indicePractica = $('#valorIndice'+idPractica).val();	
		var indiceGrupo = $('#valorGrupo'+idPractica).val();						
			
		$('#checkPractica'+indicePractica).prop('checked', true);
		clickCheck(indicePractica);
		
		if(!$("#listagrupoPracticas"+indiceGrupo).is(':visible')){
			$("#grupo"+indiceGrupo).trigger('click');
		}		
		
		/*if(!$("#trGrupo"+indiceGrupo).is(':visible')){
			expandirGrupo(indiceGrupo);
		}*/	
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
		
		$('#textoErrorPaciente').text("");
		$('#idTablaErrorPaciente').hide();
		$('#tdAceptar').hide();
		$('#tdModificar').show();
		//$('#dialogo').dialog({title: 'Modificar Paciente', height: 450, width: 600, modal: true});
		
		$('#idTituloAltaPaciente').hide();
		$('#idTituloModificacionPaciente').show();	
		
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
	    	$('#textoErrorPaciente').text("");
		    for(var i=0; i < nodos.length; i++) { 
			    $('#textoErrorPaciente').append( '<div><b>* ' + nodos[i].firstChild.nodeValue + '</b></div>');
		    }
		    $('#idTablaErrorPaciente').show();
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

		$('#textoErrorPaciente').text("");
		$('#idTablaErrorPaciente').hide();
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
		
		$('#idTituloAltaPaciente').show();
		$('#idTituloModificacionPaciente').hide();		
		
		//$('#dialogo').dialog({title: 'Agregar Paciente', height: 450, width: 600, modal: true, position: {my: "center", at: "center", of: window}});			
	}

	function cerrarVentanaAgregarPaciente(){

		/*$('#textoError').hide();		
		$('#dialogo').dialog( "close" );*/
		
		$('#textoErrorPaciente').text("");
		$('#idTablaErrorPaciente').hide();		
		$("#ventanaAgregarPaciente .close").click()		
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
	    	$('#textoErrorPaciente').text("");
		    for(var i=0; i < nodos.length; i++) { 
			    $('#textoErrorPaciente').append( '<div><b>* ' + nodos[i].firstChild.nodeValue + '</b></div>');
		    }
		    $('#idTablaErrorPaciente').show();
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

</script>

<div id="exitoGrabado" class="verdeExito"><br>${exitoGrabado}<br></div>

<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="85%" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<div id="errores" class="alert alert-danger" style="display: none"></div>
		</td>
	</tr>
</table>
<%-- 
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
					<input id="botonModificar" disabled="disabled" type="button" value="Modificar" class="botonerab" onclick="abrirVentantModificarPaciente()">					
					
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
	
	<!-- PRESELECCION -->
	<table border="0" class="cuadrado" align="center" width="85%" cellpadding="2" cellspacing="2">
		
		<tr onclick="expandirGrupo('EstudiosPreSeteados')" class="grisSubtituloCenter">				
			<td width="85%" height="15">					
				Estudios Pre Seteados							
			</td>									
		</tr>	
		<tr style="display: none" id="trGrupoEstudiosPreSeteados">
			<td width="85%">
				<table border="0" class="cuadrado" align="center" width="100%" cellpadding="0" cellspacing="0">						
					<c:forEach items="${listaEstudiosPreSeteados}" var="estudioPreSeteado" varStatus="iEstudioPreSeteado">
						<tr>					
							<td height="20" onclick="javascript:obtenerEstudioPreSeteado(<c:out value='${estudioPreSeteado.idEstudioPreSeteado}'></c:out>)"
								onmouseover="javascript:pintarFilaEstudioPreSeteado('estudioPreSeteado',<c:out value='${iEstudioPreSeteado.index}'></c:out>);"
								onmouseout="javascript:despintarFilaEstudioPreSeteado('estudioPreSeteado',<c:out value='${iEstudioPreSeteado.index}'></c:out>);"
								id="estudioPreSeteado<c:out value='${iEstudioPreSeteado.index}'></c:out>"
								class="grisMuyClaroSubtituloCenterLetraChica">
																							
								<c:out value='${estudioPreSeteado.nombre}'></c:out>
																
							</td>
						</tr>
					</c:forEach>
				</table>	
			</td>			
		</tr>
	</table>		
	<!-- PRESELECCION -->		
			
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
																				
										<input type="hidden" id="valorIndice${practica.id}" value="<%=i%>"><!-- PRESELECCION -->
										<input type="hidden" id="valorGrupo${practica.id}" value="<c:out value='${iGrupo.index}'></c:out>"><!-- PRESELECCION -->	
											
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
									
													<input type="hidden" id="valorIndice${prac.id}" value="<%=i%>"><!-- PRESELECCION -->
													<input type="hidden" id="valorGrupo${prac.id}" value="<c:out value='${iGrupo.index}'></c:out>"><!-- PRESELECCION -->									
									
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

</script>--%>



<html:form action="estudio" styleId="estudioFormId">
	<html:hidden property="metodo" value="altaEstudio"/>

	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="85%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">	
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2" cellspacing="0">
					<tr>
						<td colspan="6"  class="tituloTablaBoots" >Alta de Estudio</td>
					</tr>
					<tr>
						<td height="20" colspan="6"></td>
					</tr>
	
					<tr>
						<td width="12%" align="right" class="labelForm">Número</td>
						<td width="25%">			
							<!--<html:text property="estudioDTO.numero" value="${nroEstudio}" styleClass="form-control form-control-sm" 
								onkeypress="javascript:esNumerico(event);" readonly="readonly"/>-->
								
							<input type="text" name="estudioDTO.numero" value="${nroEstudio}" class="form-control form-control-sm" readonly="readonly" />																								
						</td>
						<td width="5%"></td>
						<td width="10%" align="right" class="labelForm">Paciente</td>
						<td width="25%">	
							<div style="display: " id="comboPacientes">
								<div class="input-group">
								
								  <html:select property='estudioDTO.paciente.id' styleClass="custom-select custom-select-sm" styleId="idPaciente" onchange="cambioPaciente()">
								  	  <html:option value="-1"> -- Seleccione un paciente -- </html:option>
									  <html:optionsCollection  name="pacientes" value="id" label="descripcion" />
								  </html:select>  
								  <div class="input-group-append">								
									  <button class="btn btn-sm btn-outline-secondary" type="button" onclick="abrirVentantAgregarPaciente();" data-toggle="modal" data-target="#ventanaAgregarPaciente"><img alt="" src="<html:rewrite page='/imagenes/botonAgregar.png'/>" align="top" width='21' height='21'></button>
									  <button class="btn btn-sm btn-outline-secondary" type="button" onclick="abrirVentantModificarPaciente();" id="botonModificar" disabled="disabled" data-toggle="modal" data-target="#ventanaAgregarPaciente"><img alt="" src="<html:rewrite page='/imagenes/botonModificar.png'/>" align="top" width='21' height='21'></button>									  
								  </div>
								</div>
							</div>																												
							<div style="display: none" id="inputPaciente">
								<input type="text" value="" id="nombrePacienteAgregado" readonly="readonly" class="form-control form-control-sm">																								
								<input type="hidden" name="estudioDTO.paciente.id" value="" id="idPacienteAgregado">
							</div>							
						</td>
						<td width="5%"></td>			
					</tr>					
					<tr>
						<td width="10%" align="right" class="labelForm">Solicitado Por</td>
						<td width="25%">
							<div style="display: " id="comboMedicos">
								<div class="input-group">
								
								  <html:select property='estudioDTO.medico.id' styleClass="custom-select custom-select-sm" styleId="idMedico" onchange="cambioMedico()">
								  	  <html:option value="-1"> -- Seleccione un médico -- </html:option>
									  <html:optionsCollection  name="medicos" value="id" label="descripcion" />
								  </html:select>  
								  <div class="input-group-append">
									  <button class="btn btn-sm btn-outline-secondary" type="button" onclick="abrirVentantAgregarMedico();" data-toggle="modal" data-target="#ventanaAgregarMedico"><img alt="" src="<html:rewrite page='/imagenes/botonAgregar.png'/>" align="top" width='21' height='21'></button>
									  <button class="btn btn-sm btn-outline-secondary" type="button" onclick="abrirVentantModificarMedico();" id="botonModificarMedico" disabled="disabled" data-toggle="modal" data-target="#ventanaAgregarMedico"><img alt="" src="<html:rewrite page='/imagenes/botonModificar.png'/>" align="top" width='21' height='21'></button>
								  </div>
								</div>
							</div>																												
							<div style="display: none" id="inputMedico">
								<input type="text" value="" id="nombreMedicoAgregado" readonly="readonly" size="25" class="form-control form-control-sm">																								
								<input type="hidden" value="" id="idMedicoAgregado" name="estudioDTO.medico.id">
							</div>									
						</td>	
						<td width="5%">
						</td>
						<td width="15%" align="right" class="labelForm">Fecha</td>
						<td width="20%">						
							<div class="input-group ">
							  <div class="input-group-prepend">
							    <span class="form-control form-control-sm" id="basic-addon1">
							    	<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
							    </span>
							  </div>
							  <input id="datepicker" type="text" name="estudioDTO.fecha" class="form-control form-control-sm"  readonly="readonly">					 
							</div>										
						</td>
						<td width="5%"></td>
					</tr>					
					<tr>		
						<td width="10%" align="right" class="labelForm">Monto Adeudado</td>
						<td width="25%">	
							<div class="input-group ">
							  <div class="input-group-prepend">
							    <span class="form-control form-control-sm" id="basic-addon1">$</span>
							  </div>
							  <input type="text" class="form-control form-control-sm" aria-describedby="basic-addon1" name="estudioDTO.montoAdeudado" onkeypress="javascript:esNumericoConDecimal(event);"/>					 
							</div>						
						</td>												
						<td width="5%"></td>
						<td width="15%" align="right" class="labelForm">Fecha de Entrega</td>
						<td align="left">
							<div class="input-group ">
							  <div class="input-group-prepend">
							    <span class="form-control form-control-sm" id="basic-addon1">
							    	<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
							  	</span>
							  </div>
							  <c:choose>
								<c:when test="${estudio.fechaEntrega != null}">
									<input id="datepicker2" type="text" readonly="readonly" class="form-control form-control-sm" name="estudioDTO.fechaEntrega">
								</c:when>
								<c:otherwise>
									<input id="datepicker2" type="text" readonly="readonly" class="form-control form-control-sm" value="" name="estudioDTO.fechaEntrega">					
								</c:otherwise>		
							</c:choose>						 
						  </div>										
						</td>										
						<td width="5%"></td>		
					</tr>										
					<tr>
						<td height="10" colspan="6"></td>
					</tr>
					<tr>
						<td width="10%" align="right" class="labelForm">Observaciones del Estudio</td>
						<td align="left" colspan="4">			
							<textarea class="form-control form-control-sm" rows="3" cols="110" name="estudioDTO.observaciones"></textarea>
						</td>
					</tr>									
					<tr>
						<td height="20" colspan="6"></td>
					</tr>
				</table>
	
				<!-- PRESELECCION -->
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="0" cellspacing="0">	
					
					<tr height="23">								
						<td width="1%" class="fondoPractica rounded-left" id="tdEstudioPreSeteado1">
						</td>
						<td align="center" class="fondoPractica rounded-right" data-toggle="collapse" data-target="#listaEstudioPreSeteado" aria-expanded="false" 									
							aria-controls="listaEstudioPreSeteado" id="grupoEstudioPreSeteado1"
							onmouseover="javascript:pintarFila('grupoEstudioPreSeteado',1,'fondoPracticaSeleccion rounded-right'); 
										 javascript:pintarFila('tdEstudioPreSeteado',1,'fondoPracticaSeleccion rounded-left');"
							onmouseout="javascript:pintarFila('grupoEstudioPreSeteado',1,'fondoPractica rounded-right');
										javascript:pintarFila('tdEstudioPreSeteado',1,'fondoPractica rounded-left');">
							
							Estudios Pre Seteados								
						</td>																				
					</tr>					
						
					<tr>
						<td width="85%" colspan="2">
							<div class="collapse" id="listaEstudioPreSeteado">
							 
								<ul class="list-group">
									<c:forEach items="${listaEstudiosPreSeteados}" var="estudioPreSeteado" varStatus="iEstudioPreSeteado">
										  <li class="list-group-item list-group-item-action list-group-item-secondary py-0" 
										  	  onclick="javascript:obtenerEstudioPreSeteado(<c:out value='${estudioPreSeteado.idEstudioPreSeteado}'></c:out>)">
										  	<c:out value='${estudioPreSeteado.nombre}'></c:out>
										  </li>
									</c:forEach>
								</ul>					 
							 	
							</div>	
						</td>			
					</tr>
				</table>				
				<!--  
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="0" cellspacing="0">	
					
					<tr height="23">								
						<td width="1%" class="fondoPractica rounded-left" id="tdEstudioPreSeteado1">
						</td>
						<td align="center" onclick="expandirGrupo('EstudiosPreSeteados')"  class="fondoPractica rounded-right"
							id="grupoEstudioPreSeteado1" 									
							onmouseover="javascript:pintarFila('grupoEstudioPreSeteado',1,'fondoPracticaSeleccion rounded-right'); 
										 javascript:pintarFila('tdEstudioPreSeteado',1,'fondoPracticaSeleccion rounded-left');"
							onmouseout="javascript:pintarFila('grupoEstudioPreSeteado',1,'fondoPractica rounded-right');
										javascript:pintarFila('tdEstudioPreSeteado',1,'fondoPractica rounded-left');">
							
							Estudios Pre Seteados								
						</td>																				
					</tr>					
						
					<tr style="display: none" id="trGrupoEstudiosPreSeteados">
						<td width="85%" colspan="2">
							<table border="0" class="cuadrado" align="center" width="100%" cellpadding="0" cellspacing="0">						
								<c:forEach items="${listaEstudiosPreSeteados}" var="estudioPreSeteado" varStatus="iEstudioPreSeteado">
									<tr>					
										<td height="20" onclick="javascript:obtenerEstudioPreSeteado(<c:out value='${estudioPreSeteado.idEstudioPreSeteado}'></c:out>)"
											onmouseover="javascript:pintarFilaEstudioPreSeteado('estudioPreSeteado',<c:out value='${iEstudioPreSeteado.index}'></c:out>);"
											onmouseout="javascript:despintarFilaEstudioPreSeteado('estudioPreSeteado',<c:out value='${iEstudioPreSeteado.index}'></c:out>);"
											id="estudioPreSeteado<c:out value='${iEstudioPreSeteado.index}'></c:out>"
											class="grisMuyClaroSubtituloCenterLetraChica">
																										
											<c:out value='${estudioPreSeteado.nombre}'></c:out>
																			
										</td>
									</tr>
								</c:forEach>
							</table>	
						</td>			
					</tr>
				</table>	-->			
				<!-- PRESELECCION -->		
									
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td height="20" colspan="2"></td>
					</tr>
									
					<%int i=0; %>
					
					<c:forEach items="${gruposPracticas}" var="grupo" varStatus="iGrupo">
						
						<tr height="23">														
							<td width="1%" class="fondoPractica rounded-left" id="tdGrupo<c:out value='${iGrupo.index}'></c:out>">
							</td>							
							<td align="left" class="fondoPractica rounded-right"
								id="grupo<c:out value='${iGrupo.index}'></c:out>" data-toggle="collapse" data-target="#listagrupoPracticas<c:out value='${iGrupo.index}'></c:out>" aria-expanded="false" 									
								aria-controls="listagrupoPracticas<c:out value='${iGrupo.index}'></c:out>" 									
								onmouseover="javascript:pintarFila('grupo',<c:out value='${iGrupo.index}'></c:out>,'fondoPracticaSeleccion rounded-right'); 
											 javascript:pintarFila('tdGrupo',<c:out value='${iGrupo.index}'></c:out>,'fondoPracticaSeleccion rounded-left');"
								onmouseout="javascript:pintarFila('grupo',<c:out value='${iGrupo.index}'></c:out>,'fondoPractica rounded-right');
											javascript:pintarFila('tdGrupo',<c:out value='${iGrupo.index}'></c:out>,'fondoPractica rounded-left');">								
								
								${grupo.nombre}
								<c:if test="${grupo.codigoFaba != null && grupo.codigoFaba != ''}">					
									- (${grupo.codigoFaba})
								</c:if>								
							</td>																				
						</tr>									
						<tr id="trGrupo<c:out value='${iGrupo.index}'></c:out>">
							<td colspan="2">
							<div class="collapse" id="listagrupoPracticas<c:out value='${iGrupo.index}'></c:out>">							
								<table border="0" class="cuadradoListaPracticas" align="left" width="100%" cellpadding="3" >
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
												class="trG<c:out value='${iGrupo.index}'></c:out> cuadradoListaPracticas" 
												onmouseover="javascript:pintarPractica(<%=i%>);"
												onmouseout="javascript:despintarPractica(<%=i%>);">
												
												<td width="5%">
													<input type="hidden" class="grupo<c:out value='${iGrupo.index}'></c:out>" value="<%=i%>">									
													<input type="hidden" name="listaPracticas[<%=i%>].id" 
														id="hiddenPractica<%=i%>">
																							
													<input type="hidden" id="valorIndice${practica.id}" value="<%=i%>"><!-- PRESELECCION -->
													<input type="hidden" id="valorGrupo${practica.id}" value="<c:out value='${iGrupo.index}'></c:out>"><!-- PRESELECCION -->	
														
													<input type="checkbox" class="checkG<c:out value='${iGrupo.index}'></c:out>"
														onchange="clickCheck(<%=i%>)" 
														id="checkPractica<%=i%>"
														value="${practica.id}">
												</td>
												<td align="left" width="65%" onclick="javascript:clickCheckFila(<%=i%>);">
													${practica.nombre}
												</td>
												<td align="right" width="25%" onclick="javascript:clickCheckFila(<%=i%>);">
													<c:if test="${practica.codigoFaba != null && practica.codigoFaba != ''}">
														Codigo Faba
													</c:if>	
												</td>
												<td align="left" width="5%" onclick="javascript:clickCheckFila(<%=i%>);">
													${practica.codigoFaba}
												</td>																						
											</tr>	
											<%i++; %>	
										</c:if>											
									</c:forEach>
									
									<c:forEach items="${grupo.subItemsPractica}" var="subItem" varStatus="iSubItem">
									<tr>
										<td colspan="4">
											<table border="0" class="cuadradoSinBordeBootstrapConFontSubItmes" align="left" width="100%" cellpadding="3" >			
												<tr>
													<td colspan="4" height="10">&nbsp;</td>							
												</tr>
												<tr>
													<td width="5%">
													</td>
													<td width="60%" align="left" class="tituloSubItemPractica">
														<b>${subItem.nombre}	
														<c:if test="${subItem.codigoFaba != null && subItem.codigoFaba != ''}">					
															- (${subItem.codigoFaba})										
														</c:if></b>
													</td>
													<td width="30%" align="right" class="tituloSubItemPractica">
														<a href="javascript:seleccionarTodosSubItem(<c:out value='${iGrupo.index},${iSubItem.index}'></c:out>)">Seleccionar Todos</a>
														/
														<a href="javascript:desSeleccionarTodosSubItem(<c:out value='${iGrupo.index},${iSubItem.index}'></c:out>)">Deseleccionar Todos</a>									
													</td>
													<td width="5%">
													</td>															
												</tr>
												<tr>
													<td width="5%">
													</td>
													<td width="90%" colspan="2">
														<table border="0" class="cuadradoListaPracticas" align="left" width="100%" cellpadding="2" >
															<!--  <tr>
																<td height="5" colspan="2"></td>
															</tr>-->															
															<c:forEach items="${subItem.practicas}" var="prac" varStatus="iPrac">											
																<tr id="trPractica<%=i%>"
																	class="trG<c:out value='${iGrupo.index}'></c:out> cuadradoListaPracticas"
																	onmouseover="javascript:pintarPractica(<%=i%>);"
																	onmouseout="javascript:despintarPractica(<%=i%>);">
																	
																	<td width="5%">	
																		<input type="hidden" class="grupo<c:out value='${iGrupo.index}'></c:out>" 
																			value="<%=i%>">
																		<input type="hidden" class="subItem<c:out value='${iGrupo.index}'></c:out>-<c:out value='${iSubItem.index}'></c:out>" 
																			value="<%=i%>">															
																																												
																		<input type="hidden" name="listaPracticas[<%=i%>].id" 
																			id="hiddenPractica<%=i%>">												
														
																		<input type="hidden" id="valorIndice${prac.id}" value="<%=i%>"><!-- PRESELECCION -->
																		<input type="hidden" id="valorGrupo${prac.id}" value="<c:out value='${iGrupo.index}'></c:out>"><!-- PRESELECCION -->									
														
																		<input type="checkbox" 
																			class="checkG<c:out value='${iGrupo.index}'></c:out> checkSI<c:out value='${iGrupo.index}'></c:out>-<c:out value='${iSubItem.index}'></c:out>"
																			onchange="clickCheck(<%=i%>)" 
																			id="checkPractica<%=i%>"
																			value="${prac.id}">													
																	</td>														
																	<td align="left" width="80%" onclick="javascript:clickCheckFila(<%=i%>);">
																		${prac.nombre}
																	</td>
																	<td align="left" width="10%" onclick="javascript:clickCheckFila(<%=i%>);">
																		<c:if test="${prac.codigoFaba != null && prac.codigoFaba != ''}">
																			Codigo Faba
																		</c:if>	
																	</td>
																	<td align="left" width="5%" onclick="javascript:clickCheckFila(<%=i%>);">
																		${prac.codigoFaba}
																	</td>																
																</tr>
																<%i++; %>						
															</c:forEach>																		
														</table>							
													</td>
													<td width="5%"></td>														
												</tr>	
											</table>
										</td>
									</tr>									
									</c:forEach>
									<tr>
										<td height="10" colspan="2"></td>							
									</tr>									
								</table>
							</div>		
							</td>
						</tr>
						<tr>
							<td height="1" colspan="2"></td>
						</tr>											
					</c:forEach>				
				</table>		
			</div>
		</td>
	</tr>				
	</table>
	
	<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">
		<tr>
			<td height="10" colspan="3"></td>
		</tr>			
		<tr>
			<td width="45%"></td>
			<td align="center">							
				<input type="button" class="btn btn-primary btn-block" value="Aceptar" onclick="javascript:submitir();">
			</td>
			<td width="45%"></td>
		</tr>
		<tr>
			<td height="20" colspan="3"></td>
		</tr>												
	</table>	
	
</html:form>



<%---------------- Ventana Agregar/Modificar Paciente --------------------------%>

<div id="ventanaAgregarPaciente" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="ventanaAgregarPacienteTitle" style="display: none;" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">	
      <div class="modal-header">
      	<div id="idTituloAltaPaciente" style="display: none">
      		<h5 class="modal-title" id="ventanaAgregarPacienteTitle">Alta de Paciente</h5>
      	</div>
        <div id="idTituloModificacionPaciente" style="display: none">
        	<h5 class="modal-title" id="ventanaAgregarPacienteTitle">Modificacion de Paciente</h5>
        </div>	                	
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">                

		<html:form action="paciente" styleId="pacienteFormId">
			<html:hidden property="metodo" value="altaPacienteDesdeAltaEstudio"/>
			<input type="hidden" id="paciente" name="pacienteDTO.id"/>

			<div id="idTablaErrorPaciente" style="display: none">		
				<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="90%" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<div id="textoErrorPaciente" class="alert alert-danger"></div>
						</td>
					</tr>
				</table>		
			</div>		
		
			<table border="0" class="cuadrado" align="center" width="90%" cellpadding="2" cellspacing="0">
				<tr>
					<td height="20" colspan="3"></td>
				</tr>				
				<tr>
					<td class="labelForm" width="25%" align="right">Nombre</td>
					<td align="left">											
						<html:text property="pacienteDTO.nombre" value="" styleClass="form-control form-control-sm" styleId="nombre"/>
					</td>
					<td width="10%"></td>
				</tr>	
				<tr>
					<td class="labelForm" width="25%" align="right">Apellido</td>
					<td  align="left">												
						<html:text property="pacienteDTO.apellido" value="" styleClass="form-control form-control-sm" styleId="apellido"/>			
					</td>
					<td width="10%"></td>
				</tr>			
				<tr>
					<td class="labelForm" width="25%" align="right">Fecha de Nacimiento</td>
					<td  align="left">
						<div class="input-group ">
							<div class="input-group-prepend">
						    	<span class="form-control form-control-sm" id="basic-addon1">
						    		<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
						  		</span>
							</div>
						  
							<input id="fechaNacimiento" type="text" class="form-control form-control-sm" name="pacienteDTO.fechaNacimiento" placeholder="dd/mm/aaaa">												
						</div>																			
					</td>
				</tr>				
				<tr>
					<td class="labelForm" width="25%" align="right">
						DNI
					</td>
					<td  align="left">
						<html:text property="pacienteDTO.dni" value="" onkeypress="javascript:esNumerico(event);" styleClass="form-control form-control-sm" styleId="dni"/>								
					</td>
				</tr>				
				<tr>
					<td class="labelForm" width="25%" align="right">
						Dirección
					</td>
					<td  align="left">
						<html:text property="pacienteDTO.direccion" value="" styleClass="form-control form-control-sm" styleId="direccion"/>			
					</td>
				</tr>	
				<tr>
					<td class="labelForm" width="25%" align="right">
						Telefono
					</td>
					<td  align="left">
						<html:text property="pacienteDTO.telefono" value="" styleClass="form-control form-control-sm" styleId="telefono"/>			
					</td>
				</tr>
				<tr>
					<td class="labelForm" width="25%" align="right">
						E-Mail
					</td>
					<td  align="left">
						<html:text property="pacienteDTO.email" value="" styleClass="form-control form-control-sm" styleId="email"/>			
					</td>
				</tr>				
				<tr>
					<td class="labelForm" width="25%" align="right">
						Obra Social
					</td>
					<td  align="left">
						<select id="obraSocial" class="custom-select custom-select-sm" name="pacienteDTO.obraSocial.id">
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
					<td class="labelForm" width="25%" align="right">
						Nro Carnet Obra Social
					</td>
					<td  align="left">
						<html:text property="pacienteDTO.nroCarnetObraSocial" value="" styleClass="form-control form-control-sm" styleId="nroCarnetObraSocial"/>			
					</td>
				</tr>
				<tr>
					<td class="labelForm" width="25%" align="right">
						Observaciones
					</td>
					<td  align="left">
						<html:text property="pacienteDTO.observaciones" value="" styleClass="form-control form-control-sm" styleId="observaciones"/>			
					</td>
				</tr>				
															
				<tr>
					<td height="20" colspan="3"></td>
				</tr>					
			</table>        
      	</html:form>                          
      </div>
      <div class="modal-footer">        
      	<div id="tdAceptar">
        	<button class="btn btn-primary" onclick="javascript:agregarPaciente();">Aceptar</button>
        </div>
        <div id="tdModificar">	
        	<button class="btn btn-primary" onclick="javascript:modificarPaciente();">Modificar</button>
        </div>
        <button class="btn btn-secondary" data-dismiss="modal">Cancelar</button>	
      </div>
    </div>
  </div>
</div>




<%---------------- Ventana Agregar/Modificar Medico --------------------------%>

<div id="ventanaAgregarMedico" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="ventanaAgregarMedicoTitle" style="display: none;" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">	
      <div class="modal-header">
      	<div id="idTituloAltaMedico" style="display: none">
      		<h5 class="modal-title" id="ventanaAgregarMedicoTitle">Alta de Medico</h5>
      	</div>
        <div id="idTituloModificacionMedico" style="display: none">
        	<h5 class="modal-title" id="ventanaAgregarMedicoTitle">Modificacion de Medico</h5>
        </div>	                	
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
                
		<html:form action="medico" styleId="medicoFormId">                
			<html:hidden property="metodo" value="altaMedicoDesdeAltaEstudio"/>
			<input type="hidden" id="medico" name="medicoDTO.id"/>

			<div id="idTablaError" style="display: none">		
				<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="80%" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<div id="textoErrorMedico" class="alert alert-danger"></div>
						</td>
					</tr>
				</table>		
			</div>		
		
			<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
				<tr>
					<td height="20" colspan="3"></td>
				</tr>				
				<tr>
					<td class="labelForm" width="20%" align="right">Nombre</td>
					<td align="left">					
						<html:text property="medicoDTO.nombre" value="" styleClass="form-control form-control-sm" styleId="nombreMedico" size="80"/>
					</td>
					<td width="10%"></td>
				</tr>	
				<tr>
					<td class="labelForm" width="20%" align="right">Apellido</td>
					<td  align="left">						
						<html:text property="medicoDTO.apellido" value="" styleClass="form-control form-control-sm" styleId="apellidoMedico" size="80"/>			
					</td>
					<td width="10%"></td>
				</tr>
				<tr>
					<td class="labelForm" width="20%" align="right">Telefono</td>
					<td  align="left">
						<html:text property="medicoDTO.telefono" value="" styleClass="form-control form-control-sm" styleId="telefonoMedico" size="80"/>			
					</td>
					<td width="10%"></td>
				</tr>
				<tr>
					<td class="labelForm" width="20%" align="right">Matricula</td>
					<td  align="left">
						<html:text property="medicoDTO.matricula" value="" styleClass="form-control form-control-sm" styleId="matriculaMedico" size="80"/>			
					</td>
					<td width="10%"></td>
				</tr>
				<tr>
					<td class="labelForm" width="20%" align="right">Especialidad</td>
					<td  align="left">
						<html:text property="medicoDTO.especialidad" value="" styleClass="form-control form-control-sm" styleId="especialidadMedico" size="80"/>			
					</td>
					<td width="10%"></td>
				</tr>												
				<tr>
					<td height="20" colspan="3"></td>
				</tr>					
			</table>        
      	</html:form>        
                              
      </div>
      <div class="modal-footer">        
      	<div id="tdAceptarMedico">
        	<button class="btn btn-primary" onclick="javascript:agregarMedico();">Aceptar</button>
        </div>
        <div id="tdModificarMedico">	
        	<button class="btn btn-primary" onclick="javascript:modificarMedico();">Modificar</button>
        </div>
        <button class="btn btn-secondary" data-dismiss="modal">Cancelar</button>	
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

	//$('#nombre').focus();

</script>



