package ar.com.labold.fachada;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.labold.dao.ObraSocialDAO;
import ar.com.labold.dto.ObraSocialDTO;
import ar.com.labold.negocio.ObraSocial;
import ar.com.labold.negocio.exception.NegocioException;
import ar.com.labold.providers.ProviderDominio;

@Transactional(rollbackFor = { Throwable.class })
public class ObraSocialFachada {

	private ObraSocialDAO obraSocialDAO;
	
	public ObraSocialFachada(){}
	
	public ObraSocialFachada(ObraSocialDAO pObraSocialDAO){
		
		this.obraSocialDAO = pObraSocialDAO;
	}
	
	public List<ObraSocial> getObrasSociales(){
		
		return obraSocialDAO.getObrasSociales();
	}

	public ObraSocial getObraSocial(Long id){
		
		return obraSocialDAO.getObraSocial(id);
	}		
	
	public boolean existeObraSocial(ObraSocialDTO obraSocial){
		
		return obraSocialDAO.existeObraSocial(obraSocial.getNombre(),obraSocial.getId());
	}
	
	public void altaObraSocial(ObraSocialDTO obraSocialDTO) throws NegocioException{
		
		obraSocialDAO.altaObraSocial(ProviderDominio.getObraSocial(obraSocialDTO));
	}
	
	public void modificacionObraSocial(ObraSocialDTO obraSocialDTO) throws NegocioException{
		
		ObraSocial obraSocial = obraSocialDAO.getObraSocial(obraSocialDTO.getId());
		
		obraSocialDAO.altaObraSocial(ProviderDominio.getObraSocial(obraSocial,obraSocialDTO));
	}
}
