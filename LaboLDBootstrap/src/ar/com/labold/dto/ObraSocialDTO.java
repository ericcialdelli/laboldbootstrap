package ar.com.labold.dto;

public class ObraSocialDTO {

	private Long id;
	
	private String nombre;
	
	private double valorUnidadBioquimica;
	
	public ObraSocialDTO(){}

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
	
	public double getValorUnidadBioquimica() {
		return valorUnidadBioquimica;
	}

	public void setValorUnidadBioquimica(double valorUnidadBioquimica) {
		this.valorUnidadBioquimica = valorUnidadBioquimica;
	}
}
