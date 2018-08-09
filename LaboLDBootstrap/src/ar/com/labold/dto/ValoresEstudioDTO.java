package ar.com.labold.dto;

import java.util.ArrayList;
import java.util.List;

public class ValoresEstudioDTO {

	private Long id;
		
	private String nombre;	
	
	private Double unidadBioquimica;

	private GrupoPracticaDTO grupoPracticaDTO;

	private List<ValorPracticaDTO> valoresPracticasDTO = new ArrayList<ValorPracticaDTO>();	

	private List<ValorSubItemPracticaDTO> valorSubItemPracticaDTO = new ArrayList<ValorSubItemPracticaDTO>();		

	private EstudioDTO estudioDTO;

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

	public Double getUnidadBioquimica() {
		return unidadBioquimica;
	}

	public void setUnidadBioquimica(Double unidadBioquimica) {
		this.unidadBioquimica = unidadBioquimica;
	}

	public GrupoPracticaDTO getGrupoPracticaDTO() {
		return grupoPracticaDTO;
	}

	public void setGrupoPracticaDTO(GrupoPracticaDTO grupoPracticaDTO) {
		this.grupoPracticaDTO = grupoPracticaDTO;
	}

	public List<ValorPracticaDTO> getValoresPracticasDTO() {
		return valoresPracticasDTO;
	}

	public void setValoresPracticasDTO(List<ValorPracticaDTO> valoresPracticasDTO) {
		this.valoresPracticasDTO = valoresPracticasDTO;
	}

	public List<ValorSubItemPracticaDTO> getValorSubItemPracticaDTO() {
		return valorSubItemPracticaDTO;
	}

	public void setValorSubItemPracticaDTO(
			List<ValorSubItemPracticaDTO> valorSubItemPracticaDTO) {
		this.valorSubItemPracticaDTO = valorSubItemPracticaDTO;
	}

	public EstudioDTO getEstudioDTO() {
		return estudioDTO;
	}

	public void setEstudioDTO(EstudioDTO estudioDTO) {
		this.estudioDTO = estudioDTO;
	}	
}
