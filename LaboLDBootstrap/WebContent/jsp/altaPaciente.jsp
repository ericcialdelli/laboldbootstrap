<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarLetras.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/validarNum.js'/>"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>

<link rel="stylesheet" href="<html:rewrite page='/css/jquery-ui_1_11_3.css'/>" type="text/css">

<!--  <script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/ui/jquery-ui-1.8.10.custom.min.js'/>"></script>	

<link rel="stylesheet" href="<html:rewrite page='/css/ui-lightness/jquery-ui-1.8.10.custom.css'/>"
	type="text/css">-->

<script type="text/javascript">

	function submitir(){
		validarForm("pacienteFormId","../paciente","validarPacienteForm","PacienteForm");
	}

</script>

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


<!-- Estilo Nuevo -->
	<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="60%" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<div id="errores" class="alert alert-danger" style="display: none"></div>
			</td>
		</tr>
	</table>	
<!-- Estilo Nuevo -->

<html:form action="paciente" styleId="pacienteFormId">
	<html:hidden property="metodo" value="altaPaciente"/>

	<%-- 
	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="65%" cellpadding="2" cellspacing="0">
	<tr><td>
	<div class="well-sm-bootstrap well-bootstrap">

		<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2" cellspacing="0">
			<tr>
				<td colspan="2"  class="tituloTabla" >Alta de Paciente</td>
			</tr>
			<tr>
				<td height="20" colspan="2"></td>
			</tr>				
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap"><b>Nombre</b></td>
				<td align="left">
					<html:text property="pacienteDTO.nombre" value="" styleClass="botonerab" styleId="nombre"/>
				</td>
			</tr>	
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap"><b>Apellido</b></td>
				<td  align="left">
					<html:text property="pacienteDTO.apellido" value="" styleClass="botonerab"/>			
				</td>
			</tr>
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap"><b>Fecha de Nacimiento</b></td>
				<td  align="left">
					<input id="datepicker" class="botonerab" type="text" size="15" name="pacienteDTO.fechaNacimiento">						
					<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>							
				</td>
			</tr>
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap">
					<b>DNI</b>
				</td>
				<td  align="left">
					<html:text property="pacienteDTO.dni" value="" onkeypress="javascript:esNumerico(event);" styleClass="botonerab"/>			
				</td>
			</tr>				
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap">
					<b>Dirección</b>
				</td>
				<td  align="left">
					<html:text property="pacienteDTO.direccion" value="" styleClass="botonerab"/>			
				</td>
			</tr>
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap">
					<b>Telefono</b>
				</td>
				<td  align="left">
					<html:text property="pacienteDTO.telefono" value="" styleClass="botonerab"/>			
				</td>
			</tr>
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap">
					<b>E-Mail</b>
				</td>
				<td  align="left">
					<html:text property="pacienteDTO.email" value="" styleClass="botonerab"/>			
				</td>
			</tr>
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap">
					<b>Obra Social</b>
				</td>
				<td  align="left">
					<select id="obraSocial" class="botonerab" name="pacienteDTO.obraSocial.id">
						<option value="-1">
							-Seleccione una Obra Social-
						</option>		
						<c:forEach items="${obrasSociales}" var="os">
							<option value="${os.id}">
								<c:out value="${os.nombre}"></c:out>
							</option>
						</c:forEach>										
					</select>			
				</td>
			</tr>
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap">
					<b>Nro Carnet Obra Social</b>
				</td>
				<td  align="left">
					<html:text property="pacienteDTO.nroCarnetObraSocial" value="" styleClass="botonerab"/>			
				</td>
			</tr>
			<tr>
				<td width="40%" align="right" class="fontNegritaRightBootstrap">
					<b>Observaciones</b>
				</td>
				<td  align="left">
					<html:text property="pacienteDTO.observaciones" value="" styleClass="botonerab"/>			
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
	</td></tr>
	</table>
	--%>

	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="65%" cellpadding="2" cellspacing="0">
	<tr><td>
	<div class="well-sm-bootstrap well-bootstrap">

		<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2" cellspacing="0">
			<tr>
				<td colspan="4"  class="tituloTablaBoots" >Alta de Paciente</td>
			</tr>
			<tr>
				<td height="20" colspan="4"></td>
			</tr>				
			<tr>
				<td width="35%" align="right" class="labelForm">Nombre</td>
				<td align="left">
					<html:text property="pacienteDTO.nombre" value="" styleClass="form-control form-control-sm" styleId="nombre"/>
				</td>
				<td width="30%" colspan="2"></td>
			</tr>	
			<tr>
				<td width="35%" align="right" class="labelForm">Apellido</td>
				<td  align="left">
					<html:text property="pacienteDTO.apellido" value="" styleClass="form-control form-control-sm"/>			
				</td>
				<td width="30%" colspan="2"></td>
			</tr>
			<!--  <tr>
				<td width="35%" align="right" class="labelForm">Fecha de Nacimiento</td>
				<td  align="left">
					<input id="datepicker" class="form-control form-control-sm" type="text" size="15" name="pacienteDTO.fechaNacimiento" placeholder="dd/mm/aaaa">																	
				</td>
				<td width="5%" align="left"><img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'></td>
				<td width="25%"></td>
			</tr>-->
			<tr>
				<td width="35%" align="right" class="labelForm">Fecha de Nacimiento</td>
				<td  align="left">
					<div class="input-group ">
						<div class="input-group-prepend">
							<span class="form-control form-control-sm" id="basic-addon1">
								<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>
							</span>
						</div>
					  
						<input id="datepicker" class="form-control form-control-sm" type="text" size="15" name="pacienteDTO.fechaNacimiento" placeholder="dd/mm/aaaa">																	
					</div>																			
				</td>				
				<td width="30%" colspan="2"></td>
			</tr>			
			<tr>
				<td width="35%" align="right" class="labelForm">DNI</td>
				<td  align="left">
					<html:text property="pacienteDTO.dni" value="" onkeypress="javascript:esNumerico(event);" styleClass="form-control form-control-sm"/>			
				</td>
				<td width="30%" colspan="2"></td>
			</tr>				
			<tr>
				<td width="35%" align="right" class="labelForm">Dirección</td>
				<td  align="left">
					<html:text property="pacienteDTO.direccion" value="" styleClass="form-control form-control-sm"/>			
				</td>
				<td width="30%" colspan="2"></td>
			</tr>
			<tr>
				<td width="35%" align="right" class="labelForm">Telefono</td>
				<td  align="left">
					<html:text property="pacienteDTO.telefono" value="" styleClass="form-control form-control-sm"/>			
				</td>
				<td width="30%" colspan="2"></td>
			</tr>
			<tr>
				<td width="35%" align="right" class="labelForm">E-Mail</td>
				<td  align="left">
					<html:text property="pacienteDTO.email" value="" styleClass="form-control form-control-sm"/>			
				</td>
				<td width="30%" colspan="2"></td>
			</tr>
			<tr>
				<td width="35%" align="right" class="labelForm">Obra Social</td>
				<td  align="left">
					<select id="obraSocial" class="custom-select custom-select-sm" name="pacienteDTO.obraSocial.id">
						<option value="-1">
							-Seleccione una Obra Social-
						</option>		
						<c:forEach items="${obrasSociales}" var="os">
							<option value="${os.id}">
								<c:out value="${os.nombre}"></c:out>
							</option>
						</c:forEach>										
					</select>			
				</td>
				<td width="30%" colspan="2"></td>
			</tr>
			<tr>
				<td width="35%" align="right" class="labelForm">Nro Carnet Obra Social</td>
				<td  align="left">
					<html:text property="pacienteDTO.nroCarnetObraSocial" value="" styleClass="form-control form-control-sm"/>			
				</td>
				<td width="30%" colspan="2"></td>
			</tr>
			<tr>
				<td width="35%" align="right" class="labelForm">Observaciones</td>
				<td  align="left">
					<html:text property="pacienteDTO.observaciones" value="" styleClass="form-control form-control-sm"/>			
				</td>
				<td width="30%" colspan="2"></td>
			</tr>								
			<tr>
				<td height="15" colspan="4"></td>
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
	</td></tr>
	</table>

</html:form>
<script type="text/javascript">

	$('#nombre').focus();

</script>