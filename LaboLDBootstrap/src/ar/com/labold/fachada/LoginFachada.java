package ar.com.labold.fachada;

import ar.com.labold.dao.LoginDAO;
import ar.com.labold.dto.UsuarioDTO;
import ar.com.labold.negocio.Usuario;
import ar.com.labold.negocio.exception.NegocioException;
import ar.com.labold.providers.ProviderDTO;

import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = { Throwable.class })
public class LoginFachada{

	private LoginDAO loginDAO;

	public LoginFachada() {
	}

	public LoginFachada(LoginDAO loginDAO) {
		this.loginDAO = loginDAO;
	}

	public UsuarioDTO login(String usuario, String password) throws NegocioException {

		Usuario usr = loginDAO.login(usuario, password);
		UsuarioDTO usrDTO = ProviderDTO.getUsuarioDTO(usr);
			
		return usrDTO;	
	}

	public Usuario getUsuario(Long id){

		return loginDAO.getUsuario(id);
	}
}
