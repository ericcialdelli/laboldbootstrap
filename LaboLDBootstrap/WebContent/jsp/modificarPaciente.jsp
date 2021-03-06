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
		validarForm("pacienteFormId","../paciente","validarPacienteForm","PacienteForm");
	}

	function volver(){

		parent.location=contextRoot() + "/paciente.do?metodo=recuperarPacientes&forward=${forward}";
	}	
</script>


<html:form action="paciente" styleId="pacienteFormId">
	<html:hidden property="metodo" value="" styleId="idMetodo"/>
	<html:hidden property="pacienteDTO.id" value="${paciente.id}"/>

	<!-- Nuevo Estilo -->
	<%-- 
	<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
		<tr>
			<td height="20" colspan="2"></td>
		</tr>				
		<tr>
			<td class="fontNegritaRightBootstrap" width="40%">Nombre</td>
			<td align="left">
				<html:text property="pacienteDTO.nombre" value="${paciente.nombre}" styleClass="botonerab" styleId="nombre"/>
			</td>
		</tr>	
		<tr>
			<td class="fontNegritaRightBootstrap" width="40%">Apellido</td>
			<td  align="left">
				<html:text property="pacienteDTO.apellido" value="${paciente.apellido}" styleClass="botonerab"/>			
			</td>
		</tr>
		<tr>
			<td class="fontNegritaRightBootstrap" width="40%">Fecha de Nacimiento</td>
			<td  align="left">
			
				<input id="datepicker" class="botonerab" type="text" size="15" name="pacienteDTO.fechaNacimiento" 
							value="<fmt:formatDate	value='${paciente.fechaNacimiento}' pattern='dd/MM/yyyy' />">						
				<img alt="" src="<html:rewrite page='/imagenes/calendar/calendar2.gif'/>" align="top" width='17' height='21'>							
			</td>
		</tr>
		<tr>
			<td class="fontNegritaRightBootstrap" width="40%">
				DNI
			</td>
			<td  align="left">
				<html:text property="pacienteDTO.dni" value="${paciente.dni}" onkeypress="javascript:esNumerico(event);" styleClass="botonerab"/>			
			</td>
		</tr>				
		<tr>
			<td class="botoneralNegritaRight" width="40%">
				Direcci�n
			</td>
			<td  align="left">
				<html:text property="pacienteDTO.direccion" value="${paciente.direccion}" styleClass="botonerab"/>			
			</td>
		</tr>
		<tr>
			<td class="fontNegritaRightBootstrap" width="40%">
				Telefono
			</td>
			<td  align="left">
				<html:text property="pacienteDTO.telefono" value="${paciente.telefono}" styleClass="botonerab"/>			
			</td>
		</tr>
		<tr>
			<td class="fontNegritaRightBootstrap" width="40%">
				E-Mail
			</td>
			<td  align="left">
				<html:text property="pacienteDTO.email" value="${paciente.email}" styleClass="botonerab"/>			
			</td>
		</tr>
		<tr>
			<td class="fontNegritaRightBootstrap" width="40%">
				Obra Social
			</td>
			<td  align="left">
				<select id="obraSocial" class="botonerab" name="pacienteDTO.obraSocial.id" >
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
			<td class="fontNegritaRightBootstrap" width="40%">
				Nro Carnet Obra Social
			</td>
			<td  align="left">
				<html:text property="pacienteDTO.nroCarnetObraSocial" value="${paciente.nroCarnetObraSocial}" styleClass="botonerab"/>			
			</td>
		</tr>		
		<tr>
			<td class="fontNegritaRightBootstrap" width="40%">
				Observaciones
			</td>
			<td  align="left">
				<html:text property="pacienteDTO.observaciones" value="${paciente.observaciones}" styleClass="botonerab"/>			
			</td>
		</tr>						
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td height="20" colspan="2">
				<c:if test="${forward=='modificacionPaciente'}">					
					<input type="button" class="btn btn-primary-bootstrap btn-sm" value="Aceptar" onclick="javascript:submitir();">
				</c:if>
				<c:if test="${forward=='eliminarPaciente'}">
					<input type="submit" class="btn btn-primary-bootstrap btn-sm" value="Eliminar">
				</c:if>											
				<input type="button" class="btn btn-primary-bootstrap btn-sm" value="Volver" onclick="javascript:volver();">
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2"></td>
		</tr>									
	</table>
	--%>
	
	<table border="0" class="cuadrado" align="center" width="80%" cellpadding="2">

		<tr>
			<td height="20" colspan="4"></td>
		</tr>				
		<tr>
			<td width="35%" align="right" class="labelForm">Nombre</td>
			<td align="left">
				<html:text property="pacienteDTO.nombre" value="${paciente.nombre}" styleClass="form-control form-control-sm" styleId="nombre"/>
			</td>
			<td width="30%" colspan="2"></td>
		</tr>	
		<tr>
			<td width="35%" align="right" class="labelForm">Apellido</td>
			<td  align="left">
				<html:text property="pacienteDTO.apellido" value="${paciente.apellido}" styleClass="form-control form-control-sm"/>			
			</td>
			<td width="30%" colspan="2"></td>
		</tr>
		<!--  <tr>
			<td width="35%" align="right" class="labelForm">Fecha de Nacimiento</td>
			<td  align="left">
			
				<input id="datepicker" class="form-control form-control-sm" type="text" size="15" name="pacienteDTO.fechaNacimiento" 
							value="<fmt:formatDate	value='${paciente.fechaNacimiento}' pattern='dd/MM/yyyy' />">
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
					<input id="datepicker" class="form-control form-control-sm" type="text" size="15" name="pacienteDTO.fechaNacimiento" 
								value="<fmt:formatDate	value='${paciente.fechaNacimiento}' pattern='dd/MM/yyyy' />">																	
				</div>																			
			</td>				
			<td width="30%" colspan="2"></td>
		</tr>
		
		<tr>
			<td width="35%" align="right" class="labelForm">DNI</td>
			<td  align="left">
				<html:text property="pacienteDTO.dni" value="${paciente.dni}" onkeypress="javascript:esNumerico(event);" styleClass="form-control form-control-sm"/>			
			</td>
			<td width="30%" colspan="2"></td>
		</tr>				
		<tr>
			<td width="35%" align="right" class="labelForm">Direcci�n</td>
			<td  align="left">
				<html:text property="pacienteDTO.direccion" value="${paciente.direccion}" styleClass="form-control form-control-sm"/>			
			</td>
			<td width="30%" colspan="2"></td>
		</tr>
		<tr>
			<td width="35%" align="right" class="labelForm">Telefono</td>
			<td  align="left">
				<html:text property="pacienteDTO.telefono" value="${paciente.telefono}" styleClass="form-control form-control-sm"/>			
			</td>
			<td width="30%" colspan="2"></td>
		</tr>
		<tr>
			<td width="35%" align="right" class="labelForm">E-Mail</td>
			<td  align="left">
				<html:text property="pacienteDTO.email" value="${paciente.email}" styleClass="form-control form-control-sm"/>			
			</td>
			<td width="30%" colspan="2"></td>
		</tr>
		<tr>
			<td width="35%" align="right" class="labelForm">Obra Social</td>
			<td  align="left">
				<select id="obraSocial" class="custom-select custom-select-sm" name="pacienteDTO.obraSocial.id" >
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
				<html:text property="pacienteDTO.nroCarnetObraSocial" value="${paciente.nroCarnetObraSocial}" styleClass="form-control form-control-sm"/>			
			</td>
			<td width="30%" colspan="2"></td>
		</tr>		
		<tr>
			<td width="35%" align="right" class="labelForm">Observaciones</td>
			<td  align="left">
				<html:text property="pacienteDTO.observaciones" value="${paciente.observaciones}" styleClass="form-control form-control-sm"/>			
			</td>
			<td width="30%" colspan="2"></td>
		</tr>						
		<tr>
			<td height="20" colspan="4"></td>
		</tr>
		<tr>
			<td height="20" colspan="4">
				<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">
					<tr>
						<td height="10" colspan="4"></td>
					</tr>			
					<tr>
						<td width="35%"></td>
						<td width="15%">
							<c:if test="${forward=='modificacionPaciente'}">					
								<input type="button" class="btn btn-primary btn-block" value="Aceptar" onclick="javascript:submitir();">
							</c:if>
							<c:if test="${forward=='eliminarPaciente'}">
								<input type="submit" class="btn btn-primary btn-block" value="Eliminar">
							</c:if>	
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
			</td>
		</tr>
		<tr>
			<td height="10" colspan="4"></td>
		</tr>									
	</table>	
	
	
</html:form>
<script type="text/javascript">

	$('#nombre').focus();
	$('#obraSocial').val("${paciente.obraSocial.id}");
	$('#idMetodo').val("${forward}");
</script>