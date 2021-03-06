<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>

<link rel="stylesheet" href="<html:rewrite page='/css/jquery-ui_1_11_3.css'/>" type="text/css">

<!--  -<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">-->

<script type="text/javascript">

function generarReporte(){

	var idEstudio = $("#idEstudio").val();
	
	var especificaciones = 'top=0,left=0,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable';
	/*if(type == "IE"){
		window.open("./reporte.do?metodo=generarReporteEstudio&idEstudio="+idEstudio,"",especificaciones);		
	}else{
		window.open("../../reporte.do?metodo=generarReporteEstudio&idEstudio="+idEstudio,"",especificaciones);				
	}*/

	var desde = $("#numeroEstudio").val();
	var hasta = $("#numeroEstudio").val();
	if(type == "IE"){
		window.open("./reporte.do?metodo=generarReportesEstudios&desde="+desde+"&hasta="+hasta,"",especificaciones);		
	}else{
		window.open("../../reporte.do?metodo=generarReportesEstudios&desde="+desde+"&hasta="+hasta,"",especificaciones);				
	}
}

	function volver(){

		var fechaDesde = $('#fechaDesde').val();
		var fechaHasta = $('#fechaHasta').val();
		var idMedico = $('#idMedico').val();
		var idObraSocial = $('#idObraSocial').val();		

		if(idMedico == ""){
			parent.location=contextRoot() + "/estudio.do?metodo=cargarRecuperarEstudios&forward=recuperarEstudioParaConsulta";
		}
		else{
			parent.location=contextRoot() + "/estudio.do?metodo=cargarRecuperarEstudiosPorMedicoObraSocial&fechaDesde="+fechaDesde+"&fechaHasta="+fechaHasta+"&idMedico="+idMedico+"&idObraSocial="+idObraSocial;			
		}	
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
	
	
</script>	
	<br>
	<c:if test="${estudio.estado == 'ENTREGADO'}">
		<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="85%" cellpadding="2" cellspacing="0">
			<tr>
				<td>
					<div class="alert alert-success">
					  <strong>El estudio ha sido entregado</strong>
					</div>
				</td>
			</tr>
		</table>		
	</c:if>
	
	<input type="hidden" value="${estudio.id}" id="idEstudio"/>
	
	<input type="hidden" value="${fechaDesde}" id="fechaDesde"/>
	<input type="hidden" value="${fechaHasta}" id="fechaHasta"/>
	<input type="hidden" value="${idMedico}" id="idMedico"/>
	<input type="hidden" value="${idObraSocial}" id="idObraSocial"/>	
	
	<%-- 
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="85%" cellpadding="2" cellspacing="0">
	<tr><td>
	<div class="well-sm-bootstrap well-bootstrap">	
	
		<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2" cellspacing="0">
			<tr>
				<td colspan="4"  class="tituloTabla" >Consulta de Estudio</td>
			</tr>
			<tr>
				<td height="20" colspan="4"></td>
			</tr>				
			<tr>
				<td class="fontNegritaRightBootstrap" width="15%" >N�mero</td>
				<td align="left" width="30%">			
					<input type="text" value="${estudio.numero}" class="botonerab" size="10" readonly="readonly" id="numeroEstudio"/>
				</td>
				
				<td class="fontNegritaRightBootstrap" width="27%" >Paciente</td>
				<td align="left">			
					<input type="text" value="${estudio.paciente.apellido}, ${estudio.paciente.nombre}" class="botonerab" size="30" readonly="readonly"/>
				</td>			
			</tr>	
			
			<tr>
				<td class="fontNegritaRightBootstrap" width="15%" >Solicitado Por</td>
				<td align="left" width="30%">			
					<input type="text" value="${estudio.medico.descripcion}" class="botonerab" size="30" readonly="readonly"/>
				</td>	
				
				<td class="fontNegritaRightBootstrap" width="27%" >Fecha</td>
				<td align="left">			
					<input id="datepicker" type="text" readonly="readonly" class="botonerab" 
						value="<fmt:formatDate	value='${estudio.fecha}' pattern='dd/MM/yyyy' />">
					<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>				
				</td>				
			</tr>
			
			<tr>		
				<td class="fontNegritaRightBootstrap" width="15%" >Estado</td>
				<td align="left" width="30%">			
					<input type="text" value="${estudio.estadoStr}" class="botonerab" size="30" readonly="readonly"/>
				</td>
				
				<td class="fontNegritaRightBootstrap" width="27%" >Fecha de Entrega</td>
				<td align="left">
					<c:choose>
						<c:when test="${estudio.fechaEntrega != null}">			
							<input id="datepicker" type="text" readonly="readonly" class="botonerab" 
								value="<fmt:formatDate	value='${estudio.fechaEntrega}' pattern='dd/MM/yyyy' />">
						</c:when>
						<c:otherwise>
							<input id="datepicker" type="text" readonly="readonly" class="botonerab" value="">					
						</c:otherwise>		
					</c:choose>		
					<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>				
				</td>		
			</tr>
				
			<tr>		
				<td class="fontNegritaRightBootstrap" width="15%" >Monto Adeudado $</td>
				<td align="left" width="30%">			
					<input type="text" value="${estudio.montoAdeudado}" class="botonerab" size="30" readonly="readonly"/>
				</td>
				
				<td class="fontNegritaRightBootstrap" width="27%" >Unidades de Facturaci�n</td>
				<td align="left">			
					<input type="text" value="${estudio.unidadesFacturacionTotal}" class="botonerab" size="10" readonly="readonly"/>
				</td>		
			</tr>
			<tr>
				<td height="10" colspan="4"></td>
			</tr>		
				
			<tr>
				<td class="fontNegritaCenterBootstrap" width="15%" >Observaciones del Estudio</td>
				<td align="left" colspan="3">			
					<textarea class="botonerab" rows="3" cols="110" readonly="readonly">${estudio.observaciones}</textarea>
				</td>
			</tr>					
	  		<tr>
				<td height="10" colspan="4">
					<!--  <hr color="lightgrey">-->
				</td>
			</tr>
			<tr>
				<td class="fontNegritaCenterBootstrap" width="15%" >Observaciones del Paciente</td>
				<td align="left"colspan="3">
					<textarea class="botonerab" rows="2" cols="110" readonly="readonly">${estudio.paciente.observaciones}</textarea>			
					<!--  <input type="text" value="${estudio.paciente.observaciones}" class="botonerab" size="100" readonly="readonly"/>-->
				</td>
			</tr>		
			<tr>
				<td height="10" colspan="4"></td>
			</tr>		
		</table>
		
		<table border="0" class="cuadrado" align="center" width="98%" cellpadding="2" cellspacing="2">
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
										<td align="left" width="20%">
											${valorPractica.practica.nombre}
										</td>		
										<td width="20%" align="left">
											<b>${valorPractica.valor}</b>
											${valorPractica.practica.unidad}
										</td>
										<td width="55%" align="left">
											<c:choose>
												<c:when test="${valorPractica.practica.valorReferencia != null}">
													Valor de Referencia: ${valorPractica.practica.mayorMenor} ${valorPractica.practica.valorReferencia} ${valorPractica.practica.unidad}
												</c:when>
												<c:when test="${valorPractica.practica.valorNormalDesde != null}">
													Valor de Referencia: ${valorPractica.practica.valorNormalDesde} a ${valorPractica.practica.valorNormalHasta} ${valorPractica.practica.unidad}		 	
												</c:when>	
												<c:when test="${valorPractica.practica.valorRefLibre != null}">
													${valorPractica.practica.valorRefLibreConBr}		 	
												</c:when>																					
											</c:choose>																				
										</td>																				
									</tr>	
									<%i++; %>	
																	
																			
							</c:forEach>
	
							<c:forEach items="${grupo.valorSubItemPractica}" var="valorSubItem" varStatus="iSubItem">
								<tr>
									<td width="5%">
									</td>
									<td colspan="3" class="negritaLeft">
										${valorSubItem.nombre}								
									</td>							
								</tr>
								<tr>
									<td width="5%">
									</td>
									<td colspan="3">
										<table border="0" class="cuadrado" align="left" width="100%" cellpadding="2" >
											<tr>
												<td height="5" colspan="4"></td>
											</tr>															
											<c:forEach items="${valorSubItem.valoresPracticas}" var="prac" varStatus="iPrac">											
												<tr id="trPractica<%=i%>"
													class="trG<c:out value='${iGrupo.index}'></c:out>">											
													<td width="5%">																					
														
													</td>														
													<td align="left" width="15%">
														${prac.practica.nombre}
													</td>
													<td width="15%" align="left">
														<b>${prac.valor}</b>
														${prac.practica.unidad}													
													</td>
													<td width="65%" align="left">
														<c:choose>
															<c:when test="${prac.practica.valorReferencia != null}">
																Valor de Referencia: ${prac.practica.mayorMenor} ${prac.practica.valorReferencia} ${prac.practica.unidad}
															</c:when>
															<c:when test="${prac.practica.valorNormalDesde != null}">
																Valor de Referencia: ${prac.practica.valorNormalDesde} a ${prac.practica.valorNormalHasta} ${prac.practica.unidad}		 	
															</c:when>	
															<c:when test="${prac.practica.valorRefLibre != null}">
																${prac.practica.valorRefLibreConBr}		 	
															</c:when>																								
														</c:choose>																					
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
	</div>
	</td></tr>				
	</table>	
	--%>
	
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="85%" cellpadding="2" cellspacing="0">
	<tr><td>
	<div class="well-sm-bootstrap well-bootstrap">	
	
		<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2" cellspacing="0">
			<tr>
				<td colspan="6"  class="tituloTablaBoots" >Consulta de Estudio</td>
			</tr>
			<tr>
				<td height="20" colspan="6"></td>
			</tr>				
			<tr>
				<td width="10%" align="right" class="labelForm">N�mero</td>
				<td width="25%">			
					<input type="text" value="${estudio.numero}" class="form-control form-control-sm" size="10" readonly="readonly" id="numeroEstudio"/>
				</td>
				<td width="5%"></td>
				<td width="15%" align="right" class="labelForm">Paciente</td>
				<td width="20%">			
					<input type="text" value="${estudio.paciente.apellido}, ${estudio.paciente.nombre}" class="form-control form-control-sm" 
						readonly="readonly"/>
				</td>
				<td width="5%"></td>			
			</tr>			
			<tr>
				<td width="10%" align="right" class="labelForm">Solicitado Por</td>
				<td width="25%">			
					<input type="text" value="${estudio.medico.descripcion}" class="form-control form-control-sm" readonly="readonly"/>
				</td>	
				<td width="5%"></td>
				<td width="15%" align="right" class="labelForm">Fecha</td>
				<td width="20%">
					<div class="input-group ">
					  <div class="input-group-prepend">
					    <span class="form-control form-control-sm" id="basic-addon1">
					    	<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
					    </span>
					  </div>
					  <input id="datepicker" type="text" class="form-control form-control-sm"  readonly="readonly" value="<fmt:formatDate	value='${estudio.fecha}' pattern='dd/MM/yyyy' />">					 
					</div>															
				</td>
				<td width="5%"></td>				
			</tr>			

			<tr>
				<td width="10%" align="right" class="labelForm">Estado</td>
				<td width="25%">			
					<input type="text" value="${estudio.estadoStr}" class="form-control form-control-sm" readonly="readonly"/>
				</td>	
				<td width="5%"></td>
				<td width="15%" align="right" class="labelForm">Fecha de Entrega</td>
				<td width="20%">
					<div class="input-group ">
					  <div class="input-group-prepend">
					    <span class="form-control form-control-sm" id="basic-addon1">
					    	<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
					    </span>
					  </div>
						<c:choose>
							<c:when test="${estudio.fechaEntrega != null}">
								<input id="datepicker" type="text" class="form-control form-control-sm"  readonly="readonly" 
										value="<fmt:formatDate	value='${estudio.fechaEntrega}' pattern='dd/MM/yyyy' />">
							</c:when>
							<c:otherwise>
								<input id="datepicker" type="text" class="form-control form-control-sm"  readonly="readonly" value="">												
							</c:otherwise>		
						</c:choose>					  					 
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
					  <input type="text" value="${estudio.montoAdeudado}" class="form-control form-control-sm" readonly="readonly" aria-describedby="basic-addon1"/>					 
					</div>							
				</td>	
				<td width="5%"></td>
				<td width="15%" align="right" class="labelForm">Unidades de Facturaci�n</td>
				<td width="20%">			
					<input type="text" value="${estudio.unidadesFacturacionTotal}" class="form-control form-control-sm" size="10" readonly="readonly"/>
				</td>	
				<td width="5%"></td>	
			</tr>

			<tr>
				<td height="10" colspan="6"></td>
			</tr>		
				
			<tr>
				<td width="10%" align="right" class="labelForm">Observaciones del Estudio</td>
				<td align="left" colspan="4">			
					<textarea class="form-control form-control-sm" rows="3" cols="110" readonly="readonly">${estudio.observaciones}</textarea>
				</td>
				<td width="5%"></td>
			</tr>					
	  		<tr>
				<td height="10" colspan="6">
				</td>
			</tr>
			<tr>
				<td width="10%" align="right" class="labelForm">Observaciones del Paciente</td>
				<td align="left"colspan="4">
					<textarea class="form-control form-control-sm" rows="2" cols="110" readonly="readonly">${estudio.paciente.observaciones}</textarea>			
				</td>
				<td width="5%"></td>
			</tr>		
			<tr>
				<td height="10" colspan="6"></td>
			</tr>		
		</table>
		
		<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="0" cellspacing="0">

			<%int i=0; %>
			
			<c:forEach items="${estudio.valoresEstudio}" var="grupo" varStatus="iGrupo">
				
				<tr height="23">
					<td width="1%" class="fondoPractica rounded-left" id="tdGrupo<c:out value='${iGrupo.index}'></c:out>">
					</td>
					<td align="left" onclick="expandirGrupo(<c:out value='${iGrupo.index}'></c:out>)"  class="fondoPractica rounded-right"<%-- class="grisSubtitulo"--%>
						id="grupo<c:out value='${iGrupo.index}'></c:out>" 									
						onmouseover="javascript:pintarFila('grupo',<c:out value='${iGrupo.index}'></c:out>,'fondoPracticaSeleccion rounded-right'); 
									 javascript:pintarFila('tdGrupo',<c:out value='${iGrupo.index}'></c:out>,'fondoPracticaSeleccion rounded-left');"
						onmouseout="javascript:pintarFila('grupo',<c:out value='${iGrupo.index}'></c:out>,'fondoPractica rounded-right');
									javascript:pintarFila('tdGrupo',<c:out value='${iGrupo.index}'></c:out>,'fondoPractica rounded-left');">
						
						${grupo.nombre}													
					</td>							
				</tr>				
				
				<tr style="display: none" id="trGrupo<c:out value='${iGrupo.index}'></c:out>">
					<td colspan="2">
						<table border="0" class="cuadradoListaPracticas" align="left" width="100%" cellpadding="2" >
				
							<c:if test="${fn:length(grupo.valoresPracticas) > 0}">
								<tr>
									<td height="10" colspan="4"></td>							
								</tr>							
							</c:if>				
				
							<c:forEach items="${grupo.valoresPracticas}" var="valorPractica" varStatus="iPractica">
								
									<tr id="trPractica<%=i%>" class="trG<c:out value='${iGrupo.index}'></c:out>">
										<td width="3%">
										</td>
										<td align="left" width="25%">
											${valorPractica.practica.nombre}
										</td>		
										<td width="22%" align="left">
											<b>${valorPractica.valor}</b>
											${valorPractica.practica.unidad}
										</td>
										<td width="50%" align="left">
											<c:choose>
												<c:when test="${valorPractica.practica.valorReferencia != null}">
													Valor de Referencia: ${valorPractica.practica.mayorMenor} ${valorPractica.practica.valorReferencia} ${valorPractica.practica.unidad}
												</c:when>
												<c:when test="${valorPractica.practica.valorNormalDesde != null}">
													Valor de Referencia: ${valorPractica.practica.valorNormalDesde} a ${valorPractica.practica.valorNormalHasta} ${valorPractica.practica.unidad}		 	
												</c:when>	
												<c:when test="${valorPractica.practica.valorRefLibre != null}">
													${valorPractica.practica.valorRefLibreConBr}		 	
												</c:when>																					
											</c:choose>																				
										</td>																				
									</tr>	
									<%i++; %>	
																	
									<tr>
										<td colspan="4" height="1"></td>							
									</tr>																			
							</c:forEach>
	
							<c:forEach items="${grupo.valorSubItemPractica}" var="valorSubItem" varStatus="iSubItem">
								<tr>
									<td height="10" colspan="4">
									</td>							
								</tr>							
								<tr>
									<td width="5%">
									</td>
									<td colspan="3" align="left">
										<b>${valorSubItem.nombre}</b>								
									</td>							
								</tr>
								<tr>
									<td width="5%">
									</td>
									<td colspan="3">
										<table border="0" class="cuadradoListaPracticas" align="left" width="100%" cellpadding="2" >
											<tr>
												<td height="5" colspan="4"></td>
											</tr>															
											<c:forEach items="${valorSubItem.valoresPracticas}" var="prac" varStatus="iPrac">											
												<tr id="trPractica<%=i%>" class="trG<c:out value='${iGrupo.index}'></c:out>">											
													<td width="3%">																																			
													</td>														
													<td align="left" width="30%">
														${prac.practica.nombre}
													</td>
													<td width="17%" align="left">
														<b>${prac.valor}</b>
														${prac.practica.unidad}													
													</td>
													<td width="50%" align="left">
														<c:choose>
															<c:when test="${prac.practica.valorReferencia != null}">
																Valor de Referencia: ${prac.practica.mayorMenor} ${prac.practica.valorReferencia} ${prac.practica.unidad}
															</c:when>
															<c:when test="${prac.practica.valorNormalDesde != null}">
																Valor de Referencia: ${prac.practica.valorNormalDesde} a ${prac.practica.valorNormalHasta} ${prac.practica.unidad}		 	
															</c:when>	
															<c:when test="${prac.practica.valorRefLibre != null}">
																${prac.practica.valorRefLibreConBr}		 	
															</c:when>																								
														</c:choose>																					
													</td>																												
												</tr>
												<%i++; %>
												<tr>
													<td colspan="4" height="1"></td>							
												</tr>																		
											</c:forEach>																		
										</table>							
									</td>							
								</tr>							
							</c:forEach>
							<tr>
								<td height="10" colspan="4"></td>							
							</tr>							
						</table>	
					</td>
				</tr>
				<tr>
					<td height="1" colspan="2"></td>
				</tr>							
			</c:forEach>					
		</table>	
	</div>
	</td></tr>				
	</table>	
	
	<table border="0" class="cuadradoSinBorde" align="center" width="70%" cellpadding="2" cellspacing="0">
		<tr>
			<td height="10" colspan="4"></td>
		</tr>			
		<tr>
			<td width="35%"></td>
			<td width="15%">
				<input type="button" class="btn btn-primary btn-block" value="Generar Reporte" onclick="generarReporte();">
			</td>	
			<td width="15%">	
				<input type="button" class="btn btn-primary btn-block" value="Volver" onclick="javascript:volver();">														
			</td>
			<td width="35%"></td>
		</tr>
		<tr>
			<td height="15" colspan="4"></td>
		</tr>									
	</table>
