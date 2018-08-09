package ar.com.labold.negocio;

import java.util.Date;
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

import ar.com.labold.utils.Fecha;

@Entity
public class Paciente {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(nullable = false)
	private String nombre;
	
	@Column(nullable = false)
	private String apellido;
	
	private String direccion;

	private String telefono;

	private String email;
	
	private int dni;

	private Date fechaNacimiento;	
	
	private String nroCarnetObraSocial;
	
	private String observaciones;
	
	@ManyToOne()
	@Cascade(value = CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "obraSocial_fk")	
	private ObraSocial obraSocial;
	
	@OneToMany(mappedBy = "paciente")
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<Estudio> estudios;	
	
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

	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public ObraSocial getObraSocial() {
		return obraSocial;
	}

	public void setObraSocial(ObraSocial obraSocial) {
		this.obraSocial = obraSocial;
	}

	public List<Estudio> getEstudios() {
		return estudios;
	}

	public void setEstudios(List<Estudio> estudios) {
		this.estudios = estudios;
	}
	
	public String getNombreApellidoDni(){
		
		return this.getApellido()+","+this.getNombre();
	}
	
	public String getFechaNacimientoString(){
		
		if(this.getFechaNacimiento()!=null){
			return Fecha.getFechaDDMMAAAASlash(Fecha.dateToStringDDMMAAAA(this.getFechaNacimiento())); 
		}
		return ""; 
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
