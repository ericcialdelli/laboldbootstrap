package ar.com.labold.negocio;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;


@Entity
public class GrupoPractica {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private String nombre;

	private double unidadBioquimica;	
	
	private String codigoFaba;
	
	@OneToMany(mappedBy = "grupoPractica")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<Practica> practicas = new ArrayList<Practica>();	
	
	@OneToMany(mappedBy = "grupoPractica")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<SubItemPractica> subItemsPractica = new ArrayList<SubItemPractica>();	
	
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

	public List<Practica> getPracticas() {
		return practicas;
	}

	public void setPracticas(List<Practica> practicas) {
		this.practicas = practicas;
	}

	public List<SubItemPractica> getSubItemsPractica() {
		return subItemsPractica;
	}

	public void setSubItemsPractica(List<SubItemPractica> subItemsPractica) {
		this.subItemsPractica = subItemsPractica;
	}

	public double getUnidadBioquimica() {
		return unidadBioquimica;
	}

	public void setUnidadBioquimica(double unidadBioquimica) {
		this.unidadBioquimica = unidadBioquimica;
	}

	public String getCodigoFaba() {
		return codigoFaba;
	}

	public void setCodigoFaba(String codigoFaba) {
		this.codigoFaba = codigoFaba;
	}

	public int cantidadPracticas(){
		
		return	this.getPracticas().size();
	}	
}
