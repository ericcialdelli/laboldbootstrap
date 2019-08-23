<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>

<%-- <script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">--%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">


	function volver(){

		parent.location=contextRoot() + "/estudio.do?metodo=cargarRecuperarEstudios&forward=recuperarEstudioEliminarPracticas";
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
	
	function pintarPractica(ind){
				
		$('#trPractica'+ind).addClass("verdeClaroSubtituloCenterListaPracticas");
	}	

	function despintarPractica(ind){
		if(!$('#checkPractica'+ind).is(':checked')){
			$('#trPractica'+ind).removeClass("verdeClaroSubtituloCenterListaPracticas");
		}	
	}	
	
	function clickCheckFila(ind){
		if(!$('#checkPractica'+ind).is(':checked')){
		
			$('#checkPractica'+ind).prop('checked', true);
		}
		else{
			$('#checkPractica'+ind).prop('checked', false);		
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
	
</script>

<%-- 
<html:form action="estudio" styleId="estudioFormId">
	<html:hidden property="metodo" value="eliminarPracticasDeEstudio"/>
	<input type="hidden" value="${estudio.id}" id="idEstudio" name="estudioDTO.id"/>	
	
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="85%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">		
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2" cellspacing="0">
					<tr>
						<td colspan="4"  class="tituloTabla" >Eliminar Practicas de Estudio</td>
					</tr>
					<tr>
						<td height="20" colspan="4"></td>
					</tr>				
					<tr>
						<td class="fontNegritaRightBootstrap" width="15%" >Número</td>
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
						
						<td class="fontNegritaRightBootstrap" width="27%" >Unidades de Facturación</td>
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
								
								${grupo.nombre}-(${grupo.unidadBioquimica})														
							</td>							
						</tr>
						
						<tr style="display: none" id="trGrupo<c:out value='${iGrupo.index}'></c:out>">
			
							<td>
								<table border="0" class="cuadrado" align="left" width="100%" cellpadding="2" >
						
									<c:forEach items="${grupo.valoresPracticas}" var="valorPractica" varStatus="iPractica">
										
											<c:choose>
												<c:when test="${!valorPractica.cubreOS}">
													<c:set var="disabled" value="disabled='disabled'"></c:set>
													
												</c:when>
												<c:otherwise>
													<c:set var="disabled" value=""></c:set>
												</c:otherwise>	
											</c:choose>								
										
											<tr id="trPractica<%=i%>"
												class="trG<c:out value='${iGrupo.index}'></c:out>">
												<td width="5%">
													<input type="hidden" name="listaValoresPracticaDTO[<%=i%>].id" 
														id="hiddenPractica<%=i%>">									
												
			
													<input type="checkbox" onchange="clickCheck(<%=i%>)" id="checkPractica<%=i%>" 
																value="${valorPractica.id}" <c:out value='${disabled}'></c:out>>										
												</td>
												<td align="left" width="95%">
													${valorPractica.practica.nombre}-(${valorPractica.unidadBioquimica})
												</td>																						
											</tr>	
											<%i++; %>	
																					
									</c:forEach>
			
									<c:forEach items="${grupo.valorSubItemPractica}" var="valorSubItem" varStatus="iSubItem">						
										<tr>
											<td width="5%">
											</td>
											<td class="negritaLeft">
												${valorSubItem.nombre}								
											</td>							
										</tr>
										<tr>
											<td width="5%">
											</td>
											<td>
												<table border="0" class="cuadrado" align="left" width="100%" cellpadding="2" >
													<tr>
														<td height="5" colspan="4"></td>
													</tr>															
													<c:forEach items="${valorSubItem.valoresPracticas}" var="prac" varStatus="iPrac">
													
														<c:choose>
															<c:when test="${!prac.cubreOS}">
																<c:set var="disabled" value="disabled='disabled'"></c:set>
															</c:when>
															<c:otherwise>
																<c:set var="disabled" value=""></c:set>
															</c:otherwise>	
														</c:choose>											
																								
														<tr id="trPractica<%=i%>"
															class="trG<c:out value='${iGrupo.index}'></c:out>">											
															<td width="5%">	
																<input type="hidden" name="listaValoresPracticaDTO[<%=i%>].id" 
																	id="hiddenPractica<%=i%>">												
																		
																<input type="checkbox" onchange="clickCheck(<%=i%>)" id="checkPractica<%=i%>"
																	value="${prac.id}" <c:out value='${disabled}'></c:out>>																																																									
															</td>														
															<td align="left" width="95%">
																${prac.practica.nombre}-(${prac.unidadBioquimica})
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
		</td>
	</tr>				
	</table>		
	
	<table border="0" class="cuadradoSinBorde" align="center" width="70%" cellpadding="2" cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>			
		<tr>
			<td align="center">				
				<input type="submit" class="btn btn-primary-bootstrap btn-sm" value="Aceptar">
				<input type="button" class="btn btn-primary-bootstrap btn-sm" value="Volver" onclick="javascript:volver();">				
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>									
	</table>
</html:form>
--%>


<html:form action="estudio" styleId="estudioFormId">
	<html:hidden property="metodo" value="eliminarPracticasDeEstudio"/>
	<input type="hidden" value="${estudio.id}" id="idEstudio" name="estudioDTO.id"/>	
	
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="85%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">		
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2" cellspacing="0">
					<tr>
						<td colspan="6"  class="tituloTablaBoots">Eliminar Practicas de Estudio</td>
					</tr>
					<tr>
						<td height="20" colspan="6"></td>
					</tr>									
					<tr>
						<td width="10%" align="right" class="labelForm">Número</td>
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
						<td width="15%" align="right" class="labelForm">Unidades de Facturación</td>
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
								
								${grupo.nombre} - (${grupo.unidadBioquimica})														
							</td>																				
						</tr>						
						
						<tr style="display: none" id="trGrupo<c:out value='${iGrupo.index}'></c:out>">			
							<td colspan="2">
								<table border="0" class="cuadradoListaPracticas" align="left" width="100%" cellpadding="2" >
									<tr>
										<td height="10" colspan="4" align="right"></td>
									</tr>						
									<c:forEach items="${grupo.valoresPracticas}" var="valorPractica" varStatus="iPractica">
										
											<c:choose>
												<c:when test="${!valorPractica.cubreOS}">
													<c:set var="disabled" value="disabled='disabled'"></c:set>
													
												</c:when>
												<c:otherwise>
													<c:set var="disabled" value=""></c:set>
												</c:otherwise>	
											</c:choose>								
										
											<tr id="trPractica<%=i%>" class="trG<c:out value='${iGrupo.index}'></c:out>"
												onmouseover="javascript:pintarPractica(<%=i%>);"
												onmouseout="javascript:despintarPractica(<%=i%>);">	
																						
												<td width="5%">
													<input type="hidden" name="listaValoresPracticaDTO[<%=i%>].id" 
														id="hiddenPractica<%=i%>">									
												
			
													<input type="checkbox" onchange="clickCheck(<%=i%>)" id="checkPractica<%=i%>" 
																value="${valorPractica.id}" <c:out value='${disabled}'></c:out>>										
												</td>
												<td align="left" width="95%" onclick="javascript:clickCheckFila(<%=i%>);">
													${valorPractica.practica.nombre}-(${valorPractica.unidadBioquimica})
												</td>																						
											</tr>	
											<%i++; %>	
																					
									</c:forEach>
			
									<c:forEach items="${grupo.valorSubItemPractica}" var="valorSubItem" varStatus="iSubItem">
										<tr>
											<td colspan="2" height="10">&nbsp;</td>							
										</tr>															
										<tr>
											<td width="5%">
											</td>
											<td align="left">
												<b>${valorSubItem.nombre}</b>								
											</td>							
										</tr>
										<tr>
											<td width="5%">
											</td>
											<td>
												<table border="0" class="cuadradoListaPracticas" align="left" width="100%" cellpadding="2" >
													<tr>
														<td height="5" colspan="2"></td>
													</tr>															
													<c:forEach items="${valorSubItem.valoresPracticas}" var="prac" varStatus="iPrac">
													
														<c:choose>
															<c:when test="${!prac.cubreOS}">
																<c:set var="disabled" value="disabled='disabled'"></c:set>
															</c:when>
															<c:otherwise>
																<c:set var="disabled" value=""></c:set>
															</c:otherwise>	
														</c:choose>											
																								
														<tr id="trPractica<%=i%>" class="trG<c:out value='${iGrupo.index}'></c:out>"
															onmouseover="javascript:pintarPractica(<%=i%>);"
															onmouseout="javascript:despintarPractica(<%=i%>);">
																																								
															<td width="5%">	
																<input type="hidden" name="listaValoresPracticaDTO[<%=i%>].id" 
																	id="hiddenPractica<%=i%>">												
																		
																<input type="checkbox" onchange="clickCheck(<%=i%>)" id="checkPractica<%=i%>"
																	value="${prac.id}" <c:out value='${disabled}'></c:out>>																																																									
															</td>														
															<td align="left" width="95%" onclick="javascript:clickCheckFila(<%=i%>);">
																${prac.practica.nombre}-(${prac.unidadBioquimica})
															</td>																												
														</tr>
														<%i++; %>						
													</c:forEach>																		
												</table>							
											</td>							
										</tr>							
									</c:forEach>
									<tr>
										<td height="10" colspan="2"></td>							
									</tr>									
								</table>	
							</td>
						</tr>			
						<tr>
							<td height="1" colspan="2"></td>
						</tr>						
					</c:forEach>			
					<!--  <tr>
						<td height="20" ></td>
					</tr>-->		
				</table>		
			</div>
		</td>
	</tr>				
	</table>		
	<table border="0" class="cuadradoSinBorde" align="center" width="80%" cellpadding="2" cellspacing="0">
		<tr>
			<td height="10" colspan="4"></td>
		</tr>			
		<tr>
			<td width="35%"></td>
			<td width="15%">
				<input type="submit" class="btn btn-block btn-outline-primary" value="Aceptar">
			</td>	
			<td width="15%">	
				<input type="button" class="btn btn-block btn-outline-primary" value="Volver" onclick="javascript:volver();">														
			</td>
			<td width="35%"></td>
		</tr>
		<tr>
			<td height="15" colspan="4"></td>
		</tr>									
	</table>	
</html:form>

