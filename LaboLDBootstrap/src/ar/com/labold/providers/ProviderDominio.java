package ar.com.labold.providers;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import ar.com.labold.dto.EstudioDTO;
import ar.com.labold.dto.GrupoPracticaDTO;
import ar.com.labold.dto.MedicoDTO;
import ar.com.labold.dto.ObraSocialDTO;
import ar.com.labold.dto.PacienteDTO;
import ar.com.labold.dto.PracticaDTO;
import ar.com.labold.dto.RolDTO;
import ar.com.labold.dto.SubItemPracticaDTO;
import ar.com.labold.dto.UsuarioDTO;
import ar.com.labold.negocio.Estudio;
import ar.com.labold.negocio.GrupoPractica;
import ar.com.labold.negocio.ItemMenu;
import ar.com.labold.negocio.Medico;
import ar.com.labold.negocio.ObraSocial;
import ar.com.labold.negocio.Paciente;
import ar.com.labold.negocio.Practica;
import ar.com.labold.negocio.Rol;
import ar.com.labold.negocio.SubItemPractica;
import ar.com.labold.negocio.Usuario;
import ar.com.labold.negocio.ValorPractica;
import ar.com.labold.negocio.ValorSubItemPractica;
import ar.com.labold.negocio.ValoresEstudio;
import ar.com.labold.utils.Fecha;


public abstract class ProviderDominio {

	//Se usa en el Alta de Usuario
	public static Usuario getUsuario(UsuarioDTO usuarioDTO, Rol rol) {

		Usuario usuario = new Usuario();
		usuario.setHabilitado(usuarioDTO.isHabilitado());
		usuario.setNombreUsuario(usuarioDTO.getNombreUsuario());
		usuario.setPassword(usuarioDTO.getPassword());
		usuario.setRol(rol);

		return usuario;
	}

	//Se usa en la modificacion de Usuario
	public static Usuario getUsuario(Usuario usuario, UsuarioDTO usuarioDTO, Rol rol) {

		usuario.setHabilitado(usuarioDTO.isHabilitado());
		usuario.setNombreUsuario(usuarioDTO.getNombreUsuario());
		usuario.setPassword(usuarioDTO.getPassword());
		usuario.setRol(rol);

		return usuario;
	}

	public static Rol getRol(RolDTO rolDTO) {

		Rol rol = new Rol();
		rol.setRol(rolDTO.getRol());
		rol.setMenues(new ArrayList<ItemMenu>());

		return rol;
	}	
	
	//Se usa en el alta de Paciente
	public static Paciente getPaciente(PacienteDTO pacienteDTO, ObraSocial obraSocial) {

		Paciente paciente = new Paciente();

		paciente.setApellido(pacienteDTO.getApellido());
		paciente.setDireccion(pacienteDTO.getDireccion());
		paciente.setDni(pacienteDTO.getDni());
		paciente.setEmail(pacienteDTO.getEmail());
		paciente.setId(pacienteDTO.getId());
		paciente.setNombre(pacienteDTO.getNombre());
		paciente.setTelefono(pacienteDTO.getTelefono());
		if(pacienteDTO.getFechaNacimiento()!=null && !pacienteDTO.getFechaNacimiento().equals("")){
			paciente.setFechaNacimiento(Fecha
					.stringDDMMAAAAToUtilDate(pacienteDTO.getFechaNacimiento()));
		}	
		paciente.setObraSocial(obraSocial);
		paciente.setNroCarnetObraSocial(pacienteDTO.getNroCarnetObraSocial());
		paciente.setObservaciones(pacienteDTO.getObservaciones());
		
		return paciente;
	}	
	
	//Se usa en la modificacion de Paciente
	public static Paciente getPaciente(Paciente paciente, PacienteDTO pacienteDTO, ObraSocial obraSocial) {

		paciente.setApellido(pacienteDTO.getApellido());
		paciente.setDireccion(pacienteDTO.getDireccion());
		paciente.setDni(pacienteDTO.getDni());
		paciente.setEmail(pacienteDTO.getEmail());
		paciente.setNombre(pacienteDTO.getNombre());
		paciente.setTelefono(pacienteDTO.getTelefono());
		if(pacienteDTO.getFechaNacimiento()!=null && !pacienteDTO.getFechaNacimiento().equals("")){
			paciente.setFechaNacimiento(Fecha
					.stringDDMMAAAAToUtilDate(pacienteDTO.getFechaNacimiento()));
		}else{
			paciente.setFechaNacimiento(null);
		}	
		paciente.setObraSocial(obraSocial);
		paciente.setNroCarnetObraSocial(pacienteDTO.getNroCarnetObraSocial());
		paciente.setObservaciones(pacienteDTO.getObservaciones());
		
		return paciente;
	}	
	
