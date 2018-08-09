package ar.com.labold.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.labold.fachada.ObraSocialFachada;
import ar.com.labold.fachada.PacienteFachada;
import ar.com.labold.negocio.ObraSocial;
import ar.com.labold.negocio.Paciente;
import ar.com.labold.struts.actions.forms.ObraSocialForm;
import ar.com.labold.utils.Constantes;
import ar.com.labold.utils.MyLogger;
import ar.com.labold.struts.utils.Validator;

public class ObraSocialAction extends ValidadorAction {

	public ActionForward altaObraSocial(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String strForward = "exitoAltaObraSocial";
		try {
			
			ObraSocialForm obraSocialForm = (ObraSocialForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			ObraSocialFachada obraSocialFachada = (ObraSocialFachada) 
									ctx.getBean("obraSocialFachada");			
			
			// valido nuevamente por seguridad.  
			if (!validarObraSocialForm(new StringBuffer(), obraSocialForm)) {
				throw new Exception("Error de Seguridad");
			}			
			
			obraSocialFachada.altaObraSocial(obraSocialForm.getObraSocialDTO());
			request.setAttribute("exitoGrabado", Constantes.EXITO_ALTA_OBRA_SOCIAL);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarObrasSociales(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarObrasSociales";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			ObraSocialFachada obraSocialFachada = (ObraSocialFachada) 
										ctx.getBean("obraSocialFachada");
						
			List<ObraSocial> listaObrasSociales = obraSocialFachada.getObrasSociales();
			
			request.setAttribute("obrasSociales", listaObrasSociales);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarObraSocial(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarObraSocial";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			ObraSocialFachada obraSocialFachada = (ObraSocialFachada) 
										ctx.getBean("obraSocialFachada");
			
			String idObraSocial = request.getParameter("id");			
			ObraSocial obraSocial = obraSocialFachada.getObraSocial(Long.valueOf(idObraSocial));
			
			request.setAttribute("obraSocial", obraSocial);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	public ActionForward modificacionObraSocial(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String strForward = "exitoModificacionObraSocial";
		try {
			
			ObraSocialForm obraSocialForm = (ObraSocialForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			ObraSocialFachada obraSocialFachada = (ObraSocialFachada) 
									ctx.getBean("obraSocialFachada");			
			
			// valido nuevamente por seguridad.  
			if (!validarObraSocialForm(new StringBuffer(), obraSocialForm)) {
				throw new Exception("Error de Seguridad");
			}			
			
			obraSocialFachada.modificacionObraSocial(obraSocialForm.getObraSocialDTO());
			request.setAttribute("exitoGrabado", Constantes.EXITO_MODIFICACION_OBRA_SOCIAL);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}		
	
	public boolean validarObraSocialForm(StringBuffer error, ActionForm form) {
		try {
			ObraSocialForm obraSocialForm = (ObraSocialForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			ObraSocialFachada obraSocialFachada = (ObraSocialFachada) 
									ctx.getBean("obraSocialFachada");
			
			boolean b1 = Validator.requerido(obraSocialForm.getObraSocialDTO().getNombre(),
																		"Nombre", error);			
			boolean existe = obraSocialFachada.existeObraSocial(obraSocialForm.getObraSocialDTO());
			if (existe) {
				Validator.addErrorXML(error, Constantes.EXISTE_OBRA_SOCIAL);
			}
			
			boolean ok1 = Validator.validarDoubleMayorQue(0, String.valueOf(obraSocialForm.getObraSocialDTO().getValorUnidadBioquimica()),
														  "Valor Unidad Bioquímica", error);			
			
			return !existe && b1 && ok1;

		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado - "+t.getMessage());
			return false;
		}

	}	
}
