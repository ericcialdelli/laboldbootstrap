package ar.com.labold.dto;

public class PracticaDTO {

	private Long id;
	
	private String nombre;
	
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
	
	private GrupoPracticaDTO grupoPracticaDTO;
	
	private SubItemPracticaDTO subItemPracticaDTO;
	
	public PracticaDTO(){
		
		this.grupoPracticaDTO = new GrupoPracticaDTO();
		this.subItemPracticaDTO = new SubItemPracticaDTO();
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

	public GrupoPracticaDTO getGrupoPracticaDTO() {
		return grupoPracticaDTO;
	}

	public void setGrupoPracticaDTO(GrupoPracticaDTO grupoPracticaDTO) {
		this.grupoPracticaDTO = grupoPracticaDTO;
	}

	public SubItemPracticaDTO getSubItemPracticaDTO() {
		return subItemPracticaDTO;
	}

	public void setSubItemPracticaDTO(SubItemPracticaDTO subItemPracticaDTO) {
		this.subItemPracticaDTO = subItemPracticaDTO;
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
		return valorRefLibre;
	}

	public void setValorRefLibre(String valorRefLibre) {
		this.valorRefLibre = valorRefLibre;
	}

	public int getOrden() {
		return orden;
	}

	public void setOrden(int orden) {
		this.orden = orden;
	}

	public void normalizarValores(){
		
		this.setValorNormalDesde((this.valorNormalDesde.equals(""))?null:this.valorNormalDesde);
		this.setValorNormalHasta((this.valorNormalHasta.equals(""))?null:this.valorNormalHasta);
		this.setValorReferencia((this.valorReferencia.equals(""))?null:this.valorReferencia);
		this.setMayorMenor((this.valorReferencia==null)?null:this.mayorMenor);
		this.setValorRefLibre((this.valorRefLibre.equals(""))?null:this.valorRefLibre);
	}	
}
