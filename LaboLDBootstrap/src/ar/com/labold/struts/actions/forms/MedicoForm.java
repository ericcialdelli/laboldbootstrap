package ar.com.labold.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.labold.dto.MedicoDTO;

public class MedicoForm extends ActionForm {

	private MedicoDTO medicoDTO;
	
	public MedicoForm(){
		
		medicoDTO = new MedicoDTO();
	}

	public MedicoDTO getMedicoDTO() {
		return medicoDTO;
	}

	public void setMedicoDTO(MedicoDTO medicoDTO) {
		this.medicoDTO = medicoDTO;
	}
}
