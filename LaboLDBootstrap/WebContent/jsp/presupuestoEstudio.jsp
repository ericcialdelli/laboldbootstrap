<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>

<!-- <script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>" type="text/css">-->

<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>

<link rel="stylesheet" href="<html:rewrite page='/css/jquery-ui_1_11_3.css'/>" type="text/css">

<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/PacienteFachada.js'/>"></script>

<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/MedicoFachada.js'/>"></script>

<script type="text/javascript">

	var listaPracticas = [];
	indexLP = 0;

	var cantUnidadesBioq = 0;
	
	function submitir(){
		$('#errores').text("");
		calcularPresupuestoEstudio("estudioFormId","../estudio","calcularPresupuestoEstudio","EstudioForm");
	}

	function calcularPresupuestoEstudio(idFormJsp,action,metodo,actionForm){
		var form = $('#'+idFormJsp).serialize(); 
		var url = '../' + action + '.do?metodo=validar&validador=' + metodo + '&form=' + actionForm + '&formJsp=' + idFormJsp;
		$.post(url,form,calcularPresupuestoEstudioCallBack);
	}

	function calcularPresupuestoEstudioCallBack(xmlDoc){
		var error = xmlDoc.getElementsByTagName('error');
		if (error.length==0){
	   		var nodos = xmlDoc.getElementsByTagName('unidades');
	   		var valor = xmlDoc.getElementsByTagName('valor');
	   		//alert("Unidades Bioquimicas: "+nodos[0].firstChild.nodeValue+"\n" + "Valor: $"+valor[0].firstChild.nodeValue);

	   		$('#idUB').html("&nbsp;&nbsp;&nbsp;&nbsp;"+nodos[0].firstChild.nodeValue);
	   		$('#idValor').html("&nbsp;&nbsp;&nbsp;$"+valor[0].firstChild.nodeValue);
	   		$('#idValorEstudio').val(valor[0].firstChild.nodeValue);
	   		$('#dialogoValor').dialog({title: 'Valor Presupuesto Estudio', height: 200, width: 380, modal: true});
		}
		else{	    	
		    for(var i=0; i < error.length; i++) { 
			    $('#errores').append( '<div>* ' + error[i].firstChild.nodeValue + '</div>');
		    }			
		}	
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

	function buscar(){
		var texto = $('#textoABuscar').val();
		var noEncontrado = true;
		
		for(i=0;i<indexLP;i++){
			var matches = listaPracticas[i].nombre.indexOf(texto) >= 0 ? true : false;
			if (matches) {
				alert("Grupo: "+listaPracticas[i].grupo+"\n"+"Práctica: "+listaPracticas[i].nombre);
				noEncontrado = false; 
			}						
		}
		if(noEncontrado){
			alert("No se ha encontrado la práctica");
		}
	}
	
	function cerrarVentanaValor(){
		
		$('#dialogoValor').dialog( "close" );
	}

	function generarReporte(){
		
		$('#estudioFormId').submit();			
	}	
	
</script>

<div id="errores" class="rojoAdvertencia"><br>${error}<br></div>

<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">
<tr><td>
<div class="well well-sm">

<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="100%" cellpadding="2" cellspacing="0">
	<tr>
		<td height="10"></td>
	</tr>			
	<tr>
		<td align="center">
			<b>Práctica:</b>
			<input type="text" class="botonerab" id="textoABuscar">				
			<input type="button" class="botonerab" value="Buscar" onclick="javascript:buscar();">
		</td>
	</tr>
	<tr>
		<td height="10"></td>
	</tr>									
</table>

<%-- <html:form action="estudio" styleId="estudioFormId">
	<html:hidden property="metodo" value="altaEstudio"/> --%>
	
<html:form action="estudio" styleId="estudioFormId" target="_blank">
	<html:hidden property="metodo" value="generarReportePresupuestoEstudio"/>	
	<input type="hidden" name="valorEstudio" id="idValorEstudio">
	
	<table border="0" class="cuadrado" align="center" width="85%" cellpadding="2" cellspacing="2">
		<tr>
			<td class="azulAjustado" >Presupuesto de Estudio</td>
		</tr>	
		<tr>
			<td height="20"></td>
		</tr>
		<%int i=0; %>
		<c:forEach items="${gruposPracticas}" var="grupo" varStatus="iGrupo">
			<tr onclick="expandirGrupo(<c:out value='${iGrupo.index}'></c:out>)" class="grisSubtitulo"
					id="grupo<c:out value='${iGrupo.index}'></c:out>" 							
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
				
				
<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2" cellspacing="0">
<tr><td>
<div class="well-sm-bootstrap well-bootstrap">				
				
				
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
							
							<script type="text/javascript">

								var practica = {
									    nombre:"${practica.nombre}",
									    grupo:"${grupo.nombre}"
									};								
							
								//listaPracticas[indexLP] = "${practica.nombre}";
								listaPracticas[indexLP] = practica;
								indexLP++;
							</script>
																	
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
					
			
</div>
</td></tr>
</table>			
					
						
				</td>
			</tr>					
		</c:forEach>		
		<tr>
			<td height="20"></td>
		</tr>		
	</table>		
	
	<div id="dialogoValor" style="display: none" >
		<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
			<tr>
				<td height="20" colspan="2"></td>
			</tr>				
			<tr>
				<td class="botoneralNegritaRight" width="55%">Unidades Bioquimicas:</td>
				<td align="left" class="botoneralNegritaLeftGrande" id="idUB"></td>
			</tr>	
			<tr>
				<td class="botoneralNegritaRight" width="55%">Valor:</td>
				<td  align="left" class="botoneralNegritaLeftGrande" id="idValor"></td>
			</tr>				
			<tr>
				<td height="20" colspan="2">								
				</td>
			</tr>					
		</table>					
		<table border="0" class="cuadradoSinBorde" align="center" width="80%" cellpadding="2">
			<tr>
				<td height="10" colspan="3"></td>
			</tr>	
			<tr>
				<td width="48%" class="botonerab" align="right">
				  	<!--  <button type="button" class="btn btn-primary" onclick="javascript:generarReporte();">Generar Informe</button>-->
					<input type="button" class="botonerab" value="Generar Informe" onclick="javascript:generarReporte();">				
				</td>		
				<td width="4%"></td>			
				<td width="48%" class="botonerab" align="left">
					<!--  <button type="button" class="btn btn-primary" onclick="javascript:cerrarVentanaValor();">Salir</button>-->
					<input type="button" class="botonerab" value="Salir" onclick="javascript:cerrarVentanaValor();">
				</td>							
			</tr>
			<tr>
				<td height="10" colspan="3"></td>
			</tr>		
		</table>	
	</div>	
	
	<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>			
		<tr>
			<td align="center">
				<!-- Nuevo Estilo -->
				<!--  <button type="button" class="btn btn-primary-bootstrap btn-sm" onclick="javascript:submitir();">Aceptar</button>-->				
				
				<input type="button" class="botonerab" value="Aceptar" id="enviar" onclick="javascript:submitir();">
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>									
	</table>
</html:form>