	//Se usa en el alta de Obra Social
	public static ObraSocial getObraSocial(ObraSocialDTO obraSocialDTO){
		
		ObraSocial obraSocial = new ObraSocial();
		obraSocial.setId(obraSocialDTO.getId());
		obraSocial.setNombre(obraSocialDTO.getNombre());
		obraSocial.setValorUnidadBioquimica(obraSocialDTO.getValorUnidadBioquimica());
		
		return obraSocial;
	}	
	
	//Se usa en la modificacion de Obra Social
	public static ObraSocial getObraSocial(ObraSocial obraSocial, ObraSocialDTO obraSocialDTO){
			
		obraSocial.setNombre(obraSocialDTO.getNombre());
		obraSocial.setValorUnidadBioquimica(obraSocialDTO.getValorUnidadBioquimica());
		
		return obraSocial;
	}	

	//Se usa en el alta de Medico
	public static Medico getMedico(MedicoDTO medicoDTO){
		
		Medico medico = new Medico();
		medico.setId(medicoDTO.getId());
		medico.setNombre(medicoDTO.getNombre());
		medico.setApellido(medicoDTO.getApellido());
		medico.setTelefono(medicoDTO.getTelefono());
		medico.setMatricula(medicoDTO.getMatricula());
		medico.setEspecialidad(medicoDTO.getEspecialidad());
		
		return medico;
	}	
	
	//Se usa en la modificacion de Medico
	public static Medico getMedico(Medico medico, MedicoDTO medicoDTO){
			
		medico.setNombre(medicoDTO.getNombre());
		medico.setApellido(medicoDTO.getApellido());
		medico.setTelefono(medicoDTO.getTelefono());
		medico.setMatricula(medicoDTO.getMatricula());
		medico.setEspecialidad(medicoDTO.getEspecialidad());
		
		return medico;
	}	
	
	//Se usa en el alta de la Practica
	public static Practica getPractica(PracticaDTO practicaDTO, GrupoPractica grupo, SubItemPractica subItem){
		
		Practica practica = new Practica();
		practica.setId(practicaDTO.getId());
		practica.setNombre(practicaDTO.getNombre());
		practica.setGrupoPractica(grupo);
		practica.setSubItemPractica(subItem);
		practica.setUnidad(practicaDTO.getUnidad());
		practica.setCodigoFaba(practicaDTO.getCodigoFaba());
		practica.setMetodo(practicaDTO.getMetodo());
		practica.setUnidadBioquimica(practicaDTO.getUnidadBioquimica());
		practica.setValorNormalDesde(practicaDTO.getValorNormalDesde());
		practica.setValorNormalHasta(practicaDTO.getValorNormalHasta());
		practica.setValorReferencia(practicaDTO.getValorReferencia());
		practica.setMayorMenor(practicaDTO.getMayorMenor());
		practica.setValorRefLibre(practicaDTO.getValorRefLibre());
		practica.setOrden(practicaDTO.getOrden());
		
		return practica;
	}	
	
	//Se usa en la modificacion de la Practica
	public static Practica getPractica(Practica practica, PracticaDTO practicaDTO){

		practica.setNombre(practicaDTO.getNombre());
		practica.setUnidad(practicaDTO.getUnidad());
		practica.setMetodo(practicaDTO.getMetodo());
		practica.setUnidadBioquimica(practicaDTO.getUnidadBioquimica());
		practica.setCodigoFaba(practicaDTO.getCodigoFaba());
		practica.setValorNormalDesde(practicaDTO.getValorNormalDesde());
		practica.setValorNormalHasta(practicaDTO.getValorNormalHasta());
		practica.setValorReferencia(practicaDTO.getValorReferencia());
		practica.setMayorMenor(practicaDTO.getMayorMenor());
		practica.setValorRefLibre(practicaDTO.getValorRefLibre());
		practica.setOrden(practicaDTO.getOrden());
		
		return practica;
	}		
	
	//Se usa en el alta del GrupoPractica
	public static GrupoPractica getGrupoPractica(GrupoPracticaDTO grupoPracticaDTO){
		
		GrupoPractica grupoPractica = new GrupoPractica();		
		grupoPractica.setNombre(grupoPracticaDTO.getNombre());
		grupoPractica.setUnidadBioquimica(grupoPracticaDTO.getUnidadBioquimica());
		grupoPractica.setCodigoFaba(grupoPracticaDTO.getCodigoFaba());
		
		return grupoPractica;
	}	
	
