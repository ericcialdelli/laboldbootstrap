<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/agregarModificarMedico.js'/>"></script>

<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/MedicoFachada.js'/>"></script>
	
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

<script type="text/javascript">

	$(function() {
		$( "#datepicker" ).datepicker({ dateFormat: 'dd/mm/yy'});	
		$( "#datepicker2" ).datepicker({ dateFormat: 'dd/mm/yy'});	
	});

	function submitir(){
		validarForm("estudioFormId","../estudio","validarModificacionEstudioForm","EstudioForm");
	}

	function volver(){

		parent.location=contextRoot() + "/estudio.do?metodo=cargarRecuperarEstudios&forward=recuperarEstudioParaModificacion";
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
	
</script>

<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="estudio" styleId="estudioFormId">
	<html:hidden property="metodo" value="modificacionEstudio"/>
	<html:hidden property="estudioDTO.id" value="${estudio.id}"/>

	<table border="0" class="cuadrado" align="center" width="85%" cellpadding="2" cellspacing="0">
		<tr>
			<td colspan="4"  class="azulAjustado" >Modificación de Estudio</td>
		</tr>
		<tr>
			<td height="20" colspan="4"></td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="12%" >Número</td>
			<td align="left" width="40%">			
				<html:text property="estudioDTO.numero" value="${estudio.numero}" styleClass="botonerab" size="10"  
					onkeypress="javascript:esNumerico(event);"/>
			</td>
			
			<td class="botoneralNegritaRight" width="20%" >Paciente</td>
			<td align="left">			
				<input type="text" value="${estudio.paciente.apellido}, ${estudio.paciente.nombre}" class="botonerab" size="30" readonly="readonly"/>
				<input type="hidden" value="${estudio.paciente.id}" name="estudioDTO.paciente.id">
			</td>			
		</tr>	
		
		<tr>
			<td class="botoneralNegritaRight" width="12%" >Solicitado Por</td>
			<td align="left" width="40%">
				<div style="display: " id="comboMedicos">
					<html:select property='estudioDTO.medico.id' styleClass="botonerab" value="${estudio.medico.id}" styleId="idMedico" onchange="cambioMedico()">
						<html:option value="-1"> -- Seleccione un médico -- </html:option>
						<html:optionsCollection  name="medicos" value="id" label="descripcion" />
					</html:select>
					<input type="button" value="Agregar" class="botonerab" onclick="abrirVentantAgregarMedico()">
					<input id="botonModificarMedico" disabled="disabled" type="button" value="Modificar" class="botonerab" onclick="abrirVentantModificarMedico();">					
				</div>
	
				<div style="display: none" id="inputMedico">
					<input type="text" value="" id="nombreMedicoAgregado" readonly="readonly" size="25">
					<input type="hidden" value="" id="idMedicoAgregado" name="estudioDTO.medico.id">
				</div>				
				
										
			</td>	
			
			<td class="botoneralNegritaRight" width="20%" >Fecha</td>
			<td align="left">			
				<input id="datepicker" type="text" name="estudioDTO.fecha" readonly="readonly" class="botonerab" 
					value="<fmt:formatDate	value='${estudio.fecha}' pattern='dd/MM/yyyy' />">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>				
			</td>				
		</tr>
		
		<tr>		
			<td class="botoneralNegritaRight" width="12%" >Estado</td>
			<td align="left" width="40%">			
				<input type="text" value="${estudio.estadoStr}" class="botonerab" size="30" readonly="readonly"/>
			</td>
			
			<td class="botoneralNegritaRight" width="20%" >Fecha de Entrega</td>
			<td align="left">
				<c:choose>
					<c:when test="${estudio.fechaEntrega != null}">			
						<input id="datepicker2" type="text" readonly="readonly" class="botonerab" name="estudioDTO.fechaEntrega"
							value="<fmt:formatDate	value='${estudio.fechaEntrega}' pattern='dd/MM/yyyy' />">
					</c:when>
					<c:otherwise>
						<input id="datepicker2" type="text" readonly="readonly" class="botonerab" value="" name="estudioDTO.fechaEntrega">					
					</c:otherwise>		
				</c:choose>		
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>				
			</td>		
		</tr>		
		
		<tr>
			<td class="botoneralNegritaRight" width="12%" >Monto Adeudado $</td>
			<td align="left" width="40%">			
				<input type="text" value="${estudio.montoAdeudado}" class="botonerab" size="30" name="estudioDTO.montoAdeudado" onkeypress="javascript:esNumericoConDecimal(event);"/>
			</td>
						
			<td class="botoneralNegritaRight" width="20%" >Unidades de Facturación</td>
			<td align="left">			
				<input type="text" value="${estudio.unidadesFacturacionTotal}" class="botonerab" size="10" name="estudioDTO.unidadesFacturacionTotal"/>
			</td>		
		</tr>		
		<tr>
			<td class="botoneralNegritaCenter" width="12%" >Observaciones del Estudio</td>
			<td align="left" colspan="3">			
				<textarea class="botonerab" rows="3" cols="110" name="estudioDTO.observaciones">${estudio.observaciones}</textarea>
			</td>
		</tr>				
		<!--  <tr>
			<td height="20" colspan="4">
				<hr color="lightgrey">
			</td>
		</tr>-->
		<tr>
			<td class="botoneralNegritaCenter" width="12%" >Observaciones del Paciente</td>
			<td align="left"colspan="3">
				<textarea class="botonerab" rows="2" cols="110" readonly="readonly">${estudio.paciente.observaciones}</textarea>			
				<!--  <input type="text" value="${estudio.paciente.observaciones}" class="botonerab" size="100" readonly="readonly"/>-->
			</td>
		</tr>		
		<tr>
			<td height="10" colspan="4"></td>
		</tr>
		
	</table>
	
	<table border="0" class="cuadrado" align="center" width="85%" cellpadding="2" cellspacing="2">
		<tr>
			<td height="20"></td>
		</tr>
		<%int i=0; %>
		
		<c:forEach items="${estudio.valoresEstudio}" var="grupo" varStatus="iGrupo">
			<tr>
				<td align="left" onclick="expandirGrupo(<c:out value='${iGrupo.index}'></c:out>)" class="grisSubtitulo"
					id="grupo<c:out value='${iGrupo.index}'></c:out>" 									
					onmouseover="javascript:pintarFila('grupo',<c:out value='${iGrupo.index}'></c:out>);"
					onmouseout="javascript:despintarFila('grupo',<c:out value='${iGrupo.index}'></c:out>);">
					
					${grupo.nombre}														
				</td>							
			</tr>
			
			<tr style="display: none" id="trGrupo<c:out value='${iGrupo.index}'></c:out>">
				<td>
					<table border="0" class="cuadrado" align="left" width="100%" cellpadding="2" >
			
						<c:forEach items="${grupo.valoresPracticas}" var="valorPractica" varStatus="iPractica">
							
								<tr id="trPractica<%=i%>"
									class="trG<c:out value='${iGrupo.index}'></c:out>">
									<td width="5%">
									</td>
									<td align="left" width="95%">
										${valorPractica.practica.nombre}
									</td>				
								</tr>	
								<%i++; %>	
																		
						</c:forEach>

						<c:forEach items="${grupo.valorSubItemPractica}" var="valorSubItem" varStatus="iSubItem">
							<tr>
								<td width="5%">
								</td>
								<td width="95%" class="negritaLeft">
									${valorSubItem.nombre}								
								</td>							
							</tr>
							<tr>
								<td width="5%">
								</td>
								<td width="95%">
									<table border="0" class="cuadrado" align="left" width="100%" cellpadding="2" >
										<tr>
											<td height="5" colspan="2"></td>
										</tr>															
										<c:forEach items="${valorSubItem.valoresPracticas}" var="prac" varStatus="iPrac">											
											<tr id="trPractica<%=i%>"
												class="trG<c:out value='${iGrupo.index}'></c:out>">											
												<td width="5%">																					
													
												</td>														
												<td align="left" width="95%">
													${prac.practica.nombre}
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
			<td height="20" ></td>
		</tr>		
	</table>		
	
	<table border="0" class="cuadradoSinBorde" align="center" width="80%" cellpadding="2" cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>			
		<tr>
			<td align="center">	
			
				<!-- Nuevo Estilo -->
				<!--
				<button type="button" class="btn btn-primary btn-sm" onclick="javascript:submitir();">Aceptar</button>
				<button type="button" class="btn btn-primary btn-sm" onclick="javascript:volver();">Volver</button>-->
						
				<input type="button" class="botonerab" value="Aceptar" id="enviar" onclick="javascript:submitir();">
				<input type="button" class="botonerab" value="Volver" id="enviar" onclick="javascript:volver();">
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>									
	</table>

</html:form>

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
	cambioMedico()
</script>