package ar.com.labold.struts.actions.forms;

import org.apache.struts.action.ActionForm;

import ar.com.labold.negocio.Parametro;

public class ParametroForm extends ActionForm {

	private Parametro parametro;

	public ParametroForm(){
		
		parametro =  new Parametro();
	}

	public Parametro getParametro() {
		return parametro;
	}

	public void setParametro(Parametro parametro) {
		this.parametro = parametro;
	}
	
}
