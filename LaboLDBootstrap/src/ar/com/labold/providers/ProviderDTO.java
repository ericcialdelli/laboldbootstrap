package ar.com.labold.providers;

import java.util.ArrayList;
import java.util.List;

import ar.com.labold.dto.EstudioDTO;
import ar.com.labold.dto.ItemMenuDTO;
import ar.com.labold.dto.ObraSocialDTO;
import ar.com.labold.dto.PacienteDTO;
import ar.com.labold.dto.RolDTO;
import ar.com.labold.dto.UsuarioDTO;
import ar.com.labold.negocio.Estudio;
import ar.com.labold.negocio.ItemMenu;
import ar.com.labold.negocio.ObraSocial;
import ar.com.labold.negocio.Paciente;
import ar.com.labold.negocio.Rol;
import ar.com.labold.negocio.Usuario;
import ar.com.labold.utils.Fecha;

/*import ar.com.siig.dto.AutorizadoDTO;
import ar.com.siig.dto.BoletaDepositoDTO;
import ar.com.siig.dto.DenunciaDTO;
import ar.com.siig.dto.EntidadDTO;
import ar.com.siig.dto.EstablecimientoDTO;
import ar.com.siig.dto.GuiaDTO;
import ar.com.siig.dto.ItemMenuDTO;
import ar.com.siig.dto.LocalidadDTO;
import ar.com.siig.dto.MarcaSenialDTO;
import ar.com.siig.dto.PeriodoDTO;
import ar.com.siig.dto.ProvinciaDTO;
import ar.com.siig.dto.RolDTO;
import ar.com.siig.dto.TipoAnimalDTO;
import ar.com.siig.dto.TipoAutorizacionDTO;
import ar.com.siig.dto.TipoProductoDTO;
import ar.com.siig.dto.UsuarioDTO;
import ar.com.siig.dto.VencimientoPeriodoDTO;
import ar.com.siig.enums.TipoFinalidad;
import ar.com.siig.negocio.Autorizado;
import ar.com.siig.negocio.BoletaDeposito;
import ar.com.siig.negocio.Denuncia;
import ar.com.siig.negocio.Entidad;
import ar.com.siig.negocio.Establecimiento;
import ar.com.siig.negocio.Guia;
import ar.com.siig.negocio.ItemMenu;
import ar.com.siig.negocio.Localidad;
import ar.com.siig.negocio.Marca;
import ar.com.siig.negocio.MarcaSenial;
import ar.com.siig.negocio.Periodo;
import ar.com.siig.negocio.Provincia;
import ar.com.siig.negocio.Rol;
import ar.com.siig.negocio.Senial;
import ar.com.siig.negocio.TipoAnimal;
import ar.com.siig.negocio.TipoAutorizacion;
import ar.com.siig.negocio.TipoProducto;
import ar.com.siig.negocio.Usuario;
import ar.com.siig.negocio.VencimientoPeriodo;
import ar.com.siig.utils.Fecha;*/

public abstract class ProviderDTO {

	public static UsuarioDTO getUsuarioDTO(Usuario usuario) {

		UsuarioDTO usuarioDTO = new UsuarioDTO();

		usuarioDTO.setId(usuario.getId());
		usuarioDTO.setNombreUsuario(usuario.getNombreUsuario());
		usuarioDTO.setPassword(usuario.getPassword());
		usuarioDTO.setRol(ProviderDTO.getRolDTO(usuario.getRol()));
		usuarioDTO.setHabilitado(usuario.isHabilitado());
		
		return usuarioDTO;
	}

	public static RolDTO getRolDTO(Rol rol) {

		List<ItemMenuDTO> listaMenuesDTO = new ArrayList<ItemMenuDTO>();
		RolDTO rolDTO = new RolDTO();

		rolDTO.setId(rol.getId());
		rolDTO.setRol(rol.getRol());

		for (ItemMenu menu : rol.getMenues()) {
			listaMenuesDTO.add(ProviderDTO.getItemMenuDTO(menu));
		}
		rolDTO.setMenues(listaMenuesDTO);

		return rolDTO;
	}

	public static ItemMenuDTO getItemMenuDTO(ItemMenu menu) {
		return ProviderDTO.getItemMenuDTO(menu, null);
	}

	private static ItemMenuDTO getItemMenuDTO(ItemMenu menu, ItemMenuDTO padre) {

		if (menu != null) {
			List<ItemMenuDTO> listaMenuDTO = new ArrayList<ItemMenuDTO>();
			ItemMenuDTO menuDTO = new ItemMenuDTO();

			menuDTO.setId(menu.getId());
			menuDTO.setItem(menu.getItem());
			menuDTO.setOrden(menu.getOrden());
			menuDTO.setPadre(padre);
			menuDTO.setUrl(menu.getUrl());

			for (ItemMenu menuHijo : menu.getHijos()) {
				listaMenuDTO.add(ProviderDTO.getItemMenuDTO(menuHijo, menuDTO));
			}
			menuDTO.setHijos(listaMenuDTO);

			return menuDTO;
		} else {
			return null;
		}
	}

