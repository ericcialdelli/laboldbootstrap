package ar.com.labold.fachada;

import java.util.ArrayList;
import java.util.List;

import ar.com.labold.dao.UsuarioDAO;
import ar.com.labold.dto.UsuarioDTO;
import ar.com.labold.negocio.Rol;
import ar.com.labold.negocio.Usuario;
import ar.com.labold.negocio.exception.NegocioException;
import ar.com.labold.providers.ProviderDTO;
import ar.com.labold.providers.ProviderDominio;

import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = { Throwable.class })
public class UsuarioFachada{

	private UsuarioDAO usuarioDAO;
	private RolFachada rolFachada;

	public UsuarioFachada() {
	}

	public UsuarioFachada(UsuarioDAO usuarioDAO, RolFachada pRolFachada) {
		this.usuarioDAO = usuarioDAO;
		this.rolFachada = pRolFachada;
	}

	public void altaUsuario(Usuario elUsuario) throws NegocioException {
		usuarioDAO.altaUsuario(elUsuario);
	}

	public boolean existeUsuario(String nombre, Long id) {
		return usuarioDAO.existeUsuario(nombre, id);
	}

	public List<Usuario> getUsuarios() {
		return usuarioDAO.getUsuarios();
	}

	public List<UsuarioDTO> getUsuariosDTO() {
		List<UsuarioDTO> usuariosDTO = new ArrayList<UsuarioDTO>();
		List<Usuario> usuarios = usuarioDAO.getUsuarios();
		for (Usuario usuario : usuarios) {
			usuariosDTO.add(ProviderDTO.getUsuarioDTO(usuario));
		}
		return usuariosDTO;
	}

	public Usuario getUsuario(Long id) {
		return usuarioDAO.getUsuario(id);
	}

	public UsuarioDTO getUsuarioDTO(Long id) {
		Usuario usuario = usuarioDAO.getUsuario(id);
		return ProviderDTO.getUsuarioDTO(usuario);
	}

	public void altaUsuario(UsuarioDTO usuario) throws NegocioException {

		Rol rol = rolFachada.getRol(usuario.getRol().getId());
		usuarioDAO.altaUsuario(ProviderDominio
				.getUsuario(usuario, rol));

	}

	public void modificacionUsuario(UsuarioDTO usuarioDTO)
			throws NegocioException {
		Usuario usuario = usuarioDAO.getUsuario(usuarioDTO.getId());		
		Rol rol = rolFachada.getRol(usuarioDTO.getRol().getId());

		usuarioDAO.modificacionUsuario(ProviderDominio.getUsuario(usuario,
				usuarioDTO, rol));
	}

	public List<Usuario> getAgentesFirmantes(){
		
		return usuarioDAO.getAgentesFirmantes();
	}
}
