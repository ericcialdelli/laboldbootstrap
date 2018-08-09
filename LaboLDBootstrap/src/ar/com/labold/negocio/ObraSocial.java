package ar.com.labold.negocio;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ObraSocial {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private String nombre;

	private double valorUnidadBioquimica;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public double getValorUnidadBioquimica() {
		return valorUnidadBioquimica;
	}

	public void setValorUnidadBioquimica(double valorUnidadBioquimica) {
		this.valorUnidadBioquimica = valorUnidadBioquimica;
	}
	
}
