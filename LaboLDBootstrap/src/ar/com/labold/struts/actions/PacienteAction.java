package ar.com.labold.struts.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.labold.utils.Constantes;
import ar.com.labold.utils.MyLogger;
import ar.com.labold.dto.PacienteDTO;
import ar.com.labold.fachada.ObraSocialFachada;
import ar.com.labold.fachada.PacienteFachada;
import ar.com.labold.negocio.Paciente;
import ar.com.labold.struts.actions.forms.PacienteForm;
import ar.com.labold.struts.utils.Validator;

public class PacienteAction extends ValidadorAction {

	@SuppressWarnings("unchecked")
	public ActionForward cargarAltaPaciente(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargaAltaPaciente";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			ObraSocialFachada obraSocialFachada = (ObraSocialFachada) ctx.getBean("obraSocialFachada");
			
			request.setAttribute("obrasSociales", obraSocialFachada.getObrasSociales());
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward altaPaciente(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoAltaPaciente";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PacienteFachada pacienteFachada = (PacienteFachada) ctx.getBean("pacienteFachada");
			
			PacienteForm pacienteForm = (PacienteForm)form;
			
			// valido nuevamente por seguridad.  
			if (!validarPacienteForm(new StringBuffer(), pacienteForm)) {
				throw new Exception("Error de Seguridad");
			}						
			pacienteFachada.altaPaciente(pacienteForm.getPacienteDTO());
			
			request.setAttribute("exitoGrabado", Constantes.EXITO_ALTA_PACIENTE);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	/*@SuppressWarnings("unchecked")
	public ActionForward altaPacienteDesdeAltaEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		StringBuffer nodo = Validator.abrirXML();
		PrintWriter out = null;
		
		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PacienteFachada pacienteFachada = (PacienteFachada) ctx.getBean("pacienteFachada");
			
			PacienteForm pacienteForm = (PacienteForm)form;
			
			// valido nuevamente por seguridad.  
			if (!validarPacienteForm(new StringBuffer(), pacienteForm)) {
				throw new Exception("Error de Seguridad");
			}						
			Paciente paciente = pacienteFachada.altaPaciente(pacienteForm.getPacienteDTO());
			nodo.append("\n" + "<id>" + paciente.getId() + "</id>");
			nodo.append("\n" + "<nombre>" + paciente.getApellido()+","+paciente.getNombre() + "</nombre>");
			Validator.cerrarXML(nodo);
			
		} catch (Throwable t) {
			
			nodo = new StringBuffer(Validator.XML_HEADER);
			Validator.addErrorXML(nodo, "ValidadorAction :" + t.getCause() + "|" + t.getMessage());	
			
		} finally {
			try {
				out = response.getWriter();
			} catch (IOException e) {}
			
			out.write(nodo.toString());
			response.setContentType("text/xml");
		}
		return null;
	}*/	
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarPacientes(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarPacientes";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PacienteFachada pacienteFachada = (PacienteFachada) ctx.getBean("pacienteFachada");
			
			String forward = request.getParameter("forward");
			List<Paciente> listaPacientes = pacienteFachada.getPacientes();
			
			request.setAttribute("listaPacientes", listaPacientes);
			request.setAttribute("forward", forward);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	

	@SuppressWarnings("unchecked")
	public ActionForward recuperarPaciente(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarPaciente";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PacienteFachada pacienteFachada = (PacienteFachada) ctx.getBean("pacienteFachada");
			ObraSocialFachada obraSocialFachada = (ObraSocialFachada) ctx.getBean("obraSocialFachada");
			
			String idPaciente = request.getParameter("id");
			String forward = request.getParameter("forward");
			Paciente paciente = pacienteFachada.getPaciente(Long.valueOf(idPaciente));
			
			request.setAttribute("obrasSociales", obraSocialFachada.getObrasSociales());
			request.setAttribute("paciente", paciente);
			request.setAttribute("forward", forward);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		
	
	@SuppressWarnings("unchecked")
	public ActionForward modificacionPaciente(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoModificacionPaciente";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PacienteFachada pacienteFachada = (PacienteFachada) ctx.getBean("pacienteFachada");
			
			PacienteForm pacienteForm = (PacienteForm)form;
			
			// valido nuevamente por seguridad.  
			if (!validarPacienteForm(new StringBuffer(), pacienteForm)) {
				throw new Exception("Error de Seguridad");
			}						
			pacienteFachada.modificacionPaciente(pacienteForm.getPacienteDTO());
			
			request.setAttribute("exitoGrabado", Constantes.EXITO_MODIFICACION_PACIENTE);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		
	
	@SuppressWarnings("unchecked")
	public ActionForward eliminarPaciente(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoEliminarPaciente";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PacienteFachada pacienteFachada = (PacienteFachada) ctx.getBean("pacienteFachada");
			
			PacienteForm pacienteForm = (PacienteForm)form;
						
			pacienteFachada.eliminarPaciente(pacienteForm.getPacienteDTO());
			
			request.setAttribute("exitoGrabado", "El Paciente "+ pacienteForm.getPacienteDTO().getNombre() + ", "+ pacienteForm.getPacienteDTO().getApellido() +" se ha eliminado ");
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	public boolean validarPacienteForm(StringBuffer error, ActionForm form) {
		
		try{
			WebApplicationContext ctx = getWebApplicationContext();
			PacienteFachada pacienteFachada = (PacienteFachada) ctx.getBean("pacienteFachada");
			PacienteForm pacienteForm = (PacienteForm)form;
			PacienteDTO paciente = pacienteForm.getPacienteDTO();
			
			boolean ok = true;
			boolean ok1 = true;
			boolean ok2 = true;
			boolean ok3 = true;
			boolean ok4 = true;
			boolean ok5 = true;
			boolean ok6 = true;
			
			ok = Validator.requerido(paciente.getNombre(),"Nombre", error);
			ok1 = Validator.requerido(paciente.getApellido(),"Apellido", error);
			//ok2 = Validator.requerido(paciente.getFechaNacimiento(),"Fecha de Nacimiento", error);
			//if(ok2){
			if(pacienteForm.getPacienteDTO().getFechaNacimiento()!=null && !pacienteForm.getPacienteDTO().getFechaNacimiento().equals("")){
				ok2 = Validator.validarFechaValida(pacienteForm.getPacienteDTO().getFechaNacimiento(),"Fecha de Nacimiento",error);
			}	
			ok3 = Validator.validarEnteroMayorQue(-1, String.valueOf(paciente.getDni()), "DNI", error);
			
			if(ok3 && paciente.getDni()>0){
				if(pacienteFachada.existePaciente(paciente.getDni(), paciente.getId())){
					Validator.addErrorXML(error, Constantes.EXISTE_PACIENTE);
					ok3=false;
				}
			}
			
			//ok4 = Validator.requerido(paciente.getDireccion(),"Dirección", error);
			//ok5 = Validator.requerido(paciente.getTelefono(),"Telefono", error);
			ok6 = Validator.validarComboRequeridoSinNull("-1",Long.toString(paciente.getObraSocial().getId()),
					 																		"Obra Social",error);
			
			
			
			return ok && ok1 && ok2 && ok3 && ok4 && ok5 && ok6;
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado - "+t.getMessage());
			return false;
		}
	}
}
