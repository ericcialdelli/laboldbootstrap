package ar.com.labold.struts.actions;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.util.StringUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.struts.DispatchActionSupport;

import ar.com.labold.utils.MyLogger;
import ar.com.labold.dto.UsuarioDTO;
import ar.com.labold.fachada.MenuFachada;
import ar.com.labold.negocio.ItemMenu;
import ar.com.labold.utils.ComparadorItemsMenu;
import ar.com.labold.utils.ComparadorItemsMenuOrden;
import ar.com.labold.utils.Constantes;
import ar.com.labold.utils.MenuJSCook;

public class MenuAction extends DispatchActionSupport {

	@SuppressWarnings("unchecked")
	public ActionForward getMenu(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {

			UsuarioDTO usuario = (UsuarioDTO) request.getSession().getAttribute(
					Constantes.USER_LABEL_SESSION);

			WebApplicationContext ctx = getWebApplicationContext();
			MenuFachada menuFachada = (MenuFachada) ctx.getBean("menuFachada");

			String jsMenu = (String) request.getSession().getAttribute(usuario.getRol().getRol());

			if (jsMenu == null) {
				List<ItemMenu> menu = menuFachada.getItemsMenu(usuario.getRol().getRol());
				Collections.sort(menu);

				jsMenu = MenuJSCook.getJs(menu);

				request.getSession().setAttribute(usuario.getRol().getRol(), jsMenu);
			}

			List<String> rolesString = new ArrayList<String>();
			rolesString.add(usuario.getRol().getRol());
			String username = usuario.getNombreUsuario();
			String rolesStr = StringUtils.collectionToCommaDelimitedString(rolesString);

			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("ISO-8859-1");

			out.write(jsMenu + "@" + username + "@" + rolesStr + "@" + "1.0");
			out.flush();

			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("roles", rolesStr);

		} catch (Throwable e) {
			MyLogger.logError(e);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward cargarMenu(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			
			UsuarioDTO usuario = (UsuarioDTO) request.getSession().getAttribute(
					Constantes.USER_LABEL_SESSION);			
			WebApplicationContext ctx = getWebApplicationContext();
			MenuFachada menuFachada = (MenuFachada) ctx.getBean("menuFachada");
			List<ItemMenu> listaMenues = menuFachada.getItemsMenu(usuario.getRol().getRol());
			Collections.sort(listaMenues, new ComparadorItemsMenuOrden());
			request.setAttribute("listaMenu", listaMenues);
		} catch (Throwable e) {
			MyLogger.logError(e);
		}
		return mapping.findForward("cargarMenu");
	}
	
}
