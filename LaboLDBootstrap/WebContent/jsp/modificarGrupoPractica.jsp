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

	function volver(){

		parent.location=contextRoot() + "/grupoPractica.do?metodo=cargarModificacionGrupoPractica";
	}	
</script>


<div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>

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

	<html:hidden property="metodo" value="modificacionGrupoPractica" />
	<html:hidden property="grupoPracticaDTO.id" value="${grupoPractica.id}"/>
		
	<!-- Nuevo Estilo -->  
	<%-- 
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="60%" cellpadding="2" cellspacing="0">
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="2" class="tituloTabla">
							Modificacion de Grupo Pr�ctica
						</td>
					</tr>		
					<tr>
						<td height="20" colspan="2"></td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Nombre</td>
						<td align="left">
							<html:text styleClass="botonerab" property="grupoPracticaDTO.nombre" value="${grupoPractica.nombre}" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
					<tr>
						<td width="40%" class="fontNegritaRightBootstrap">Unidad Bioquimica</td>
						<td align="left">
							<html:text styleClass="botonerab" property="grupoPracticaDTO.unidadBioquimica" value="${grupoPractica.unidadBioquimica}" 
									onkeypress="return evitarAutoSubmit(event)"/>
						</td>
					</tr>
					
					<tr>
						<td class="fontNegritaRightBootstrap" width="40%">C�digo Faba</td>
						<td align="left">
							<html:text property="grupoPracticaDTO.codigoFaba" value="${grupoPractica.codigoFaba}" styleClass="botonerab" styleId="nombre"/>
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
							<input type="button" class="btn btn-primary-bootstrap btn-sm" value="Volver" onclick="javascript:volver();">									
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
							Modificacion de Grupo Pr�ctica
						</td>
					</tr>		
					<tr>
						<td height="20" colspan="3"></td>
					</tr>
					<tr>
						<td align="right" class="labelForm" width="35%">Nombre</td>
						<td align="left">
							<html:text styleClass="form-control form-control-sm" property="grupoPracticaDTO.nombre" value="${grupoPractica.nombre}" 
									styleId="nombre" onkeypress="return evitarAutoSubmit(event)"/>
						</td>
						<td width="30%"></td>
					</tr>
					<tr>
						<td align="right" class="labelForm" width="35%">Unidad Bioquimica</td>
						<td align="left">
							<html:text styleClass="form-control form-control-sm" property="grupoPracticaDTO.unidadBioquimica" value="${grupoPractica.unidadBioquimica}" 
									onkeypress="return validarNumeroConDecimal(event, this)"/>
						</td>
						<td width="30%"></td>
					</tr>
					
					<tr>
						<td align="right" class="labelForm" width="35%">C�digo Faba</td>
						<td align="left">
							<html:text property="grupoPracticaDTO.codigoFaba" value="${grupoPractica.codigoFaba}" styleClass="form-control form-control-sm" styleId="nombre"/>
						</td>
						<td width="30%"></td>
					</tr>			
					
					<tr>
						<td height="15" colspan="3"></td>
					</tr>
				</table>
				<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">
					<tr>
						<td height="10" colspan="4"></td>
					</tr>			
					<tr>
						<td width="35%"></td>
						<td width="15%">
							<input type="button" class="btn btn-primary btn-block" value="Aceptar" id="enviar" onclick="javascript:submitir();">
						</td>	
						<td width="15%">	
							<input type="button" class="btn btn-primary btn-block" value="Volver" id="enviar" onclick="javascript:volver();">														
						</td>
						<td width="35%"></td>
					</tr>
					<tr>
						<td height="15" colspan="4"></td>
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
