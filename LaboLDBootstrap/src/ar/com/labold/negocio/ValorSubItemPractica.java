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
public class ValorSubItemPractica {

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
	@JoinColumn(name = "valoresEstudio_fk")
	private ValoresEstudio valoresEstudio;
	
	@OneToMany(mappedBy = "valorSubItemPractica")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<ValorPractica> valoresPracticas = new ArrayList<ValorPractica>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public SubItemPractica getSubItemPractica() {
		return subItemPractica;
	}

	public void setSubItemPractica(SubItemPractica subItemPractica) {
		this.subItemPractica = subItemPractica;
	}

	public ValoresEstudio getValoresEstudio() {
		return valoresEstudio;
	}

	public void setValoresEstudio(ValoresEstudio valoresEstudio) {
		this.valoresEstudio = valoresEstudio;
	}

	public List<ValorPractica> getValoresPracticas() {
		return valoresPracticas;
	}

	public void setValoresPracticas(List<ValorPractica> valoresPracticas) {
		this.valoresPracticas = valoresPracticas;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public double getUnidadesFacturacionDePracticas(){
		
		double unidadesFacturacionDePracticas = 0.0;
		
		for (ValorPractica vp : this.getValoresPracticas()) {
			unidadesFacturacionDePracticas = unidadesFacturacionDePracticas + vp.getUnidadBioquimica();
		}
		return unidadesFacturacionDePracticas;
	}	
}
