package ar.com.labold.struts.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.labold.dto.EstudioDTO;
import ar.com.labold.dto.PracticaDTO;
import ar.com.labold.fachada.EstudioFachada;
import ar.com.labold.fachada.MedicoFachada;
import ar.com.labold.fachada.ObraSocialFachada;
import ar.com.labold.fachada.PacienteFachada;
import ar.com.labold.fachada.PracticaFachada;
import ar.com.labold.negocio.Estudio;
import ar.com.labold.negocio.EstudioPreSeteado;
import ar.com.labold.negocio.GrupoPractica;
import ar.com.labold.negocio.Medico;
import ar.com.labold.negocio.ObraSocial;
import ar.com.labold.negocio.Practica;
import ar.com.labold.negocio.ValorPractica;
import ar.com.labold.negocio.ValorSubItemPractica;
import ar.com.labold.negocio.ValoresEstudio;
import ar.com.labold.providers.ProviderDominio;
import ar.com.labold.struts.actions.forms.EstudioForm;
import ar.com.labold.struts.actions.forms.ValorUnidadFacturacionForm;
import ar.com.labold.struts.utils.Validator;
import ar.com.labold.utils.Constantes;
import ar.com.labold.utils.MyLogger;
import ar.com.labold.enums.AspectoOrina;
import ar.com.labold.enums.CelulasEpitelialesOrina;
import ar.com.labold.enums.CetonasOrina;
import ar.com.labold.enums.ColorOrina;
import ar.com.labold.enums.EstadoEstudio;
import ar.com.labold.enums.GlucosaOrina;
import ar.com.labold.enums.HematiesHbOrina;
import ar.com.labold.enums.MucusOrina;
import ar.com.labold.enums.NitritosOrina;
import ar.com.labold.enums.PigmentosBiliaresOrina;
import ar.com.labold.enums.PiocitosOrina;
import ar.com.labold.enums.ProteinasOrina;
import ar.com.labold.enums.SedimentoOrina;
import ar.com.labold.enums.UrobilinogenoOrina;
import ar.com.labold.fachada.ReportesFachada;

public class EstudioAction extends ValidadorAction {

	@SuppressWarnings("unchecked")
	public ActionForward cargarAltaEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargaAltaEstudio";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PacienteFachada pacienteFachada = (PacienteFachada) ctx.getBean("pacienteFachada");
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			PracticaFachada practicaFachada = (PracticaFachada) ctx.getBean("practicaFachada");
			ObraSocialFachada obraSocialFachada = (ObraSocialFachada) ctx.getBean("obraSocialFachada");
			MedicoFachada medicoFachada = (MedicoFachada) ctx.getBean("medicoFachada");
			
			request.setAttribute("obrasSociales", obraSocialFachada.getObrasSociales());						
			request.setAttribute("nroEstudio", estudioFachada.getProximoNroEstudio());
			request.setAttribute("pacientes", pacienteFachada.getPacientes());
			List<GrupoPractica> gruposPracticas = practicaFachada.getGruposPractica();
			request.setAttribute("gruposPracticas", gruposPracticas);
			request.setAttribute("medicos", medicoFachada.getMedicos());
									
			
			//PRESELECCION
			List<EstudioPreSeteado> listaEstudiosPreSeteados = practicaFachada.getEstudiosPreSeteados();
			request.setAttribute("listaEstudiosPreSeteados", listaEstudiosPreSeteados);				
			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward altaEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoAltaEstudio";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			EstudioForm estudioForm = (EstudioForm)form;
			estudioForm.normalizarListaPracticas();
			
			// valido nuevamente por seguridad.  
			if (!validarEstudioForm(new StringBuffer(), estudioForm)) {
				throw new Exception("Error de Seguridad");
			}						
			double unidadesFacturacion = estudioFachada.altaEstudio(estudioForm.getEstudioDTO(),estudioForm.getListaPracticas());
			
			request.setAttribute("exitoGrabado", Constantes.EXITO_ALTA_ESTUDIO+unidadesFacturacion+Constantes.EXITO_ALTA_ESTUDIO2);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		

