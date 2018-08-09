package ar.com.labold.dto;

public class ReporteFacturacionPorAnioDTO {

	private String anio;
	private String cantEstudios;
	private String promedioCantEstudios;
	private String porcentajeCrecimiento;
	
	public String getAnio() {
		return anio;
	}
	public void setAnio(String anio) {
		this.anio = anio;
	}
	public String getCantEstudios() {
		return cantEstudios;
	}
	public void setCantEstudios(String cantEstudios) {
		this.cantEstudios = cantEstudios;
	}
	public String getPromedioCantEstudios() {
		return promedioCantEstudios;
	}
	public void setPromedioCantEstudios(String promedioCantEstudios) {
		this.promedioCantEstudios = promedioCantEstudios;
	}
	public String getPorcentajeCrecimiento() {
		return porcentajeCrecimiento;
	}
	public void setPorcentajeCrecimiento(String porcentajeCrecimiento) {
		this.porcentajeCrecimiento = porcentajeCrecimiento;
	}
	
}
