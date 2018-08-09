<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>

<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/PacienteFachada.js'/>"></script>

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

<script type="text/javascript">

	function volver(){

		parent.location=contextRoot() + "/estudio.do?metodo=cargarRecuperarEstudios&forward=recuperarEstudioAgregarPracticas";
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

	function clickCheckFila(ind){
		
		if(!$('#checkPractica'+ind).is(':checked')){
			//$('#checkPractica'+ind).attr('checked','checked');
			$('#checkPractica'+ind).prop('checked', true);
		}
		else{
			//$('#checkPractica'+ind).removeAttr('checked');			
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
	
	function seleccionarTodos(nroGrupo){

		$('.checkG'+nroGrupo).prop('checked',true);
		//$('.checkG'+nroGrupo).attr('checked','checked');
		//$('.trG'+nroGrupo).addClass("verdeClaroSubtituloCenter");

		$('.grupo'+nroGrupo).each(
			function(){
				clickCheck($(this).val());
			}
		);	
	}

	function desSeleccionarTodos(nroGrupo){

		$('.checkG'+nroGrupo).prop('checked',false);
		//$('.checkG'+nroGrupo).removeAttr('checked');
		//$('.trG'+nroGrupo).removeClass("verdeClaroSubtituloCenter");

		$('.grupo'+nroGrupo).each(
			function(){
				clickCheck($(this).val());
			}
		);		
	}

	function seleccionarTodosSubItem(nroGrupo,nroSubItem){

		$('.checkSI'+nroGrupo+"-"+nroSubItem).prop('checked',true);
		//$('.checkSI'+nroGrupo+"-"+nroSubItem).attr('checked','checked');		

		$('.subItem'+nroGrupo+"-"+nroSubItem).each(
			function(){
				clickCheck($(this).val());
			}
		);	
	}

	function desSeleccionarTodosSubItem(nroGrupo,nroSubItem){

		$('.checkSI'+nroGrupo+"-"+nroSubItem).prop('checked',false);
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

<html:form action="estudio">
	<html:hidden property="metodo" value="agregarPracticasAEstudio"/>
	<html:hidden property="estudioDTO.id" value="${estudio.id}"/>

	<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2" cellspacing="0">
		<tr>
			<td colspan="4"  class="azulAjustado" >Agregar Practicas a Estudio</td>
		</tr>
		<tr>
			<td height="20" colspan="4"></td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="12%" >Número</td>
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
				<input type="text" readonly="readonly" class="botonerab" 
					value="<fmt:formatDate	value='${estudio.fecha}' pattern='dd/MM/yyyy' />">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>				
			</td>				
		</tr>
		
		<tr>
			<td colspan="2"></td>
			<td class="botoneralNegritaRight" width="30%" >Unidades de Facturación</td>
			<td align="left">			
				<input type="text" value="${estudio.unidadesFacturacionTotal}" class="botonerab" size="10" readonly="readonly"/>
			</td>		
		</tr>		
					
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
	</table>
	
	<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2" cellspacing="2">
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
							
								<c:choose>
									<c:when test="${map[practica.id]!=null}">
									
										<tr class="verdeClaroSubtituloCenter">
											<td width="5%">
												<input type="checkbox" checked='checked' disabled="disabled">
											</td>
											<td align="left" width="65%">
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
									</c:when>
									<c:otherwise>
										<tr id="trPractica<%=i%>" class="trG<c:out value='${iGrupo.index}'></c:out>">
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
									</c:otherwise>
								</c:choose>	
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
										
											<c:choose>
												<c:when test="${map[prac.id]!=null}">																					
													<tr class="verdeClaroSubtituloCenter">											
														<td width="5%">	
															<input type="checkbox" checked='checked' disabled="disabled">												
														</td>														
														<td align="left" width="80%">
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
												</c:when>
												<c:otherwise>
													<tr id="trPractica<%=i%>" class="trG<c:out value='${iGrupo.index}'></c:out>">											
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
												</c:otherwise>
											</c:choose>										
																					
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
	
	<table border="0" class="cuadradoSinBorde" align="center" width="70%" cellpadding="2" cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>			
		<tr>
			<td align="center">				
				<input type="submit" class="botonerab" value="Aceptar" id="enviar">
				<input type="button" class="botonerab" value="Volver" id="enviar" onclick="javascript:volver();">
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>									
	</table>

</html:form>