	//Se usa en la modificacion del GrupoPractica
	public static GrupoPractica getGrupoPractica(GrupoPractica grupoPractica, GrupoPracticaDTO grupoPracticaDTO){
				
		grupoPractica.setNombre(grupoPracticaDTO.getNombre());
		grupoPractica.setUnidadBioquimica(grupoPracticaDTO.getUnidadBioquimica());
		grupoPractica.setCodigoFaba(grupoPracticaDTO.getCodigoFaba());
		
		return grupoPractica;
	}	
	
	//Se usa en el alta del SubItemPractica
	public static SubItemPractica getSubItemPractica(SubItemPracticaDTO subItemPracticaDTO, GrupoPractica grupoPractica){
		
		SubItemPractica subItemPractica = new SubItemPractica();
		subItemPractica.setNombre(subItemPracticaDTO.getNombre());
		subItemPractica.setCodigoFaba(subItemPracticaDTO.getCodigoFaba());
		subItemPractica.setGrupoPractica(grupoPractica);
		
		return subItemPractica;
	}	
	
	//Se usa en el alta del Estudio
	public static Estudio getEstudio(EstudioDTO estudioDTO, Paciente paciente, List<Practica> listaPracticas, Medico medico){
		
		Estudio estudio = new Estudio(); 
		estudio.setId(estudioDTO.getId());
		estudio.setNumero(estudioDTO.getNumero());
		estudio.setPaciente(paciente);
		//estudio.setSolicitadoPor(estudioDTO.getSolicitadoPor());
		estudio.setFecha(Fecha.stringDDMMAAAAToUtilDate(estudioDTO.getFecha()));
		estudio.setMedico(medico);
		estudio.setMontoAdeudado(estudioDTO.getMontoAdeudado());
		estudio.setValorUnidadBioquimica(estudioDTO.getValorUnidadBioquimica());
		if(estudioDTO.getFechaEntrega()!=null && !estudioDTO.getFechaEntrega().equals("")){
			estudio.setFechaEntrega(Fecha.stringDDMMAAAAToUtilDate(estudioDTO.getFechaEntrega()));
		}	
		estudio.setEstado(estudioDTO.getEstado());
		
		estudio.setObservaciones(estudioDTO.getObservaciones());//OBSERVACIONES
		
		Map<Long,ValoresEstudio> mapValoresEstudio = new TreeMap<Long,ValoresEstudio>();
		Map<Long,ValorSubItemPractica> mapValorSubItemPractica = new TreeMap<Long,ValorSubItemPractica>();
		
		//Map donde pongo la cantidad de practicas por grupo
		//Map<Long,Integer> mapCantPracPorGrupo = new TreeMap<Long,Integer>();		

		//Map donde pongo la cantidad de practicas que elegí por grupo
		Map<Long,Double> mapCantPracElegidasPorGrupo = new TreeMap<Long,Double>();		
		Double cantPracElegPorGrupo;

		//Map donde pongo la cantidad de unidades de facturacion de las practicas que elegí por grupo
		Map<Long,Double> mapCantUnidPorGrupo = new TreeMap<Long,Double>();		
		Double cantUnidPorGrupo;		
		
		long idGrupo;
		long idSubItemPractica;
		ValoresEstudio valoresEstudio;
		ValorSubItemPractica valorSubItemPractica;
		
		//Hay q agregar todas las practicas...
		for (Practica practica : listaPracticas) {
			
			idGrupo = practica.getGrupoPractica().getId();
			
			/*//Voy poniendo en un map la cantidad de Practicas por grupo			
			idGrupo = practica.getGrupoPractica().getId();
			mapCantPracPorGrupo.put(idGrupo, practica.getGrupoPractica().getPracticas().size());*/				

			//Voy poniendo en un map la cantidad de practicas por grupo que elegí
			cantPracElegPorGrupo = mapCantPracElegidasPorGrupo.get(idGrupo);
			if(cantPracElegPorGrupo == null){
				mapCantPracElegidasPorGrupo.put(idGrupo, new Double(1));
			}			
			else{
				mapCantPracElegidasPorGrupo.put(idGrupo, 1+cantPracElegPorGrupo);
			}
			
			//Voy poniendo en un map la cantidad de unidades de facturacion de practicas que elegí por grupo
			cantUnidPorGrupo = mapCantUnidPorGrupo.get(idGrupo);
			if(cantUnidPorGrupo == null){
				mapCantUnidPorGrupo.put(idGrupo, practica.getUnidadBioquimica());
			}			
			else{
				mapCantUnidPorGrupo.put(idGrupo, practica.getUnidadBioquimica()+cantUnidPorGrupo);
			}			
			
			valoresEstudio = mapValoresEstudio.get(idGrupo);
			
			if(valoresEstudio == null){
				valoresEstudio = new ValoresEstudio();
				valoresEstudio.setNombre(practica.getGrupoPractica().getNombre());
				valoresEstudio.setGrupoPractica(practica.getGrupoPractica());
				valoresEstudio.setUnidadBioquimica(practica.getGrupoPractica().getUnidadBioquimica());
				mapValoresEstudio.put(idGrupo, valoresEstudio);
			}
			
			ValorPractica valorPractica = new ValorPractica();
			valorPractica.setPractica(practica);
			valorPractica.setValor(null);										
			valorPractica.setUnidadBioquimica(practica.getUnidadBioquimica());
			valorPractica.setCubreOS(true);
			
			if(practica.getSubItemPractica() != null ){
				
				idSubItemPractica = practica.getSubItemPractica().getId();
				valorSubItemPractica = mapValorSubItemPractica.get(idSubItemPractica);
				if(valorSubItemPractica == null){
					valorSubItemPractica = new ValorSubItemPractica();
					valorSubItemPractica.setNombre(practica.getSubItemPractica().getNombre());
					valorSubItemPractica.setSubItemPractica(practica.getSubItemPractica());
					mapValorSubItemPractica.put(idSubItemPractica, valorSubItemPractica);
					valoresEstudio.getValorSubItemPractica().add(valorSubItemPractica);
				}
				
				valorPractica.setValorSubItemPractica(valorSubItemPractica);
				valorPractica.setValoresEstudio(null);				
				valorSubItemPractica.getValoresPracticas().add(valorPractica);
				valorSubItemPractica.setValoresEstudio(valoresEstudio);
				
			}else{				
				valorPractica.setValoresEstudio(valoresEstudio);
				valorPractica.setValorSubItemPractica(null);
				valoresEstudio.getValoresPracticas().add(valorPractica);
			}					
		}
		
		double totalUnidadesFacturacion=0;
		for (ValoresEstudio valoresEstudio2 : mapValoresEstudio.values()) {
			
			valoresEstudio2.setEstudio(estudio);
			estudio.getValoresEstudio().add(valoresEstudio2);
			
			/*System.out.println(valoresEstudio2.getGrupoPractica().getId());
			System.out.println(valoresEstudio2.getGrupoPractica().getNombre());
			System.out.println("Practicas del Grupo: "+valoresEstudio2.getGrupoPractica().getPracticas().size());			
			System.out.println("Practicas elegidas: "+mapCantPracElegidasPorGrupo.get(valoresEstudio2.getGrupoPractica().getId()));
			System.out.println("Unidades de Facturacion elegidas: "+mapCantUnidPorGrupo.get(valoresEstudio2.getGrupoPractica().getId()));
			System.out.println("");*/
			
			if(valoresEstudio2.getGrupoPractica().getPracticas().size() == mapCantPracElegidasPorGrupo.get(valoresEstudio2.getGrupoPractica().getId())){
				
				mapCantUnidPorGrupo.put(valoresEstudio2.getGrupoPractica().getId(),valoresEstudio2.getGrupoPractica().getUnidadBioquimica());
			}
			
			totalUnidadesFacturacion=totalUnidadesFacturacion+mapCantUnidPorGrupo.get(valoresEstudio2.getGrupoPractica().getId());
		}
		
		//System.out.println("Unidades de Facturacion Total: "+totalUnidadesFacturacion);
		estudio.setUnidadesFacturacionTotal(new Double(totalUnidadesFacturacion));
		
		return estudio;
	}	
	
