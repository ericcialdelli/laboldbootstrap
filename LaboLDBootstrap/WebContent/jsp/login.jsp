<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<html>
<head>
<link rel="stylesheet" href="<html:rewrite page='/css/main.css'/>" type="text/css">
<link rel="stylesheet" href="<html:rewrite page='/css/jqueryslidemenu.css'/>" type="text/css">

<!-- Bootstrap core CSS -->
<!--  <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">-->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

</head>

<!--  <script type="text/javascript"
	src="<html:rewrite page='/js/JQuery/jquery-1.7.2.min.js'/>"></script>-->
	
	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	
<script>
	function darFoco(){
		if($('#idUsuario').val()==''){
			$('#idUsuario').focus();
		}else{
			if($('#password').val()==''){
				$('#password').focus();
			}else{
				$('#idAceptar').focus();
			}
		}
	}
</script>
</head>

<body onload="darFoco();">

<html:form action="login">
	<html:hidden property="metodo" value="login" />
	
	<!-- Estilo Viejo -->
<%--
	<table align="center" border="0" width="100%" height="100%">
		<tr>
			<td height="85%">
				<div id="errores" class="rojoAdvertencia">${error}</div>
				<br>
				<table class="cuadrado" border="0" width="40%" align="center">
					<tr>
						<td colspan="4" height="26em" align="center" class="azulAjustado">
							<CENTER>
								<b>Bienvenido</b>
							</CENTER>
						</td> 
					</tr>  
					<tr>
						<td height="15" colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td height="32" width="25%">
							<div align="right">
								<img src="<html:rewrite page='/imagenes/personitas.jpg'/>" width="33" height="32" alt="Roles">
							</div>
						</td>
						<td width="25%"><b>Usuario</b></td>
						<td align="left">
							<html:text styleId="idUsuario" property="usuario" styleClass="botonerab" size="15" value=""/>
						</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td height="32">
							<div align="right">
								<img src="<html:rewrite page='/imagenes/llaves.gif'/>" width="33" height="32" alt="Roles">
							</div>
						</td>
						<td><b>Contraseņa</b></td>
						<td align="left">
							<html:password property="password"	styleId="password" styleClass="botonerab" size="15" value=""></html:password>
						</td>
						<td>&nbsp;</td>
					</tr>
					
					<tr>
						<td height="15" colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="4" height="29" align="center">
							<html:submit styleId="idAceptar" styleClass="botonerab" value="Ingresar"></html:submit>
						</td>
					</tr>
					<tr>
						<td height="14" colspan="4">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="10%"></td>	
		</tr>	
	</table>
--%>		
			
	<!-- Estilo Nuevo -->		


	<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="40%" cellpadding="2" cellspacing="0" height="90%">
	<tr>
		<td>						
			<img class="mb-4" src="<html:rewrite page='/imagenes/logoLaboLD.jpg'/>" alt="" width="400" height="100">
			<br>
			<br>
			<h1 class="h3 mb-3 font-weight-normal"></h1>
			<div class="well-sm-bootstrap well-bootstrap">
				<table border="0" class="cuadradoSinBordeBootstrapSinFont" align="center" width="100%" cellpadding="4">
					<tr>
						<td height="30" colspan="3"></td>
					</tr>
					<tr>
						<td height="32" width="18%">
							<div align="right">
								<img src="<html:rewrite page='/imagenes/personitas.jpg'/>" width="33" height="32" alt="Roles">
							</div>
						</td>
						<td align="left">
							<!--<html:text styleId="idUsuario" property="usuario" styleClass="botonerab" size="15" value=""/>-->
							<input type="text" id="idUsuario" name="usuario" class="form-control" placeholder="Usuario" required autofocus>
						</td>
						<td width="10%">&nbsp;</td>
					</tr>					
					
					<tr>
						<td height="32">
							<div align="right">
								<img src="<html:rewrite page='/imagenes/llaves.gif'/>" width="33" height="32" alt="Roles">
							</div>
						</td>
						<td align="left">
							<!--<html:password property="password"	styleId="password" styleClass="botonerab" size="15" value=""></html:password>-->
							<input type="password" id="password" name="password" class="form-control" placeholder="Password" required autofocus>
						</td>
						<td>&nbsp;</td>
					</tr>									
					<tr>
						<td height="5" colspan="3"></td>
					</tr>
				</table>	

				<table border="0" class="cuadradoSinBorde" align="center" width="85%" cellpadding="2" cellspacing="0">
					<tr>
						<td height="10" colspan="3"></td>
					</tr>			
					<tr>
						<td width="10%"></td>
						<td align="center">							
							<html:submit styleId="idAceptar" styleClass="btn btn-lg btn-primary btn-block" value="Ingresar"></html:submit>
						</td>
						<td width="10%"></td>
					</tr>
					<tr>
						<td height="10" colspan="3"></td>
					</tr>									
				</table>
			</div>
			<c:if test="${error != null}">
				<div class="alert alert-danger">
				  <strong>${error}</strong>
				</div>
			</c:if>							
		</td>
	</tr>
	</table>				 
</html:form>

</body>
</html>
