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
		validarForm("medicoFormId","../medico","validarMedicoForm","MedicoForm");
	}

	function volver(){

		parent.location=contextRoot() + "/medico.do?metodo=recuperarMedicos";
	}	
</script>

<div id="errores" class="rojoAdvertencia">${error}</div>

<html:form action="medico" styleId="medicoFormId">
	<html:hidden property="metodo" value="modificacionMedico"/>
	<html:hidden property="medicoDTO.id" value="${medico.id}"/>
	
	<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
		<tr>
			<td colspan="2"  class="azulAjustado" >Modificación de Médico</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="40%">Nombre</td>
			<td align="left">
				<html:text property="medicoDTO.nombre" value="${medico.nombre}" styleClass="botonerab" styleId="nombre"/>
			</td>
		</tr>
		
		<tr>
			<td class="botoneralNegritaRight" width="40%">Apellido</td>
			<td align="left">
				<html:text property="medicoDTO.apellido" value="${medico.apellido}" styleClass="botonerab" styleId="nombre"/>
			</td>
		</tr>		
			
		<tr>
			<td class="botoneralNegritaRight" width="40%">Telefono</td>
			<td align="left">
				<html:text property="medicoDTO.telefono" value="${medico.telefono}" styleClass="botonerab" styleId="nombre"/>
			</td>
		</tr>			
			
		<tr>
			<td class="botoneralNegritaRight" width="40%">Matricula</td>
			<td align="left">
				<html:text property="medicoDTO.matricula" value="${medico.matricula}" styleClass="botonerab" styleId="nombre"/>
			</td>
		</tr>			
			
		<tr>
			<td class="botoneralNegritaRight" width="40%">Especialidad</td>
			<td align="left">
				<html:text property="medicoDTO.especialidad" value="${medico.especialidad}" styleClass="botonerab" styleId="nombre"/>
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
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="65%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">

				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="2"  class="tituloTabla">Modificación de Médico</td>
					</tr>
					<tr>
						<td height="20" colspan="2"></td>
					</tr>				
					<tr>
						<td class="fontNegritaRightBootstrap" width="40%">Nombre</td>
						<td align="left">
							<html:text property="medicoDTO.nombre" value="${medico.nombre}" styleClass="botonerab" styleId="nombre"/>
						</td>
					</tr>
					
					<tr>
						<td class="fontNegritaRightBootstrap" width="40%">Apellido</td>
						<td align="left">
							<html:text property="medicoDTO.apellido" value="${medico.apellido}" styleClass="botonerab" styleId="nombre"/>
						</td>
					</tr>		
						
					<tr>
						<td class="fontNegritaRightBootstrap" width="40%">Telefono</td>
						<td align="left">
							<html:text property="medicoDTO.telefono" value="${medico.telefono}" styleClass="botonerab" styleId="nombre"/>
						</td>
					</tr>			
						
					<tr>
						<td class="fontNegritaRightBootstrap" width="40%">Matricula</td>
						<td align="left">
							<html:text property="medicoDTO.matricula" value="${medico.matricula}" styleClass="botonerab" styleId="nombre"/>
						</td>
					</tr>			
						
					<tr>
						<td class="fontNegritaRightBootstrap" width="40%">Especialidad</td>
						<td align="left">
							<html:text property="medicoDTO.especialidad" value="${medico.especialidad}" styleClass="botonerab" styleId="nombre"/>
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
							<input type="button" class="btn btn-primary-bootstrap btn-sm" value="Aceptar" id="enviar" onclick="javascript:submitir();">
							<input type="button" class="btn btn-primary-bootstrap btn-sm" value="Volver" id="enviar" onclick="javascript:volver();">							
							
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