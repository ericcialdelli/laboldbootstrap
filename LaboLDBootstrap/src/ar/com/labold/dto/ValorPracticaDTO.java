package ar.com.labold.dto;

public class ValorPracticaDTO {

	private Long id;

	private String valor;

	private Double unidadBioquimica;	
	
	private boolean cubreOS;
	
	private PracticaDTO practicaDTO;	

	private ValoresEstudioDTO valoresEstudioDTO;

	private ValorSubItemPracticaDTO valorSubItemPracticaDTO;

	public ValorPracticaDTO(){
		
		practicaDTO = new PracticaDTO();
		valoresEstudioDTO = new ValoresEstudioDTO();
		valorSubItemPracticaDTO = new ValorSubItemPracticaDTO();
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public Double getUnidadBioquimica() {
		return unidadBioquimica;
	}

	public void setUnidadBioquimica(Double unidadBioquimica) {
		this.unidadBioquimica = unidadBioquimica;
	}

	public PracticaDTO getPracticaDTO() {
		return practicaDTO;
	}

	public void setPracticaDTO(PracticaDTO practicaDTO) {
		this.practicaDTO = practicaDTO;
	}

	public ValoresEstudioDTO getValoresEstudioDTO() {
		return valoresEstudioDTO;
	}

	public void setValoresEstudioDTO(ValoresEstudioDTO valoresEstudioDTO) {
		this.valoresEstudioDTO = valoresEstudioDTO;
	}

	public ValorSubItemPracticaDTO getValorSubItemPracticaDTO() {
		return valorSubItemPracticaDTO;
	}

	public void setValorSubItemPracticaDTO(
			ValorSubItemPracticaDTO valorSubItemPracticaDTO) {
		this.valorSubItemPracticaDTO = valorSubItemPracticaDTO;
	}

	public boolean isCubreOS() {
		return cubreOS;
	}

	public void setCubreOS(boolean cubreOS) {
		this.cubreOS = cubreOS;
	}
	
}
