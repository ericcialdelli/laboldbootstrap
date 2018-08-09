package ar.com.labold.negocio;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

//ESTUDIO_HISTORICO

@Entity
public class ValorSubItemPracticaHistorico {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private String nombre;
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "subItemPractica_fk")
	private SubItemPractica subItemPractica;	
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "valoresEstudioHistorico_fk")
	private ValoresEstudioHistorico valoresEstudioHistorico;	
	
	@OneToMany(mappedBy = "valorSubItemPracticaHistorico")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<ValorPracticaHistorico> valoresPracticasHistorico = new ArrayList<ValorPracticaHistorico>();

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

	public SubItemPractica getSubItemPractica() {
		return subItemPractica;
	}

	public void setSubItemPractica(SubItemPractica subItemPractica) {
		this.subItemPractica = subItemPractica;
	}

	public ValoresEstudioHistorico getValoresEstudioHistorico() {
		return valoresEstudioHistorico;
	}

	public void setValoresEstudioHistorico(
			ValoresEstudioHistorico valoresEstudioHistorico) {
		this.valoresEstudioHistorico = valoresEstudioHistorico;
	}

	public List<ValorPracticaHistorico> getValoresPracticasHistorico() {
		return valoresPracticasHistorico;
	}

	public void setValoresPracticasHistorico(
			List<ValorPracticaHistorico> valoresPracticasHistorico) {
		this.valoresPracticasHistorico = valoresPracticasHistorico;
	}
	
	
}
