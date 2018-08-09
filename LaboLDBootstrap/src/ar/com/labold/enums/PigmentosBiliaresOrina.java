package ar.com.labold.enums;

public enum PigmentosBiliaresOrina {

	No_Contiene("No Contiene"),
	Mas("+"),
	No_Reactivo("No Reactivo");
	
	private String descripcion;
	
	PigmentosBiliaresOrina(String descripcion){
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}	
}