	public static PacienteDTO getPacienteDTO(Paciente paciente) {

		PacienteDTO pacienteDTO = new PacienteDTO();

		pacienteDTO.setApellido(paciente.getApellido());
		pacienteDTO.setDireccion(paciente.getDireccion());
		pacienteDTO.setDni(paciente.getDni());
		pacienteDTO.setEmail(paciente.getEmail());
		pacienteDTO.setId(paciente.getId());
		pacienteDTO.setNombre(paciente.getNombre());
		pacienteDTO.setTelefono(paciente.getTelefono());
		pacienteDTO.setFechaNacimiento(Fecha.getFechaDDMMAAAASlash(Fecha
				.dateToStringDDMMAAAA(paciente.getFechaNacimiento())));
		pacienteDTO.setObraSocial(ProviderDTO.getObraSocialDTO(paciente.getObraSocial()));
		pacienteDTO.setNroCarnetObraSocial(paciente.getNroCarnetObraSocial());
		pacienteDTO.setObservaciones(paciente.getObservaciones());
		
		return pacienteDTO;
	}	
	
	public static ObraSocialDTO getObraSocialDTO(ObraSocial obraSocial){
		
		ObraSocialDTO obraSocialDTO = new ObraSocialDTO();
		obraSocialDTO.setId(obraSocial.getId());
		obraSocialDTO.setNombre(obraSocial.getNombre());
		obraSocialDTO.setValorUnidadBioquimica(obraSocial.getValorUnidadBioquimica());
		
		return obraSocialDTO;
	}
	
