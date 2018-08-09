package ar.com.labold.enums;

public enum GlucosaOrina {

	No_Contiene("No Contiene");
	
	private String descripcion;
	
	GlucosaOrina(String descripcion){
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}	
}
