package ar.com.labold.dto;

import ar.com.labold.enums.EstadoEstudio;

public class EstudioDTO {

	private Long id;
	
	private Long numero;

	private String solicitadoPor;
	
	private String fecha;
	
	private String fechaEntrega;
	
	private Double unidadesFacturacionTotal;
	
	private double valorUnidadBioquimica;
	
	private PacienteDTO paciente;
	
	private MedicoDTO medico;
	
	private double montoAdeudado;	
	
	private String observaciones;//OBSERVACIONES
	
	private EstadoEstudio estado;
	
	public EstudioDTO(){
		paciente = new PacienteDTO();
		medico = new MedicoDTO();
	}

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

	public String getSolicitadoPor() {
		return solicitadoPor;
	}

	public void setSolicitadoPor(String solicitadoPor) {
		this.solicitadoPor = solicitadoPor;
	}

	public PacienteDTO getPaciente() {
		return paciente;
	}

	public void setPaciente(PacienteDTO paciente) {
		this.paciente = paciente;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public Double getUnidadesFacturacionTotal() {
		return unidadesFacturacionTotal;
	}

	public void setUnidadesFacturacionTotal(Double unidadesFacturacionTotal) {
		this.unidadesFacturacionTotal = unidadesFacturacionTotal;
	}

	public MedicoDTO getMedico() {
		return medico;
	}

	public void setMedico(MedicoDTO medico) {
		this.medico = medico;
	}

	public double getMontoAdeudado() {
		return montoAdeudado;
	}

	public void setMontoAdeudado(double montoAdeudado) {
		this.montoAdeudado = montoAdeudado;
	}

	public String getFechaEntrega() {
		return fechaEntrega;
	}

	public void setFechaEntrega(String fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}

	public EstadoEstudio getEstado() {
		return estado;
	}

	public void setEstado(EstadoEstudio estado) {
		this.estado = estado;
	}
	
	public String getEstadoStr(){
		return (this.estado == null)?"":this.estado.getDescripcion();
	}
	
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
