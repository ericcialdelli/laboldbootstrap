<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>


<!-- Nuevo Estilo -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
<link rel="stylesheet" href="<html:rewrite page='/css/jquery-ui_1_11_3.css'/>" type="text/css">
<!-- Nuevo Estilo -->

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>

<script>

	function abrirVentanaModificarParametro(clave){
					
		$('#claveForm').val(clave);
		$('#valorForm').val($('#val'+clave).val());
		$('#descripcionForm').val($('#desc'+clave).val());			
					
		$('#dialogo').dialog({title: '', height: 235, width: 800, modal: true, position: {my: "center", at: "center", of: window}});			
	}

	function cerrarVentanaModificarParametro(){

		//$('#textoError').hide();		
		$('#dialogo').dialog( "close" );
	}

	/*function modificarParametro(){
			
		var form = $('#pacienteFormId').serialize(); 
		var url = '../../paciente.do?metodo=validar&validador=validarPacienteForm&form=PacienteForm&formJsp=pacienteFormId';		
		$.post(url,form,validarPacienteFormCallBack);		
	}*/

	var clase;
	function pintarFila(idTr){
		
		clase = $('#'+idTr).attr("class");
		$('#'+idTr).removeClass(clase);
		//$('#'+idTr).addClass("verdeSeleccionFila");
		$('#'+idTr).addClass("verdeSeleccionFilaLista");
	}

	function despintarFila(idTr){
		
		$('#'+idTr).addClass(clase);
		//$('#'+idTr).removeClass("verdeSeleccionFila");
		$('#'+idTr).removeClass("verdeSeleccionFilaLista");
	}
	
</script>

<!-- Estilo Nuevo -->
<c:if test="${exitoGrabado != null}">
	<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="80%" cellpadding="0" cellspacing="0" id="tablaExitoGrabado">
		<tr>
			<td>
				<div id="exitoGrabado" class="alert alert-success"><b>${exitoGrabado}</b></div>
			</td>
		</tr>
	</table>
</c:if>	

	<!-- Nuevo Estilo -->  
	<%-- 
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="80%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td class="tituloTabla">
							Parametros
						</td>
					</tr>	
					<tr>
						<td height="20"></td>
					</tr>
					<tr>
						<td>
							<table border="0" class="cuadrado" align="center" width="85%" cellpadding="2">
								<tr>
									<td class="subTituloTabla">Clave</td>
									<td class="subTituloTabla">Valor</td>
									<td class="subTituloTabla">Descripcion</td>
									<td class="subTituloTabla"></td>
								</tr>
								<%String clase=""; %>
								<c:forEach items="${listaParametros}" var="parametro" varStatus="i">
									<%clase=(clase.equals("")?"par":""); %>
				
									<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${i.index}'></c:out>');"
										onmouseout="javascript:despintarFila('idTr<c:out value='${i.index}'></c:out>');"
										id="idTr<c:out value='${i.index}'></c:out>">					
														
										<td>${parametro.clave}</td>
										<td>${parametro.valor}</td>
										<td>${parametro.descripcion}</td>
										<td>
											<input type="hidden" value="${parametro.valor}" id="val${parametro.clave}">
											<input type="hidden" value="${parametro.descripcion}" id="desc${parametro.clave}">
											<a href="javascript:abrirVentanaModificarParametro(${parametro.clave});">
												Seleccionar
											</a>
										</td>
									</tr>
								</c:forEach>
							</table>
						</td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>	
				</table>
			</div>
		</td>
	</tr>
	</table>
	--%>

	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="80%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td class="tituloTablaBoots">
							Parametros
						</td>
					</tr>	
					<tr>
						<td height="20"></td>
					</tr>
					<tr>
						<td>
							<table border="0" class="cuadradoLista" align="center" width="85%" cellpadding="2">
								<tr>
									<td class="subTituloTabla rounded-left">Clave</td>
									<td class="subTituloTabla">Valor</td>
									<td class="subTituloTabla">Descripcion</td>
									<td class="subTituloTabla rounded-right"></td>
								</tr>
								<%String clase=""; %>
								<c:forEach items="${listaParametros}" var="parametro" varStatus="i">
									<%clase=(clase.equals("")?"par":""); %>
				
									<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${i.index}'></c:out>');"
										onmouseout="javascript:despintarFila('idTr<c:out value='${i.index}'></c:out>');"
										id="idTr<c:out value='${i.index}'></c:out>">					
										
										<%-- 				
										<td>${parametro.clave}</td>
										<td>${parametro.valor}</td>
										<td>${parametro.descripcion}</td>
										<td>
											<input type="hidden" value="${parametro.valor}" id="val${parametro.clave}">
											<input type="hidden" value="${parametro.descripcion}" id="desc${parametro.clave}">
											<a href="javascript:abrirVentanaModificarParametro(${parametro.clave});">
												Seleccionar
											</a>
										</td>
										--%>
										
										<c:if test="${parametro.clave != 3}">				
											<td>${parametro.clave}</td>
											<td>${parametro.valor}</td>
											<td>${parametro.descripcion}</td>
											<td>
												<input type="hidden" value="${parametro.valor}" id="val${parametro.clave}">
												<input type="hidden" value="${parametro.descripcion}" id="desc${parametro.clave}">
												<%-- 												
												<a href="javascript:abrirVentanaModificarParametro(${parametro.clave});">
													Seleccionar
												</a>
												--%>
												<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#exampleModalCenter" onclick="javascript:abrirVentanaModificarParametro(${parametro.clave});">
						  							Modificar
												</button>												
												
											</td>
										</c:if>											
										<c:if test="${parametro.clave == 3}">
										<html:form action="parametros" styleId="parametrosFormId">
										
											<html:hidden property="metodo" value="modificarParametros"/>
											<html:hidden property="parametro.clave" value="${parametro.clave}"/>
											<html:hidden property="parametro.descripcion" value="${parametro.descripcion}"/>
																					
											<td height="5">${parametro.clave}</td>
											
											<td>
												<html:select property="parametro.valor" value="${parametro.valor}" styleClass="custom-select custom-select-sm">
													<c:forEach items="${listaPeriodicidad}" var="p">
														<html:option value="${p.clave}"><c:out value="${p.valor}"></c:out></html:option>										
													</c:forEach>									
												</html:select>								
											</td>
											
											<td>${parametro.descripcion}</td>
											
											<td><input type="submit" class="btn btn-sm btn-primary" value="Asignar"></td>
										</html:form>							
										</c:if>										
																														
									</tr>
								</c:forEach>
							</table>
						</td>
					</tr>
					<tr>
						<td height="10">
						</td>
					</tr>	
				</table>
			</div>
		</td>
	</tr>
	</table>

