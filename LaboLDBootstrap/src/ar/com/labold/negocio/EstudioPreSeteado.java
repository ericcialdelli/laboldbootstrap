package ar.com.labold.negocio;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;


//PRESELECCION
@Entity
public class EstudioPreSeteado {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long idEstudioPreSeteado;
	
	private String nombre;
	
	@ManyToMany
	@JoinTable(name = "Practicas_Pre_Seteadas", joinColumns = @JoinColumn(name = "idEstudioPreSeteado_fk"), inverseJoinColumns = { @JoinColumn(name = "idPractica_fk") })
	//@Cascade({ org.hibernate.annotations.CascadeType.ALL })
	@LazyCollection(LazyCollectionOption.FALSE)	
	private List<Practica> listaPracticas = new ArrayList<Practica>();

	
	public Long getIdEstudioPreSeteado() {
		return idEstudioPreSeteado;
	}

	public void setIdEstudioPreSeteado(Long idEstudioPreSeteado) {
		this.idEstudioPreSeteado = idEstudioPreSeteado;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<Practica> getListaPracticas() {
		return listaPracticas;
	}

	public void setListaPracticas(List<Practica> listaPracticas) {
		this.listaPracticas = listaPracticas;
	}
}
