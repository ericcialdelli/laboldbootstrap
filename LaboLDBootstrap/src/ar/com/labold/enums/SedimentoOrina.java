package ar.com.labold.enums;

public enum SedimentoOrina {

	No_Contiene("No Contiene"),
	Escasa_Cantidad("Escasa Cantidad"),
	Regular_Cantidad("Regular Cantidad"),
	Abundante_Cantidad("Abundante Cantidad");
	
	private String descripcion;
	
	SedimentoOrina(String descripcion){
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}	
}
