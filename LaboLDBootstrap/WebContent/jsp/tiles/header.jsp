<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="<html:rewrite page='/js/net.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/dwr/engine.js'/>"></script>
<script type="text/javascript" src="<html:rewrite page='/dwr/util.js'/>"></script>

<script type="text/javascript">
var timerID;

function callBack(){}

function llamadoAjaxNull(){		
    var url = '../../ajaxNull.do?metodo=returnNull'; 
    var loader1 = new net.ContentLoader(url,callBack,null,"POST",null);	
}

function arrancarAjaxTimer(){
   llamadoAjaxNull();
   timerID  = setTimeout("arrancarAjaxTimer()", 60000);
}
</script>

<BODY onload="arrancarAjaxTimer()">
<div>
<table class="header" border="0">

	<tr>
		<td width="20%" height="100%">
			<!--  <img height="80%" width="100%" src="../../imagenes/Arba.jpg">-->
			<img height="80%" width="100%" src="../../imagenes/logoLaboLD.jpg">	
		</td>
		<td width="60%" style="text-align: center; font-weight: bold"><jsp:useBean
			id="now" class="java.util.Date" /> <br>
			Usuario: <label id="usuario"></label> <br>
			Roles: <label id="roles"></label> <br>
		</td>
		 <td width="20%">
		 	<!-- <img src="../../imagenes/LaProvincia.jpg"> -->
		</td>
	</tr>	
	
</table>

</div>
</BODY>