package ar.com.labold.enums;

public enum ProteinasOrina {

	No_Contiene("No Contiene"),
	Trazas("Trazas"),
	Mas("+"),
	MasMasMas("+++");
	
	private String descripcion;
	
	ProteinasOrina(String descripcion){
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}	
}
