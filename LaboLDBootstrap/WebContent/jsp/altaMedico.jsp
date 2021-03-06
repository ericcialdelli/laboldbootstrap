<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
	

	
<script type="text/javascript">

	function submitir(){
		$("#tablaExitoGrabado").hide();//Estilo Nuevo
		validarForm("medicoFormId","../medico","validarMedicoForm","MedicoForm");
	}
</script>


<!--  <div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>--> <!-- Estilo Viejo -->

<!-- Estilo Nuevo -->
<c:if test="${exitoGrabado != null}">
	<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="65%" cellpadding="0" cellspacing="0" id="tablaExitoGrabado">
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
	<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="65%" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<div id="errores" class="alert alert-danger" style="display: none"></div>
			</td>
		</tr>
	</table>	
<!-- Estilo Nuevo -->

<html:form action="medico" styleId="medicoFormId" onsubmit="javascript:submitir();">

	<html:hidden property="metodo" value="altaMedico" />

	<!-- Nuevo Estilo --> 
	<!--   
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="65%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="2" class="tituloTabla">
							Alta de M�dico
						</td>
					</tr>
					<tr>
						<td height="20" colspan="2"></td>
					</tr>
					<tr>
						<td width="40%" class="tituloCaracteristica">Nombre</td>
						<td align="left">
							<html:text styleClass="botonerab" property="medicoDTO.nombre" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Apellido</td>
						<td align="left">
							<html:text styleClass="botonerab" property="medicoDTO.apellido" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Tel�fono</td>
						<td align="left">
							<html:text styleClass="botonerab" property="medicoDTO.telefono" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>	
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Matricula</td>
						<td align="left">
							<html:text styleClass="botonerab" property="medicoDTO.matricula" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Especialidad</td>
						<td align="left">
							<html:text styleClass="botonerab" property="medicoDTO.especialidad" value="" 
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
	</table>-->


<!-- Estilo Bootstrap--> 
	
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="65%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">				
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2" cellspacing="1">
					 				
					<tr>
						<td colspan="3" class="tituloTablaBoots">
							<!--  <h3 class="h3 mb-3 font-weight-normal">Alta de M�dico</h3>-->
							Alta de M�dico
						</td>
					</tr>
					
					<tr>
						<td height="20" colspan="3"></td>
					</tr>
					
					<tr>
						<td width="35%" align="right" class="labelForm">Nombre</td>
						<td align="left">
							<html:text styleClass="form-control form-control-sm" property="medicoDTO.nombre" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>										
						</td>
						<td width="30%"></td>
					</tr>
					<tr>
						<td width="35%" align="right" class="labelForm">Apellido</td>
						<td align="left">
							<html:text styleClass="form-control form-control-sm" property="medicoDTO.apellido" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
						<td width="30%"></td>
					</tr>
					<tr>
						<td width="35%" align="right" class="labelForm">Tel�fono</td>
						<td align="left">
							<html:text styleClass="form-control form-control-sm" property="medicoDTO.telefono" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>	
					<tr>
						<td width="35%" align="right" class="labelForm">Matricula</td>
						<td align="left">
							<html:text styleClass="form-control form-control-sm" property="medicoDTO.matricula" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
					<tr>
						<td width="35%" align="right" class="labelForm">Especialidad</td>
						<td align="left">
								<html:text styleClass="form-control form-control-sm" property="medicoDTO.especialidad" value="" 
										styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>		
						</td>
					</tr>					
					<tr>
						<td height="15" colspan="2"></td>
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
