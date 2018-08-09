package ar.com.labold.negocio;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class ValorPractica {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = true)
	private String valor;

	private Double unidadBioquimica;	
	
	private boolean cubreOS;
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "practica_fk")	
	private Practica practica;	
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "valoresEstudio_fk")
	private ValoresEstudio valoresEstudio;

	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "valorSubItemPractica_fk")
	private ValorSubItemPractica valorSubItemPractica;	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public Practica getPractica() {
		return practica;
	}

	public void setPractica(Practica practica) {
		this.practica = practica;
	}

	public ValoresEstudio getValoresEstudio() {
		return valoresEstudio;
	}

	public void setValoresEstudio(ValoresEstudio valoresEstudio) {
		this.valoresEstudio = valoresEstudio;
	}

	public ValorSubItemPractica getValorSubItemPractica() {
		return valorSubItemPractica;
	}

	public void setValorSubItemPractica(ValorSubItemPractica valorSubItemPractica) {
		this.valorSubItemPractica = valorSubItemPractica;
	}

	public Double getUnidadBioquimica() {
		return unidadBioquimica;
	}

	public void setUnidadBioquimica(Double unidadBioquimica) {
		this.unidadBioquimica = unidadBioquimica;
	}

	public boolean isCubreOS() {
		return cubreOS;
	}

	public void setCubreOS(boolean cubreOS) {
		this.cubreOS = cubreOS;
	}
	
}
