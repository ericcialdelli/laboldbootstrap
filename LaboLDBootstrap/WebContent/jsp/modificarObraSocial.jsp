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
		validarForm("obraSocialFormId","../obraSocial","validarObraSocialForm","ObraSocialForm");
	}

	function volver(){

		parent.location=contextRoot() + "/obraSocial.do?metodo=recuperarObrasSociales";
	}	
</script>

<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="obraSocial" styleId="obraSocialFormId">
	<html:hidden property="metodo" value="modificacionObraSocial"/>
	<html:hidden property="obraSocialDTO.id" value="${obraSocial.id}"/>
	
	<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
		<tr>
			<td colspan="2"  class="azulAjustado" >Modificación de Obra Social</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="40%">Nombre</td>
			<td align="left">
				<html:text property="obraSocialDTO.nombre" value="${obraSocial.nombre}" styleClass="botonerab" styleId="nombre"/>
			</td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight">Valor Unidad Bioquímica</td>
			<td align="left">						
				<html:text styleClass="botonerab" property="obraSocialDTO.valorUnidadBioquimica" value="${obraSocial.valorUnidadBioquimica}" 
						styleId="valor"/>						
						
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


<!-- Nuevo Estilo -->
<!--
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="60%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="2"  class="tituloTabla" >Modificaciï¿½n de Obra Social</td>
					</tr>
					<tr>
						<td height="20" colspan="2"></td>
					</tr>				
					<tr>
						<td class="fontNegritaRightBootstrap" width="40%">Nombre</td>
						<td align="left">
							<html:text property="obraSocialDTO.nombre" value="${obraSocial.nombre}" styleClass="botonerab" styleId="nombre"/>
						</td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Valor Unidad Bioquï¿½mica</td>
						<td align="left">						
							<html:text styleClass="botonerab" property="obraSocialDTO.valorUnidadBioquimica" value="${obraSocial.valorUnidadBioquimica}" 
									styleId="valor"/>						
									
						</td>
					</tr>							
					<tr>
						<td height="10" colspan="2"></td>
					</tr>									
				</table>

				<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">
					<tr>
						<td height="10"></td>
					</tr>			
					<tr>
						<td align="center">							
							<input type="button" class="btn btn-primary-bootstrap btn-sm" value="Aceptar" onclick="javascript:submitir();">
							<input type="button" class="btn btn-primary-bootstrap btn-sm" value="Volver" onclick="javascript:volver();">
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
-->
</html:form>
<script type="text/javascript">

	$('#nombre').focus();

</script>