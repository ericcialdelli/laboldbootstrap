<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript" src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>

<script type="text/javascript">
	function submitir(){
		validarForm("usuarioFormId","../usuario","validarUsuarioForm","UsuarioForm");
	}

	/*function cargarRolesSegunEntidad(){
		dwr.util.removeAllOptions("idRol");
		var data = [ { nombre:"Cargando...", id:-1 }];
		dwr.util.addOptions("idRol", data, "id", "rol");

		var idEntidad = $("select[name='usuarioDTO.entidad.id'] ").val();
		idEntidad = (idEntidad == null)? $('#idSelectEntidad').val():idEntidad;
		RolFachada.cargarRolesSegunEntidad(idEntidad,'${usuario.id}', cargarRolesSegunEntidadCallback);
	}

	function cargarRolesSegunEntidadCallback(roles){
		dwr.util.removeAllOptions("idRol");
		dwr.util.addOptions("idRol", roles,"id","rol");
		if(''!='${usu.rol.id}'){
			dwr.util.setValue("idRol",'${usu.rol.id}');
		}
	}

	$(document).ready(function() {
		cargarRolesSegunEntidad()
		});*/
</script>

<%-- errores de validaciones AJAX --%>
<div id="errores" class="rojoAdvertencia">
	${error}
</div>
<html:form action="usuario" styleId="usuarioFormId">
	<html:hidden property="metodo" value="${metodo}"/>
	<html:hidden property="usuarioDTO.id" value="${usu.id}"/>

	<table width="80%" cellspacing="1" cellpadding="0" border="0" align="center">
        <tr>
            <td class="lineaColor">
                <span class="tituloOpcion">
                    ${titulo}
                </span>
            </td>
        </tr>
	</table>
	<br>
	<br>
	<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2" cellspacing="0">
		<tr>
			<td colspan="2"  class="tituloTabla" ></td>
		</tr>
		<tr>
			<td height="20" colspan="2" class="TDtablaNormal"></td>
		</tr>				
		<tr>
			<td class="TDtablaBoldRight">Nombr</td>
			<td align="left" class="TDtablaNormal">
				<c:choose>
					<c:when test="${metodo=='altaUsuario'}">
						<html:text property="usuarioDTO.nombreUsuario" value="${usu.nombreUsuario}" styleId="nombre"/>
					</c:when>
					<c:otherwise><!-- AL MODIFICAR NO PUEDO CAMBIAR EL NOMBRE DE USUARIO -->
						<html:text property="usuarioDTO.nombreUsuario" value="${usu.nombreUsuario}" readonly="true" styleId="nombre"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>	
		<tr>
			<td class="TDtablaBoldRight">Contraseña</td>
			<td  align="left" class="TDtablaNormal">
				<html:password property="usuarioDTO.password" value="${usu.password}"/>			
			</td>
		</tr>
		<tr>
			<td class="TDtablaBoldRight">
				Confirmar Contraseña
			</td>
			<td  align="left" class="TDtablaNormal">
				<html:password property="contrasenia" value="${usu.password}"/>			
			</td>
		</tr>
		<tr>
			<c:choose>
				<c:when test="${metodo=='altaUsuario'}"><!-- ALTA -->
					<td class="TDtablaBoldRight">
						Habilitado
					</td>					
					<td align="left" class="TDtablaNormal">
						<input type="checkbox" name="usuarioDTO.habilitado" class="botonerab" 
								checked="checked" value="true" disabled="disabled">
					</td>
				</c:when>
				<c:when test="${usuario.rol.id!=idRolAdministrador}"><!-- MODIFICACION USUARIO COMUN -->
					<html:hidden property="usuarioDTO.habilitado" value="true"/>
				</c:when>
				<c:otherwise><!-- MODIFICACION ADMINISTRADOR -->
					<td class="TDtablaBoldRight">
						Habilitado
					</td>
					<td align="left" class="TDtablaNormal">
						<c:choose>
							<c:when test="${usu.habilitado}">
									<input type="checkbox" name="usuarioDTO.habilitado" class="botonerab" 
											checked="checked" value="true">
								</td>
							</c:when>
							<c:otherwise>
									<input type="checkbox" name="usuarioDTO.habilitado" class="botonerab" value="true">
							</c:otherwise>
						</c:choose>
					</td>
				</c:otherwise>
			</c:choose>
		</tr>

		<tr>
			<td class="TDtablaBoldRight">
				Rol
			</td>
			<td align="left" class="TDtablaNormal">
				<html:select  styleClass="botonerab" property="usuarioDTO.rol.id" styleId="idRol">
					<c:forEach items="${roles}" var="rol">
						<option value="${rol.id}">
							<c:out value="${rol.rol}"></c:out>
						</option>
					</c:forEach>					
				</html:select>
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2" class="TDtablaNormal"></td>
		</tr>
		<tr>
			<td height="20" colspan="2" class="TDtablaNormal">				
				<c:choose>
					<c:when test="${metodo=='altaUsuario'}">
						<!--  --><input type="button" class="botonerab" value="Aceptar" id="enviar" onclick="javascript:submitir();">
						<input type="button" class="botonerab" value="Cancelar" 
								onclick="javascript:parent.location= contextRoot() +  '/jsp.do?page=.index'">													
					</c:when>
					<c:otherwise>
						<input type="button" class="botonerab" value="Modificar" id="enviar" onclick="javascript:submitir();">
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td height="10" colspan="2" class="TDtablaNormal"></td>
		</tr>									
	</table>

</html:form>
<script type="text/javascript">

	$('#nombre').focus();

</script>