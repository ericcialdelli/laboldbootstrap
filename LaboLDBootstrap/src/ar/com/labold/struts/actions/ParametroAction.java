package ar.com.labold.struts.actions;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.labold.fachada.ParametroFachada;
import ar.com.labold.negocio.Parametro;
import ar.com.labold.struts.actions.forms.ParametroForm;
import ar.com.labold.utils.MyLogger;

public class ParametroAction extends ValidadorAction {

	@SuppressWarnings("unchecked")
	public ActionForward mostrarModificarParametros(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoMostrarModificarParametros";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			ParametroFachada parametroFachada = (ParametroFachada)ctx.getBean("parametroFachada");
			
			List<Parametro> listaParametros = parametroFachada.getParametros();
			
			request.setAttribute("listaParametros", listaParametros);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	

	@SuppressWarnings("unchecked")
	public ActionForward modificarParametros(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoModificarParametros";

		try {
			ParametroForm parametroForm = (ParametroForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			ParametroFachada parametroFachada = (ParametroFachada)ctx.getBean("parametroFachada");
			
			parametroFachada.modificarParametros(parametroForm.getParametro());
			request.setAttribute("exitoGrabado", "El parametro se ha modificado con exito");			

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		
}
