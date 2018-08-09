package ar.com.labold.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.labold.fachada.MedicoFachada;
import ar.com.labold.fachada.ObraSocialFachada;
import ar.com.labold.negocio.Medico;
import ar.com.labold.negocio.ObraSocial;
import ar.com.labold.struts.actions.forms.MedicoForm;
import ar.com.labold.struts.actions.forms.ObraSocialForm;
import ar.com.labold.struts.utils.Validator;
import ar.com.labold.utils.Constantes;
import ar.com.labold.utils.MyLogger;

public class MedicoAction extends ValidadorAction {

	public ActionForward altaMedico(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String strForward = "exitoAltaMedico";
		try {
			
			MedicoForm medicoForm = (MedicoForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			MedicoFachada medicoFachada = (MedicoFachada)ctx.getBean("medicoFachada");			
			
			// valido nuevamente por seguridad.  
			if (!validarMedicoForm(new StringBuffer(), medicoForm)) {
				throw new Exception("Error de Seguridad");
			}			
			
			medicoFachada.altaMedico(medicoForm.getMedicoDTO());
			request.setAttribute("exitoGrabado", Constantes.EXITO_ALTA_MEDICO);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarMedicos(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarMedicos";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			MedicoFachada medicoFachada = (MedicoFachada)ctx.getBean("medicoFachada");
						
			List<Medico> listaMedicos = medicoFachada.getMedicos();
			
			request.setAttribute("medicos", listaMedicos);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarMedico(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarMedico";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			MedicoFachada medicoFachada = (MedicoFachada)ctx.getBean("medicoFachada");
			
			String idMedico = request.getParameter("id");			
			Medico medico = medicoFachada.getMedico(Long.valueOf(idMedico));
			
			request.setAttribute("medico", medico);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	public ActionForward modificacionMedico(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String strForward = "exitoModificacionMedico";
		try {
			MedicoForm medicoForm = (MedicoForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			MedicoFachada medicoFachada = (MedicoFachada)ctx.getBean("medicoFachada");			
			
			// valido nuevamente por seguridad.  
			if (!validarMedicoForm(new StringBuffer(), medicoForm)) {
				throw new Exception("Error de Seguridad");
			}			
			
			medicoFachada.modificacionMedico(medicoForm.getMedicoDTO());
			request.setAttribute("exitoGrabado", Constantes.EXITO_MODIFICACION_MEDICO);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}
		return mapping.findForward(strForward);
	}	
	
	public boolean validarMedicoForm(StringBuffer error, ActionForm form) {
		try {
			MedicoForm medicoForm = (MedicoForm)form;
			WebApplicationContext ctx = getWebApplicationContext();
			MedicoFachada medicoFachada = (MedicoFachada)ctx.getBean("medicoFachada");
			boolean existe = false;
			boolean b1 = Validator.requerido(medicoForm.getMedicoDTO().getNombre(),"Nombre", error);
			boolean b2 = Validator.requerido(medicoForm.getMedicoDTO().getApellido(),"Apellido", error);
			
			if(!medicoForm.getMedicoDTO().getMatricula().equals("")){
				existe = medicoFachada.existeMedico(medicoForm.getMedicoDTO());
				if (existe) {
					Validator.addErrorXML(error, Constantes.EXISTE_MEDICO);
				}
			}	
			return !existe && b1 && b2;

		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado - "+t.getMessage());
			return false;
		}

	}	
}
