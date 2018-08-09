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


<!-- Estilo Viejo -->
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

<link rel="stylesheet" href="<html:rewrite page='https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css'/>"
	type="text/css">
<!-- Estilo Viejo -->

<script type="text/javascript">

	function submitir(){
		validarForm("estudioPreSeteadoFormId","../estudioPreSeteado","validarEstudioPreSeteadoForm","EstudioPreSeteadoForm");
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

</script>

<div id="exitoGrabado" class="verdeExito"><br>${exitoGrabado}<br></div>
<div id="errores" class="rojoAdvertencia"><br>${error}<br></div>


<html:form action="estudioPreSeteado" styleId="estudioPreSeteadoFormId">
	<html:hidden property="metodo" value="altaEstudioPreSeteado"/>

	<table border="0" class="cuadrado" align="center" width="85%" cellpadding="2" cellspacing="0">
		<tr>
			<td colspan="2"  class="azulAjustado" >Alta de Estudio Pre Seteado</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="30%" >Nombre</td>
			<td align="left" width="70%">			
				<html:text property="nombre" value="" styleClass="botonerab" size="45"/>
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