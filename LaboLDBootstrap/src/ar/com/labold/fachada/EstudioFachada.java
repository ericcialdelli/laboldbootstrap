package ar.com.labold.fachada;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Hibernate;
import org.springframework.transaction.annotation.Transactional;

import ar.com.labold.dao.EstudioDAO;
import ar.com.labold.dao.MedicoDAO;
import ar.com.labold.dao.PacienteDAO;
import ar.com.labold.dao.PracticaDAO;
import ar.com.labold.dto.EstudioDTO;
import ar.com.labold.dto.PracticaDTO;
import ar.com.labold.dto.ValorPracticaDTO;
import ar.com.labold.enums.EstadoEstudio;
import ar.com.labold.negocio.Estudio;
import ar.com.labold.negocio.EstudioHistorico;
import ar.com.labold.negocio.Medico;
import ar.com.labold.negocio.Paciente;
import ar.com.labold.negocio.Practica;
import ar.com.labold.negocio.SubItemPractica;
import ar.com.labold.negocio.ValorPractica;
import ar.com.labold.negocio.ValorPracticaHistorico;
import ar.com.labold.negocio.ValorSubItemPractica;
import ar.com.labold.negocio.ValorSubItemPracticaHistorico;
import ar.com.labold.negocio.ValorUnidadFacturacion;
import ar.com.labold.negocio.ValoresEstudio;
import ar.com.labold.negocio.ValoresEstudioHistorico;
import ar.com.labold.providers.ProviderDominio;

@Transactional(rollbackFor = { Throwable.class })
public class EstudioFachada {

	private EstudioDAO estudioDAO;
	private PacienteDAO pacienteDAO;
	private PracticaDAO practicaDAO;
	private MedicoDAO medicoDAO;
	
	public EstudioFachada(){}
	
	public EstudioFachada(EstudioDAO pEstudioDAO, PacienteDAO pPacienteDAO, PracticaDAO pPracticaDAO, MedicoDAO pMedicoDAO){
		
		this.estudioDAO = pEstudioDAO;
		this.pacienteDAO = pPacienteDAO;
		this.practicaDAO = pPracticaDAO;
		this.medicoDAO = pMedicoDAO;
	}
	
	public double altaEstudio(EstudioDTO estudioDTO, List<PracticaDTO> listaPracticasDTO){
		
		List<Practica> listaPracticas = new ArrayList<Practica>(); 
		for (PracticaDTO practicaDTO : listaPracticasDTO) {
			listaPracticas
			.add(practicaDAO.getPractica(practicaDTO.getId()));
		}
		
		estudioDTO.setEstado(EstadoEstudio.NO_ENTREGADO);
		
		Paciente paciente = pacienteDAO.getPaciente(estudioDTO.getPaciente().getId());
		Medico medico = medicoDAO.getMedico(estudioDTO.getMedico().getId());
		
		//Seteo el valor de la UB, copiandolo de la obra social del paciente
		estudioDTO.setValorUnidadBioquimica(paciente.getObraSocial().getValorUnidadBioquimica());
		
		Estudio estudio = ProviderDominio.getEstudio(estudioDTO, paciente,listaPracticas,medico);
		
		estudioDAO.altaEstudio(estudio);
		
		return estudio.getUnidadesFacturacionTotal();
	}
	
	public List<Estudio> getEstudios(){
		
		return estudioDAO.getEstudios();
	}

	public List<Estudio> getEstudios(Long idPaciente){
		
		return estudioDAO.getEstudios(idPaciente);
	}	
	
	public Estudio getEstudio(Long idEstudio){
		
		return estudioDAO.getEstudio(idEstudio);
	}	

	public Estudio getEstudioPorNroProtocolo(Long nroProtocolo){
		
		return estudioDAO.getEstudioPorNroProtocolo(nroProtocolo);
	}		
	
	public void modificacionEstudio(EstudioDTO estudioDTO){
		
		Estudio estudio = estudioDAO.getEstudio(estudioDTO.getId());				
		Medico medico = medicoDAO.getMedico(estudioDTO.getMedico().getId());
		estudioDAO.altaEstudio(ProviderDominio.getEstudio(estudio,estudioDTO,medico));
	}	
	