	//Se usa en agregarPracticasAEstudio
	public static Estudio getEstudio(Estudio estudio, List<Practica> listaPracticas){

		double unidadesFacturacionEstudio = estudio.getUnidadesFacturacionTotal();
		
		Map<Long,ValoresEstudio> mapValoresEstudio = new HashMap<Long,ValoresEstudio>();
		Map<Long,ValorSubItemPractica> mapValorSubItemPractica = new HashMap<Long,ValorSubItemPractica>();

		//Armo los maps con los valoresEstudio y ValorSubItemPractica que tiene el Estudio.
		for (ValoresEstudio ve : estudio.getValoresEstudio()) {
			
			mapValoresEstudio.put(ve.getGrupoPractica().getId(), ve);
			
			for (ValorSubItemPractica vsip : ve.getValorSubItemPractica()) {			
				mapValorSubItemPractica.put(vsip.getSubItemPractica().getId(), vsip);
			}			
			//System.out.println(ve.getNombre()+": "+ve.cantidadPracticas()+" practicas");
			//System.out.println("GRUPO: "+ve.getGrupoPractica().getNombre()+": "+ve.getGrupoPractica().cantidadPracticas()+" practicas");
		}		
		
		//Recorro las practicas nuevas y las agrego al ValorEstudio o ValorSubItemPractica del Estudio.
		ValoresEstudio ve;
		for (Practica practica : listaPracticas) {
			
			unidadesFacturacionEstudio = unidadesFacturacionEstudio + practica.getUnidadBioquimica();
			
			ve = mapValoresEstudio.get(practica.getGrupoPractica().getId());
			
			if(ve == null){
				ve = new ValoresEstudio();
				ve.setNombre(practica.getGrupoPractica().getNombre());
				ve.setGrupoPractica(practica.getGrupoPractica());
				ve.setUnidadBioquimica(practica.getGrupoPractica().getUnidadBioquimica());
				ve.setEstudio(estudio);
				estudio.getValoresEstudio().add(ve);
				mapValoresEstudio.put(practica.getGrupoPractica().getId(), ve);
			}			
			
			ValorPractica valorPractica = new ValorPractica();
			valorPractica.setPractica(practica);
			valorPractica.setValor(null);										
			valorPractica.setUnidadBioquimica(practica.getUnidadBioquimica());
			valorPractica.setCubreOS(true);						
			
			if(practica.getSubItemPractica()!=null){
				ValorSubItemPractica vsip = mapValorSubItemPractica.get(practica.getSubItemPractica().getId());
				if(vsip == null){
					vsip = new ValorSubItemPractica();
					vsip.setNombre(practica.getSubItemPractica().getNombre());
					vsip.setSubItemPractica(practica.getSubItemPractica());
					vsip.setValoresEstudio(ve);
					mapValorSubItemPractica.put(practica.getSubItemPractica().getId(), vsip);
					ve.getValorSubItemPractica().add(vsip);
				}
				
				valorPractica.setValorSubItemPractica(vsip);
				valorPractica.setValoresEstudio(null);				
				
				//Agregar la practica al vsip.				
				vsip.getValoresPracticas().add(valorPractica);
			}
			else{				
				//Agregar la practica al ve.
				valorPractica.setValorSubItemPractica(null);
				valorPractica.setValoresEstudio(ve);
				ve.getValoresPracticas().add(valorPractica);
			}
			
			//Tengo que restarle a las unidades de Facturacion del Estudio, la suma de las unidades de las practias del VE.
			//Para luego sumarle las unidades de Facturacion del VE como grupo entero.
			if(ve.cantidadPracticas() == ve.getGrupoPractica().cantidadPracticas()){
				double unidadesFacturacionValorEstudio = ve.getUnidadesFacturacionDePracticas();
				unidadesFacturacionEstudio = unidadesFacturacionEstudio - unidadesFacturacionValorEstudio;
				unidadesFacturacionEstudio = unidadesFacturacionEstudio + ve.getUnidadBioquimica();
			}								
		}
		estudio.setUnidadesFacturacionTotal(unidadesFacturacionEstudio);		
		
		return estudio;
	}
	
