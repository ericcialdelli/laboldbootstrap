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
	
</script>

<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="practica" styleId="practicaFormId">
	<html:hidden property="metodo" value="modificacionPractica"/>
	<html:hidden property="practicaDTO.id" value="${practica.id}"/>
	<html:hidden styleId="idGrupo" property="practicaDTO.grupoPracticaDTO.id" value="${practica.grupoPractica.id}"/>
	
	<c:choose>
		<c:when test="${practica.subItemPractica != null}">
			<html:hidden property="practicaDTO.subItemPracticaDTO.id" value="${practica.subItemPractica.id}"/>
		</c:when>
		<c:otherwise>
			<html:hidden property="practicaDTO.subItemPracticaDTO.id" value="0"/>
		</c:otherwise>		
	</c:choose>
	
	<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
		<tr>
			<td colspan="2"  class="azulAjustado" >Modificación de Práctica</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="40%">Nombre</td>
			<td align="left">
				<html:text property="practicaDTO.nombre" value="${practica.nombre}" styleClass="botonerab" styleId="nombre" size="40"/>
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">Orden</td>
			<td align="left">
				<html:text property="practicaDTO.orden" value="${practica.orden}" styleClass="botonerab" styleId="nombre"/>
			</td>
		</tr>		
		<tr>
			<td class="botoneralNegritaRight" width="40%">Unidad</td>
			<td align="left">
				<html:text property="practicaDTO.unidad" value="${practica.unidad}" styleClass="botonerab" styleId="nombre"/>
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">Metodo</td>
			<td align="left">
				<html:text property="practicaDTO.metodo" value="${practica.metodo}" styleClass="botonerab" styleId="nombre"/>
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">Unidad Bioquimica</td>
			<td align="left">
				<html:text property="practicaDTO.unidadBioquimica" value="${practica.unidadBioquimica}" styleClass="botonerab" styleId="nombre"/>
			</td>
		</tr>
		<tr>
			<td class="botoneralNegritaRight" width="40%">Código Faba</td>
			<td align="left">
				<html:text property="practicaDTO.codigoFaba" value="${practica.codigoFaba}" styleClass="botonerab" styleId="nombre"/>
			</td>
		</tr>							
		<tr>
			<td colspan="2" class="botoneralNegrita">
				<input type="hidden" name="checkValor" value="SV" id="idCheckValor">
				<c:choose>
					<c:when test="${practica.valorReferencia != null}">
						<input type="radio" name="valores" onchange="cambiarValores();" value="SV">Sin Valor
						<input type="radio" name="valores" onchange="cambiarValores();" value="DH">Valores Desde/Hasta
						<input type="radio" name="valores" onchange="cambiarValores();" value="Ref" checked="checked">Valor Referencia
						<input type="radio" name="valores" onchange="cambiarValores();" value="Libre">Valor Referencia Libre
						<script type="text/javascript">
							var tr = "trValorReferencia"
						</script>
					</c:when>
					<c:when test="${practica.valorNormalDesde != null}">
						<input type="radio" name="valores" onchange="cambiarValores();" value="SV">Sin Valor
						<input type="radio" name="valores" onchange="cambiarValores();" value="DH" checked="checked">Valores Desde/Hasta
						<input type="radio" name="valores" onchange="cambiarValores();" value="Ref">Valor Referencia
						<input type="radio" name="valores" onchange="cambiarValores();" value="Libre">Valor Referencia Libre
						<script type="text/javascript">
							var tr = "trValorDesdeHasta";
						</script>						
					</c:when>
					<c:when test="${practica.valorRefLibre != null}">
						<input type="radio" name="valores" onchange="cambiarValores();" value="SV">Sin Valor
						<input type="radio" name="valores" onchange="cambiarValores();" value="DH">Valores Desde/Hasta
						<input type="radio" name="valores" onchange="cambiarValores();" value="Ref">Valor Referencia
						<input type="radio" name="valores" onchange="cambiarValores();" value="Libre" checked="checked">Valor Referencia Libre
						<script type="text/javascript">
							var tr = "trTextArea";
						</script>						
					</c:when>					
					<c:otherwise>
						<input type="radio" name="valores" onchange="cambiarValores();" value="SV" checked="checked">Sin Valor
						<input type="radio" name="valores" onchange="cambiarValores();" value="DH">Valores Desde/Hasta
						<input type="radio" name="valores" onchange="cambiarValores();" value="Ref">Valor Referencia
						<input type="radio" name="valores" onchange="cambiarValores();" value="Libre">Valor Referencia Libre
						<script type="text/javascript">
							var tr = "";
						</script>					
					</c:otherwise>						
				</c:choose>		
			</td>
		</tr>	
		
		<tr style="display: none" id="trValorDesdeHasta">
			<td colspan="2">
				<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">		
					<tr>
						<td width="40%" class="botoneralNegritaRight">Valor Normal Desde</td>
						<td align="left">
							<html:text styleClass="botonerab DH" property="practicaDTO.valorNormalDesde" value="${practica.valorNormalDesde}" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
					<tr>
						<td width="40%" class="botoneralNegritaRight">Valor Normal Hasta</td>
						<td align="left">
							<html:text styleClass="botonerab DH" property="practicaDTO.valorNormalHasta" value="${practica.valorNormalHasta}" 
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
							<html:text styleClass="botonerab refe" property="practicaDTO.valorReferencia" value="${practica.valorReferencia}" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)" />
						</td>
					</tr>		
					<tr>
						<td width="40%" class="botoneralNegritaRight">Mayor/Menor</td>
						<td align="left">
							<c:choose>
								<c:when test="${practica.mayorMenor == '<'}">
									<input type="hidden" class="refe" name="practicaDTO.mayorMenor" value="<" id="idMayorMenor">
									<input type="radio" name="referencia" onchange="cambiarMayorMenor();"
										value="mayor" id="radioMayor">Mayor
									<input type="radio" name="referencia" checked="checked" onchange="cambiarMayorMenor();" 
										value="menor" id="radioMenor">Menor
								</c:when>
								<c:otherwise>
									<input type="hidden" class="refe" name="practicaDTO.mayorMenor" value=">" id="idMayorMenor">
									<input type="radio" name="referencia" checked="checked" onchange="cambiarMayorMenor();"
										value="mayor" id="radioMayor">Mayor
									<input type="radio" name="referencia" onchange="cambiarMayorMenor();" value="menor"
									 	id="radioMenor">Menor								
								</c:otherwise>	
							</c:choose>		
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
							<textarea id="idTextArea" rows="5" cols="60" name="practicaDTO.valorRefLibre">${practica.valorRefLibre}</textarea>
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
				<input type="button" class="botonerab" value="Volver" id="enviar" onclick="javascript:volver();">
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>									
	</table>

</html:form>
<script type="text/javascript">

	$('#nombre').focus();
	$('#'+tr).show();

</script>