	public long getProximoNroEstudio(){
		
		return estudioDAO.getProximoNroEstudio();
	}
		
	public void completarEstudio(EstudioDTO estudio, List<ValorPractica> listaValorPractias){
		
		for (ValorPractica valorPractica : listaValorPractias) {
			ValorPractica valPractica = estudioDAO.getValorPractica(valorPractica.getId());
			valPractica.setValor(valorPractica.getValor());			
		}
	}
	
	public void eliminarPracticasParaFacturacion(EstudioDTO estudioDTO, List<ValorPracticaDTO> listaValoresPracticaDTO){
		
		Estudio estudio = estudioDAO.getEstudio(estudioDTO.getId());
		double unidadesFacturacion = estudio.getUnidadesFacturacionTotal();
		
		for (ValorPracticaDTO valorPracticaDTO : listaValoresPracticaDTO) {

			ValorPractica valorPractica = estudioDAO.getValorPractica(valorPracticaDTO.getId());
			unidadesFacturacion = unidadesFacturacion - valorPractica.getUnidadBioquimica(); 
			//valorPractica.setUnidadBioquimica(0.0);
			valorPractica.setCubreOS(false);
		}
		estudio.setUnidadesFacturacionTotal(unidadesFacturacion);//Ver bien si esto cierra//
	}

	public void restablecerPracticasParaFacturacion(EstudioDTO estudioDTO, List<ValorPracticaDTO> listaValoresPracticaDTO){
		
		Estudio estudio = estudioDAO.getEstudio(estudioDTO.getId());
		double unidadesFacturacion = estudio.getUnidadesFacturacionTotal();
		
		for (ValorPracticaDTO valorPracticaDTO : listaValoresPracticaDTO) {

			ValorPractica valorPractica = estudioDAO.getValorPractica(valorPracticaDTO.getId());
			unidadesFacturacion = unidadesFacturacion + valorPractica.getUnidadBioquimica(); 
			valorPractica.setCubreOS(true);
		}
		estudio.setUnidadesFacturacionTotal(unidadesFacturacion);//Ver bien si esto cierra//
	}
	
	public double recuperarValorUnidadFacturacion(){
		
		ValorUnidadFacturacion valor = estudioDAO.recuperarValorUnidadFacturacion();
		return valor.getValorEnPesos();
	}
	
	public void modificarValorUnidadFacturacion(double valor){
		
		ValorUnidadFacturacion valorUnidadFacturacion = estudioDAO.recuperarValorUnidadFacturacion();
		valorUnidadFacturacion.setValorEnPesos(valor);
	}
	
	public double agregarPracticasAEstudio(EstudioDTO estudioDTO, List<PracticaDTO> listaPracticasDTO){
		
		List<Practica> listaPracticas = new ArrayList<Practica>(); 
		for (PracticaDTO practicaDTO : listaPracticasDTO) {
			if(practicaDTO != null){
				listaPracticas.add(practicaDAO.getPractica(practicaDTO.getId()));
			}	
		}		
		Estudio estudio = estudioDAO.getEstudio(estudioDTO.getId());		
		ProviderDominio.getEstudio(estudio,listaPracticas);
		
		//estudioDAO.altaEstudio(estudio);
		
		return estudio.getUnidadesFacturacionTotal();
	}
	