	//Se usa en la modificacion del Estudio
	public static Estudio getEstudio(Estudio estudio, EstudioDTO estudioDTO, Medico medico){
					
		estudio.setNumero(estudioDTO.getNumero());		
		//estudio.setSolicitadoPor(estudioDTO.getSolicitadoPor());
		estudio.setFecha(Fecha.stringDDMMAAAAToUtilDate(estudioDTO.getFecha()));
		estudio.setUnidadesFacturacionTotal(estudioDTO.getUnidadesFacturacionTotal());
		//estudio.setValorUnidadBioquimica(estudioDTO.getValorUnidadBioquimica());
		estudio.setMedico(medico);
		estudio.setMontoAdeudado(estudioDTO.getMontoAdeudado());
		if(estudioDTO.getFechaEntrega()!=null && !estudioDTO.getFechaEntrega().equals("")){
			estudio.setFechaEntrega(Fecha.stringDDMMAAAAToUtilDate(estudioDTO.getFechaEntrega()));
		}	
		//estudio.setEstado(estudioDTO.getEstado());
		
		estudio.setObservaciones(estudioDTO.getObservaciones());//OBSERVACIONES
		
		return estudio;
	}		
	
	/*public static Localidad getLocalidad(LocalidadDTO localidadDTO) {

		Localidad localidad = new Localidad();
		localidad.setNombre(localidadDTO.getNombre());
		return localidad;
	}

	public static Localidad getLocalidad(Localidad localidad,
			LocalidadDTO localidadDTO) {

		localidad.setNombre(localidadDTO.getNombre());
		return localidad;
	}

	public static Periodo getPeriodo(PeriodoDTO periodoDTO) {

		Periodo periodo = new Periodo();
		periodo.setPeriodo(periodoDTO.getPeriodo());

		for (VencimientoPeriodoDTO vencimientoDTO : periodoDTO
				.getVencimientoPeriodoDTO()) {
			periodo.getVencimientoPeriodo().add(
					ProviderDominio.getVencimientoPeriodo(periodo,
							vencimientoDTO));
		}

		return periodo;
	}

	public static VencimientoPeriodo getVencimientoPeriodo(Periodo periodo,
			VencimientoPeriodoDTO vencimientoPeriodoDTO) {

		VencimientoPeriodo vencimientoPeriodo = new VencimientoPeriodo();

		vencimientoPeriodo.setPeriodo(periodo);
		vencimientoPeriodo.setFecha(Fecha
				.stringDDMMAAAAToUtilDate(vencimientoPeriodoDTO.getFecha()));
		;

		return vencimientoPeriodo;
	}

	public static Periodo getPeriodo(Periodo periodo, PeriodoDTO periodoDTO) {

		periodo.setPeriodo(periodoDTO.getPeriodo());

		for (VencimientoPeriodoDTO vencDTO : periodoDTO
				.getVencimientoPeriodoDTO()) {

			for (VencimientoPeriodo venc : periodo.getVencimientoPeriodo()) {

				if (vencDTO.getId().longValue() == venc.getId().longValue()) {

					venc.setFecha(Fecha.stringDDMMAAAAToUtilDate(vencDTO
							.getFecha()));
				}
			}
		}

		return periodo;
	}

	// Se usa en el alta de Entidad, por lo tanto no seteo las Marcas y SeÃ±ales
	// pq no tiene.
	public static Entidad getEntidad(EntidadDTO entidadDTO, Localidad localidad) {

		Entidad entidad = null;
		if (TipoDeEntidad.PRD.getName().equalsIgnoreCase(
				entidadDTO.getTipoEntidad())) {
			entidad = new Productor();
		} else {
			entidad = new RecursosNaturales();
		}

		entidad.setDireccion(entidadDTO.getDireccion());
		entidad.setEmail(entidadDTO.getEmail());
		entidad.setNombre(entidadDTO.getNombre());
		entidad.setTelefono(entidadDTO.getTelefono());
		entidad.setLocalidad(localidad);
		entidad.setNroMatricula(entidadDTO.getNroMatricula());
		entidad.setNroExpediente(entidadDTO.getNroExpediente());
		entidad.setCuit(entidadDTO.getCuit());
		entidad.setCuil(entidadDTO.getCuil());
		entidad.setDni(entidadDTO.getDni());
		entidad.setTipoDocumento(entidadDTO.getTipoDocumento());
		entidad.setCodigoPostal(entidadDTO.getCodigoPostal());

		return entidad;
	}

	// Se usa en la modificacion de Entidad, por lo tanto no seteo las Marcas y
	// SeÃ±ales pq no se modifican.
	public static Entidad getEntidad(Entidad entidad, EntidadDTO entidadDTO,
			Localidad localidad) {

		entidad.setDireccion(entidadDTO.getDireccion());
		entidad.setEmail(entidadDTO.getEmail());
		entidad.setLocalidad(localidad);
		entidad.setNombre(entidadDTO.getNombre());
		entidad.setTelefono(entidadDTO.getTelefono());
		entidad.setNroMatricula(entidadDTO.getNroMatricula());
		entidad.setCuit(entidadDTO.getCuit());
		entidad.setCuil(entidadDTO.getCuil());
		entidad.setDni(entidadDTO.getDni());
		entidad.setTipoDocumento(entidadDTO.getTipoDocumento());
		entidad.setCodigoPostal(entidadDTO.getCodigoPostal());
		return entidad;
	}*/

