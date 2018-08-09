<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript">

	function submitir(){
		validarForm("valorUnidadFacturacionFormId","../facturacion","validarValorUnidadFacturacionForm","ValorUnidadFacturacionForm");
	}
</script>


<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="facturacion" styleId="valorUnidadFacturacionFormId" onsubmit="javascript:submitir();">

	<html:hidden property="metodo" value="modificarValorUnidadFacturacion" />
	
	<table border="0" class="cuadrado" align="center" width="60%"
		cellpadding="2">
		<tr>
			<td colspan="2" class="azulAjustado">
				Modificación Valor Unidad de Facturación Particular
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight">Valor $</td>
			<td align="left">
				<html:text styleClass="botonerab" property="valorUnidadFacturacion" value="${valor}" 
						styleId="valor" onkeypress="return evitarAutoSubmit(event)"/>
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
	</table>

</html:form>
<script type="text/javascript">

	$('#valor').focus();

</script>