<%-- 
<div id="dialogo" style="display: none" >	
		
	<html:form action="parametros" styleId="parametrosFormId">
		<html:hidden property="metodo" value="modificarParametros"/>
	
		<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
			<tr>
				<td height="20" colspan="2"></td>
			</tr>				
			<tr>
				<td class="botoneralNegritaRight" width="20%">Clave</td>
				<td align="left">
					<html:text property="parametro.clave" value="" styleClass="botonerabGrande" styleId="claveForm" size="80" readonly="true"/>
				</td>
			</tr>	
			<tr>
				<td class="botoneralNegritaRight" width="20%">Valor</td>
				<td  align="left">
					<html:text property="parametro.valor" value="" styleClass="botonerabGrande" styleId="valorForm" size="80"/>			
				</td>
			</tr>
			<tr>
				<td class="botoneralNegritaRight" width="20%">Descripcion</td>
				<td  align="left">
					<html:text property="parametro.descripcion" value="" styleClass="botonerabGrande" styleId="descripcionForm" size="80"/>			
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
				<td width="48%" class="botonerab" align="right">
					<input type="submit" class="botonerab" value="Modificar">
				</td>				
				<td width="4%"></td>			
				<td width="48%" class="botonerab" align="left">
					<input type="button" class="botonerab" value="Cancelar" onclick="javascript:cerrarVentanaModificarParametro();">
				</td>							
			</tr>
			<tr>
				<td height="10" colspan="3"></td>
			</tr>		
		</table>
	</html:form>	
</div>
--%>


<div id="exampleModalCenter" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" style="display: none;" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
    <html:form action="parametros" styleId="parametrosFormId">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Modificacion de Parametro</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        
        
			<html:hidden property="metodo" value="modificarParametros"/>
			<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2" cellspacing="0">
				<tr>
					<td height="20" colspan="3"></td>
				</tr>				
				<tr>
					<td class="labelForm" width="20%" align="right">Clave</td>
					<td align="left">
						<html:text property="parametro.clave" value="" styleClass="form-control form-control-sm" styleId="claveForm" size="80" readonly="true"/>
					</td>
					<td width="10%"></td>
				</tr>	
				<tr>
					<td class="labelForm" width="20%" align="right">Valor</td>
					<td  align="left">
						<html:text property="parametro.valor" value="" styleClass="form-control form-control-sm" styleId="valorForm" size="80"/>			
					</td>
					<td width="10%"></td>
				</tr>
				<tr>
					<td class="labelForm" width="20%" align="right">Descripcion</td>
					<td  align="left">
						<html:text property="parametro.descripcion" value="" styleClass="form-control form-control-sm" styleId="descripcionForm" size="80"/>			
					</td>
					<td width="10%"></td>
				</tr>				
				<tr>
					<td height="20" colspan="3"></td>
				</tr>					
			</table>        
        
        
      </div>
      <div class="modal-footer">        
        <button type="submit" class="btn btn-primary">Modificar</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
      </div>
      </html:form>
    </div>
  </div>
</div>











