<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript">

	function submitir(){
		validarForm("medicoFormId","../medico","validarMedicoForm","MedicoForm");
	}
</script>


<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>
<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="medico" styleId="medicoFormId" onsubmit="javascript:submitir();">

	<html:hidden property="metodo" value="altaMedico" />
	  
	<table border="0" class="cuadrado" align="center" width="60%"
		cellpadding="2">
		<tr>
			<td colspan="2" class="azulAjustado">
				Alta Medico
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight">Nombre</td>
			<td align="left">
				<html:text styleClass="botonerab" property="medicoDTO.nombre" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight">Apellido</td>
			<td align="left">
				<html:text styleClass="botonerab" property="medicoDTO.apellido" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight">Teléfono</td>
			<td align="left">
				<html:text styleClass="botonerab" property="medicoDTO.telefono" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>	
		<tr>
			<td width="40%" class="botoneralNegritaRight">Matricula</td>
			<td align="left">
				<html:text styleClass="botonerab" property="medicoDTO.matricula" value="" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
			</td>
		</tr>
		<tr>
			<td width="40%" class="botoneralNegritaRight">Especialidad</td>
			<td align="left">
				<html:text styleClass="botonerab" property="medicoDTO.especialidad" value="" 
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
	
	<!-- Nuevo Estilo -->
	<!--  
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="65%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="2" class="tituloTabla">
							Alta de Médico
						</td>
					</tr>
					<tr>
						<td height="20" colspan="2"></td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Nombre</td>
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
						<td width="40%" class="fontNegritaRightBootstrap">Teléfono</td>
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
						</td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>									
				</table>
			</div>
		</td>
	</tr>
	</table>-->

</html:form>
<script type="text/javascript">

	$('#nombre').focus();

</script>
