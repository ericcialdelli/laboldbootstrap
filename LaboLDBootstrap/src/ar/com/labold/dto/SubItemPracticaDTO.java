package ar.com.labold.dto;


public class SubItemPracticaDTO {

	private Long id;
	
	private String nombre;
	
	private GrupoPracticaDTO grupoPractica;
	
	private String codigoFaba;
	
	public SubItemPracticaDTO(){
		
		this.grupoPractica = new GrupoPracticaDTO();
	}

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

	public GrupoPracticaDTO getGrupoPractica() {
		return grupoPractica;
	}

	public void setGrupoPractica(GrupoPracticaDTO grupoPractica) {
		this.grupoPractica = grupoPractica;
	}

	public String getCodigoFaba() {
		return codigoFaba;
	}

	public void setCodigoFaba(String codigoFaba) {
		this.codigoFaba = codigoFaba;
	}

}
