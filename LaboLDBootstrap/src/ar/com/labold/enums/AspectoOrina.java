package ar.com.labold.enums;

public enum AspectoOrina {

	Limpido("Limpido"),
	Ligeramente_Turbio("Ligeramente Turbio"),
	Turbio("Turbio");
	
	private String descripcion;
	
	AspectoOrina(String descripcion){
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}	
}
