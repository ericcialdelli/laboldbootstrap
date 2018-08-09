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

@Entity
public class ValoresEstudio {

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

	@OneToMany(mappedBy = "valoresEstudio")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<ValorPractica> valoresPracticas = new ArrayList<ValorPractica>();	
	
	@OneToMany(mappedBy = "valoresEstudio")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<ValorSubItemPractica> valorSubItemPractica = new ArrayList<ValorSubItemPractica>();		
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "estudio_fk")
	private Estudio estudio;	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public GrupoPractica getGrupoPractica() {
		return grupoPractica;
	}

	public void setGrupoPractica(GrupoPractica grupoPractica) {
		this.grupoPractica = grupoPractica;
	}

	public List<ValorPractica> getValoresPracticas() {
		return valoresPracticas;
	}

	public void setValoresPracticas(List<ValorPractica> valoresPracticas) {
		this.valoresPracticas = valoresPracticas;
	}

	public Estudio getEstudio() {
		return estudio;
	}

	public void setEstudio(Estudio estudio) {
		this.estudio = estudio;
	}

	public List<ValorSubItemPractica> getValorSubItemPractica() {
		return valorSubItemPractica;
	}

	public void setValorSubItemPractica(
			List<ValorSubItemPractica> valorSubItemPractica) {
		this.valorSubItemPractica = valorSubItemPractica;
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
	
	public int cantidadPracticas(){
		
		int cantPracticas = this.getValoresPracticas().size();
		int cantPracticasEnSubItem = 0;
		
		for (ValorSubItemPractica vsip : this.getValorSubItemPractica()) {
			
			cantPracticasEnSubItem = cantPracticasEnSubItem + vsip.getValoresPracticas().size();
		}
		
		return cantPracticas+cantPracticasEnSubItem;
	}
	
	public double getUnidadesFacturacionDePracticas(){
		
		double unidadesFacturacionDePracticas = 0.0;
		
		for (ValorPractica vp : this.getValoresPracticas()) {
			unidadesFacturacionDePracticas = unidadesFacturacionDePracticas + vp.getUnidadBioquimica();
		}

		for (ValorSubItemPractica vsip : this.getValorSubItemPractica()) {
			
			unidadesFacturacionDePracticas = unidadesFacturacionDePracticas + vsip.getUnidadesFacturacionDePracticas();
		}		
		
		return unidadesFacturacionDePracticas;
	}
}
