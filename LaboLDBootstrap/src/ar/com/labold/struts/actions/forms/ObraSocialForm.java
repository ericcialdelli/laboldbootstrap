package ar.com.labold.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.labold.dto.ObraSocialDTO;

public class ObraSocialForm extends ActionForm {

	private ObraSocialDTO obraSocialDTO;
	
	public ObraSocialForm(){
		
		obraSocialDTO = new ObraSocialDTO();
	}

	public ObraSocialDTO getObraSocialDTO() {
		return obraSocialDTO;
	}

	public void setObraSocialDTO(ObraSocialDTO obraSocialDTO) {
		this.obraSocialDTO = obraSocialDTO;
	}
}
