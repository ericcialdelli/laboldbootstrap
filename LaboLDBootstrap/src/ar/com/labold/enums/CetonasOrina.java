package ar.com.labold.enums;

public enum CetonasOrina {

	No_Contiene("No Contiene"),
	Mas("+"),
	Trazas("Trazas");
	
	private String descripcion;
	
	CetonasOrina(String descripcion){
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}	
}
