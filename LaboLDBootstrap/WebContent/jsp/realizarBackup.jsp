<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript">

	function submitir(){
		validarForm("backupFormId","../backup","validarBackupForm","BackupForm");
	}
</script>


<div id="exitoGrabado" class="verdeExito">${mensaje}</div>
<%-- errores de validaciones AJAX --%>

 <div id="errores" class="rojoAdvertencia">${error}</div>
	


<html:form action="backup" styleId="backupFormId" onsubmit="javascript:submitir();">

	<html:hidden property="metodo" value="realizarBackup" />
	
	  
	<table border="0" class="cuadrado" align="center" width="80%"
		cellpadding="2">
		<tr>
			<td colspan="2" class="azulAjustado">
				Realizar Backup
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td width="14%" class="botoneralNegritaRight">Nombre</td>
			<td align="left">
				<html:text styleClass="botonerab" property="nombre" value="${nombreArchivo}" 
						styleId="nombre" onkeypress="return evitarAutoSubmit(event)" size="110"/>
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
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="60%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="2" class="tituloTabla">
							Alta Obra Social
						</td>
					</tr>
					<tr>
						<td height="20" colspan="2"></td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Nombre</td>
						<td align="left">
							<html:text styleClass="botonerab" property="obraSocialDTO.nombre" value="" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Valor Unidad Bioquimica</td>
						<td align="left">						
							<html:text styleClass="botonerab" property="obraSocialDTO.valorUnidadBioquimica" value="" 
									styleId="valor" onkeypress="return evitarAutoSubmit(event)"/>						
									
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
	</table>			
-->
</html:form>
<script type="text/javascript">

	$('#nombre').focus();

</script>
