<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>	
	
<script type="text/javascript">

	function submitir(){
		validarForm("grupoPracticaFormId","../grupoPractica","validarGrupoPracticaForm","GrupoPracticaForm");
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

<html:form action="grupoPractica" styleId="grupoPracticaFormId" onsubmit="javascript:submitir();">

	<html:hidden property="metodo" value="altaGrupoPractica" />

		
	<!-- Nuevo Estilo -->
	<%--   
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="60%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="2" class="tituloTabla">
							Alta de Grupo Práctica
						</td>
					</tr>		
					<tr>
						<td height="20" colspan="2"></td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Nombre</td>
						<td align="left">
							<html:text styleClass="botonerab" property="grupoPracticaDTO.nombre" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Unidad Bioquimica</td>
						<td align="left">
							<html:text styleClass="botonerab" property="grupoPracticaDTO.unidadBioquimica" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
					
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Código Faba</td>
						<td align="left">
							<html:text styleClass="botonerab" property="grupoPracticaDTO.codigoFaba" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
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
	</table>
	--%>
	
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="60%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="3" class="tituloTablaBoots">
							Alta de Grupo Práctica
						</td>
					</tr>		
					<tr>
						<td height="20" colspan="3"></td>
					</tr>
					<tr>
						<td width="35%" align="right" class="labelForm">Nombre</td>
						<td align="left">
							<html:text styleClass="form-control form-control-sm" property="grupoPracticaDTO.nombre" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
						<td width="30%"></td>
					</tr>
					<tr>
						<td width="35%" align="right" class="labelForm">Unidad Bioquimica</td>
						<td align="left">
							<html:text styleClass="form-control form-control-sm" property="grupoPracticaDTO.unidadBioquimica" value="" 
									styleId="nombre" onkeypress="return validarNumeroConDecimal(event, this)"/>
						</td>
						<td width="30%"></td>
					</tr>
					
					<tr>
						<td width="35%" align="right" class="labelForm">Código Faba</td>
						<td align="left">
							<html:text styleClass="form-control form-control-sm" property="grupoPracticaDTO.codigoFaba" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
						<td width="30%"></td>
					</tr>		
					
					<tr>
						<td height="15" colspan="3"></td>
					</tr>
				</table>
				<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">
					<tr>
						<td height="10" colspan="3"></td>
					</tr>			
					<tr>
						<td width="45%"></td>
						<td align="center">							
							<input type="button" class="btn btn-primary btn-block" value="Aceptar" onclick="javascript:submitir();">
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
