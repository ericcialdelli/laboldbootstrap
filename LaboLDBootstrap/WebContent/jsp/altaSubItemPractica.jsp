<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript">

	function submitir(){
		validarForm("subItemPracticaFormId","../grupoPractica","validarSubItemPracticaForm","GrupoPracticaForm");
	}
</script>


<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="grupoPractica" styleId="subItemPracticaFormId" onsubmit="javascript:submitir();">

	<html:hidden property="metodo" value="altaSubItemPractica" />
	
	<table border="0" class="cuadrado" align="center" width="60%"
		cellpadding="2">
		<tr>
			<td colspan="2" class="azulAjustado">
				Alta de SubItem Práctica
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight">Grupo Practica</td>
			<td align="left">
				<select id="grupoPractica" class="botonerab" name="subItemPracticaDTO.grupoPractica.id">
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
			<td width="40%" class="botoneralNegritaRight">Nombre SubItem</td>
			<td align="left">
				<html:text styleClass="botonerab" property="subItemPracticaDTO.nombre" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
		
		<tr>
			<td width="40%" class="botoneralNegritaRight">Código Faba</td>
			<td align="left">
				<html:text styleClass="botonerab" property="subItemPracticaDTO.codigoFaba" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
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

	$('#nombre').focus();

</script>
