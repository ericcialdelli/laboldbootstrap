package ar.com.labold.negocio;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Parametro {

	@Id
	private Long clave;
	
	private String valor;

	private String descripcion;
	
	public Long getClave() {
		return clave;
	}

	public void setClave(Long clave) {
		this.clave = clave;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
}
