package ar.com.labold.enums;

public enum NitritosOrina {

	No_Contiene("No Contiene"),
	Mas("+"),
	MasMas("++");
	
	private String descripcion;
	
	NitritosOrina(String descripcion){
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}	
}
