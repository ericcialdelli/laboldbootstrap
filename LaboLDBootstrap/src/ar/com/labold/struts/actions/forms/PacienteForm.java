package ar.com.labold.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.labold.dto.PacienteDTO;

public class PacienteForm extends ActionForm {

	private PacienteDTO pacienteDTO;

	public PacienteForm(){
		
		pacienteDTO = new PacienteDTO();
	}
	
	public PacienteDTO getPacienteDTO() {
		return pacienteDTO;
	}

	public void setPacienteDTO(PacienteDTO pacienteDTO) {
		this.pacienteDTO = pacienteDTO;
	}

}
