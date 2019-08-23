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

	/*function pintarFila(tag,id){
		
		//$('#'+tag+id).attr("class", "verdeSubtitulo");
		$('#'+tag+id).attr("class", "azulSubtitulo");
	}*/

	function despintarFila(tag,id){

		$('#'+tag+id).attr("class", "grisSubtitulo");
			
	}

	function pintarFila(tag,id,clase){
		
		$('#'+tag+id).attr("class", clase);
	}	
	
	function pintarPractica(ind){
		
		//$('#trPractica'+ind).addClass("verdeClaroSubtituloCenter");
		//$('#trPractica'+ind).addClass("azulClaroSubtituloCenter");
		$('#trPractica'+ind).addClass("verdeClaroSubtituloCenterListaPracticas");
	}	

	function despintarPractica(ind){
		if(!$('#checkPractica'+ind).is(':checked')){
			//$('#trPractica'+ind).removeClass("verdeClaroSubtituloCenter");
			//$('#trPractica'+ind).removeClass("azulClaroSubtituloCenter");
			$('#trPractica'+ind).removeClass("verdeClaroSubtituloCenterListaPracticas");
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
<br>

<c:if test="${exitoGrabado != null}">
	<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="85%" cellpadding="0" cellspacing="0" id="tablaExitoGrabado">
		<tr>
			<td>
				<div id="exitoGrabado" class="alert alert-success"><b>${exitoGrabado}</b></div>
			</td>
		</tr>
	</table>
</c:if>	

<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="85%" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<div id="errores" class="alert alert-danger" style="display: none"></div>
		</td>
	</tr>
</table>

<%--
<html:form action="estudioPreSeteado" styleId="estudioPreSeteadoFormId">
	<html:hidden property="metodo" value="altaEstudioPreSeteado"/>		
	
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="85%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">	
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2" cellspacing="0">
					<tr>
						<td colspan="2"  class="tituloTabla" >Alta de Estudio Pre Seteado</td>
					</tr>
					<tr>
						<td height="20" colspan="2"></td>
					</tr>				
					<tr>
						<td class="fontNegritaRightBootstrap" width="30%" >Nombre</td>
						<td align="left" width="70%">			
							<html:text property="nombre" value="" styleClass="botonerab" size="45"/>
						</td>
										
					</tr>	
															
					<tr>
						<td height="20" colspan="2"></td>
					</tr>
				</table>
				
				<table border="0" class="cuadrado" align="center" width="100%" cellpadding="2" cellspacing="2">
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
	
			</div>
		</td>
	</tr>
	</table>	
 --%>	
	
<html:form action="estudioPreSeteado" styleId="estudioPreSeteadoFormId">
	<html:hidden property="metodo" value="altaEstudioPreSeteado"/>		
	
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="85%" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">	
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2" cellspacing="0">
					<tr>
						<td colspan="3"  class="tituloTablaBoots" >Alta de Estudio Pre Seteado</td>
					</tr>
					<tr>
						<td height="20" colspan="3"></td>
					</tr>				
					<tr>
						<td width="35%" align="right" class="labelForm">Nombre</td>
						<td align="left">			
							<html:text property="nombre" value="" styleClass="form-control form-control-sm"/>
						</td>
						<td width="30%"></td>				
					</tr>	
															
					<tr>
						<td height="20" colspan="3"></td>
					</tr>
				</table>
				
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<td height="20"></td>
					</tr>
					<%int i=0; %>
					<c:forEach items="${gruposPracticas}" var="grupo" varStatus="iGrupo">
						
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
								<c:if test="${grupo.codigoFaba != null && grupo.codigoFaba != ''}">					
									- (${grupo.codigoFaba})
								</c:if>														
							</td>							
						</tr>						
						
						
						<tr style="display: none" id="trGrupo<c:out value='${iGrupo.index}'></c:out>">
							<td colspan="2">
								<table border="0" class="cuadradoListaPracticas" align="left" width="100%" cellpadding="2" >
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
											<%-- <td width="65%" class="negritaLeft">--%>
											<td width="65%" align="left">
												<b>${subItem.nombre}	
												<c:if test="${subItem.codigoFaba != null && subItem.codigoFaba != ''}">					
													- (${subItem.codigoFaba})										
												</c:if>	</b>
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
												<table border="0" class="cuadradoListaPracticas" align="left" width="100%" cellpadding="2" >
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
					<%-- <tr>
						<td height="20"></td>
					</tr>--%>		
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