	public void eliminarPracticasDeEstudio(EstudioDTO estudioDTO, List<ValorPracticaDTO> listaValoresPracticaDTO){
		
		Estudio estudio = estudioDAO.getEstudio(estudioDTO.getId());
		double unidadesFacturacionEstudio = estudio.getUnidadesFacturacionTotal();
		ValoresEstudio ve = null;
		
		for (ValorPracticaDTO valorPracticaDTO : listaValoresPracticaDTO) {		
			
			ValorPractica valorPractica = estudioDAO.getValorPractica(valorPracticaDTO.getId());			
			estudioDAO.eliminarValorPractica(valorPractica);					
									
			if(valorPractica.getValorSubItemPractica() != null ){				
				ValorSubItemPractica vsip = estudioDAO.getValorSubItemPractica(valorPractica.getValorSubItemPractica().getId());				
				if(vsip.getValoresPracticas().size()==0){
					estudioDAO.eliminarValorSubItemPractica(vsip);
				}	
				ve = estudioDAO.getValorEstudio(vsip.getValoresEstudio().getId());
			}
			else{				
				ve = estudioDAO.getValorEstudio(valorPractica.getValoresEstudio().getId());	
			}			
			
			if(ve.cantidadPracticas()+1 == ve.getGrupoPractica().cantidadPracticas()){
				unidadesFacturacionEstudio = unidadesFacturacionEstudio - ve.getGrupoPractica().getUnidadBioquimica();
				unidadesFacturacionEstudio = unidadesFacturacionEstudio + ve.getUnidadesFacturacionDePracticas();
			}
			else{
				unidadesFacturacionEstudio = unidadesFacturacionEstudio - valorPractica.getUnidadBioquimica();
			}
			
			if(ve.getValoresPracticas().size()==0){
				estudioDAO.eliminarValoresEstudio(ve);
			}			
		}
		
		estudio = estudioDAO.getEstudio(estudioDTO.getId());
		estudio.setUnidadesFacturacionTotal(unidadesFacturacionEstudio);
		estudioDAO.altaEstudio(estudio);
	}
	
	public boolean existeEstudio(long nroEstudio) {
		return estudioDAO.existeEstudio(nroEstudio);
	}	

	public boolean existeEstudio(long nroEstudio, long id) {
		return estudioDAO.existeEstudio(nroEstudio,id);
	}
	
	public void eliminarEstudio(Long idEstudio){
	
		Estudio estudio = estudioDAO.getEstudio(idEstudio);
		estudioDAO.eliminarEstudio(estudio);
	}
	
	public Map<Long,String> recuperarPracticasAnteriores(Long idPaciente){
		Map<Long,String> map = new HashMap<Long, String>();
		List<Estudio> listaEstudios = this.getEstudios(idPaciente);
		for (Estudio estudio : listaEstudios) {			
			for (ValoresEstudio valorEstudio : estudio.getValoresEstudio()) {				
				for (ValorPractica valorPractica : valorEstudio.getValoresPracticas()) {
					//String v = map.get(valorPractica.getId());
					String v = map.get(valorPractica.getPractica().getId());
					if(v==null){
						v="Valores Anteriores:\n";
					}
					v=v+valorPractica.getValor()+"\n";
					//map.put(valorPractica.getId(), v);
					map.put(valorPractica.getPractica().getId(), v);
				}
				for (ValorSubItemPractica valorSubItemPractica : valorEstudio.getValorSubItemPractica()) {
					for (ValorPractica valorPractica : valorSubItemPractica.getValoresPracticas()) {
						//String v = map.get(valorPractica.getId());
						String v = map.get(valorPractica.getPractica().getId());
						if(v==null){
							v="Valores Anteriores:\n";
						}
						v=v+valorPractica.getValor()+"\n";
						//map.put(valorPractica.getId(), v);
						map.put(valorPractica.getPractica().getId(), v);
					}
				}				
			}
		}		
		return map;
	}
	
	public void entregarEstudio(EstudioDTO estudioDTO){
		
		Estudio estudio = estudioDAO.getEstudio(estudioDTO.getId());
		estudio.setMontoAdeudado(new Double(0));
		estudio.setEstado(EstadoEstudio.ENTREGADO);
		estudioDAO.altaEstudio(estudio);
	}	
	
	public List<Estudio> recuperarUltimosEstudios(){
		
		return estudioDAO.recuperarUltimosEstudios();
	}
	
