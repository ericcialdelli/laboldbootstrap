<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>

<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

<script type="text/javascript">

	$(function() {
		$( "#datepicker" ).datepicker({ dateFormat: 'dd/mm/yy'});		
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

	function clickCheck(grupo, practica){

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
	}

	function seleccionarTodos(nroGrupo){

		$('.checkG'+nroGrupo).attr('checked','checked');
		$('.trG'+nroGrupo).addClass("verdeClaroSubtituloCenter");
			
	}

	function desSeleccionarTodos(nroGrupo){

		$('.checkG'+nroGrupo).removeAttr('checked');
		$('.trG'+nroGrupo).removeClass("verdeClaroSubtituloCenter");
	}
	
</script>

<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="estudio" styleId="estudioFormId">
	<html:hidden property="metodo" value="altaEstudio"/>

	<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2" cellspacing="0">
		<tr>
			<td colspan="4"  class="azulAjustado" >Alta de Estudio</td>
		</tr>
		<tr>
			<td height="20" colspan="4"></td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="12%" >Número</td>
			<td align="left" width="30%">			
				<html:text property="estudioDTO.numero" value="${nroEstudio}" styleClass="botonerab" size="10"  
					onkeypress="javascript:esNumerico(event);" readonly="readonly"/>
			</td>
			
			<td class="botoneralNegritaRight" width="30%" >Paciente</td>
			<td align="left">			
				<select id="obraSocial" class="botonerab" name="estudioDTO.paciente.id">
					<option value="-1">
						Seleccione un paciente...
					</option>		
					<c:forEach items="${pacientes}" var="p">
						<option value="${p.id}">
							<c:out value="${p.apellido}"></c:out>, <c:out value="${p.nombre}"></c:out>
						</option>
					</c:forEach>										
				</select>
			</td>			
		</tr>	
		
		<tr>
			<td class="botoneralNegritaRight" width="12%" >Solicitado Por</td>
			<td align="left" width="30%">			
				<html:text property="estudioDTO.solicitadoPor" value="" styleClass="botonerab" size="40"/>
			</td>
			
			<td class="botoneralNegritaRight" width="30%" >Fecha</td>
			<td align="left">			
				<input id="datepicker" type="text" name="estudioDTO.fecha" readonly="readonly" class="botonerab">
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>				
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
						<tr>
							<td height="5" colspan="2" align="right">
								<a href="javascript:seleccionarTodos(<c:out value='${iGrupo.index}'></c:out>)">Seleccionar Todos</a>
								/
								<a href="javascript:desSeleccionarTodos(<c:out value='${iGrupo.index}'></c:out>)">Deseleccionar Todos</a>
							</td>
						</tr>				
						<c:forEach items="${grupo.practicas}" var="practica" varStatus="iPractica">
							<c:if test="${practica.subItemPractica == null}">
								<tr id="trG<c:out value='${iGrupo.index}'></c:out>P<c:out value='${iPractica.index}'></c:out>"
									class="trG<c:out value='${iGrupo.index}'></c:out>">
									<td width="5%">
										<input type="hidden" name="listaPracticas[<%=i%>].id" 
											id="hiddenG<c:out value='${iGrupo.index}'></c:out>P<c:out value='${iPractica.index}'></c:out>">
										<input type="checkbox" class="checkG<c:out value='${iGrupo.index}'></c:out>"
											onchange="clickCheck(<c:out value='${iGrupo.index}'></c:out>,<c:out value='${iPractica.index}'></c:out>)" 
											id="checkG<c:out value='${iGrupo.index}'></c:out>P<c:out value='${iPractica.index}'></c:out>"
											value="${practica.id}">
									</td>
									<td align="left" width="95%">
										${practica.nombre}
									</td>				
								</tr>	
								<%i++; %>	
							</c:if>											
						</c:forEach>
						
						<c:forEach items="${grupo.subItemsPractica}" var="subItem" varStatus="iSubItem">
							<tr>
								<td width="5%">
								</td>
								<td width="95%" class="negritaLeft">
									${subItem.nombre}								
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
										<c:forEach items="${subItem.practicas}" var="prac" varStatus="iPrac">											
											<tr id="trG<c:out value='${iGrupo.index}'></c:out>S<c:out value='${iSubItem.index}'></c:out>P<c:out value='${iPrac.index}'></c:out>"
												class="trG<c:out value='${iGrupo.index}'></c:out>">											
												<td width="5%">		
												
													<input type="hidden" name="listaPracticas[<%=i%>].id" 
														id="hiddenG<c:out value='${iGrupo.index}'></c:out>S<c:out value='${iSubItem.index}'></c:out>P<c:out value='${iPrac.index}'></c:out>">												
																							
													<input type="checkbox" class="checkG<c:out value='${iGrupo.index}'></c:out>"
														onchange="clickCheckPracticaSubItem(<c:out value='${iGrupo.index}'></c:out>,<c:out value='${iSubItem.index}'></c:out>,<c:out value='${iPrac.index}'></c:out>)" 
														id="checkG<c:out value='${iGrupo.index}'></c:out>S<c:out value='${iSubItem.index}'></c:out>P<c:out value='${iPrac.index}'></c:out>"
														value="${prac.id}">													
												</td>														
												<td align="left" width="95%">
													${prac.nombre}
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
	
	<table border="0" class="cuadradoSinBorde" align="center" width="70%" cellpadding="2" cellspacing="0">
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
<script type="text/javascript">

	//$('#nombre').focus();

</script>