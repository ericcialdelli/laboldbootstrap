package ar.com.labold.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.labold.dto.GrupoPracticaDTO;
import ar.com.labold.dto.SubItemPracticaDTO;

public class GrupoPracticaForm extends ActionForm {

	private GrupoPracticaDTO grupoPracticaDTO;
	private SubItemPracticaDTO subItemPracticaDTO;  
	
	public GrupoPracticaForm(){
		
		this.grupoPracticaDTO = new GrupoPracticaDTO();
		this.subItemPracticaDTO = new SubItemPracticaDTO();
	}

	public GrupoPracticaDTO getGrupoPracticaDTO() {
		return grupoPracticaDTO;
	}

	public void setGrupoPracticaDTO(GrupoPracticaDTO grupoPracticaDTO) {
		this.grupoPracticaDTO = grupoPracticaDTO;
	}

	public SubItemPracticaDTO getSubItemPracticaDTO() {
		return subItemPracticaDTO;
	}

	public void setSubItemPracticaDTO(SubItemPracticaDTO subItemPracticaDTO) {
		this.subItemPracticaDTO = subItemPracticaDTO;
	}
	
}