	public List<Estudio> recuperarEstudiosPorMedicoObraSocial(String fechaDesde, String fechaHasta, long idMedico, long idObraSocial){
		
		List<Estudio> lista = null;
		lista = estudioDAO.recuperarEstudiosPorMedicoObraSocial(fechaDesde,fechaHasta,idMedico,idObraSocial);
		return lista;
	}
	
	//****************************************************************************************************//
	//***************************** PASAR ESTUDIOS A HISTORICO *******************************************//
	//****************************************************************************************************//
	
	//ESTUDIO_HISTORICO
	public void pasarEstudiosAHistoricos(String fechaDesde, String fechaHasta){
		
		List<Estudio> listaEstudios = estudioDAO.getEstudiosEntreFechas(fechaDesde,fechaHasta);
		EstudioHistorico estudioHistorico;
		Paciente paciente;
		Medico medico;
		
		for (Estudio estudio : listaEstudios) {
		
			paciente = pacienteDAO.getPaciente(estudio.getPaciente().getId());					
			medico = (estudio.getMedico()!=null)?medicoDAO.getMedico(estudio.getMedico().getId()):null;			
			
			estudioHistorico = new EstudioHistorico();
			estudioHistorico.setNumero(estudio.getNumero());
			estudioHistorico.setFecha(estudio.getFecha());
			estudioHistorico.setEstado(estudio.getEstado());
			estudioHistorico.setFechaEntrega(estudio.getFechaEntrega());
			estudioHistorico.setMontoAdeudado(estudio.getMontoAdeudado());
			estudioHistorico.setUnidadesFacturacionTotal(estudio.getUnidadesFacturacionTotal());
			estudioHistorico.setValorUnidadBioquimica(estudio.getValorUnidadBioquimica());
			estudioHistorico.setPaciente(paciente);
			estudioHistorico.setMedico(medico);
			
			pasarValoresEstudioAHistorico(estudio,estudioHistorico);
			
			estudioDAO.altaEstudioHistorico(estudioHistorico);
			estudioDAO.eliminarEstudioSinFlushClear(estudio);
			//estudioDAO.eliminarEstudio(estudio);
		}
		estudioDAO.flushClear();
		System.out.println(listaEstudios.size());
				
	}	

	//ESTUDIO_HISTORICO_POR_NRO
	public void pasarEstudiosAHistoricosPorNro(Long nroDesde, Long nroHasta){
		
		List<Estudio> listaEstudios = estudioDAO.getEstudiosEntreNro(nroDesde,nroHasta);
		EstudioHistorico estudioHistorico;
		Paciente paciente;
		Medico medico;
		
		for (Estudio estudio : listaEstudios) {
		
			paciente = pacienteDAO.getPaciente(estudio.getPaciente().getId());					
			medico = (estudio.getMedico()!=null)?medicoDAO.getMedico(estudio.getMedico().getId()):null;			
			
			estudioHistorico = new EstudioHistorico();
			estudioHistorico.setNumero(estudio.getNumero());
			estudioHistorico.setFecha(estudio.getFecha());
			estudioHistorico.setEstado(estudio.getEstado());
			estudioHistorico.setFechaEntrega(estudio.getFechaEntrega());
			estudioHistorico.setMontoAdeudado(estudio.getMontoAdeudado());
			estudioHistorico.setUnidadesFacturacionTotal(estudio.getUnidadesFacturacionTotal());
			estudioHistorico.setValorUnidadBioquimica(estudio.getValorUnidadBioquimica());
			estudioHistorico.setPaciente(paciente);
			estudioHistorico.setMedico(medico);
			
			pasarValoresEstudioAHistorico(estudio,estudioHistorico);
			
			estudioDAO.altaEstudioHistorico(estudioHistorico);
			estudioDAO.eliminarEstudioSinFlushClear(estudio);
			//estudioDAO.eliminarEstudio(estudio);
		}
		estudioDAO.flushClear();
		System.out.println(listaEstudios.size());
				
	}		
	
