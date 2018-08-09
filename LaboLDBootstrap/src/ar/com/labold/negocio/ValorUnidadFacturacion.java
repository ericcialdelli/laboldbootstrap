package ar.com.labold.negocio;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ValorUnidadFacturacion {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;	
	
	private double valorEnPesos;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public double getValorEnPesos() {
		return valorEnPesos;
	}

	public void setValorEnPesos(double valorEnPesos) {
		this.valorEnPesos = valorEnPesos;
	}
}
