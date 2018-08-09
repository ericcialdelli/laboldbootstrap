package ar.com.labold.fachada;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import ar.com.labold.dao.ParametroDAO;
import ar.com.labold.negocio.Parametro;

@Transactional(rollbackFor = { Throwable.class })
public class ParametroFachada {

	private ParametroDAO parametroDAO;
	
	public ParametroFachada(){}
	
	public ParametroFachada(ParametroDAO pParametroDAO){
		this.parametroDAO = pParametroDAO;
	}
	
	public Parametro getParametro(Long parametro){
		
		return parametroDAO.getParametro(parametro);
	}
	
	public String getNombreCarpetaBackup(){
		
		return parametroDAO.getNombreCarpetaBackup();
	}

	public String getNombreCarpetaMotorBD(){
		
		return parametroDAO.getNombreCarpetaMotorBD();
	}
	
	public List<Parametro> getParametros(){
		
		return parametroDAO.getParametros();
	}
	
	public void modificarParametros(Parametro parametro){
		
		Parametro p = parametroDAO.getParametro(parametro.getClave());
		p.setValor(parametro.getValor());
		p.setDescripcion(parametro.getDescripcion());
		
		parametroDAO.modificarParametros(p);
	}
}
