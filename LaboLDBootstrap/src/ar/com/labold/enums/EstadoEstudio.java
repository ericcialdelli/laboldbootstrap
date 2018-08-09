package ar.com.labold.enums;

public enum EstadoEstudio {
	
	ENTREGADO("Entregado"), NO_ENTREGADO("No Entregado");
	
	private String descripcion;

	EstadoEstudio(String pDescripcion) {
		this.descripcion = pDescripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getName() {
		return name();
	}
}
