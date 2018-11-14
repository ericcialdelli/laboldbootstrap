<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/jquery-1.3.2.min.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/Concurrent.Thread-full-20090713.js'/>"></script>

<script type="text/javascript" src="<html:rewrite page='/js/funcUtiles.js'/>"></script>

<script>

	function recuperarObraSocial(id){
		//var urlSeleccionGuia = $('#paramUrlSeleccionGuia').val();
		//parent.location=contextRoot() + "/guia.do?metodo="+urlSeleccionGuia+"&id="+id;
		parent.location=contextRoot() + "/obraSocial.do?metodo=recuperarObraSocial&id="+id;
	}

	var clase;
	function pintarFila(idTr){
		
		clase = $('#'+idTr).attr("class");
		$('#'+idTr).removeClass(clase);
		$('#'+idTr).addClass("verdeSeleccionFila");		
	}

	function despintarFila(idTr){
		
		$('#'+idTr).addClass(clase);
		$('#'+idTr).removeClass("verdeSeleccionFila");
	}
	
</script>

<!--  <div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>--> <!-- Estilo Viejo -->

<br>
<br>
<!-- Estilo Nuevo -->
<c:if test="${exitoGrabado != null}">
	<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="70%" cellpadding="0" cellspacing="0" id="tablaExitoGrabado">
		<tr>
			<td>
				<div id="exitoGrabado" class="alert alert-success"><b>${exitoGrabado}</b></div>
			</td>
		</tr>
	</table>
</c:if>	
<!-- Estilo Nuevo -->

<%-- 
<table border="0" class="cuadrado" align="center" width="70%"
	cellpadding="2">
	<tr>
		<td class="azulAjustado">Modificación de Obras Sociales</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td>
			<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">
				<tr>
					<td class="azulAjustado" width="40%">Nombre</td>
					<td class="azulAjustado" width="40%">Valor Unidad Bioquímica</td>
					<td class="azulAjustado"></td>
				</tr>
				<%String clase=""; %>
				<c:forEach items="${obrasSociales}" var="obraSocial" varStatus="i">
					<%clase=(clase.equals("")?"par":""); %>

					<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${i.index}'></c:out>');"
						onmouseout="javascript:despintarFila('idTr<c:out value='${i.index}'></c:out>');"
						id="idTr<c:out value='${i.index}'></c:out>">					
										
						<td>${obraSocial.nombre}</td>
						<td>${obraSocial.valorUnidadBioquimica}</td>
						<td>
							<a href="javascript:recuperarObraSocial(${obraSocial.id});">
								Seleccionar
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10"></td>
	</tr>	
</table>--%>

<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="70%" cellpadding="2">	
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">	
					<tr>
						<td class="tituloTabla">Modificación de Obras Sociales</td>
					</tr>
					<tr>
						<td height="20"></td>
					</tr>
					<tr>
						<td>
							<table border="0" class="cuadrado" align="center" width="70%" cellpadding="2">
								<tr>									
									<td class="subTituloTabla" width="40%">Nombre</td>
									<td class="subTituloTabla" width="40%">Valor Unidad Bioquímica</td>
									<td class="subTituloTabla"></td>
								</tr>
								<%String clase=""; %>
								<c:forEach items="${obrasSociales}" var="obraSocial" varStatus="i">
									<%clase=(clase.equals("")?"par":""); %>
				
									<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${i.index}'></c:out>');"
										onmouseout="javascript:despintarFila('idTr<c:out value='${i.index}'></c:out>');"
										id="idTr<c:out value='${i.index}'></c:out>">					
														
										<td>${obraSocial.nombre}</td>
										<td>${obraSocial.valorUnidadBioquimica}</td>
										<td>
											<a href="javascript:recuperarObraSocial(${obraSocial.id});">
												Seleccionar
											</a>
										</td>
									</tr>
								</c:forEach>
							</table>
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