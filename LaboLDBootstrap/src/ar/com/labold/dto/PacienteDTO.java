package ar.com.labold.dto;

public class PacienteDTO {

	private Long id;
	
	private String nombre;
	
	private String apellido;
	
	private String direccion;

	private String telefono;

	private String email;
	
	private int dni;	
	
	private String fechaNacimiento;
	
	private String nroCarnetObraSocial;
	
	private String observaciones;	
	
	private ObraSocialDTO obraSocial;
	
	public PacienteDTO(){
		
		obraSocial = new ObraSocialDTO();
	}

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

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getDni() {
		return dni;
	}

	public void setDni(int dni) {
		this.dni = dni;
	}

	public String getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public ObraSocialDTO getObraSocial() {
		return obraSocial;
	}

	public void setObraSocial(ObraSocialDTO obraSocial) {
		this.obraSocial = obraSocial;
	}

	public String getNroCarnetObraSocial() {
		return nroCarnetObraSocial;
	}

	public void setNroCarnetObraSocial(String nroCarnetObraSocial) {
		this.nroCarnetObraSocial = nroCarnetObraSocial;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	
}
