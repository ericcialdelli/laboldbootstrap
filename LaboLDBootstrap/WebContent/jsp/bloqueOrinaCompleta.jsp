<%@ taglib uri="http://struts.apache.org/tags-html"  prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

							<table border="0" class="cuadrado" align="left" width="100%" cellpadding="2" >
								<tr>
									<td width="5%">
									</td>
									<td colspan="3" class="negritaLeft">
										Examen Físico-Químico 								
									</td>							
								</tr>
								<tr>
									<td width="5%">
									</td>
									<td colspan="3">
										<table border="0" class="cuadrado" align="left" width="100%" cellpadding="2" >
											<tr>
												<td height="5" colspan="4"></td>
											</tr>
											
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Color
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[0].valoresPracticas[0].id}">
												</td>
												<td width="30%" align="left">
												
													<select name="listaValoresPractica[<%=i%>].valor" class="botonerab" 
															title="${map[grupo.valorSubItemPractica[0].valoresPracticas[0].practica.id]}">
															
														<c:forEach items="${listaColorOrina}" var="color">
															<c:choose>
																<c:when test="${grupo.valorSubItemPractica[0].valoresPracticas[0].valor == color.descripcion}">
																	<option value="${color.descripcion}" selected="selected"><c:out value='${color.descripcion}'/></option>
																</c:when>
																<c:otherwise>
																	<option value="${color.descripcion}"><c:out value='${color.descripcion}'/></option>
																</c:otherwise>
															</c:choose>																																																																		
														</c:forEach>
														
													</select>	
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Aspecto
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[0].valoresPracticas[1].id}">
												</td>
												<td width="30%" align="left">				
													<select name="listaValoresPractica[<%=i%>].valor" class="botonerab" 
															title="${map[grupo.valorSubItemPractica[0].valoresPracticas[1].practica.id]}">
															
														<c:forEach items="${listaAspectoOrina}" var="aspecto">
															<c:choose>
																<c:when test="${grupo.valorSubItemPractica[0].valoresPracticas[1].valor == aspecto.descripcion}">
																	<option value="${aspecto.descripcion}" selected="selected"><c:out value='${aspecto.descripcion}'/></option>
																</c:when>
																<c:otherwise>
																	<option value="${aspecto.descripcion}"><c:out value='${aspecto.descripcion}'/></option>
																</c:otherwise>
															</c:choose>																																																																		
														</c:forEach>
														
													</select>														
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Densidad
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[0].valoresPracticas[2].id}">
												</td>
												<td width="30%" align="left">
													<input type="text" size="25" class="botonerab" name="listaValoresPractica[<%=i%>].valor"
														value="${grupo.valorSubItemPractica[0].valoresPracticas[2].valor}" id="valor<%=i%>"
														title="${map[grupo.valorSubItemPractica[0].valoresPracticas[2].practica.id]}">
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>												
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													PH
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[0].valoresPracticas[3].id}">
												</td>
												<td width="30%" align="left">
													<input type="text" size="25" class="botonerab" name="listaValoresPractica[<%=i%>].valor"
														value="${grupo.valorSubItemPractica[0].valoresPracticas[3].valor}" id="valor<%=i%>"
														title="${map[grupo.valorSubItemPractica[0].valoresPracticas[3].practica.id]}">
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>												
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Proteínas
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[0].valoresPracticas[4].id}">
												</td>
												<td width="30%" align="left">														
													<select name="listaValoresPractica[<%=i%>].valor" class="botonerab" 
															title="${map[grupo.valorSubItemPractica[0].valoresPracticas[4].practica.id]}">
															
														<c:forEach items="${listaProteinasOrina}" var="proteina">
															<c:choose>
																<c:when test="${grupo.valorSubItemPractica[0].valoresPracticas[4].valor == proteina.descripcion}">
																	<option value="${proteina.descripcion}" selected="selected"><c:out value='${proteina.descripcion}'/></option>
																</c:when>
																<c:otherwise>
																	<option value="${proteina.descripcion}"><c:out value='${proteina.descripcion}'/></option>
																</c:otherwise>
															</c:choose>																																																																		
														</c:forEach>
														
													</select>														
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Nitritos
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[0].valoresPracticas[5].id}">
												</td>
												<td width="30%" align="left">

													<select name="listaValoresPractica[<%=i%>].valor" class="botonerab" 
															title="${map[grupo.valorSubItemPractica[0].valoresPracticas[5].practica.id]}">
															
														<c:forEach items="${listaNitritosOrina}" var="nitritos">
															<c:choose>
																<c:when test="${grupo.valorSubItemPractica[0].valoresPracticas[5].valor == nitritos.descripcion}">
																	<option value="${nitritos.descripcion}" selected="selected"><c:out value='${nitritos.descripcion}'/></option>
																</c:when>
																<c:otherwise>
																	<option value="${nitritos.descripcion}"><c:out value='${nitritos.descripcion}'/></option>
																</c:otherwise>
															</c:choose>																																																																		
														</c:forEach>
														
													</select>															
														
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>											
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Cetonas
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[0].valoresPracticas[6].id}">
												</td>
												<td width="30%" align="left">											
													<select name="listaValoresPractica[<%=i%>].valor" class="botonerab" 
															title="${map[grupo.valorSubItemPractica[0].valoresPracticas[6].practica.id]}">
															
														<c:forEach items="${listaCetonasOrina}" var="cetonas">
															<c:choose>
																<c:when test="${grupo.valorSubItemPractica[0].valoresPracticas[6].valor == cetonas.descripcion}">
																	<option value="${cetonas.descripcion}" selected="selected"><c:out value='${cetonas.descripcion}'/></option>
																</c:when>
																<c:otherwise>
																	<option value="${cetonas.descripcion}"><c:out value='${cetonas.descripcion}'/></option>
																</c:otherwise>
															</c:choose>																																																																		
														</c:forEach>
														
													</select>														
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>																									
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Urobilinógeno
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[0].valoresPracticas[7].id}">
												</td>
												<td width="30%" align="left">
													<select name="listaValoresPractica[<%=i%>].valor" class="botonerab" 
															title="${map[grupo.valorSubItemPractica[0].valoresPracticas[7].practica.id]}">
															
														<c:forEach items="${listaUrobilinogenoOrina}" var="urobilinogeno">
															<c:choose>
																<c:when test="${grupo.valorSubItemPractica[0].valoresPracticas[7].valor == urobilinogeno.descripcion}">
																	<option value="${urobilinogeno.descripcion}" selected="selected"><c:out value='${urobilinogeno.descripcion}'/></option>
																</c:when>
																<c:otherwise>
																	<option value="${urobilinogeno.descripcion}"><c:out value='${urobilinogeno.descripcion}'/></option>
																</c:otherwise>
															</c:choose>																																																																		
														</c:forEach>
														
													</select>															
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>														
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Pigmentos Biliares
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[0].valoresPracticas[8].id}">
												</td>
												<td width="30%" align="left">
														
													<select name="listaValoresPractica[<%=i%>].valor" class="botonerab" 
															title="${map[grupo.valorSubItemPractica[0].valoresPracticas[8].practica.id]}">
															
														<c:forEach items="${listaPigmentosBiliaresOrina}" var="pigmentosBiliares">
															<c:choose>
																<c:when test="${grupo.valorSubItemPractica[0].valoresPracticas[8].valor == pigmentosBiliares.descripcion}">
																	<option value="${pigmentosBiliares.descripcion}" selected="selected"><c:out value='${pigmentosBiliares.descripcion}'/></option>
																</c:when>
																<c:otherwise>
																	<option value="${pigmentosBiliares.descripcion}"><c:out value='${pigmentosBiliares.descripcion}'/></option>
																</c:otherwise>
															</c:choose>																																																																		
														</c:forEach>
														
													</select>														
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>											
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Hematíes/Hb 
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[0].valoresPracticas[9].id}">
												</td>
												<td width="30%" align="left">
														
													<select name="listaValoresPractica[<%=i%>].valor" class="botonerab" 
															title="${map[grupo.valorSubItemPractica[0].valoresPracticas[9].practica.id]}">
															
														<c:forEach items="${listaHematiesHbOrina}" var="hematies">
															<c:choose>
																<c:when test="${grupo.valorSubItemPractica[0].valoresPracticas[9].valor == hematies.descripcion}">
																	<option value="${hematies.descripcion}" selected="selected"><c:out value='${hematies.descripcion}'/></option>
																</c:when>
																<c:otherwise>
																	<option value="${hematies.descripcion}"><c:out value='${hematies.descripcion}'/></option>
																</c:otherwise>
															</c:choose>																																																																		
														</c:forEach>
														
													</select>														
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>											
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Glucosa 
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[0].valoresPracticas[10].id}">
												</td>
												<td width="30%" align="left">
														
													<select name="listaValoresPractica[<%=i%>].valor" class="botonerab" 
															title="${map[grupo.valorSubItemPractica[0].valoresPracticas[10].practica.id]}">
															
														<c:forEach items="${listaGlucosaOrina}" var="glucosa">
															<c:choose>
																<c:when test="${grupo.valorSubItemPractica[0].valoresPracticas[10].valor == glucosa.descripcion}">
																	<option value="${glucosa.descripcion}" selected="selected"><c:out value='${glucosa.descripcion}'/></option>
																</c:when>
																<c:otherwise>
																	<option value="${glucosa.descripcion}"><c:out value='${glucosa.descripcion}'/></option>
																</c:otherwise>
															</c:choose>																																																																		
														</c:forEach>
														
													</select>														
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Sedimento 
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[0].valoresPracticas[11].id}">
												</td>
												<td width="30%" align="left">
														
													<select name="listaValoresPractica[<%=i%>].valor" class="botonerab" 
															title="${map[grupo.valorSubItemPractica[0].valoresPracticas[11].practica.id]}">
															
														<c:forEach items="${listaSedimentoOrina}" var="sedimento">
															<c:choose>
																<c:when test="${grupo.valorSubItemPractica[0].valoresPracticas[11].valor == sedimento.descripcion}">
																	<option value="${sedimento.descripcion}" selected="selected"><c:out value='${sedimento.descripcion}'/></option>
																</c:when>
																<c:otherwise>
																	<option value="${sedimento.descripcion}"><c:out value='${sedimento.descripcion}'/></option>
																</c:otherwise>
															</c:choose>																																																																		
														</c:forEach>
														
													</select>														
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>												
																																			
										</table>																															
									</td>							
								</tr>
								
								<tr>
									<td width="5%">
									</td>
									<td colspan="3" class="negritaLeft">
										Sedimento Urinario 								
									</td>							
								</tr>
								<tr>
									<td width="5%">
									</td>
									<td colspan="3">								
										<table border="0" class="cuadrado" align="left" width="100%" cellpadding="2" >
											<tr>
												<td height="5" colspan="4"></td>
											</tr>
											
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Células Epiteliales
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[1].valoresPracticas[0].id}">
												</td>
												<td width="30%" align="left">
														
													<select name="listaValoresPractica[<%=i%>].valor" class="botonerab" 
															title="${map[grupo.valorSubItemPractica[1].valoresPracticas[0].practica.id]}">
															
														<c:forEach items="${listaCelulasEpitelialesOrina}" var="celulas">
															<c:choose>
																<c:when test="${grupo.valorSubItemPractica[1].valoresPracticas[0].valor == celulas.descripcion}">
																	<option value="${celulas.descripcion}" selected="selected"><c:out value='${celulas.descripcion}'/></option>
																</c:when>
																<c:otherwise>
																	<option value="${celulas.descripcion}"><c:out value='${celulas.descripcion}'/></option>
																</c:otherwise>
															</c:choose>																																																																		
														</c:forEach>
														
													</select>														
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>											
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Leucocitos
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[1].valoresPracticas[1].id}">
												</td>
												<td width="30%" align="left">
													<input type="text" size="25" class="botonerab" name="listaValoresPractica[<%=i%>].valor"
														value="${grupo.valorSubItemPractica[1].valoresPracticas[1].valor}" id="valor<%=i%>"
														title="${map[grupo.valorSubItemPractica[1].valoresPracticas[1].practica.id]}">
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>											
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Microorganismos
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[1].valoresPracticas[2].id}">
												</td>
												<td width="30%" align="left">
													<input type="text" size="25" class="botonerab" name="listaValoresPractica[<%=i%>].valor"
														value="${grupo.valorSubItemPractica[1].valoresPracticas[2].valor}" id="valor<%=i%>"
														title="${map[grupo.valorSubItemPractica[1].valoresPracticas[2].practica.id]}">
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Piocitos
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[1].valoresPracticas[3].id}">
												</td>
												<td width="30%" align="left">
														
													<select name="listaValoresPractica[<%=i%>].valor" class="botonerab" 
															title="${map[grupo.valorSubItemPractica[1].valoresPracticas[3].practica.id]}">
															
														<c:forEach items="${listaPiocitosOrina}" var="piocitos">
															<c:choose>
																<c:when test="${grupo.valorSubItemPractica[1].valoresPracticas[3].valor == piocitos.descripcion}">
																	<option value="${piocitos.descripcion}" selected="selected"><c:out value='${piocitos.descripcion}'/></option>
																</c:when>
																<c:otherwise>
																	<option value="${piocitos.descripcion}"><c:out value='${piocitos.descripcion}'/></option>
																</c:otherwise>
															</c:choose>																																																																		
														</c:forEach>
														
													</select>														
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>											
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Mucus
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[1].valoresPracticas[4].id}">
												</td>
												<td width="30%" align="left">

													<select name="listaValoresPractica[<%=i%>].valor" class="botonerab" 
															title="${map[grupo.valorSubItemPractica[1].valoresPracticas[4].practica.id]}">
															
														<c:forEach items="${listaMucusOrina}" var="mucus">
															<c:choose>
																<c:when test="${grupo.valorSubItemPractica[1].valoresPracticas[4].valor == mucus.descripcion}">
																	<option value="${mucus.descripcion}" selected="selected"><c:out value='${mucus.descripcion}'/></option>
																</c:when>
																<c:otherwise>
																	<option value="${mucus.descripcion}"><c:out value='${mucus.descripcion}'/></option>
																</c:otherwise>
															</c:choose>																																																																		
														</c:forEach>
														
													</select>														
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>											
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Cristales
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[1].valoresPracticas[5].id}">
												</td>
												<td width="30%" align="left">
													<input type="text" size="25" class="botonerab" name="listaValoresPractica[<%=i%>].valor"
														value="${grupo.valorSubItemPractica[1].valoresPracticas[5].valor}" id="valor<%=i%>"
														title="${map[grupo.valorSubItemPractica[1].valoresPracticas[5].practica.id]}">
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>											
											<tr>											
												<td width="5%"></td>														
												<td align="left" width="15%">
													Hematíes
													<input type="hidden" name="listaValoresPractica[<%=i%>].id" value="${grupo.valorSubItemPractica[1].valoresPracticas[6].id}">
												</td>
												<td width="30%" align="left">
													<input type="text" size="25" class="botonerab" name="listaValoresPractica[<%=i%>].valor"
														value="${grupo.valorSubItemPractica[1].valoresPracticas[6].valor}" id="valor<%=i%>"
														title="${map[grupo.valorSubItemPractica[1].valoresPracticas[6].practica.id]}">
												</td>
												<td width="50%" align="left">
												</td>																												
											</tr>
											<%i++; %>												
											
										</table>
									</td>
								</tr>																										
							</table>
