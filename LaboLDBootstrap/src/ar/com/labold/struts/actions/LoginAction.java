package ar.com.labold.struts.actions;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.struts.DispatchActionSupport;

import ar.com.labold.negocio.exception.NegocioException;
import ar.com.labold.utils.Fecha;
import ar.com.labold.utils.MyLogger;
import ar.com.labold.dto.UsuarioDTO;
import ar.com.labold.exception.BackupException;
import ar.com.labold.fachada.LoginFachada;
import ar.com.labold.struts.actions.forms.LoginForm;
import ar.com.labold.utils.Constantes;

public class LoginAction extends DispatchActionSupport {

	@SuppressWarnings("unchecked")
	public ActionForward login(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoLogin";

		try {

			LoginForm loginForm = (LoginForm) form;

			String usuario = loginForm.getUsuario();
			String password = loginForm.getPassword();

			WebApplicationContext ctx = getWebApplicationContext();
			LoginFachada loginFachada = (LoginFachada) ctx.getBean("loginFachada");

			UsuarioDTO usrDTO = loginFachada.login(usuario, password);

			request.getSession().setAttribute(Constantes.USER_LABEL_SESSION, usrDTO);

			MyLogger.log("Se logueo el usuario: " + usrDTO.getNombreUsuario());
			
		} catch (NegocioException ne) {
			request.setAttribute("error", ne.getMessage());	
			strForward = "errorLogin";
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}

	@SuppressWarnings("unchecked")
	public ActionForward logout(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoLogout";

		try {

			HttpSession session = request.getSession();
			UsuarioDTO usrDTO = (UsuarioDTO)session.getAttribute(Constantes.USER_LABEL_SESSION);
			session.setAttribute(Constantes.USER_LABEL_SESSION, null);
			session.invalidate();
			
			MyLogger.log("Se deslogueo el usuario: " + usrDTO.getNombreUsuario());
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
}
