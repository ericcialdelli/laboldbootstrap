package ar.com.labold.struts.actions.forms;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;
import org.apache.struts.action.ActionForm;

import ar.com.labold.dto.PracticaDTO;

public class EstudioPreSeteadoForm extends ActionForm {

	private String id;
	private String nombre;
	private List<PracticaDTO> listaPracticas;
	
	public EstudioPreSeteadoForm(){
		
		listaPracticas = (List<PracticaDTO>) LazyList.decorate(new ArrayList(),
				FactoryUtils.instantiateFactory(PracticaDTO.class));		
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<PracticaDTO> getListaPracticas() {
		return listaPracticas;
	}

	public void setListaPracticas(List<PracticaDTO> listaPracticas) {
		this.listaPracticas = listaPracticas;
	}

	public void normalizarListaPracticas() {

		List<PracticaDTO> listaEliminar = new ArrayList<PracticaDTO>();
		for (PracticaDTO practica : listaPracticas) {
			if (practica != null && practica.getId() == 0) {
				listaEliminar.add(practica);
			}
		}
		listaPracticas.removeAll(listaEliminar);
	}	
}
