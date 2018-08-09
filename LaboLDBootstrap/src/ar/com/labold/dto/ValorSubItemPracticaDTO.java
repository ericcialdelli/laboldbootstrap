package ar.com.labold.dto;

import java.util.ArrayList;
import java.util.List;

public class ValorSubItemPracticaDTO {

	private Long id;

	private String nombre;

	private SubItemPracticaDTO subItemPracticaDTO;

	private ValoresEstudioDTO valoresEstudioDTO;

	private List<ValorPracticaDTO> valoresPracticasDTO = new ArrayList<ValorPracticaDTO>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public SubItemPracticaDTO getSubItemPracticaDTO() {
		return subItemPracticaDTO;
	}

	public void setSubItemPracticaDTO(SubItemPracticaDTO subItemPracticaDTO) {
		this.subItemPracticaDTO = subItemPracticaDTO;
	}

	public ValoresEstudioDTO getValoresEstudioDTO() {
		return valoresEstudioDTO;
	}

	public void setValoresEstudioDTO(ValoresEstudioDTO valoresEstudioDTO) {
		this.valoresEstudioDTO = valoresEstudioDTO;
	}

	public List<ValorPracticaDTO> getValoresPracticasDTO() {
		return valoresPracticasDTO;
	}

	public void setValoresPracticasDTO(List<ValorPracticaDTO> valoresPracticasDTO) {
		this.valoresPracticasDTO = valoresPracticasDTO;
	}
	
	
}
