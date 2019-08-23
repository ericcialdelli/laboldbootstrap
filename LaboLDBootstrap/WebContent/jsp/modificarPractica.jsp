<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/dwr/interface/PracticaFachada.js'/>"></script>

<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">

<script type="text/javascript">

	function submitir(){
		validarForm("practicaFormId","../practica","validarPracticaForm","PracticaForm");
	}

	function volver(){
		var idGrupo = $("#idGrupo").val();
		parent.location=contextRoot() + "/practica.do?metodo=cargarModificacionPractica&idGrupo="+idGrupo;
	}	

	function cambiarValores(){

		var valor = $('input[name=valores]:checked').val();
		$('#idCheckValor').val(valor);
		
		if(valor=="DH"){
			$('#trValorDesdeHasta').show();
			$('#trValorReferencia').hide();
			$('#trTextArea').hide();
			
			$('.refe').val(null);
			$('#idTextArea').val(null);			
		}
		if(valor=="Ref"){
			$('#trValorDesdeHasta').hide();
			$('#trValorReferencia').show();
			$('#trTextArea').hide();
			
			$('.DH').val(null);
			$('#idTextArea').val(null);
			$('#idMayorMenor').val(">");
			$('#radioMayor').prop('checked',true);
			$('#radioMenor').prop('checked',false);			
			//$('#radioMayor').attr('checked','checked');
			//$('#radioMenor').removeAttr('checked');
		}
		if(valor=="SV"){
			$('#trValorDesdeHasta').hide();
			$('#trValorReferencia').hide();
			$('#trTextArea').hide();
			
			$('.DH').val(null);
			$('.refe').val(null);
			$('#idTextArea').val(null);
		}	
		if(valor=="Libre"){
			$('#trValorDesdeHasta').hide();
			$('#trValorReferencia').hide();
			$('#trTextArea').show();			
			
			$('.DH').val(null);
			$('.refe').val(null);
		}					
	}

	function cambiarMayorMenor(){

		var valor = $('input[name=referencia]:checked').val();
		valor = (valor=='menor')?'<':'>';
		$('#idMayorMenor').val(valor);
	}
	
	function cambioGrupo(){

		var idGrupo = $('#selectGrupoPractica').val();
		if (idGrupo != "-1") {
			$('#selectSubItemPractica').attr('disabled', false);
			
			PracticaFachada.getSubItemsPorGrupoPractica(idGrupo,
					cambioGrupoCallback);
		} else {
			dwr.util.removeAllOptions("selectSubItemPractica");
			var data = [ 
						 {
							nombre : "Sin SubItem",
							id : 0
						 }						  
			 		   ];
			dwr.util.addOptions("selectSubItemPractica", data, "id", "nombre");
			$('#selectSubItemPractica').attr('disabled', true);
		}
	}

	function cambioGrupoCallback(subItems){

		dwr.util.removeAllOptions("selectSubItemPractica");
		var data = [ 
		 {
			nombre : "Sin SubItem",
			id : 0
		 }						  
		   ];
		dwr.util.addOptions("selectSubItemPractica", data, "id", "nombre");
		dwr.util.addOptions("selectSubItemPractica", subItems, "id", "nombre");		
	}			
	
</script>

<!--<div id="errores" class="rojoAdvertencia">${error}</div>--> <!-- Estilo Viejo -->

<!-- Estilo Nuevo -->
	<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="60%" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<div id="errores" class="alert alert-danger" style="display: none"></div>
			</td>
		</tr>
	</table>	
<!-- Estilo Nuevo -->

