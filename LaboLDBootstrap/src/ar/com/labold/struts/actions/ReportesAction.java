package ar.com.labold.struts.actions;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.labold.fachada.ReportesFachada;
import ar.com.labold.utils.MyLogger;

public class ReportesAction extends ValidadorAction {

	public ActionForward generarReporteEstudiosARealizarEntreFechas(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		try {
			String path = request.getSession().getServletContext()
					.getRealPath("jasper");

			WebApplicationContext ctx = getWebApplicationContext();
			ReportesFachada reportesFachada = (ReportesFachada) ctx.getBean("reportesFachada");
			
			String fechaDesde = request.getParameter("fechaDesde");
			String fechaHasta = request.getParameter("fechaHasta");
			
			byte[] bytes = reportesFachada
					.generarReporteEstudiosARealizarEntreFechas(path,fechaDesde,fechaHasta);

			// Lo muestro en la salida del response
			response.setContentType("application/pdf");
			ServletOutputStream out = response.getOutputStream();
			out.write(bytes, 0, bytes.length);
			out.flush();

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			return mapping.findForward("errorSinMenu");
		}

		return null;
	}

	public ActionForward generarReporteEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		try {
			String path = request.getSession().getServletContext()
					.getRealPath("jasper");

			WebApplicationContext ctx = getWebApplicationContext();
			ReportesFachada reportesFachada = (ReportesFachada) ctx.getBean("reportesFachada");
			
			String idEstudio = request.getParameter("idEstudio");
			
			byte[] bytes = reportesFachada
					.generarReporteEstudio(path,Long.valueOf(idEstudio));

			// Lo muestro en la salida del response
			response.setContentType("application/pdf");
			ServletOutputStream out = response.getOutputStream();
			out.write(bytes, 0, bytes.length);
			out.flush();

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			return mapping.findForward("errorSinMenu");
		}

		return null;
	}	
	
	public ActionForward generarReportesEstudios(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		try {
			String path = request.getSession().getServletContext()
					.getRealPath("jasper");

			WebApplicationContext ctx = getWebApplicationContext();
			ReportesFachada reportesFachada = (ReportesFachada) ctx.getBean("reportesFachada");
			
			String desde = request.getParameter("desde");
			String hasta = request.getParameter("hasta");
			
			byte[] bytes = reportesFachada
					.generarReportesEstudios(path,Long.valueOf(desde),Long.valueOf(hasta));

			// Lo muestro en la salida del response
			response.setContentType("application/pdf");
			ServletOutputStream out = response.getOutputStream();
			out.write(bytes, 0, bytes.length);
			out.flush();

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			return mapping.findForward("errorSinMenu");
		}

		return null;
	}	
	
	public ActionForward generarReporteFacturacionEntreFechas(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		try {
			String path = request.getSession().getServletContext()
					.getRealPath("jasper");

			WebApplicationContext ctx = getWebApplicationContext();
			ReportesFachada reportesFachada = (ReportesFachada) ctx.getBean("reportesFachada");
			
			String fechaDesde = request.getParameter("fechaDesde");
			String fechaHasta = request.getParameter("fechaHasta");
			
			byte[] bytes = reportesFachada
					.generarReporteFacturacionEntreFechas(path,fechaDesde,fechaHasta);

			// Lo muestro en la salida del response
			response.setContentType("application/pdf");
			ServletOutputStream out = response.getOutputStream();
			out.write(bytes, 0, bytes.length);
			out.flush();

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			return mapping.findForward("errorSinMenu");
		}

		return null;
	}	
	
	public ActionForward generarReporteFacturacionEntreFechasPorObraSocial(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		try {
			String path = request.getSession().getServletContext()
					.getRealPath("jasper");

			WebApplicationContext ctx = getWebApplicationContext();
			ReportesFachada reportesFachada = (ReportesFachada) ctx.getBean("reportesFachada");
			
			String fechaDesde = request.getParameter("fechaDesde");
			String fechaHasta = request.getParameter("fechaHasta");
			
			byte[] bytes = reportesFachada
					.generarReporteFacturacionEntreFechasPorObraSocial(path,fechaDesde,fechaHasta);

			// Lo muestro en la salida del response
			response.setContentType("application/pdf");
			ServletOutputStream out = response.getOutputStream();
			out.write(bytes, 0, bytes.length);
			out.flush();

		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			return mapping.findForward("errorSinMenu");
		}

		return null;
	}
	
	public ActionForward generarReporteFacturacionPorAnio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		try {
			String path = request.getSession().getServletContext()
					.getRealPath("jasper");

			WebApplicationContext ctx = getWebApplicationContext();
			ReportesFachada reportesFachada = (ReportesFachada) ctx.getBean("reportesFachada");
			
			byte[] bytes = reportesFachada
					.generarReporteFacturacionPorAnio();

			// Lo muestro en la salida del response
			response.setContentType("application/pdf");
			ServletOutputStream out = response.getOutputStream();
			out.write(bytes, 0, bytes.length);
			out.flush();

			
			//reportesFachada.generarReporteFacturacionPorAnio();
			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			return mapping.findForward("errorSinMenu");
		}

		return null;
	}	
}
