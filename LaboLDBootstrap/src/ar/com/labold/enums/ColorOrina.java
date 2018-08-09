package ar.com.labold.enums;

public enum ColorOrina {

	Amarillo_Ambar("Amarillo Ambar"),
	Amarillo_Claro("Amarillo Claro"),
	Amarillo_Intenso("Amarillo Intenso"),
	Amarillo_Pardo("Amarillo Pardo");
	
	private String descripcion;
	
	ColorOrina(String descripcion){
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}	
}
