package ar.com.labold.fachada;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.labold.dao.ObraSocialDAO;
import ar.com.labold.dao.PacienteDAO;
import ar.com.labold.dto.PacienteDTO;
import ar.com.labold.negocio.ObraSocial;
import ar.com.labold.negocio.Paciente;
import ar.com.labold.providers.ProviderDominio;

@Transactional(rollbackFor = { Throwable.class })
public class PacienteFachada {

	private PacienteDAO pacienteDAO;
	private ObraSocialDAO obraSocialDAO;
	
	public PacienteFachada(){}
	
	public PacienteFachada(PacienteDAO pPacienteDAO, ObraSocialDAO pObraSocialDAO){
		
		this.pacienteDAO = pPacienteDAO;
		this.obraSocialDAO = pObraSocialDAO;
	}
	
	public Paciente altaPaciente(PacienteDTO pacienteDTO){
		
		ObraSocial obraSocial = obraSocialDAO.getObraSocial(pacienteDTO.getObraSocial().getId());
		Paciente paciente = ProviderDominio.getPaciente(pacienteDTO,obraSocial);
		
		pacienteDAO.altaPaciente(paciente);
		
		return paciente;
	}

	public void modificacionPaciente(PacienteDTO pacienteDTO){
		
		Paciente paciente = pacienteDAO.getPaciente(pacienteDTO.getId());
		ObraSocial obraSocial = obraSocialDAO.getObraSocial(pacienteDTO.getObraSocial().getId());			
		
		pacienteDAO.altaPaciente(ProviderDominio.getPaciente(paciente,pacienteDTO,obraSocial));
	}		
	
	public List<Paciente> getPacientes(){
		
		return pacienteDAO.getPacientes();
	}

	public Paciente getPaciente(Long idPaciente){
		
		return pacienteDAO.getPaciente(idPaciente);
	}	
	
	public boolean existePaciente(int dni, Long id){
		
		return pacienteDAO.existePaciente(dni,id);
	}
	
	public Paciente altaPacienteDesdeAltaEstudio(String nombre,String apellido,String fechaNacimiento,int dni, 
											     String direccion,String telefono,String email, Long idObraSocial,
											     String nroCarnetObraSocial, String observaciones){
		
		PacienteDTO pacienteDTO = new PacienteDTO();
		pacienteDTO.setNombre(nombre);
		pacienteDTO.setApellido(apellido);
		pacienteDTO.setFechaNacimiento(fechaNacimiento);
		pacienteDTO.setDni(dni);
		pacienteDTO.setDireccion(direccion);
		pacienteDTO.setTelefono(telefono);
		pacienteDTO.setEmail(email);
		pacienteDTO.getObraSocial().setId(idObraSocial);
		pacienteDTO.setNroCarnetObraSocial(nroCarnetObraSocial);
		pacienteDTO.setObservaciones(observaciones);
		
		return this.altaPaciente(pacienteDTO);		
	}
	
	public void modificarPacienteDesdeAltaEstudio(Long idPaciente, String nombre,String apellido,String fechaNacimiento,int dni, 
		     String direccion,String telefono,String email, Long idObraSocial, String nroCarnetObraSocial, String observaciones){

		PacienteDTO pacienteDTO = new PacienteDTO();
		pacienteDTO.setId(idPaciente);
		pacienteDTO.setNombre(nombre);
		pacienteDTO.setApellido(apellido);
		pacienteDTO.setFechaNacimiento(fechaNacimiento);
		pacienteDTO.setDni(dni);
		pacienteDTO.setDireccion(direccion);
		pacienteDTO.setTelefono(telefono);
		pacienteDTO.setEmail(email);
		pacienteDTO.getObraSocial().setId(idObraSocial);
		pacienteDTO.setNroCarnetObraSocial(nroCarnetObraSocial);
		pacienteDTO.setObservaciones(observaciones);
		
		this.modificacionPaciente(pacienteDTO);		
	}
	
	public void eliminarPaciente(PacienteDTO pacienteDTO){
		
		Paciente paciente = pacienteDAO.getPaciente(pacienteDTO.getId());
		pacienteDAO.eliminarPaciente(paciente);
	}

}