<html:form action="practica" styleId="practicaFormId">
	<html:hidden property="metodo" value="modificacionPractica"/>
	<html:hidden property="practicaDTO.id" value="${practica.id}"/>
	<html:hidden styleId="idGrupo" property="" value="${practica.grupoPractica.id}"/>
	<%-- <html:hidden styleId="idGrupo" property="practicaDTO.grupoPracticaDTO.id" value="${practica.grupoPractica.id}"/>
	
	<c:choose>
		<c:when test="${practica.subItemPractica != null}">
			<html:hidden property="practicaDTO.subItemPracticaDTO.id" value="${practica.subItemPractica.id}"/>
		</c:when>
		<c:otherwise>
			<html:hidden property="practicaDTO.subItemPracticaDTO.id" value="0"/>
		</c:otherwise>		
	</c:choose>--%>
	
	
	<!-- Nuevo Estilo -->  
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="60%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="3" class="tituloTablaBoots">
							Modificación de Práctica
						</td>
					</tr>
					<tr>
						<td height="20" colspan="3"></td>
					</tr>
					<tr>
						<td align="right" class="labelForm" width="35%">Grupo Practica</td>
						<td align="left">
							<html:select styleId="selectGrupoPractica" styleClass="custom-select custom-select-sm" property="practicaDTO.grupoPracticaDTO.id" onchange="cambioGrupo();"
								value="${practica.grupoPractica.id}">		
								<c:forEach items="${listaGrupos}" var="grupo">
									<html:option value="${grupo.id}">
										<c:out value="${grupo.nombre}"></c:out>
									</html:option>
								</c:forEach>										
							</html:select>
						</td>
						<td width="30%"></td>
					</tr>					
					<tr>
						<td align="right" class="labelForm" width="35%">SubItem</td>
						<td align="left">
							<html:select property="practicaDTO.subItemPracticaDTO.id" value="${practica.subItemPractica.id}" styleClass="custom-select custom-select-sm" styleId="selectSubItemPractica">
								<html:option value="0">Sin SubItem</html:option>				
								<c:forEach items="${practica.grupoPractica.subItemsPractica}" var="s">
									<html:option value="${s.id}"><c:out value="${s.nombre}"></c:out></html:option>										
								</c:forEach>									
							</html:select>
						</td>
					</tr>								
					<tr>
						<td align="right" class="labelForm" width="35%">Nombre</td>
						<td align="left">
							<html:text property="practicaDTO.nombre" value="${practica.nombre}" styleClass="form-control form-control-sm" styleId="nombre" size="40"/>
						</td>
						<td width="30%"></td>
					</tr>
					<tr>
						<td align="right" class="labelForm" width="35%">Orden</td>
						<td align="left">
							<html:text property="practicaDTO.orden" value="${practica.orden}" styleClass="form-control form-control-sm" styleId="nombre" onkeypress="javascript:esNumerico(event);"/>
						</td>
						<td width="30%"></td>
					</tr>		
					<tr>
						<td align="right" class="labelForm" width="35%">Unidad</td>
						<td align="left">
							<html:text property="practicaDTO.unidad" value="${practica.unidad}" styleClass="form-control form-control-sm" styleId="nombre"/>
						</td>
						<td width="30%"></td>
					</tr>
					<tr>
						<td align="right" class="labelForm" width="35%">Metodo</td>
						<td align="left">
							<html:text property="practicaDTO.metodo" value="${practica.metodo}" styleClass="form-control form-control-sm" styleId="nombre"/>
						</td>
						<td width="30%"></td>
					</tr>
					<tr>
						<td align="right" class="labelForm" width="35%">Unidad Bioquimica</td>
						<td align="left">
							<html:text property="practicaDTO.unidadBioquimica" value="${practica.unidadBioquimica}" styleClass="form-control form-control-sm" styleId="nombre" onkeypress="return validarNumeroConDecimal(event, this)"/>
						</td>
						<td width="30%"></td>
					</tr>
					<tr>
						<td align="right" class="labelForm" width="35%">Código Faba</td>
						<td align="left">
							<html:text property="practicaDTO.codigoFaba" value="${practica.codigoFaba}" styleClass="form-control form-control-sm" styleId="nombre"/>
						</td>
						<td width="30%"></td>
					</tr>
					<tr>
						<td colspan="3" height="20"></td>
					</tr>													
					<tr>
						<td colspan="3">
							<input type="hidden" name="checkValor" value="SV" id="idCheckValor">
							<c:choose>
								<c:when test="${practica.valorReferencia != null}">
								
									<%--
									<input type="radio" name="valores" onchange="cambiarValores();" value="SV">Sin Valor
									<input type="radio" name="valores" onchange="cambiarValores();" value="DH">Valores Desde/Hasta
									<input type="radio" name="valores" onchange="cambiarValores();" value="Ref" checked="checked">Valor Referencia
									<input type="radio" name="valores" onchange="cambiarValores();" value="Libre">Valor Referencia Libre
									--%>
									
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio1" onchange="cambiarValores();" value="SV">
									  <label class="form-check-label" for="inlineRadio1">Sin Valor</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio2" onchange="cambiarValores();" value="DH">
									  <label class="form-check-label" for="inlineRadio2">Valores Desde/Hasta</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio3" onchange="cambiarValores();" value="Ref" checked="checked">
									  <label class="form-check-label" for="inlineRadio3">Valor Referencia</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio4" onchange="cambiarValores();" value="Libre">
									  <label class="form-check-label" for="inlineRadio4">Valor Referencia Libre</label>
									</div>									
									
									<script type="text/javascript">
										var tr = "trValorReferencia"
									</script>
								</c:when>
								<c:when test="${practica.valorNormalDesde != null}">
								
									<%-- 
									<input type="radio" name="valores" onchange="cambiarValores();" value="SV">Sin Valor
									<input type="radio" name="valores" onchange="cambiarValores();" value="DH" checked="checked">Valores Desde/Hasta
									<input type="radio" name="valores" onchange="cambiarValores();" value="Ref">Valor Referencia
									<input type="radio" name="valores" onchange="cambiarValores();" value="Libre">Valor Referencia Libre
									--%>
									
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio1" onchange="cambiarValores();" value="SV">
									  <label class="form-check-label" for="inlineRadio1">Sin Valor</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio2" onchange="cambiarValores();" value="DH" checked="checked">
									  <label class="form-check-label" for="inlineRadio2">Valores Desde/Hasta</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio3" onchange="cambiarValores();" value="Ref">
									  <label class="form-check-label" for="inlineRadio3">Valor Referencia</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio4" onchange="cambiarValores();" value="Libre">
									  <label class="form-check-label" for="inlineRadio4">Valor Referencia Libre</label>
									</div>									
									
									<script type="text/javascript">
										var tr = "trValorDesdeHasta";
									</script>						
								</c:when>
								<c:when test="${practica.valorRefLibre != null}">
								
									<%-- 
									<input type="radio" name="valores" onchange="cambiarValores();" value="SV">Sin Valor
									<input type="radio" name="valores" onchange="cambiarValores();" value="DH">Valores Desde/Hasta
									<input type="radio" name="valores" onchange="cambiarValores();" value="Ref">Valor Referencia
									<input type="radio" name="valores" onchange="cambiarValores();" value="Libre" checked="checked">Valor Referencia Libre
									--%>
									
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio1" onchange="cambiarValores();" value="SV">
									  <label class="form-check-label" for="inlineRadio1">Sin Valor</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio2" onchange="cambiarValores();" value="DH">
									  <label class="form-check-label" for="inlineRadio2">Valores Desde/Hasta</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio3" onchange="cambiarValores();" value="Ref">
									  <label class="form-check-label" for="inlineRadio3">Valor Referencia</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio4" onchange="cambiarValores();" value="Libre" checked="checked">
									  <label class="form-check-label" for="inlineRadio4">Valor Referencia Libre</label>
									</div>									
									
									<script type="text/javascript">
										var tr = "trTextArea";
									</script>						
								</c:when>					
								<c:otherwise>
									<%-- 
									<input type="radio" name="valores" onchange="cambiarValores();" value="SV" checked="checked">Sin Valor
									<input type="radio" name="valores" onchange="cambiarValores();" value="DH">Valores Desde/Hasta
									<input type="radio" name="valores" onchange="cambiarValores();" value="Ref">Valor Referencia
									<input type="radio" name="valores" onchange="cambiarValores();" value="Libre">Valor Referencia Libre
									--%>
									
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio1" onchange="cambiarValores();" value="SV" checked="checked">
									  <label class="form-check-label" for="inlineRadio1">Sin Valor</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio2" onchange="cambiarValores();" value="DH">
									  <label class="form-check-label" for="inlineRadio2">Valores Desde/Hasta</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio3" onchange="cambiarValores();" value="Ref">
									  <label class="form-check-label" for="inlineRadio3">Valor Referencia</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="valores" id="inlineRadio4" onchange="cambiarValores();" value="Libre">
									  <label class="form-check-label" for="inlineRadio4">Valor Referencia Libre</label>
									</div>										
									
									<script type="text/javascript">
										var tr = "";
									</script>					
								</c:otherwise>						
							</c:choose>		
						</td>
					</tr>	
					<tr>
						<td colspan="3" height="10"></td>
					</tr>					
					<tr style="display: none" id="trValorDesdeHasta">
						<td colspan="3">
							<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">		
								<tr>
									<td width="40%" class="labelForm">Valor Normal Desde</td>
									<td align="left">
										<html:text styleClass="form-control form-control-sm DH" property="practicaDTO.valorNormalDesde" value="${practica.valorNormalDesde}" 
												styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
									</td>
								</tr>
								<tr>
									<td width="40%" class="labelForm">Valor Normal Hasta</td>
									<td align="left">
										<html:text styleClass="form-control form-control-sm DH" property="practicaDTO.valorNormalHasta" value="${practica.valorNormalHasta}" 
												styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
									</td>
								</tr>
							</table>			
						</td>
					</tr>			
					<tr style="display: none" id="trValorReferencia">
						<td colspan="3">
							<table border="0" class="cuadradoSinFont" align="center" width="70%" cellpadding="2">
								<tr>
									<td colspan="3" height="5"></td>
								</tr>																	
								<tr>
									<td width="40%" class="labelForm">Valor de Referencia</td>
									<td align="left">
										<html:text styleClass="form-control form-control-sm refe" property="practicaDTO.valorReferencia" value="${practica.valorReferencia}" 
												styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
									</td>
									<td width="20%"></td>
								</tr>		
								<tr>
									<td width="40%" class="labelForm">Mayor/Menor</td>
									<td align="left">
										<c:choose>
											<c:when test="${practica.mayorMenor == '<'}">
												<input type="hidden" class="refe" name="practicaDTO.mayorMenor" value="<" id="idMayorMenor">
													
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="referencia" id="radioMayor" onchange="cambiarMayorMenor();" value="mayor">
												  <label class="form-check-label" for="radioMayor">Mayor</label>
												</div>										
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="referencia" id="radioMenor" onchange="cambiarMayorMenor();" value="menor" checked="checked">
												  <label class="form-check-label" for="radioMenor">Menor</label>
												</div>													
													
											</c:when>
											<c:otherwise>
												<input type="hidden" class="refe" name="practicaDTO.mayorMenor" value=">" id="idMayorMenor">
												 	
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="referencia" id="radioMayor" onchange="cambiarMayorMenor();" value="mayor" checked="checked">
												  <label class="form-check-label" for="radioMayor">Mayor</label>
												</div>										
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="referencia" id="radioMenor" onchange="cambiarMayorMenor();" value="menor">
												  <label class="form-check-label" for="radioMenor">Menor</label>
												</div>												 	
												 									
											</c:otherwise>	
										</c:choose>		
									</td>
									<td width="20%"></td>
								</tr>
								<tr>
									<td colspan="3" height="5"></td>
								</tr>		
							</table>			
						</td>
					</tr>		
			
					<tr style="display: none" id="trTextArea">
						<td colspan="3">
							<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">										
								<tr>
									<td align="center">
										<textarea id="idTextArea" rows="5" cols="60" name="practicaDTO.valorRefLibre" class="form-control form-control-sm">${practica.valorRefLibre}</textarea>
									</td>
								</tr>		
							</table>			
						</td>
					</tr>						
					<tr>
						<td height="15" colspan="3"></td>
					</tr>
				</table>
				<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">
					<tr>
						<td height="10" colspan="4"></td>
					</tr>			
					<tr>
						<td width="35%"></td>
						<td width="15%">
							<input type="button" class="btn btn-primary btn-block" value="Aceptar" id="enviar" onclick="javascript:submitir();">
						</td>	
						<td width="15%">	
							<input type="button" class="btn btn-primary btn-block" value="Volver" id="enviar" onclick="javascript:volver();">														
						</td>
						<td width="35%"></td>
					</tr>
					<tr>
						<td height="15" colspan="4"></td>
					</tr>									
				</table>				
			</div>
		</td>
	</tr>
	</table>
</html:form>
<script type="text/javascript">

	$('#nombre').focus();
	$('#'+tr).show();

</script>