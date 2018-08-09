package ar.com.labold.negocio;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Practica {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private String nombre;

	
	//-----------------------------//
	
	private int orden;
	
	private String unidad;
	
	private String metodo;
	
	private String valorNormalDesde;

	private String valorNormalHasta;
	
	private String valorReferencia;	
	
	private String mayorMenor;
	
	private String valorRefLibre;
	
	private double unidadBioquimica;
	
	private String codigoFaba;
	//Agregar codigoFaba en Grupo y SubItem
	
	/*@ManyToOne()
	@JoinColumn(name = "practica_fk")
	private Practica padre;

	@OneToMany(mappedBy = "padre")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Practica> hijos;*/	
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "grupoPractica_fk")
	private GrupoPractica grupoPractica;	
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "subItemPractica_fk")
	private SubItemPractica subItemPractica;	
	
	
	//PRESELECCION
	/*@ManyToMany(cascade = {javax.persistence.CascadeType.ALL},mappedBy="listaPracticas")
	private List<EstudioPreSeteado> listaEstudiosPreSeteados = new ArrayList<EstudioPreSeteado>();*/
	
	
	//-----------------------------//
	
	
	
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

	public String getUnidad() {
		return unidad;
	}

	public void setUnidad(String unidad) {
		this.unidad = unidad;
	}

	public String getValorNormalDesde() {
		return valorNormalDesde;
	}

	public void setValorNormalDesde(String valorNormalDesde) {
		this.valorNormalDesde = valorNormalDesde;
	}

	public String getValorNormalHasta() {
		return valorNormalHasta;
	}

	public void setValorNormalHasta(String valorNormalHasta) {
		this.valorNormalHasta = valorNormalHasta;
	}

	public String getValorReferencia() {
		return valorReferencia;
	}

	public void setValorReferencia(String valorReferencia) {
		this.valorReferencia = valorReferencia;
	}

	/*public Practica getPadre() {
		return padre;
	}

	public void setPadre(Practica padre) {
		this.padre = padre;
	}

	public List<Practica> getHijos() {
		return hijos;
	}

	public void setHijos(List<Practica> hijos) {
		this.hijos = hijos;
	}*/

	public GrupoPractica getGrupoPractica() {
		return grupoPractica;
	}

	public void setGrupoPractica(GrupoPractica grupoPractica) {
		this.grupoPractica = grupoPractica;
	}

	public SubItemPractica getSubItemPractica() {
		return subItemPractica;
	}

	public void setSubItemPractica(SubItemPractica subItemPractica) {
		this.subItemPractica = subItemPractica;
	}

	public String getMayorMenor() {
		return mayorMenor;
	}

	public void setMayorMenor(String mayorMenor) {
		this.mayorMenor = mayorMenor;
	}

	public String getMetodo() {
		return metodo;
	}

	public void setMetodo(String metodo) {
		this.metodo = metodo;
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

	public String getValorRefLibre() {
		return this.valorRefLibre;
	}

	public void setValorRefLibre(String valorRefLibre) {
		this.valorRefLibre = valorRefLibre;
	}

	public String getValorRefLibreConBr() {
		
		if(valorRefLibre!=null){
			return  valorRefLibre.replaceAll("\r\n", "<br>");			
		}
		return valorRefLibre;
	}

	public int getOrden() {
		return orden;
	}

	public void setOrden(int orden) {
		this.orden = orden;
	}

	/*public List<EstudioPreSeteado> getListaEstudiosPreSeteados() {
		return listaEstudiosPreSeteados;
	}

	public void setListaEstudiosPreSeteados(
			List<EstudioPreSeteado> listaEstudiosPreSeteados) {
		this.listaEstudiosPreSeteados = listaEstudiosPreSeteados;
	}*/
	
	
}
