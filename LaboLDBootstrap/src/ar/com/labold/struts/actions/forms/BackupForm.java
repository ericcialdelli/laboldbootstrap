package ar.com.labold.struts.actions.forms;

import org.apache.struts.action.ActionForm;

public class BackupForm extends ActionForm {

	private String nombre;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
}
