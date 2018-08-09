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
public class ValoresEstudioHistorico {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private String nombre;	
	
	private Double unidadBioquimica;
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "grupoPractica_fk")
	private GrupoPractica grupoPractica;
	
	@OneToMany(mappedBy = "valoresEstudioHistorico")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<ValorPracticaHistorico> valoresPracticasHistorico = new ArrayList<ValorPracticaHistorico>();	
	
	@OneToMany(mappedBy = "valoresEstudioHistorico")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<ValorSubItemPracticaHistorico> valorSubItemPracticaHistorico = new ArrayList<ValorSubItemPracticaHistorico>();	
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "estudioHistorico_fk")
	private EstudioHistorico estudioHistorico;

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

	public Double getUnidadBioquimica() {
		return unidadBioquimica;
	}

	public void setUnidadBioquimica(Double unidadBioquimica) {
		this.unidadBioquimica = unidadBioquimica;
	}

	public GrupoPractica getGrupoPractica() {
		return grupoPractica;
	}

	public void setGrupoPractica(GrupoPractica grupoPractica) {
		this.grupoPractica = grupoPractica;
	}

	public EstudioHistorico getEstudioHistorico() {
		return estudioHistorico;
	}

	public void setEstudioHistorico(EstudioHistorico estudioHistorico) {
		this.estudioHistorico = estudioHistorico;
	}

	public List<ValorPracticaHistorico> getValoresPracticasHistorico() {
		return valoresPracticasHistorico;
	}

	public void setValoresPracticasHistorico(
			List<ValorPracticaHistorico> valoresPracticasHistorico) {
		this.valoresPracticasHistorico = valoresPracticasHistorico;
	}

	public List<ValorSubItemPracticaHistorico> getValorSubItemPracticaHistorico() {
		return valorSubItemPracticaHistorico;
	}

	public void setValorSubItemPracticaHistorico(
			List<ValorSubItemPracticaHistorico> valorSubItemPracticaHistorico) {
		this.valorSubItemPracticaHistorico = valorSubItemPracticaHistorico;
	}	
	
	
}