	/*public static Provincia getProvincia(ProvinciaDTO provinciaDTO) {

		Provincia provincia = new Provincia();
		provincia.setNombre(provinciaDTO.getNombre());
		return provincia;
	}

	public static Provincia getProvincia(Provincia provincia,
			ProvinciaDTO provinciaDTO) {

		provincia.setNombre(provinciaDTO.getNombre());
		return provincia;
	}

	public static Localidad getLocalidad(LocalidadDTO localidadDTO,
			Provincia provincia) {

		Localidad localidad = new Localidad();
		localidad.setNombre(localidadDTO.getNombre());
		localidad.setProvincia(provincia);

		return localidad;
	}

	public static Localidad getLocalidad(LocalidadDTO localidadDTO,
			Localidad localidad, Provincia provincia) {

		localidad.setNombre(localidadDTO.getNombre());
		localidad.setProvincia(provincia);

		return localidad;
	}

	public static Establecimiento getEstablecimiento(
			EstablecimientoDTO establecimientoDTO, Localidad localidad) {
		Establecimiento establecimiento = new Establecimiento();
		establecimiento.setNombre(establecimientoDTO.getNombre());
		establecimiento.setLocalidad(localidad);
		return establecimiento;
	}

	public static Establecimiento getEstablecimiento(
			EstablecimientoDTO establecimientoDTO,
			Establecimiento establecimiento, Localidad localidad) {
		establecimiento.setNombre(establecimientoDTO.getNombre());
		establecimiento.setLocalidad(localidad);
		return establecimiento;
	}

	public static Marca getMarca(MarcaSenialDTO marcaSenialDTO, Entidad entidad) {

		Marca marca = new Marca();

		marca.setFechaVencimiento(Fecha.stringDDMMAAAAToUtilDate(marcaSenialDTO
				.getFechaVencimiento()));
		marca.setId(marcaSenialDTO.getId());
		marca.setImagen(marcaSenialDTO.getImagen());
		marca.setNumero(marcaSenialDTO.getNumero());
		marca.setBoletaDeposito(ProviderDominio
				.getBoletaDeposito(marcaSenialDTO.getBoletaDeposito()));
		marca.setProductor(entidad);
		String nombreImagen = marcaSenialDTO.getNombreImagen();
		if (marcaSenialDTO.getNombreImagen().contains(File.separator)) {
			nombreImagen = marcaSenialDTO.getNombreImagen().substring(
					marcaSenialDTO.getNombreImagen()
							.lastIndexOf(File.separator));
		}
		marca.setNombreImagen(nombreImagen);

		return marca;
	}

	public static Senial getSenial(MarcaSenialDTO marcaSenialDTO,
			Entidad entidad) {

		Senial senial = new Senial();

		senial.setFechaVencimiento(Fecha
				.stringDDMMAAAAToUtilDate(marcaSenialDTO.getFechaVencimiento()));
		senial.setId(marcaSenialDTO.getId());
		senial.setImagen(marcaSenialDTO.getImagen());
		senial.setNumero(marcaSenialDTO.getNumero());
		senial.setBoletaDeposito(ProviderDominio
				.getBoletaDeposito(marcaSenialDTO.getBoletaDeposito()));
		senial.setProductor(entidad);
		String nombreImagen = marcaSenialDTO.getNombreImagen();
		if (marcaSenialDTO.getNombreImagen().contains(File.separator)) {
			nombreImagen = marcaSenialDTO.getNombreImagen().substring(
					marcaSenialDTO.getNombreImagen()
							.lastIndexOf(File.separator));
		}
		senial.setNombreImagen(nombreImagen);

		return senial;
	}

	public static BoletaDeposito getBoletaDeposito(BoletaDepositoDTO boletaDTO) {

		BoletaDeposito boleta = new BoletaDeposito();
		if (boletaDTO.getFechaPago() != null
				&& !boletaDTO.getFechaPago().equals("")) {
			boleta.setFechaPago(Fecha.stringDDMMAAAAToUtilDate(boletaDTO
					.getFechaPago()));
		}
		boleta.setFechaVencimiento(Fecha.stringDDMMAAAAToUtilDate(boletaDTO
				.getFechaVencimiento()));
		boleta.setId(boletaDTO.getId());
		boleta.setMonto(boletaDTO.getMonto());
		boleta.setNumero(boletaDTO.getNumero());

		return boleta;
	}

	public static BoletaDeposito getBoletaDepositoParaGuias(
			BoletaDepositoDTO boletaDTO, List<Guia> listaGuias,
			Productor productor) {

		BoletaDeposito boleta = ProviderDominio.getBoletaDeposito(boletaDTO);
		boleta.setProductor(productor);
		boleta.setGuias(listaGuias);

		return boleta;
	}

	public static Denuncia getDenuncia(DenunciaDTO denunciaDTO) {
		Denuncia denuncia = new Denuncia();
		denuncia.setNumeroDeDenuncia(denunciaDTO.getNumeroDeDenuncia());
		denuncia.setNumeroDeLlamado(denunciaDTO.getNumeroDeLlamado());
		denuncia.setDesde(Fecha.stringDDMMAAAAToUtilDate(denunciaDTO.getDesde()));
		denuncia.setHasta(Fecha.stringDDMMAAAAToUtilDate(denunciaDTO.getHasta()));
		denuncia.setLugar(denunciaDTO.getLugar());
		return denuncia;

	}

	public static Guia getGuiaLegalizada(GuiaDTO guiaDTO, Marca marca,
			Productor productor, Senial senial, Usuario usuario) {

		Guia guia = new Guia();
		guia.setFechaLegalizacion(Fecha.stringDDMMAAAAToUtilDate(guiaDTO
				.getFechaLegalizacion()));
		guia.setMarca(marca);
		guia.setNumero(guiaDTO.getNumero());
		guia.setNumeroInterno(guiaDTO.getNumeroInterno());
		guia.setPeriodo(guiaDTO.getPeriodo());
		guia.setProductor(productor);
		guia.setSenial(senial);
		guia.setTipoEstadoGuia(TipoEstadoGuia.LEGALIZADA);
		guia.setAgenteFirmante(usuario);
		
		return guia;
	}

	public static void getGuiaDevuelta(Guia guia, GuiaDTO guiaDTO,
			Establecimiento establecimientoOrigen,
			Establecimiento establecimientoDestino, TipoAnimal tipoAnimal) {

		guia.setCanon(guiaDTO.getCanon());
		guia.setCantidad(guiaDTO.getCantidad());
		guia.setEstablecimientoOrigen(establecimientoOrigen);
		guia.setEstablecimientoDestino(establecimientoDestino);
		guia.setFechaTransito(Fecha.stringDDMMAAAAToUtilDate(guiaDTO
				.getFechaTransito()));
		guia.setFinalidad(guiaDTO.getFinalidad());
		guia.setInteres(guiaDTO.getInteres());
		guia.setMedioTransporte(guiaDTO.getMedioTransporte());
		guia.setMonto(guiaDTO.getMonto());
		guia.setNroDTA(guiaDTO.getNroDTA());
		guia.setPatente(guiaDTO.getPatente());
		guia.setPatenteAcoplado(guiaDTO.getPatenteAcoplado());
		guia.setTipoAnimal(tipoAnimal);
		guia.setTipoEstadoGuia(TipoEstadoGuia.DEVUELTA);
		guia.setTrasporteACargo(guiaDTO.getTrasporteACargo());

	}

	public static Autorizado getAutorizado(AutorizadoDTO autorizadoDTO) {
		Autorizado autorizado = new Autorizado();
		autorizado.setNombre(autorizadoDTO.getNombre());
		autorizado.setDni(autorizadoDTO.getDni());
		return autorizado;
	}

	public static TipoAnimal getTipoAnimal(TipoAnimalDTO tipoAnimalDTO,
			Categoria categoria) {
		TipoAnimal tipoAnimal = new TipoAnimal();
		tipoAnimal.setDescripcion(tipoAnimalDTO.getDescripcion());
		tipoAnimal.setCategoria(categoria);
		tipoAnimal.setValor(Double.valueOf(tipoAnimalDTO.getValor()));
		return tipoAnimal;
	}

	public static ProductorEnEstablecimiento getProductorEnEstablecimiento(
			Productor productor, Establecimiento establecimiento,
			TipoAnimal tipoAnimal, int stock) {

		ProductorEnEstablecimiento productorEnEstablecimiento = new ProductorEnEstablecimiento();
		productorEnEstablecimiento.setEstablecimiento(establecimiento);
		productorEnEstablecimiento.setProductor(productor);
		productorEnEstablecimiento.getAnimalesEnEstablecimiento().add(
				getAnimalesEnEstablecimiento(productorEnEstablecimiento,
						tipoAnimal, stock));

		return productorEnEstablecimiento;
	}

	public static AnimalEnEstablecimiento getAnimalesEnEstablecimiento(
			ProductorEnEstablecimiento productorEnEstablecimiento,
			TipoAnimal tipoAnimal, int stock) {

		AnimalEnEstablecimiento animalEnEstablecimiento = new AnimalEnEstablecimiento();
		animalEnEstablecimiento.setStock(stock);
		animalEnEstablecimiento.setTipoAnimal(tipoAnimal);
		animalEnEstablecimiento
				.setProductorEnEstablecimiento(productorEnEstablecimiento);

		return animalEnEstablecimiento;
	}*/
}