	public static EstudioDTO getEstudioDTO(Estudio estudio){
		
		EstudioDTO estudioDTO = new EstudioDTO(); 
		estudioDTO.setId(estudio.getId());
		estudioDTO.setNumero(estudio.getNumero());
		estudioDTO.setPaciente(ProviderDTO.getPacienteDTO(estudio.getPaciente()));
		//estudioDTO.setSolicitadoPor(estudio.getSolicitadoPor());
		estudioDTO.setFecha(Fecha.getFechaDDMMAAAASlash(Fecha
				.dateToStringDDMMAAAA(estudio.getFecha())));
		estudioDTO.setMontoAdeudado(estudio.getMontoAdeudado());
		estudioDTO.setFechaEntrega((Fecha.getFechaDDMMAAAASlash(Fecha.dateToStringDDMMAAAA(estudio.getFechaEntrega()))));
		estudioDTO.setEstado(estudio.getEstado());
		estudioDTO.setValorUnidadBioquimica(estudio.getValorUnidadBioquimica());
		
		estudioDTO.setObservaciones(estudio.getObservaciones());//OBSERVACIONES
		
		return estudioDTO;
	}
	
	
	/*public static PeriodoDTO getPeriodoDTO(Periodo periodo) {

		PeriodoDTO periodoDTO = new PeriodoDTO();

		periodoDTO.setId(periodo.getId());
		periodoDTO.setPeriodo(periodo.getPeriodo());

		for (VencimientoPeriodo vencimientoPeriodo : periodo
				.getVencimientoPeriodo()) {

			periodoDTO.getVencimientoPeriodoDTO().add(
					ProviderDTO.getVencimientoPeriodoDTO(periodoDTO,
							vencimientoPeriodo));
		}

		return periodoDTO;
	}

	public static VencimientoPeriodoDTO getVencimientoPeriodoDTO(
			PeriodoDTO periodoDTO, VencimientoPeriodo vencimientoPeriodo) {

		VencimientoPeriodoDTO vencimientoPeriodoDTO = new VencimientoPeriodoDTO();

		vencimientoPeriodoDTO.setId(vencimientoPeriodo.getId());
		vencimientoPeriodoDTO.setPeriodoDTO(periodoDTO);
		vencimientoPeriodoDTO.setFecha(Fecha.getFechaDDMMAAAASlash(Fecha
				.dateToStringDDMMAAAA(vencimientoPeriodo.getFecha())));

		return vencimientoPeriodoDTO;
	}

	public static EntidadDTO getEntidadDTO(Entidad entidad) {

		EntidadDTO entidadDTO = new EntidadDTO();

		entidadDTO.setId(entidad.getId());
		entidadDTO.setNombre(entidad.getNombre());
		entidadDTO.setDireccion(entidad.getDireccion());
		entidadDTO.setTelefono(entidad.getTelefono());
		entidadDTO.setEmail(entidad.getEmail());
		entidadDTO.setLocalidad(ProviderDTO.getLocalidadDTO(entidad
				.getLocalidad()));
		entidadDTO.setTipoEntidadDesc(entidad.getTipoEntidad());
		entidadDTO.setTipoEntidad(entidad.getIdTipoEntidad());
		entidadDTO.setNroMatricula(entidad.getNroMatricula());
		entidadDTO.setNroExpediente(entidad.getNroExpediente());
		entidadDTO.setCuit(entidad.getCuit());
		entidadDTO.setCuil(entidad.getCuil());
		entidadDTO.setDni(entidad.getDni());
		entidadDTO.setTipoDocumento(entidad.getTipoDocumento());
		entidadDTO.setCodigoPostal(entidad.getCodigoPostal());

		List<MarcaSenialDTO> listaMarcasDTO = new ArrayList<MarcaSenialDTO>();
		for (Marca marca : entidad.getMarcas()) {
			listaMarcasDTO.add(getMarcaSenialDTO(marca));
		}
		entidadDTO.setMarcas(listaMarcasDTO);

		List<MarcaSenialDTO> listaSenialesDTO = new ArrayList<MarcaSenialDTO>();
		for (Senial senial : entidad.getSeniales()) {
			listaSenialesDTO.add(getMarcaSenialDTO(senial));
		}
		entidadDTO.setSeniales(listaSenialesDTO);

		return entidadDTO;
	}

	public static TipoProductoDTO getTipoProductoDTO(TipoProducto tipoProducto) {
		TipoProductoDTO tipoProdDTO = new TipoProductoDTO();
		tipoProdDTO.setId(tipoProducto.getId());
		tipoProdDTO.setNombre(tipoProducto.getNombre());
		return tipoProdDTO;
	}

	public static ProvinciaDTO getProvinciaDTO(Provincia provincia) {
		ProvinciaDTO provinciaDTO = new ProvinciaDTO();
		provinciaDTO.setId(provincia.getId());
		provinciaDTO.setNombre(provincia.getNombre());
		return provinciaDTO;
	}

	public static LocalidadDTO getLocalidadDTO(Localidad localidad) {
		LocalidadDTO localidadDTO = new LocalidadDTO();
		localidadDTO.setId(localidad.getId());
		localidadDTO.setNombre(localidad.getNombre());
		localidadDTO.setProvinciaDTO(ProviderDTO.getProvinciaDTO(localidad
				.getProvincia()));
		return localidadDTO;
	}

	public static EstablecimientoDTO getEstablecimientoDTO(
			Establecimiento establecimiento) {
		EstablecimientoDTO establecimientoDTO = new EstablecimientoDTO();
		establecimientoDTO.setId(establecimiento.getId());
		establecimientoDTO.setNombre(establecimiento.getNombre());
		establecimientoDTO.setLocalidadDTO(ProviderDTO
				.getLocalidadDTO(establecimiento.getLocalidad()));
		return establecimientoDTO;
	}

	public static MarcaSenialDTO getMarcaSenialDTO(MarcaSenial marcaSenial) {

		MarcaSenialDTO marcaSenialDTO = new MarcaSenialDTO();
		marcaSenialDTO.setTipo(marcaSenial.getIdTipoMarcaSenial());
		marcaSenialDTO.setBoletaDeposito(getBoletaDepositoDTO(marcaSenial
				.getBoletaDeposito()));
		marcaSenialDTO.setFechaVencimiento(Fecha.getFechaDDMMAAAASlash(Fecha
				.dateToStringDDMMAAAA(marcaSenial.getFechaVencimiento())));
		marcaSenialDTO.setId(marcaSenial.getId());
		marcaSenialDTO.setImagen(marcaSenial.getImagen());
		marcaSenialDTO.setNumero(marcaSenial.getNumero());
		marcaSenialDTO.setNombreImagen(marcaSenial.getNombreImagen());

		return marcaSenialDTO;
	}

	public static BoletaDepositoDTO getBoletaDepositoDTO(BoletaDeposito boleta) {

		BoletaDepositoDTO boletaDTO = new BoletaDepositoDTO();
		if (boleta.getFechaPago() != null && !boleta.getFechaPago().equals("")) {
			boletaDTO.setFechaPago(Fecha.getFechaDDMMAAAASlash(Fecha
					.dateToStringDDMMAAAA(boleta.getFechaPago())));
		}
		boletaDTO.setFechaVencimiento(Fecha.getFechaDDMMAAAASlash(Fecha
				.dateToStringDDMMAAAA(boleta.getFechaVencimiento())));
		boletaDTO.setId(boleta.getId());
		boletaDTO.setMonto(boleta.getMonto());
		boletaDTO.setNumero(boleta.getNumero());

		return boletaDTO;
	}

	public static AutorizadoDTO getAutorizadoDTO(Autorizado autorizado) {
		AutorizadoDTO autorizadoDTO = new AutorizadoDTO();
		autorizadoDTO.setId(autorizado.getId());
		autorizadoDTO.setDni(autorizado.getDni());
		autorizadoDTO.setNombre(autorizado.getNombre());
		return autorizadoDTO;
	}

	public static TipoAutorizacionDTO getTipoAutorizacionDTO(
			TipoAutorizacion tipoAutorizacion) {
		TipoAutorizacionDTO tipoAutorizacionDTO = new TipoAutorizacionDTO();
		tipoAutorizacionDTO.setId(tipoAutorizacion.getId());
		tipoAutorizacionDTO.setDescripcion(tipoAutorizacion.getDescripcion());
		return tipoAutorizacionDTO;
	}

	public static DenunciaDTO getDenunciaDTO(Denuncia denuncia) {
		DenunciaDTO denunciaDTO = new DenunciaDTO();
		denunciaDTO.setId(denuncia.getId());
		denunciaDTO.setNumeroDeDenuncia(denuncia.getNumeroDeDenuncia());
		return denunciaDTO;
	}

	public static TipoAnimalDTO getTipoAnimalDTO(TipoAnimal tipoAnimal) {
		TipoAnimalDTO tipoAnimalDTO = new TipoAnimalDTO();
		tipoAnimalDTO.setId(tipoAnimal.getId());
		tipoAnimalDTO.setDescripcion(tipoAnimal.getDescripcion());
		tipoAnimalDTO.setIdCategoria(tipoAnimal.getCategoria().getId());
		tipoAnimalDTO.setDescripcionCategoria(tipoAnimal.getCategoria()
				.getDescripcion());
		tipoAnimalDTO.setSuperCategoriaTipoAnimal(tipoAnimal.getCategoria()
				.getSuperCategoriaTipoAnimal());
		tipoAnimalDTO.setValor(tipoAnimal.getValor().toString());
		return tipoAnimalDTO;
	}	
	
	public static GuiaDTO getGuiaDTO(Guia guia){
		
		GuiaDTO guiaDTO = new GuiaDTO();
		
		guiaDTO.setFechaLegalizacion(Fecha.getFechaDDMMAAAASlash(Fecha.dateToStringDDMMAAAA(
																	guia.getFechaLegalizacion())));
		guiaDTO.setId(guia.getId());
		guiaDTO.setMarcaSenial(ProviderDTO.getMarcaSenialDTO(
				(guia.getMarca() != null)?guia.getMarca():guia.getSenial()));
		guiaDTO.setNumero(guia.getNumero());
		guiaDTO.setNumeroInterno(guia.getNumeroInterno());
		guiaDTO.setPeriodo(guia.getPeriodo());
		guiaDTO.setProductor(ProviderDTO.getEntidadDTO(guia.getProductor()));
		guiaDTO.setAgenteFirmante(ProviderDTO.getUsuarioDTO(guia.getAgenteFirmante()));
		
		guiaDTO.setCanon(guia.getCanon());
		guiaDTO.setCantidad(guia.getCantidad());
		if(guia.getEstablecimientoDestino() != null){
			guiaDTO.setEstablecimientoDestino(ProviderDTO.getEstablecimientoDTO(guia.getEstablecimientoDestino()));
		}	
		if(guia.getEstablecimientoOrigen() != null){
			guiaDTO.setEstablecimientoOrigen(ProviderDTO.getEstablecimientoDTO(guia.getEstablecimientoOrigen()));
		}
		if (guia.getFechaTransito() != null && !guia.getFechaTransito().equals("")) {
			guiaDTO.setFechaTransito(Fecha.getFechaDDMMAAAASlash(Fecha
					.dateToStringDDMMAAAA(guia.getFechaTransito())));
		}			
		guiaDTO.setFinalidad(guia.getFinalidad());			
		guiaDTO.setInteres(guia.getInteres());
		guiaDTO.setMedioTransporte(guia.getMedioTransporte());
		guiaDTO.setMonto(guia.getMonto());
		guiaDTO.setNroDTA(guia.getNroDTA());
		guiaDTO.setPatente(guia.getPatente());
		guiaDTO.setPatenteAcoplado(guia.getPatenteAcoplado());
		if(guia.getTipoAnimal() != null){
			guiaDTO.setTipoAnimal(ProviderDTO.getTipoAnimalDTO(guia.getTipoAnimal()));
		}	
		guiaDTO.setTipoEstadoGuia(guia.getTipoEstadoGuia());
		guiaDTO.setTrasporteACargo(guia.getTrasporteACargo());
		
		
		return guiaDTO;
	}*/
}
