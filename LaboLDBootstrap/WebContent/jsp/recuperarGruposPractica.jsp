<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script type="text/javascript"
	src="<html:rewrite page='/js/validacionAjax.js'/>"></script>
<script type="text/javascript"
	src="<html:rewrite page='/js/funcUtiles.js'/>"></script>
<script type="text/javascript">

	var clase;
	function pintarFila(idTr){
		
		clase = $('#'+idTr).attr("class");
		$('#'+idTr).removeClass(clase);
		//$('#'+idTr).addClass("verdeSeleccionFila");
		$('#'+idTr).addClass("verdeSeleccionFilaLista");
	}
	
	function despintarFila(idTr){
		
		$('#'+idTr).addClass(clase);
		//$('#'+idTr).removeClass("verdeSeleccionFila");
		$('#'+idTr).removeClass("verdeSeleccionFilaLista");
	}

	function recuperarGrupo(id){

		parent.location=contextRoot() + "/grupoPractica.do?metodo=recuperarGrupoPractica&id="+id;
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
						<td colspan="2">
							<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
								<tr>
									<td class="subTituloTabla">Nombre</td>
									<td class="subTituloTabla"></td>
								</tr>
								<%String clase=""; %>
								<c:forEach items="${listaGrupos}" var="grupo" varStatus="i">
									<%clase=(clase.equals("")?"par":""); %>
				
									<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${i.index}'></c:out>');"
										onmouseout="javascript:despintarFila('idTr<c:out value='${i.index}'></c:out>');"
										id="idTr<c:out value='${i.index}'></c:out>">					
														
										<td>${grupo.nombre}</td>
										<td>
											<a href="javascript:recuperarGrupo(${grupo.id});">
												Seleccionar
											</a>
										</td>
									</tr>
								</c:forEach>
							</table>
						</td>
					</tr>
					<tr>
						<td height="10" colspan="2"></td>
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
						<td colspan="2" class="tituloTablaBoots">
							Modificacion de Grupo Pr�ctica
						</td>
					</tr>
					<tr>
						<td height="20" colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2">
							<table border="0" class="cuadradoLista" align="center" width="60%" cellpadding="2">
								<tr>
									<td class="subTituloTabla rounded-left">Nombre</td>
									<td class="subTituloTabla rounded-right"></td>
								</tr>
								<%String clase=""; %>
								<c:forEach items="${listaGrupos}" var="grupo" varStatus="i">
									<%clase=(clase.equals("")?"par":""); %>
				
									<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${i.index}'></c:out>');"
										onmouseout="javascript:despintarFila('idTr<c:out value='${i.index}'></c:out>');"
										id="idTr<c:out value='${i.index}'></c:out>">					
														
										<td>${grupo.nombre}</td>
										<td>
											<a href="javascript:recuperarGrupo(${grupo.id});">
												Seleccionar
											</a>
										</td>
									</tr>
								</c:forEach>
							</table>
						</td>
					</tr>
					<tr>
						<td height="10" colspan="2"></td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
	</table>	
