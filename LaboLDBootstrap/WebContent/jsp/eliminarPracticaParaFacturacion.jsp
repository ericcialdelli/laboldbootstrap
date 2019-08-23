<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>

<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

<script type="text/javascript">


	function volver(){

		parent.location=contextRoot() + "/estudio.do?metodo=cargarRecuperarEstudios&forward=recuperarEstudioEliminarPracticasParaFacturacion";
	}	

	function expandirGrupo(idGrupo){
		
		$("#trGrupo"+idGrupo).toggle();
	}
		
	/*function pintarFila(tag,id){
		
		//$('#'+tag+id).attr("class", "verdeSubtitulo");
		$('#'+tag+id).attr("class", "fondoPracticaSeleccion rounded-right");
	}

	function despintarFila(tag,id){

		//$('#'+tag+id).attr("class", "grisSubtitulo");
		$('#'+tag+id).attr("class", "fondoPractica rounded-right");		
	}*/

	function pintarFila(tag,id,clase){
				
		$('#'+tag+id).attr("class", clase);
	}	
	
	function clickCheckFila(ind){
		if(!$('#checkPractica'+ind).is(':disabled')){		
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
	}	
	
	function clickCheck(ind){

		if($('#checkPractica'+ind).is(':checked')){
			$('#trPractica'+ind).addClass("verdeClaroSubtituloCenterListaPracticas");
			$('#hiddenPractica'+ind).val($('#checkPractica'+ind).val());	
		}
		else{
			$('#trPractica'+ind).removeClass("verdeClaroSubtituloCenterListaPracticas");
			$('#hiddenPractica'+ind).val(0);
		}
	}
	
	function pintarPractica(ind){
		
		$('#trPractica'+ind).addClass("verdeClaroSubtituloCenterListaPracticas");
	}	

	function despintarPractica(ind){
		if(!$('#checkPractica'+ind).is(':checked')){
			$('#trPractica'+ind).removeClass("verdeClaroSubtituloCenterListaPracticas");
		}	
	}	
	
</script>

<html:form action="estudio" styleId="estudioFormId">
	<html:hidden property="metodo" value="eliminarPracticasParaFacturacion"/>
	<input type="hidden" value="${estudio.id}" id="idEstudio" name="estudioDTO.id"/>
	
	<%-- 
	<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2" cellspacing="0">
		<tr>
			<td colspan="4"  class="azulAjustado" >Eliminar Practicas de Estudio para Facturacion</td>
		</tr>
		<tr>
			<td height="20" colspan="4"></td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="12%" >N�mero</td>
			<td align="left" width="30%">			
				<input type="text" value="${estudio.numero}" class="botonerab" size="10" readonly="readonly"/>
			</td>
			
			<td class="botoneralNegritaRight" width="30%" >Paciente</td>
			<td align="left">			
				<input type="text" value="${estudio.paciente.apellido}, ${estudio.paciente.nombre}" class="botonerab" size="30" readonly="readonly"/>
			</td>			
		</tr>	
		
		<tr>
			<td class="botoneralNegritaRight" width="12%" >Solicitado Por</td>
			<td align="left" width="30%">			
				<input type="text" value="${estudio.medico.descripcion}" class="botonerab" size="30" readonly="readonly"/>
			</td>	
			
			<td class="botoneralNegritaRight" width="30%" >Fecha</td>
			<td align="left">			
				<input id="datepicker" type="text" readonly="readonly" class="botonerab" 
					value="<fmt:formatDate	value='${estudio.fecha}' pattern='dd/MM/yyyy' />">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>				
			</td>				
		</tr>
		
		<tr>
			<td colspan="2"></td>
			<td class="botoneralNegritaRight" width="30%" >Unidades de Facturaci�n</td>
			<td align="left">			
				<input type="text" value="${estudio.unidadesFacturacionTotal}" class="botonerab" size="10" readonly="readonly"/>
			</td>		
		</tr>
					
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
	</table>
	
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2" cellspacing="0"> 
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
	
	--%>
	
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="85%" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<div class="well-sm-bootstrap well-bootstrap">				
					<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2" cellspacing="1">			
						<tr>
							<td colspan="6" class="tituloTablaBoots">	
								Eliminar Practicas de Estudio para Facturacion
							</td>
						</tr>
						<tr>
							<td height="20" colspan="6"></td>
						</tr>				
						<tr>
							<td width="10%" align="right" class="labelForm">N�mero</td>
							<td width="25%">			
								<input type="text" value="${estudio.numero}" class="form-control form-control-sm" size="10" readonly="readonly"/>
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
								<input id="datepicker" type="text" class="form-control form-control-sm"  readonly="readonly" value="<fmt:formatDate	value='${estudio.fecha}' pattern='dd/MM/yyyy' />">											
							</td>
							<td width="5%" align="left">
								<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
							</td>				
						</tr>
						
						<tr>
							<td colspan="3"></td>
							<td width="15%" align="right" class="labelForm">Unidades de Facturaci�n</td>
							<td width="20%">			
								<input type="text" value="${estudio.unidadesFacturacionTotal}" class="form-control form-control-sm" size="10" readonly="readonly"/>
							</td>	
							<td width="5%"></td>	
						</tr>
									
						<tr>
							<td height="20" colspan="6"></td>
						</tr>
					</table>
				<%-- </div>	
			</td>
		</tr>									
	</table>
	
	
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="85%" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<div class="well-sm-bootstrap well-bootstrap">--%>	
				
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
									
									${grupo.nombre}-(${grupo.unidadBioquimica})														
								</td>							
							</tr>
							
							<tr style="display: none" id="trGrupo<c:out value='${iGrupo.index}'></c:out>">
				
								<td colspan="2">
									<table border="0" class="cuadradoListaPracticas" align="left" width="100%" cellpadding="2" >
							
										<c:if test="${fn:length(grupo.valoresPracticas) > 0}">
											<tr>
												<td height="10" colspan="2"></td>							
											</tr>							
										</c:if>
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
													class="trG<c:out value='${iGrupo.index}'></c:out>"
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
												<td height="10" colspan="2">
												</td>							
											</tr>												
											<tr>
												<td width="5%">
												</td>
												<%-- <td class="negritaLeft">--%>
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
																class="trG<c:out value='${iGrupo.index}'></c:out>"
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
			<td width="40%"></td>
			<td width="10%">
				<input type="submit" class="btn btn-primary btn-block" value="Aceptar" id="enviar">
			</td>	
			<td width="10%">	
				<input type="button" class="btn btn-primary btn-block" value="Volver" id="enviar" onclick="javascript:volver();">														
			</td>
			<td width="40%"></td>
		</tr>
		<tr>
			<td height="15" colspan="4"></td>
		</tr>										
	</table>
</html:form>