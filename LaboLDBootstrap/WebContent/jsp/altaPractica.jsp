<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
	
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>	
	
<script type="text/javascript"
	src="<html:rewrite page='/dwr/interface/PracticaFachada.js'/>"></script>	
	
<script type="text/javascript">

	function submitir(){
		$('#exitoGrabado').html("");
		validarForm("practicaFormId","../practica","validarPracticaForm","PracticaForm");
	}

	function cambioGrupo(){

		var idGrupo = $('#selectGrupoPractica').val();
		if (idGrupo != "-1") {
			$('#selectSubItemPractica').attr('disabled', false);
			
			PracticaFachada.getSubItemsPorGrupoPractica(idGrupo,
					cambioGrupoCallback);
		} else {
			dwr.util.removeAllOptions("selectSubItemPractica");
			var data = [ {
							nombre : "Seleccione un SubItem",
							id : -1
						 },
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
		var data = [ {
			nombre : "Seleccione un SubItem",
			id : -1
		 },
		 {
			nombre : "Sin SubItem",
			id : 0
		 }						  
		   ];
		dwr.util.addOptions("selectSubItemPractica", data, "id", "nombre");
		dwr.util.addOptions("selectSubItemPractica", subItems, "id", "nombre");		
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
	
</script>

<!--  <div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>--> <!-- Estilo Viejo -->

<!-- Estilo Nuevo -->
<c:if test="${exitoGrabado != null}">
	<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="60%" cellpadding="0" cellspacing="0" id="tablaExitoGrabado">
		<tr>
			<td>
				<div id="exitoGrabado" class="alert alert-success"><b>${exitoGrabado}</b></div>
			</td>
		</tr>
	</table>
</c:if>	
<!-- Estilo Nuevo -->

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

<html:form action="practica" styleId="practicaFormId" onsubmit="javascript:submitir();">

	<html:hidden property="metodo" value="altaPractica" />
	
	<%--
	<table border="0" class="cuadrado" align="center" width="60%"
		cellpadding="2">
		<tr>
			<td colspan="2" class="azulAjustado">
				Alta de Pr�ctica
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight">Grupo Practica</td>
			<td align="left">
				<select id="selectGrupoPractica" class="botonerab" name="practicaDTO.grupoPracticaDTO.id" onchange="cambioGrupo();">
					<option value="-1">
						Seleccione un Grupo...
					</option>		
					<c:forEach items="${listaGrupos}" var="grupo">
						<option value="${grupo.id}">
							<c:out value="${grupo.nombre}"></c:out>
						</option>
					</c:forEach>										
				</select>
			</td>
		</tr>	
		<tr>
			<td width="40%" class="botoneralNegritaRight">SubItem Practica</td>
			<td align="left">
				<select id="selectSubItemPractica" class="botonerab" name="practicaDTO.subItemPracticaDTO.id" disabled="disabled">
					<option value="-1">
						Seleccione un SubItem...
					</option>
					<option value="0">
						Sin SubItem
					</option>																	
				</select>
			</td>
		</tr>			
		<tr>
			<td width="40%" class="botoneralNegritaRight">Nombre</td>
			<td align="left">
				<html:text styleClass="botonerab" property="practicaDTO.nombre" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">Orden</td>
			<td align="left">
				<html:text property="practicaDTO.orden" value="" styleClass="botonerab" onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>		
		<tr>
			<td width="40%" class="botoneralNegritaRight">Unidad</td>
			<td align="left">
				<html:text styleClass="botonerab" property="practicaDTO.unidad" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>

		<tr>
			<td width="40%" class="botoneralNegritaRight">M�todo</td>
			<td align="left">
				<html:text styleClass="botonerab" property="practicaDTO.metodo" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
		
		<tr>
			<td width="40%" class="botoneralNegritaRight">Unidad de Bioquimica</td>
			<td align="left">
				<html:text styleClass="botonerab" property="practicaDTO.unidadBioquimica" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>		

		<tr>
			<td width="40%" class="botoneralNegritaRight">C�digo Faba</td>
			<td align="left">
				<html:text styleClass="botonerab" property="practicaDTO.codigoFaba" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" class="botoneralNegrita">
				<input type="hidden" name="checkValor" value="SV" id="idCheckValor">
				<input type="radio" name="valores" onchange="cambiarValores();" value="SV" checked="checked">Sin Valor
				<input type="radio" name="valores" onchange="cambiarValores();" value="DH">Valores Desde/Hasta
				<input type="radio" name="valores" onchange="cambiarValores();" value="Ref">Valor Referencia
				<input type="radio" name="valores" onchange="cambiarValores();" value="Libre">Valor Referencia Libre
			</td>
		</tr>		
		
		<tr style="display: none" id="trValorDesdeHasta">
			<td colspan="2">
				<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">		
					<tr>
						<td width="40%" class="botoneralNegritaRight">Valor Normal Desde</td>
						<td align="left">
							<html:text styleClass="botonerab DH" property="practicaDTO.valorNormalDesde" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
					<tr>
						<td width="40%" class="botoneralNegritaRight">Valor Normal Hasta</td>
						<td align="left">
							<html:text styleClass="botonerab DH" property="practicaDTO.valorNormalHasta" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
				</table>			
			</td>
		</tr>			
		<tr style="display: none" id="trValorReferencia">
			<td colspan="2">
				<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">										
					<tr>
						<td width="40%" class="botoneralNegritaRight">Valor de Referencia</td>
						<td align="left">
							<html:text styleClass="botonerab refe" property="practicaDTO.valorReferencia" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)" />
						</td>
					</tr>		
					<tr>
						<td width="40%" class="botoneralNegritaRight">Mayor/Menor</td>
						<td align="left">
							<input type="hidden" class="refe" name="practicaDTO.mayorMenor" value=">" id="idMayorMenor">
							<input type="radio" name="referencia" checked="checked" onchange="cambiarMayorMenor();"
								value="mayor">Mayor
							<input type="radio" name="referencia" onchange="cambiarMayorMenor();" value="menor">Menor
						</td>
					</tr>		
				</table>			
			</td>
		</tr>	
		
		<tr style="display: none" id="trTextArea">
			<td colspan="2">
				<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">										
					<tr>
						<td align="center">
							<textarea id="idTextArea" rows="5" cols="60" name="practicaDTO.valorRefLibre"></textarea>
						</td>
					</tr>		
				</table>			
			</td>
		</tr>		
						
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td height="20" colspan="2">
				<input type="button" class="botonerab" value="Aceptar" id="enviar" onclick="javascript:submitir();"> 
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
	</table>--%>


	<!-- Nuevo Estilo -->  <!--  
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="60%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="2" class="tituloTabla">
							Alta de Pr�ctica
						</td>
					</tr>

					<tr>
						<td height="20" colspan="2"></td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Grupo Practica</td>
						<td align="left">
							<select id="selectGrupoPractica" class="botonerab" name="practicaDTO.grupoPracticaDTO.id" onchange="cambioGrupo();">
								<option value="-1">
									Seleccione un Grupo...
								</option>		
								<c:forEach items="${listaGrupos}" var="grupo">
									<option value="${grupo.id}">
										<c:out value="${grupo.nombre}"></c:out>
									</option>
								</c:forEach>										
							</select>
						</td>
					</tr>	
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">SubItem Practica</td>
						<td align="left">
							<select id="selectSubItemPractica" class="botonerab" name="practicaDTO.subItemPracticaDTO.id" disabled="disabled">
								<option value="-1">
									Seleccione un SubItem...
								</option>
								<option value="0">
									Sin SubItem
								</option>																	
							</select>
						</td>
					</tr>			
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Nombre</td>
						<td align="left">
							<html:text styleClass="botonerab" property="practicaDTO.nombre" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
					<tr>
						<td class="fontNegritaRightBootstrap" width="40%">Orden</td>
						<td align="left">
							<html:text property="practicaDTO.orden" value="" styleClass="botonerab" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>		
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Unidad</td>
						<td align="left">
							<html:text styleClass="botonerab" property="practicaDTO.unidad" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
			
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">M�todo</td>
						<td align="left">
							<html:text styleClass="botonerab" property="practicaDTO.metodo" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
					
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Unidad de Bioquimica</td>
						<td align="left">
							<html:text styleClass="botonerab" property="practicaDTO.unidadBioquimica" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>		
			
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">C�digo Faba</td>
						<td align="left">
							<html:text styleClass="botonerab" property="practicaDTO.codigoFaba" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="fontNegritaCenterBootstrap">
							<input type="hidden" name="checkValor" value="SV" id="idCheckValor">
							<input type="radio" name="valores" onchange="cambiarValores();" value="SV" checked="checked">Sin Valor
							<input type="radio" name="valores" onchange="cambiarValores();" value="DH">Valores Desde/Hasta
							<input type="radio" name="valores" onchange="cambiarValores();" value="Ref">Valor Referencia
							<input type="radio" name="valores" onchange="cambiarValores();" value="Libre">Valor Referencia Libre
						</td>
					</tr>		
					
					<tr style="display: none" id="trValorDesdeHasta">
						<td colspan="2">
							<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">		
								<tr>
									<td width="40%" class="fontNegritaRightBootstrap">Valor Normal Desde</td>
									<td align="left">
										<html:text styleClass="botonerab DH" property="practicaDTO.valorNormalDesde" value="" 
												styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
									</td>
								</tr>
								<tr>
									<td width="40%" class="fontNegritaRightBootstrap">Valor Normal Hasta</td>
									<td align="left">
										<html:text styleClass="botonerab DH" property="practicaDTO.valorNormalHasta" value="" 
												styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
									</td>
								</tr>
							</table>			
						</td>
					</tr>			
					<tr style="display: none" id="trValorReferencia">
						<td colspan="2">
							<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">										
								<tr>
									<td width="40%" class="fontNegritaRightBootstrap">Valor de Referencia</td>
									<td align="left">
										<html:text styleClass="botonerab refe" property="practicaDTO.valorReferencia" value="" 
												styleId="nombre" onkeypress="return evitarAutoSubmit(event)" />
									</td>
								</tr>		
								<tr>
									<td width="40%" class="fontNegritaRightBootstrap">Mayor/Menor</td>
									<td align="left">
										<input type="hidden" class="refe" name="practicaDTO.mayorMenor" value=">" id="idMayorMenor">
										<input type="radio" name="referencia" checked="checked" onchange="cambiarMayorMenor();"
											value="mayor">Mayor
										<input type="radio" name="referencia" onchange="cambiarMayorMenor();" value="menor">Menor
									</td>
								</tr>		
							</table>			
						</td>
					</tr>	
					<tr style="display: none" id="trTextArea">
						<td colspan="2">
							<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">										
								<tr>
									<td align="center">
										<textarea id="idTextArea" rows="5" cols="60" name="practicaDTO.valorRefLibre"></textarea>
									</td>
								</tr>		
							</table>			
						</td>
					</tr>				
					<tr>
						<td height="15" colspan="2"></td>
					</tr>
				</table>
				<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">
					<tr>
						<td height="10"></td>
					</tr>			
					<tr>
						<td align="center">
							<input type="button" class="btn btn-primary-bootstrap btn-sm" value="Aceptar" onclick="javascript:submitir();">									
						</td>
					</tr>
					<tr>
						<td height="20"></td>
					</tr>									
				</table>								
				
			</div>
		</td>
	</tr>
	</table>-->


<!--  
<div class="input-group">
  <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username with two button addons" aria-describedby="button-addon4">
  <div class="input-group-append" id="button-addon4">
    <button class="btn btn-outline-secondary" type="button">Button</button>
    <button class="btn btn-outline-secondary" type="button">Button</button>
  </div>
</div>-->

	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="65%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="3" class="tituloTablaBoots">
							Alta de Pr�ctica
						</td>
					</tr>

					<tr>
						<td height="20" colspan="3"></td>
					</tr>
					<tr>
						<td width="35%" align="right" class="labelForm">Grupo Practica</td>
						<td align="left">
							<select id="selectGrupoPractica" class="custom-select custom-select-sm" name="practicaDTO.grupoPracticaDTO.id" onchange="cambioGrupo();">
								<option value="-1">
									Seleccione un Grupo...
								</option>		
								<c:forEach items="${listaGrupos}" var="grupo">
									<option value="${grupo.id}">
										<c:out value="${grupo.nombre}"></c:out>
									</option>
								</c:forEach>										
							</select>
						</td>
						<td width="30%"></td>
					</tr>	
					<tr>
						<td width="35%" align="right" class="labelForm">SubItem Practica</td>
						<td align="left">
							<select id="selectSubItemPractica" class="custom-select custom-select-sm" name="practicaDTO.subItemPracticaDTO.id" disabled="disabled">
								<option value="-1">
									Seleccione un SubItem...
								</option>
								<option value="0">
									Sin SubItem
								</option>																	
							</select>
						</td>
						<td width="30%"></td>
					</tr>			
					<tr>
						<td width="35%" align="right" class="labelForm">Nombre</td>
						<td align="left">
							<html:text styleClass="form-control form-control-sm" property="practicaDTO.nombre" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
						<td width="30%"></td>
					</tr>
					<tr>
						<td width="35%" align="right" class="labelForm">Orden</td>
						<td align="left">
							<html:text property="practicaDTO.orden" value="" styleClass="form-control form-control-sm" onkeypress="esNumerico(event); return evitarAutoSubmit(event)"/>
						</td>
						<td width="30%"></td>
					</tr>		
					<tr>
						<td width="35%" align="right" class="labelForm">Unidad</td>
						<td align="left">
							<html:text styleClass="form-control form-control-sm" property="practicaDTO.unidad" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
						<td width="30%"></td>
					</tr>
			
					<tr>
						<td width="35%" align="right" class="labelForm">M�todo</td>
						<td align="left">
							<html:text styleClass="form-control form-control-sm" property="practicaDTO.metodo" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
						<td width="30%"></td>
					</tr>
					
					<tr>
						<td width="35%" align="right" class="labelForm">Unidad Bioquimica</td>
						<td align="left">
							<html:text styleClass="form-control form-control-sm" property="practicaDTO.unidadBioquimica" value="" 
									styleId="nombre" onkeypress="return validarNumeroConDecimal(event, this)"/>
						</td>
						<td width="30%"></td>
					</tr>		
			
					<tr>
						<td width="35%" align="right" class="labelForm">C�digo Faba</td>
						<td align="left">
							<html:text styleClass="form-control form-control-sm" property="practicaDTO.codigoFaba" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
						<td width="30%"></td>
					</tr>
					<tr>
						<td colspan="3" height="20"></td>
					</tr>					
					<tr>
						<!--  <td colspan="3" class="fontNegritaCenterBootstrap">
							<input type="hidden" name="checkValor" value="SV" id="idCheckValor">
							<input type="radio" name="valores" onchange="cambiarValores();" value="SV" checked="checked">Sin Valor
							<input type="radio" name="valores" onchange="cambiarValores();" value="DH">Valores Desde/Hasta
							<input type="radio" name="valores" onchange="cambiarValores();" value="Ref">Valor Referencia
							<input type="radio" name="valores" onchange="cambiarValores();" value="Libre">Valor Referencia Libre
						</td>-->
						<td colspan="3">
							<input type="hidden" name="checkValor" value="SV" id="idCheckValor">
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
						</td>
					</tr>		
					<tr>
						<td colspan="3" height="10"></td>
					</tr>					
					<tr style="display: none" id="trValorDesdeHasta">
						<td colspan="3">
							<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">
								<tr>
									<td colspan="3" height="5"></td>
								</tr>									
								<tr>
									<td width="40%" class="labelForm">Valor Normal Desde</td>
									<td align="left">
										<html:text styleClass="form-control form-control-sm DH" property="practicaDTO.valorNormalDesde" value="" 
												styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
									</td>
									<td width="20%"></td>
								</tr>
								<tr>
									<td width="40%" class="labelForm">Valor Normal Hasta</td>
									<td align="left">
										<html:text styleClass="form-control form-control-sm DH" property="practicaDTO.valorNormalHasta" value="" 
												styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
									</td>
									<td width="20%"></td>
								</tr>
								<tr>
									<td colspan="3" height="5"></td>
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
										<html:text styleClass="form-control form-control-sm refe" property="practicaDTO.valorReferencia" value="" 
												styleId="nombre" onkeypress="return evitarAutoSubmit(event)" />
									</td>
									<td width="20%"></td>
								</tr>		
								<tr>
									<td width="40%" class="labelForm">Mayor/Menor</td>
									<td align="left">									
										<input type="hidden" class="refe" name="practicaDTO.mayorMenor" value=">" id="idMayorMenor">
										
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="referencia" id="radioMayor" onchange="cambiarMayorMenor();" value="mayor" checked="checked">
										  <label class="form-check-label" for="radioMayor">Mayor</label>
										</div>										
										<div class="form-check form-check-inline">
										  <input class="form-check-input" type="radio" name="referencia" id="radioMenor" onchange="cambiarMayorMenor();" value="menor">
										  <label class="form-check-label" for="radioMenor">Menor</label>
										</div>									
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
										<textarea id="idTextArea" rows="5" cols="60" name="practicaDTO.valorRefLibre" class="form-control form-control-sm"></textarea>
									</td>
								</tr>		
							</table>			
						</td>
					</tr>				
					<tr>
						<td height="15" colspan="3"></td>
					</tr>
				</table>
				<table border="0" class="cuadradoSinBorde" align="center" width="100%" cellpadding="2" cellspacing="0">
					<tr>
						<td height="20" colspan="3"></td>
					</tr>			
					<tr>
						<td width="45%"></td>						
						<td align="center">
							<input type="button" class="btn btn-primary  btn-block" value="Aceptar" onclick="javascript:submitir();">									
						</td>
						<td width="45%"></td>
					</tr>
					<tr>
						<td height="20" colspan="3"></td>
					</tr>									
				</table>								
				
			</div>
		</td>
	</tr>
	</table>


</html:form>
<script type="text/javascript">

	$('#nombre').focus();

</script>
