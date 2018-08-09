package ar.com.labold.enums;

public enum UrobilinogenoOrina {

	No_Contiene("No Contiene"),
	Normal("Normal");
	
	private String descripcion;
	
	UrobilinogenoOrina(String descripcion){
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}	
}
