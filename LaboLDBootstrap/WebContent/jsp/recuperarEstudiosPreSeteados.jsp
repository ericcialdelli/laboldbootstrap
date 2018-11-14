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
		$('#'+idTr).addClass("verdeSeleccionFila");		
	}
	
	function despintarFila(idTr){
		
		$('#'+idTr).addClass(clase);
		$('#'+idTr).removeClass("verdeSeleccionFila");
	}

	function recuperarEstudioPreSeteado(id){

		parent.location=contextRoot() + "/estudioPreSeteado.do?metodo=recuperarEstudioPreSeteado&id="+id+"&forward="+"${forward}";
	}	
</script>
	
<!--  <div id="exitoGrabado" class="verdeExito">${exitoGrabado}</div>-->
	
	<c:if test="${exitoGrabado != null}">
		<table border="0" class="cuadradoSinBordeBootstrap" align="center" width="60%" cellpadding="2" cellspacing="0">
			<tr>
				<td>
					<div class="alert alert-success">
					  <strong>${exitoGrabado}</strong>
					</div>
				</td>
			</tr>
		</table>		
	</c:if>

	<%-- 
	<table border="0" class="cuadrado" align="center" width="60%"
		cellpadding="2">
		<tr>
			<td colspan="2" class="azulAjustado">			
				<c:if test="${forward=='modificacionEstudioPreSeteado'}">
					Modificacion de Estudio Pre Seteado
				</c:if>
				<c:if test="${forward=='eliminarEstudioPreSeteado'}">
					Eliminar Estudio Pre Seteado
				</c:if>										
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2"></td>
		</tr>
		<tr>
			<td colspan="2">
				<table border="0" class="cuadrado" align="center" width="60%" cellpadding="2">
					<tr>
						<td class="azulAjustado">Nombre</td>
						<td class="azulAjustado"></td>
					</tr>
					<%String clase=""; %>
					<c:forEach items="${listaEstudiosPreSeteados}" var="estudio" varStatus="i">
						<%clase=(clase.equals("")?"par":""); %>
	
						<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${i.index}'></c:out>');"
							onmouseout="javascript:despintarFila('idTr<c:out value='${i.index}'></c:out>');"
							id="idTr<c:out value='${i.index}'></c:out>">					
											
							<td>${estudio.nombre}</td>
							<td>
								<a href="javascript:recuperarEstudioPreSeteado(${estudio.idEstudioPreSeteado});">
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
	</table>--%>
	
<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="60%" cellpadding="2">	
	<tr>
		<td>
			<div class="well-sm-bootstrap well-bootstrap">	
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="2">
					<tr>
						<td colspan="2" class="tituloTabla">			
							<c:if test="${forward=='modificacionEstudioPreSeteado'}">
								Modificacion de Estudio Pre Seteado
							</c:if>
							<c:if test="${forward=='eliminarEstudioPreSeteado'}">
								Eliminar Estudio Pre Seteado
							</c:if>										
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
								<c:forEach items="${listaEstudiosPreSeteados}" var="estudio" varStatus="i">
									<%clase=(clase.equals("")?"par":""); %>
				
									<tr class="<%=clase%>" onmouseover="javascript:pintarFila('idTr<c:out value='${i.index}'></c:out>');"
										onmouseout="javascript:despintarFila('idTr<c:out value='${i.index}'></c:out>');"
										id="idTr<c:out value='${i.index}'></c:out>">					
														
										<td>${estudio.nombre}</td>
										<td>
											<a href="javascript:recuperarEstudioPreSeteado(${estudio.idEstudioPreSeteado});">
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