	@SuppressWarnings("unchecked")
	public ActionForward cargarRecuperarEstudios(ActionMapping mapping,
											ActionForm form, HttpServletRequest request,
											HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarRecuperarEstudios";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PacienteFachada pacienteFachada = (PacienteFachada) ctx.getBean("pacienteFachada");
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			String forward = request.getParameter("forward");
			
			String titulo;
			
			if(forward.equals("recuperarEstudioParaModificacion")){
				titulo="Modificar Estudio";
			}else{
				if(forward.equals("recuperarEstudioParaConsulta")){
					titulo="Consulta de Estudios";
				}else{
					if(forward.equals("recuperarEstudioParaCompletar")){
						titulo="Completar Estudios";
					}else{
						if(forward.equals("recuperarEstudioEliminarPracticasParaFacturacion")){
							titulo="Eliminar Practicas de Estudio para Facturacion";
						}else{
							if(forward.equals("recuperarEstudioRestablecerPracticasParaFacturacion")){
								titulo="Restablecer Practicas de Estudio para Facturacion";
							}else{								
								if(forward.equals("recuperarEstudioAgregarPracticas")){
									titulo="Agregar Practicas a Estudio";
								}else{
									if(forward.equals("recuperarEstudioEliminarPracticas")){
										titulo="Eliminar Practicas de Estudio";
									}
									else{
										if(forward.equals("recuperarEstudioEntregarEstudio")){
											titulo="Entregar Estudio";
										}									
										else{
											titulo="Eliminar Estudio";
										}
									}	
								}								
							}							
								
						}	
					}										
				}
			}
			
			List<Estudio> listaUltimosEstudios = estudioFachada.recuperarUltimosEstudios();
			
			request.setAttribute("listaPacientes", pacienteFachada.getPacientes());
			request.setAttribute("forward", forward);
			request.setAttribute("titulo", titulo);
			request.setAttribute("listaUltimosEstudios", listaUltimosEstudios);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarEstudios(ActionMapping mapping,
											ActionForm form, HttpServletRequest request,
											HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstudios";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			String idPaciente = request.getParameter("idPaciente"); 

			List<Estudio> listaEstudios = estudioFachada.getEstudios(Long.valueOf(idPaciente));
			
			request.setAttribute("listaEstudios", listaEstudios);

		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarEstudioParaModificacion(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstudioParaModificacion";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			PacienteFachada pacienteFachada = (PacienteFachada) ctx.getBean("pacienteFachada");
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			MedicoFachada medicoFachada = (MedicoFachada) ctx.getBean("medicoFachada");
			
			String nroProtocolo = request.getParameter("nroProtocolo");			
			Estudio estudio = estudioFachada.getEstudioPorNroProtocolo(Long.valueOf(nroProtocolo));

			request.setAttribute("pacientes", pacienteFachada.getPacientes());
			request.setAttribute("medicos", medicoFachada.getMedicos());
			request.setAttribute("estudio", estudio);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	

	@SuppressWarnings("unchecked")
	public ActionForward recuperarEstudioParaConsulta(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstudioParaConsulta";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			String fechaDesde = request.getParameter("fechaDesde");
			String fechaHasta = request.getParameter("fechaHasta");
			String idMedico = request.getParameter("idMedico");
			String idObraSocial = request.getParameter("idObraSocial");
			
			String nroProtocolo = request.getParameter("nroProtocolo");			
			Estudio estudio = estudioFachada.getEstudioPorNroProtocolo(Long.valueOf(nroProtocolo));
			
			request.setAttribute("estudio", estudio);
			
			if(idMedico!=null){//Si se llamo desde 'recuperarEstudiosPorMedicoObraSocial'
				request.setAttribute("fechaDesde", fechaDesde);
				request.setAttribute("fechaHasta", fechaHasta);
				request.setAttribute("idMedico", idMedico);	
				request.setAttribute("idObraSocial", idObraSocial);
			}
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	

	@SuppressWarnings("unchecked")
	public ActionForward recuperarEstudioParaCompletar(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstudioParaCompletar";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			String nroProtocolo = request.getParameter("nroProtocolo");			
			Estudio estudio = estudioFachada.getEstudioPorNroProtocolo(Long.valueOf(nroProtocolo));
			
			request.setAttribute("estudio", estudio);
			Map<Long,String> map = estudioFachada.recuperarPracticasAnteriores(estudio.getPaciente().getId());
			request.setAttribute("map", map);
			request.setAttribute("estudioV", "asdasd\nasdasdsad");			
			
			request.setAttribute("listaColorOrina", ColorOrina.values());
			request.setAttribute("listaAspectoOrina", AspectoOrina.values());
			request.setAttribute("listaProteinasOrina", ProteinasOrina.values());
			request.setAttribute("listaNitritosOrina", NitritosOrina.values());		
			request.setAttribute("listaCetonasOrina", CetonasOrina.values());
			request.setAttribute("listaUrobilinogenoOrina", UrobilinogenoOrina.values());
			request.setAttribute("listaPigmentosBiliaresOrina", PigmentosBiliaresOrina.values());
			request.setAttribute("listaHematiesHbOrina", HematiesHbOrina.values());
			request.setAttribute("listaGlucosaOrina", GlucosaOrina.values());
			request.setAttribute("listaSedimentoOrina", SedimentoOrina.values());
			request.setAttribute("listaCelulasEpitelialesOrina", CelulasEpitelialesOrina.values());
			request.setAttribute("listaPiocitosOrina", PiocitosOrina.values());
			request.setAttribute("listaMucusOrina", MucusOrina.values());			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	

	@SuppressWarnings("unchecked")
	public ActionForward recuperarEstudioEliminarPracticasParaFacturacion(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstudioEliminarPracticasParaFacturacion";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			String nroProtocolo = request.getParameter("nroProtocolo");			
			Estudio estudio = estudioFachada.getEstudioPorNroProtocolo(Long.valueOf(nroProtocolo));
			
			request.setAttribute("estudio", estudio);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		

	@SuppressWarnings("unchecked")
	public ActionForward recuperarEstudioRestablecerPracticasParaFacturacion(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstudioRestablecerPracticasParaFacturacion";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			String nroProtocolo = request.getParameter("nroProtocolo");			
			Estudio estudio = estudioFachada.getEstudioPorNroProtocolo(Long.valueOf(nroProtocolo));
			
			request.setAttribute("estudio", estudio);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	
	@SuppressWarnings("unchecked")
	public ActionForward modificacionEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoModificacionEstudio";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			EstudioForm estudioForm = (EstudioForm)form;
			
			// valido nuevamente por seguridad.  
			if (!validarModificacionEstudioForm(new StringBuffer(), estudioForm)) {
				throw new Exception("Error de Seguridad");
			}
			
			estudioFachada.modificacionEstudio(estudioForm.getEstudioDTO());
			
			request.setAttribute("exitoGrabado", Constantes.EXITO_MODIFICACION_ESTUDIO);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward completarEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCompletarEstudio";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			EstudioForm estudioForm = (EstudioForm)form;
			
			/* valido nuevamente por seguridad.  
			if (!validarEstudioForm(new StringBuffer(), estudioForm)) {
				throw new Exception("Error de Seguridad");
			}*/
			
			estudioFachada.completarEstudio(estudioForm.getEstudioDTO(),estudioForm.getListaValoresPractica());
			
			request.setAttribute("exitoGrabado", Constantes.EXITO_COMPLETAR_ESTUDIO);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward completarEstudioParaReporte(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		PrintWriter out = null;
		try {
			ActionForm actionForm = (ActionForm) Class.forName("ar.com.labold.struts.actions.forms.EstudioForm").newInstance(); 
			BeanUtils.populate(actionForm, request.getParameterMap());			
			EstudioForm estudioForm = (EstudioForm)actionForm;
			
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");

			estudioFachada.completarEstudio(estudioForm.getEstudioDTO(),estudioForm.getListaValoresPractica());
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			
			StringBuffer error = Validator.abrirXML();
			//Validator.addErrorXML(error, "Error Inesperado");
			Validator.addErrorXML(error, "Error Inesperado - "+t.getMessage());					
			
			Validator.cerrarXML(error);
			
			try {
				out = response.getWriter();
			} catch (IOException e) {
			}
			out.write(error.toString());
			response.setContentType("text/xml");			
		}

		return null;
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward eliminarPracticasParaFacturacion(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoEliminarPracticasParaFacturacion";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			EstudioForm estudioForm = (EstudioForm)form;
			estudioForm.normalizarListaValoresPracticaDTO();
			
			estudioFachada.eliminarPracticasParaFacturacion(estudioForm.getEstudioDTO(),estudioForm.getListaValoresPracticaDTO());
			
			request.setAttribute("exitoGrabado", Constantes.EXITO_ELIMINAR_PRACTICA_PARA_FACTURACION);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	

	@SuppressWarnings("unchecked")
	public ActionForward restablecerPracticasParaFacturacion(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRestablecerPracticasParaFacturacion";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			EstudioForm estudioForm = (EstudioForm)form;
			estudioForm.normalizarListaValoresPracticaDTO();
			
			estudioFachada.restablecerPracticasParaFacturacion(estudioForm.getEstudioDTO(),estudioForm.getListaValoresPracticaDTO());
			
			request.setAttribute("exitoGrabado", Constantes.EXITO_RESTABLECER_PRACTICA_PARA_FACTURACION);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarValorUnidadFacturacion(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarValorUnidadFacturacion";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			double valor = estudioFachada.recuperarValorUnidadFacturacion();			
			request.setAttribute("valor", valor);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	

	@SuppressWarnings("unchecked")
	public ActionForward modificarValorUnidadFacturacion(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoModificarValorUnidadFacturacion";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			ValorUnidadFacturacionForm valorForm = (ValorUnidadFacturacionForm)form;
			
			estudioFachada.modificarValorUnidadFacturacion(valorForm.getValorUnidadFacturacion());			
			request.setAttribute("exitoGrabado", Constantes.EXITO_MODIFICAR_VALOR_UNIDAD_FACTURACION);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarEstudioAgregarPracticas(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstudioAgregarPracticas";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			PracticaFachada practicaFachada = (PracticaFachada) ctx.getBean("practicaFachada");			
			
			String nroProtocolo = request.getParameter("nroProtocolo");	
			
			Estudio estudio = estudioFachada.getEstudioPorNroProtocolo(Long.valueOf(nroProtocolo));
			Map<Long,Long> map = this.armarHashMap(estudio);
			System.out.println(estudio.getValoresEstudio().size());
			List<GrupoPractica> gruposPracticas = practicaFachada.getGruposPractica();
			
			request.setAttribute("gruposPracticas", gruposPracticas);						
			request.setAttribute("estudio", estudio);
			request.setAttribute("map", map);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	private Map<Long,Long> armarHashMap(Estudio estudio){
		
		Map<Long,Long> map = new HashMap<Long, Long>();
		for (ValoresEstudio ve : estudio.getValoresEstudio()) {
			//System.out.println("GRUPO: "+ve.getNombre());
			//System.out.println("");
			//System.out.println("	Practicas:");
			for (ValorPractica vp : ve.getValoresPracticas()) {
				//System.out.println("		"+vp.getPractica().getNombre());
				map.put(vp.getPractica().getId(), vp.getPractica().getId());
			}
			//System.out.println("");
			//System.out.println("	SubItems:");
			for (ValorSubItemPractica vsip : ve.getValorSubItemPractica()) {
				//System.out.println("		"+vsip.getNombre());
				for (ValorPractica vp2 : vsip.getValoresPracticas()) {
					//System.out.println("			"+vp2.getPractica().getNombre());
					map.put(vp2.getPractica().getId(), vp2.getPractica().getId());
				}
			}
			//System.out.println("");
			//System.out.println("-----------------------------------------------");
			//System.out.println("");
		}
		
		return map;
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward agregarPracticasAEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoAgregarPracticasAEstudio";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			EstudioForm estudioForm = (EstudioForm)form;
			estudioForm.normalizarListaPracticas();
						
			double unidadesFacturacion = estudioFachada.agregarPracticasAEstudio(estudioForm.getEstudioDTO(),estudioForm.getListaPracticas());
			
			request.setAttribute("exitoGrabado", "Se han agregado las Practicas al Estudio con Exito");//Constantes.EXITO_ALTA_ESTUDIO+unidadesFacturacion+Constantes.EXITO_ALTA_ESTUDIO2);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarEstudioEliminarPracticas(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstudioEliminarPracticas";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			String nroProtocolo = request.getParameter("nroProtocolo");			
			Estudio estudio = estudioFachada.getEstudioPorNroProtocolo(Long.valueOf(nroProtocolo));
			
			request.setAttribute("estudio", estudio);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward eliminarPracticasDeEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoEliminarPracticasDeEstudio";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			EstudioForm estudioForm = (EstudioForm)form;
			estudioForm.normalizarListaValoresPracticaDTO();
			
			estudioFachada.eliminarPracticasDeEstudio(estudioForm.getEstudioDTO(),estudioForm.getListaValoresPracticaDTO());
			
			request.setAttribute("exitoGrabado", Constantes.EXITO_ELIMINAR_PRACTICA_DE_ESTUDIO);			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarEstudioParaEliminar(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstudioParaEliminar";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			String nroProtocolo = request.getParameter("nroProtocolo");			
			Estudio estudio = estudioFachada.getEstudioPorNroProtocolo(Long.valueOf(nroProtocolo));
			
			request.setAttribute("estudio", estudio);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarEstudioEntregarEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstudioEntregarEstudio";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			String nroProtocolo = request.getParameter("nroProtocolo");			
			Estudio estudio = estudioFachada.getEstudioPorNroProtocolo(Long.valueOf(nroProtocolo));
			
			request.setAttribute("estudio", estudio);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward eliminarEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoEliminarEstudio";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			EstudioForm estudioForm = (EstudioForm)form;			
				
			estudioFachada.eliminarEstudio(estudioForm.getEstudioDTO().getId());
			//estudioFachada.pasarEstudiosAHistoricos("2014");
			
			request.setAttribute("exitoGrabado", "El Estudio n° "+estudioForm.getEstudioDTO().getNumero()+" se ha eliminado");
			
		} catch (Throwable t) {
			System.out.println(t);
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}		

	//ESTUDIO_HISTORICO
	@SuppressWarnings("unchecked")
	public ActionForward pasarEstudiosAHistorico(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoPasarEstudiosAHistorico";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			EstudioForm estudioForm = (EstudioForm)form;			
				
			estudioFachada.pasarEstudiosAHistoricos(estudioForm.getFechaDesde(),estudioForm.getFechaHasta());
			
			request.setAttribute("exitoGrabado", "Los Estudios fueron pasados al Historico con exito!");
			
		} catch (Throwable t) {
			System.out.println(t);
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	//RECUPERAR_ESTUDIO_HISTORICO
	@SuppressWarnings("unchecked")
	public ActionForward recuperarEstudiosDeHistorico(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstudiosDeHistorico";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			EstudioForm estudioForm = (EstudioForm)form;			
				
			estudioFachada.recuperarEstudiosDeHistorico(estudioForm.getFechaDesde(),estudioForm.getFechaHasta());
			
			request.setAttribute("exitoGrabado", "Los Estudios fueron recuperados del Historico con exito!");
			
		} catch (Throwable t) {
			System.out.println(t);
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	

	//ESTUDIO_HISTORICO_POR_NRO
	@SuppressWarnings("unchecked")
	public ActionForward pasarEstudiosAHistoricoPorNro(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoPasarEstudiosAHistoricoPorNro";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			EstudioForm estudioForm = (EstudioForm)form;			
				
			estudioFachada.pasarEstudiosAHistoricosPorNro(estudioForm.getNroDesde(),estudioForm.getNroHasta());
			
			request.setAttribute("exitoGrabado", "Los Estudios fueron pasados al Historico con exito!");
			
		} catch (Throwable t) {
			System.out.println(t);
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
		
	//ESTUDIO_HISTORICO_POR_NRO
	@SuppressWarnings("unchecked")
	public ActionForward recuperarEstudiosDeHistoricoPorNro(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstudiosDeHistoricoPorNro";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			EstudioForm estudioForm = (EstudioForm)form;			
				
			estudioFachada.recuperarEstudiosDeHistoricoPorNro(estudioForm.getNroDesde(),estudioForm.getNroHasta());
			
			request.setAttribute("exitoGrabado", "Los Estudios fueron recuperados del Historico con exito!");
			
		} catch (Throwable t) {
			System.out.println(t);
			MyLogger.logError(t);
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward cargarPresupuestoEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargaPresupuestoEstudio";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
						
			PracticaFachada practicaFachada = (PracticaFachada) ctx.getBean("practicaFachada");
																			
			List<GrupoPractica> gruposPracticas = practicaFachada.getGruposPractica();
			request.setAttribute("gruposPracticas", gruposPracticas);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward generarReportePresupuestoEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		try {			
			EstudioForm estudioForm = (EstudioForm)form;
			estudioForm.normalizarListaPracticas();
			EstudioDTO estudioDTO = estudioForm.getEstudioDTO();			
			
			String path = request.getSession().getServletContext()
					.getRealPath("jasper");

			WebApplicationContext ctx = getWebApplicationContext();
			ReportesFachada reportesFachada = (ReportesFachada) ctx.getBean("reportesFachada");
			PracticaFachada practicaFachada = (PracticaFachada) ctx.getBean("practicaFachada");
			
			List<Practica> listaPracticas = new ArrayList<Practica>(); 
			for (PracticaDTO practicaDTO : estudioForm.getListaPracticas()) {
				listaPracticas.add(practicaFachada.getPractica(practicaDTO.getId()));
			} 
			
			byte[] bytes = reportesFachada.generarReportePresupuestoEstudio(path,listaPracticas,estudioForm.getValorEstudio());
			
			// Lo muestro en la salida del response
			response.setContentType("application/pdf");
			ServletOutputStream out = response.getOutputStream();
			out.write(bytes, 0, bytes.length);
			out.flush();

		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			return mapping.findForward("errorSinMenu");
		}

		return null;
	}	
	
	public void calcularPresupuestoEstudio(StringBuffer respuesta, ActionForm form){
		
		EstudioForm estudioForm = (EstudioForm)form;
		
		estudioForm.normalizarListaPracticas();
		EstudioDTO estudioDTO = estudioForm.getEstudioDTO();
		WebApplicationContext ctx = getWebApplicationContext();
		PracticaFachada practicaFachada = (PracticaFachada) ctx.getBean("practicaFachada");
		EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
		
		double valor = estudioFachada.recuperarValorUnidadFacturacion();		
		
		List<Practica> listaPracticas = new ArrayList<Practica>(); 
		for (PracticaDTO practicaDTO : estudioForm.getListaPracticas()) {
			listaPracticas.add(practicaFachada.getPractica(practicaDTO.getId()));
		}		
		estudioDTO.setFecha("20/09/2015");//Le pongo cualquier fecha para que no pinche en el ProviderDominio
		estudioDTO.setFechaEntrega("20/09/2015");//Le pongo cualquier fecha para que no pinche en el ProviderDominio
		estudioDTO.setEstado(EstadoEstudio.NO_ENTREGADO);//Le pongo cualquier estado para que no pinche en el ProviderDominio
		Estudio estudio = ProviderDominio.getEstudio(estudioDTO,null,listaPracticas,null);		
		
		respuesta.append("<unidades>" + estudio.getUnidadesFacturacionTotal() + "</unidades>");
		respuesta.append("<valor>" + estudio.getUnidadesFacturacionTotal()*valor + "</valor>");		
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward entregarEstudio(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoEntregarEstudio";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			
			EstudioForm estudioForm = (EstudioForm)form;
			estudioFachada.entregarEstudio(estudioForm.getEstudioDTO());
			
			request.setAttribute("exitoGrabado", Constantes.EXITO_ENTREGA_ESTUDIO);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward cargarRecuperarEstudiosPorMedicoObraSocial(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoCargarRecuperarEstudiosPorMedicoObraSocial";

		try {
			WebApplicationContext ctx = getWebApplicationContext();

			ObraSocialFachada obraSocialFachada = (ObraSocialFachada) ctx.getBean("obraSocialFachada");
			MedicoFachada medicoFachada = (MedicoFachada) ctx.getBean("medicoFachada");
			
			String fechaDesde = request.getParameter("fechaDesde");
			String fechaHasta = request.getParameter("fechaHasta");
			String idMedico = request.getParameter("idMedico");
			String idObraSocial = request.getParameter("idObraSocial");			
			
			request.setAttribute("obrasSociales", obraSocialFachada.getObrasSociales());						
			request.setAttribute("medicos", medicoFachada.getMedicos());
			
			if(idMedico!=null){//Si se llamo desde 'recuperarEstudiosPorMedicoObraSocial'
				request.setAttribute("fDesde", fechaDesde);
				request.setAttribute("fHasta", fechaHasta);
				request.setAttribute("idMed", idMedico);	
				request.setAttribute("idOS", idObraSocial);
			}			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	@SuppressWarnings("unchecked")
	public ActionForward recuperarEstudiosPorMedicoObraSocial(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoRecuperarEstudiosPorMedicoObraSocial";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			ObraSocialFachada obraSocialFachada = (ObraSocialFachada) ctx.getBean("obraSocialFachada");
			MedicoFachada medicoFachada = (MedicoFachada) ctx.getBean("medicoFachada");			
			
			String fechaDesde = request.getParameter("fechaDesde");
			String fechaHasta = request.getParameter("fechaHasta");
			String idMedico = request.getParameter("idMedico");
			String idObraSocial = request.getParameter("idObraSocial");
			
			List<Estudio> lista = estudioFachada.recuperarEstudiosPorMedicoObraSocial(fechaDesde,fechaHasta,Long.valueOf(idMedico),Long.valueOf(idObraSocial));
			
			Medico medico = medicoFachada.getMedico(Long.valueOf(idMedico));
			String nomMedico = (medico == null)?"No se especifico medico":medico.getApellido()+","+medico.getNombre()+"-"+medico.getMatricula();
			
			ObraSocial obraSocial = obraSocialFachada.getObraSocial(Long.valueOf(idObraSocial));
			String nomObraSocial = (obraSocial == null)?"No se especifico obra social":obraSocial.getNombre();
			
			request.setAttribute("estudios",lista);
			request.setAttribute("cantEstudios",(lista != null)?lista.size():0);
			/*request.setAttribute("fechaDesde",fechaDesde);
			request.setAttribute("fechaHasta",fechaHasta);
			request.setAttribute("medico",nomMedico);
			request.setAttribute("obraSocial",nomObraSocial);*/
						
			//request.setAttribute("volver","/estudio.do?metodo=recuperarEstudiosPorMedicoObraSocial&amp;fechaDesde="+fechaDesde+"&amp;fechaHasta="+fechaHasta+"&amp;idMedico="+idMedico+"&amp;idObraSocial="+idObraSocial);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	/**********************************************************************
	 **********************	METODOS VALIDADORES ***************************
	 **********************************************************************/
	
	public boolean validarEstudioForm(StringBuffer error, ActionForm form) {
		
		try{
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");			
			EstudioForm estudioForm = (EstudioForm)form;
			EstudioDTO estudio = estudioForm.getEstudioDTO();
			
			boolean ok1 = true;
			boolean ok2 = true;
			boolean ok3 = true;
			boolean ok4 = true;
			
			ok1 = Validator.validarEnteroMayorQue(0, String.valueOf(estudio.getNumero()), "Numero", error);			

			if(ok1){
				ok1 = !estudioFachada.existeEstudio(estudio.getNumero());

				if (!ok1) {
					Validator.addErrorXML(error, "El número de Estudio ya existe, especifique otro");
				}
			}
			
			ok2 = Validator.validarComboRequeridoSinNull("-1",Long.toString(estudio.getPaciente().getId()),
																			"Paciente",error);			
			
			//ok3 = Validator.requerido(estudio.getSolicitadoPor(),"Solicitado Por", error);

			ok3 = Validator.validarComboRequeridoSinNull("-1",Long.toString(estudio.getMedico().getId()),"Medico",error);				
			
			ok4 = Validator.requerido(estudio.getFecha(),"Fecha", error);

			return ok1 && ok2 && ok3 && ok4;
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado - "+t.getMessage());			
			return false;
		}
	}

	public boolean validarModificacionEstudioForm(StringBuffer error, ActionForm form) {
		
		try{
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");			
			EstudioForm estudioForm = (EstudioForm)form;
			EstudioDTO estudio = estudioForm.getEstudioDTO();
			
			boolean ok1 = true;
			boolean ok2 = true;
			boolean ok3 = true;
			boolean ok4 = true;
			
			ok1 = Validator.validarEnteroMayorQue(0, String.valueOf(estudio.getNumero()), "Numero", error);			

			if(ok1){
				ok1 = !estudioFachada.existeEstudio(estudio.getNumero(),estudio.getId());

				if (!ok1) {
					Validator.addErrorXML(error, "El número de Estudio ya existe, especifique otro");
				}
			}
			
			ok2 = Validator.validarComboRequeridoSinNull("-1",Long.toString(estudio.getPaciente().getId()),
																			"Paciente",error);			
			
			ok4 = Validator.requerido(estudio.getFecha(),"Fecha", error);

			return ok1 && ok2 && ok3 && ok4;
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado - "+t.getMessage());
			return false;
		}
	}	
	
	public boolean validarValorUnidadFacturacionForm(StringBuffer error, ActionForm form) {
		
		try{	
			ValorUnidadFacturacionForm valorForm = (ValorUnidadFacturacionForm)form;
			
			boolean ok1 = true;
			
			ok1 = Validator.validarDoubleMayorQue(0, String.valueOf(valorForm.getValorUnidadFacturacion()), "Valor $", error);			

			return ok1;
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado - "+t.getMessage());
			return false;
		}
	}	

	@SuppressWarnings("unchecked")
	public ActionForward validarNroProtocolo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		PrintWriter out = null;
		StringBuffer error = Validator.abrirXML();		

		try {
			out = response.getWriter();
			WebApplicationContext ctx = getWebApplicationContext();
			EstudioFachada estudioFachada = (EstudioFachada) ctx.getBean("estudioFachada");
			String nroProtocolo = request.getParameter("nroProtocolo");
			
			if(!estudioFachada.existeEstudio(Long.valueOf(nroProtocolo))){
				Validator.addErrorXML(error, "No existe un estudio con el nro "+nroProtocolo);
			}
									
			Validator.cerrarXML(error);
			out.write(error.toString());
			response.setContentType("text/xml");			
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, t.getMessage());
		}

		return null;
	}
	
	//ESTUDIO_HISTORICO
	public boolean validarPasarEstudiosAHistoricoForm(StringBuffer error, ActionForm form) {
		
		try{			
			EstudioForm estudioForm = (EstudioForm)form;
			
			boolean ok1 = true;
			boolean ok2 = true;

			ok1 = Validator.requerido(estudioForm.getFechaDesde(),"Fecha Desde", error);
			ok2 = Validator.requerido(estudioForm.getFechaHasta(),"Fecha Hasta", error);

			return ok1 && ok2;
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado - "+t.getMessage());
			return false;
		}
	}	
	
	//ESTUDIO_HISTORICO_POR_NRO
	public boolean validarPasarEstudiosAHistoricoPorNroForm(StringBuffer error, ActionForm form) {
		
		try{			
			EstudioForm estudioForm = (EstudioForm)form;
			
			boolean ok1 = true;
			boolean ok2 = true;

			ok1 = Validator.validarLongMayorQue(0,String.valueOf(estudioForm.getNroDesde()),"Numero Desde", error);
			ok2 = Validator.validarLongMayorQue(estudioForm.getNroDesde().intValue()-1,String.valueOf(estudioForm.getNroHasta()),"Numero Hasta", error);

			return ok1 && ok2;
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado - "+t.getMessage());
			return false;
		}
	}	
}
