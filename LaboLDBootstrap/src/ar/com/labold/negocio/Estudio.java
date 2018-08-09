package ar.com.labold.negocio;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import ar.com.labold.enums.EstadoEstudio;

@Entity
public class Estudio {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private Long numero;
	
	@Column(nullable = false)
	private Date fecha;
	
	private Double unidadesFacturacionTotal; 
	
	private Double montoAdeudado;
	
	private Date fechaEntrega;
	
	private double valorUnidadBioquimica;
	
	@Enumerated(EnumType.STRING)
	private EstadoEstudio estado;
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "paciente_fk")	
	private Paciente paciente;

	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "medico_fk")	
	private Medico medico;	
	
	@OneToMany(mappedBy = "estudio")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<ValoresEstudio> valoresEstudio = new ArrayList<ValoresEstudio>();	
	
	private String observaciones;//OBSERVACIONES
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getNumero() {
		return numero;
	}

	public void setNumero(Long numero) {
		this.numero = numero;
	}

	public Paciente getPaciente() {
		return paciente;
	}

	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public List<ValoresEstudio> getValoresEstudio() {
		return valoresEstudio;
	}

	public void setValoresEstudio(List<ValoresEstudio> valoresEstudio) {
		this.valoresEstudio = valoresEstudio;
	}

	public Double getUnidadesFacturacionTotal() {
		return unidadesFacturacionTotal;
	}

	public void setUnidadesFacturacionTotal(Double unidadesFacturacionTotal) {
		this.unidadesFacturacionTotal = unidadesFacturacionTotal;
	}

	public Medico getMedico() {
		return medico;
	}

	public void setMedico(Medico medico) {
		this.medico = medico;
	}

	public Double getMontoAdeudado() {
		return montoAdeudado;
	}

	public void setMontoAdeudado(Double montoAdeudado) {
		this.montoAdeudado = montoAdeudado;
	}

	public Date getFechaEntrega() {
		return fechaEntrega;
	}

	public void setFechaEntrega(Date fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}

	public EstadoEstudio getEstado() {
		return estado;
	}

	public void setEstado(EstadoEstudio estado) {
		this.estado = estado;
	}	

	@Transient
	public String getEstadoStr(){
		return (this.estado == null)?"":this.estado.getDescripcion();
	}
	
	@Transient
	public void setEstadoStr(String estadoEstudio){
		this.estado = EstadoEstudio.valueOf(estadoEstudio);
	}

	public double getValorUnidadBioquimica() {
		return valorUnidadBioquimica;
	}

	public void setValorUnidadBioquimica(double valorUnidadBioquimica) {
		this.valorUnidadBioquimica = valorUnidadBioquimica;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	
	
}