	//ESTUDIO_HISTORICO
	private void pasarValoresEstudioAHistorico(Estudio estudio, EstudioHistorico estudioHistorico){
		
		ValoresEstudioHistorico valoresEstudioHistorico;
		
		//Hibernate.initialize(estudio.getValoresEstudio());
		
		for (ValoresEstudio valoresEstudio : estudio.getValoresEstudio()) {
			
			valoresEstudioHistorico = new ValoresEstudioHistorico();
			valoresEstudioHistorico.setEstudioHistorico(estudioHistorico);
			valoresEstudioHistorico.setGrupoPractica(valoresEstudio.getGrupoPractica());
			valoresEstudioHistorico.setNombre(valoresEstudio.getNombre());
			valoresEstudioHistorico.setUnidadBioquimica(valoresEstudio.getUnidadBioquimica());
			
			pasarValorPracticaAHistorico(valoresEstudio,valoresEstudioHistorico);
			pasarValorSubItemPracticaAHistorico(valoresEstudio,valoresEstudioHistorico);
			
			estudioHistorico.getValoresEstudioHistorico().add(valoresEstudioHistorico);
		}
	}
	
	//ESTUDIO_HISTORICO	
	public void pasarValorPracticaAHistorico(ValoresEstudio valoresEstudio, ValoresEstudioHistorico valoresEstudioHistorico){
		
		ValorPracticaHistorico valorPracticaHistorico;
		
		for(ValorPractica valorPractica : valoresEstudio.getValoresPracticas()){
		
			valorPracticaHistorico = new ValorPracticaHistorico();
			valorPracticaHistorico.setCubreOS(valorPractica.isCubreOS());
			valorPracticaHistorico.setPractica(valorPractica.getPractica());
			valorPracticaHistorico.setUnidadBioquimica(valorPractica.getUnidadBioquimica());
			valorPracticaHistorico.setValor(valorPractica.getValor());
			valorPracticaHistorico.setValoresEstudioHistorico(valoresEstudioHistorico);
			
			valoresEstudioHistorico.getValoresPracticasHistorico().add(valorPracticaHistorico);
		}
	}	
	
	//ESTUDIO_HISTORICO	
	public void pasarValorSubItemPracticaAHistorico(ValoresEstudio valoresEstudio, ValoresEstudioHistorico valoresEstudioHistorico){
		
		ValorSubItemPracticaHistorico valorSubItemPracticaHistorico;
		
		for(ValorSubItemPractica valorSubItemPractica : valoresEstudio.getValorSubItemPractica()){
			
			valorSubItemPracticaHistorico = new ValorSubItemPracticaHistorico();
			valorSubItemPracticaHistorico.setNombre(valorSubItemPractica.getNombre());
			valorSubItemPracticaHistorico.setSubItemPractica(valorSubItemPractica.getSubItemPractica());
			valorSubItemPracticaHistorico.setValoresEstudioHistorico(valoresEstudioHistorico);
			
			pasarValorPracticaAHistorico(valorSubItemPractica,valorSubItemPracticaHistorico);
			
			valoresEstudioHistorico.getValorSubItemPracticaHistorico().add(valorSubItemPracticaHistorico);
		}
	}	
	
	//ESTUDIO_HISTORICO
	public void pasarValorPracticaAHistorico(ValorSubItemPractica valorSubItemPractica, ValorSubItemPracticaHistorico valorSubItemPracticaHistorico){
		
		ValorPracticaHistorico valorPracticaHistorico;
		
		for(ValorPractica valorPractica : valorSubItemPractica.getValoresPracticas()){

			valorPracticaHistorico = new ValorPracticaHistorico();
			valorPracticaHistorico.setCubreOS(valorPractica.isCubreOS());
			valorPracticaHistorico.setPractica(valorPractica.getPractica());
			valorPracticaHistorico.setUnidadBioquimica(valorPractica.getUnidadBioquimica());
			valorPracticaHistorico.setValor(valorPractica.getValor());
			valorPracticaHistorico.setValorSubItemPracticaHistorico(valorSubItemPracticaHistorico);			
			
			valorSubItemPracticaHistorico.getValoresPracticasHistorico().add(valorPracticaHistorico);
		}				
	}							   
	//*********************************************************************************************************//
	//*********************************************************************************************************//
	//*********************************************************************************************************//	
	
	
	
