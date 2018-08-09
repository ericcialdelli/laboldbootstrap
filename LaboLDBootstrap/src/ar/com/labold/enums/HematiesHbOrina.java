package ar.com.labold.enums;

public enum HematiesHbOrina {

	No_Contiene("No Contiene"),
	Mas("+"),
	MasMas("++"),
	MasMasMas("+++"),
	MasMasMasMas("++++"),
	Trazas("Trazas");
	
	private String descripcion;
	
	HematiesHbOrina(String descripcion){
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}	
}
