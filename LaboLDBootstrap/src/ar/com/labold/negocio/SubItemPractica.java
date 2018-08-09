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
public class SubItemPractica {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private String nombre;

	private String codigoFaba;
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "grupoPractica_fk")
	private GrupoPractica grupoPractica;	
	
	@OneToMany(mappedBy = "subItemPractica")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<Practica> practicas = new ArrayList<Practica>();	
	
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

	public GrupoPractica getGrupoPractica() {
		return grupoPractica;
	}

	public void setGrupoPractica(GrupoPractica grupoPractica) {
		this.grupoPractica = grupoPractica;
	}

	public String getCodigoFaba() {
		return codigoFaba;
	}

	public void setCodigoFaba(String codigoFaba) {
		this.codigoFaba = codigoFaba;
	}	

}