	//*********************************************************************************************************//
	//***************************** RECUPERAR ESTUDIOS DE HISTORICO *******************************************//
	//*********************************************************************************************************//
	
	//RECUPERAR_ESTUDIO_HISTORICO
	public void recuperarEstudiosDeHistorico(String fechaDesde, String fechaHasta){
		
		List<EstudioHistorico> listaEstudiosHistoricos = estudioDAO.getEstudiosHistoricosEntreFechas(fechaDesde,fechaHasta);
		Estudio estudio;
		Paciente paciente;
		Medico medico;
		
		for (EstudioHistorico estudioHistorico : listaEstudiosHistoricos) {
		
			paciente = pacienteDAO.getPaciente(estudioHistorico.getPaciente().getId());					
			medico = (estudioHistorico.getMedico()!=null)?medicoDAO.getMedico(estudioHistorico.getMedico().getId()):null;			
			
			estudio = new Estudio();
			estudio.setNumero(estudioHistorico.getNumero());
			estudio.setFecha(estudioHistorico.getFecha());
			estudio.setEstado(estudioHistorico.getEstado());
			estudio.setFechaEntrega(estudioHistorico.getFechaEntrega());
			estudio.setMontoAdeudado(estudioHistorico.getMontoAdeudado());
			estudio.setUnidadesFacturacionTotal(estudioHistorico.getUnidadesFacturacionTotal());
			estudio.setValorUnidadBioquimica(estudioHistorico.getValorUnidadBioquimica());
			estudio.setPaciente(paciente);
			estudio.setMedico(medico);
			
			recuperarValoresEstudioDeHistorico(estudio,estudioHistorico);
			
			estudioDAO.altaEstudioSinFlushClear(estudio);
			estudioDAO.eliminarEstudioHistoricoSinFlushClear(estudioHistorico);
			//estudioDAO.eliminarEstudio(estudio);
		}
		estudioDAO.flushClear();
		System.out.println(listaEstudiosHistoricos.size());			
	}	

	//RECUPERAR_ESTUDIO_HISTORICO_POR_NRO
	public void recuperarEstudiosDeHistoricoPorNro(Long nroDesde, Long nroHasta){
		
		List<EstudioHistorico> listaEstudiosHistoricos = estudioDAO.getEstudiosHistoricosEntreFechasPorNro(nroDesde,nroHasta);
		Estudio estudio;
		Paciente paciente;
		Medico medico;
		
		for (EstudioHistorico estudioHistorico : listaEstudiosHistoricos) {
		
			paciente = pacienteDAO.getPaciente(estudioHistorico.getPaciente().getId());					
			medico = (estudioHistorico.getMedico()!=null)?medicoDAO.getMedico(estudioHistorico.getMedico().getId()):null;			
			
			estudio = new Estudio();
			estudio.setNumero(estudioHistorico.getNumero());
			estudio.setFecha(estudioHistorico.getFecha());
			estudio.setEstado(estudioHistorico.getEstado());
			estudio.setFechaEntrega(estudioHistorico.getFechaEntrega());
			estudio.setMontoAdeudado(estudioHistorico.getMontoAdeudado());
			estudio.setUnidadesFacturacionTotal(estudioHistorico.getUnidadesFacturacionTotal());
			estudio.setValorUnidadBioquimica(estudioHistorico.getValorUnidadBioquimica());
			estudio.setPaciente(paciente);
			estudio.setMedico(medico);
			
			recuperarValoresEstudioDeHistorico(estudio,estudioHistorico);
			
			estudioDAO.altaEstudioSinFlushClear(estudio);
			estudioDAO.eliminarEstudioHistoricoSinFlushClear(estudioHistorico);
			//estudioDAO.eliminarEstudio(estudio);
		}
		estudioDAO.flushClear();
		System.out.println(listaEstudiosHistoricos.size());			
	}		
	
	//RECUPERAR_ESTUDIO_HISTORICO
	private void recuperarValoresEstudioDeHistorico(Estudio estudio, EstudioHistorico estudioHistorico){
		
		ValoresEstudio valoresEstudio;
		
		for (ValoresEstudioHistorico valoresEstudioHistorico : estudioHistorico.getValoresEstudioHistorico()) {
			
			valoresEstudio = new ValoresEstudio();
			valoresEstudio.setEstudio(estudio);
			valoresEstudio.setGrupoPractica(valoresEstudioHistorico.getGrupoPractica());
			valoresEstudio.setNombre(valoresEstudioHistorico.getNombre());
			valoresEstudio.setUnidadBioquimica(valoresEstudioHistorico.getUnidadBioquimica());
			
			recuperarValorPracticaDeHistorico(valoresEstudio,valoresEstudioHistorico);
			recuperarValorSubItemPracticaDeHistorico(valoresEstudio,valoresEstudioHistorico);
			
			estudio.getValoresEstudio().add(valoresEstudio);
		}
	}	
	
	//RECUPERAR_ESTUDIO_HISTORICO	
	public void recuperarValorPracticaDeHistorico(ValoresEstudio valoresEstudio, ValoresEstudioHistorico valoresEstudioHistorico){
		
		ValorPractica valorPractica;
		
		for(ValorPracticaHistorico valorPracticaHistorico : valoresEstudioHistorico.getValoresPracticasHistorico()){
		
			valorPractica = new ValorPractica();
			valorPractica.setCubreOS(valorPracticaHistorico.isCubreOS());
			valorPractica.setPractica(valorPracticaHistorico.getPractica());
			valorPractica.setUnidadBioquimica(valorPracticaHistorico.getUnidadBioquimica());
			valorPractica.setValor(valorPracticaHistorico.getValor());
			valorPractica.setValoresEstudio(valoresEstudio);
			
			valoresEstudio.getValoresPracticas().add(valorPractica);
		}
	}	
	
	//RECUPERAR_ESTUDIO_HISTORICO	
	public void recuperarValorSubItemPracticaDeHistorico(ValoresEstudio valoresEstudio, ValoresEstudioHistorico valoresEstudioHistorico){
		
		ValorSubItemPractica valorSubItemPractica;
		
		for(ValorSubItemPracticaHistorico valorSubItemPracticaHistorico : valoresEstudioHistorico.getValorSubItemPracticaHistorico()){
			
			valorSubItemPractica = new ValorSubItemPractica();
			valorSubItemPractica.setNombre(valorSubItemPracticaHistorico.getNombre());
			valorSubItemPractica.setSubItemPractica(valorSubItemPracticaHistorico.getSubItemPractica());
			valorSubItemPractica.setValoresEstudio(valoresEstudio);
			
			recuperarValorPracticaDeHistorico(valorSubItemPractica,valorSubItemPracticaHistorico);
			
			valoresEstudio.getValorSubItemPractica().add(valorSubItemPractica);
		}
	}	
	
	//RECUPERAR_ESTUDIO_HISTORICO
	public void recuperarValorPracticaDeHistorico(ValorSubItemPractica valorSubItemPractica, ValorSubItemPracticaHistorico valorSubItemPracticaHistorico){
		
		ValorPractica valorPractica;
		
		for(ValorPracticaHistorico valorPracticaHistorico : valorSubItemPracticaHistorico.getValoresPracticasHistorico()){

			valorPractica = new ValorPractica();
			valorPractica.setCubreOS(valorPracticaHistorico.isCubreOS());
			valorPractica.setPractica(valorPracticaHistorico.getPractica());
			valorPractica.setUnidadBioquimica(valorPracticaHistorico.getUnidadBioquimica());
			valorPractica.setValor(valorPracticaHistorico.getValor());
			valorPractica.setValorSubItemPractica(valorSubItemPractica);			
			
			valorSubItemPractica.getValoresPracticas().add(valorPractica);
		}				
	}	
	//*********************************************************************************************************//
	//*********************************************************************************************************//
	//*********************************************************************************************************//	
}
