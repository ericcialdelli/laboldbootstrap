package ar.com.labold.fachada;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import ar.com.labold.dao.RolDAO;
import ar.com.labold.dao.UsuarioDAO;
import ar.com.labold.dto.ItemMenuDTO;
import ar.com.labold.dto.RolDTO;
import ar.com.labold.negocio.ItemMenu;
import ar.com.labold.negocio.Rol;
import ar.com.labold.negocio.Usuario;
import ar.com.labold.negocio.exception.AccesoDenegadoException;
import ar.com.labold.negocio.exception.NegocioException;
import ar.com.labold.providers.ProviderDTO;
import ar.com.labold.providers.ProviderDominio;
import ar.com.labold.utils.Constantes;
import ar.com.labold.utils.MyLogger;

import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = { Throwable.class })
public class RolFachada{

	private RolDAO rolDAO;

	private UsuarioDAO usuarioDAO;

	public RolFachada() {
	}

	public RolFachada(RolDAO elRolDAO, UsuarioDAO elUsuarioDAO) {
		this.rolDAO = elRolDAO;
		this.usuarioDAO = elUsuarioDAO;
	}

	public List<Rol> getRoles() {
		return rolDAO.getRoles();

	}

	public Rol getRol(Long id) {
		return rolDAO.getRol(id);

	}

	public List<ItemMenu> recuperarMenues() {
		return rolDAO.recuperarMenues();

	}

	public List<ItemMenuDTO> recuperarMenuesDTO() {
		List<ItemMenuDTO> menuesDTO = new ArrayList<ItemMenuDTO>();
		List<ItemMenu> menues = rolDAO.recuperarMenues();
		for (ItemMenu itemMenu : menues) {
			menuesDTO.add(ProviderDTO.getItemMenuDTO(itemMenu));
		}
		return menuesDTO;

	}

	public void altaRol(RolDTO rolDTO, List<ItemMenuDTO> menuesDTO)
			throws NegocioException {

		Rol rol = ProviderDominio.getRol(rolDTO);
		this.getItemsMenues(rol, menuesDTO);

		rolDAO.altaRol(rol);
	}

	public Rol recuperarRol(long idRol) {
		return rolDAO.recuperarRol(idRol);

	}

	public RolDTO recuperarRolDTO(long idRol) {
		Rol rol = rolDAO.recuperarRol(idRol);

		return ProviderDTO.getRolDTO(rol);
	}

	public void modificacionRol(RolDTO rolDTO, List<ItemMenuDTO> menuesDTO)
			throws NegocioException {

		Rol rol = rolDAO.recuperarRol(rolDTO.getId());
		rol.setMenues(new ArrayList<ItemMenu>());
		this.getItemsMenues(rol, menuesDTO);

		rolDAO.modificacionRol(rol);

	}

	public boolean existeRol(RolDTO rol) {

		return rolDAO.existeRol(rol);

	}

	public List<RolDTO> cargarRolesSegunEntidad(Long idEntidad,
			Long idUsuarioLogueado)throws NegocioException {
		
		try{
			Usuario usuario = null;// usuarioDAO.getUsuario(idUsuario);
			if (idUsuarioLogueado != null) {
				usuario = usuarioDAO.getUsuario(idUsuarioLogueado);
			}
			List<Rol> roles = null;
			List<RolDTO> rolesDTO = new ArrayList<RolDTO>();
			if (Constantes.ID_ROL_ADMINISTRADOR == usuario.getRol().getId().longValue()) {
					// si es un Administrador, deben estar todos los roles
					roles = rolDAO.getRoles();
			} else {
				// si NO es un Administrador, entonces debe estar solo su rol
				roles = new ArrayList<Rol>();
				roles.add(usuario.getRol());
			}
	
			for (Rol rol : roles) {
				rolesDTO.add(ProviderDTO.getRolDTO(rol));
			}
	
			return rolesDTO;
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			throw new NegocioException("Error Inesperado");
		}		
	}

	private void getItemsMenues(Rol rol, List<ItemMenuDTO> menues) {

		HashMap<Long, String> hashMenu = new HashMap<Long, String>();

		for (ItemMenuDTO itemMenu : menues) {
			if (itemMenu != null) {
				ItemMenu item = rolDAO.getItemMenu(itemMenu.getId());
				rol.getMenues().add(item);

				ItemMenu itemPadre = item.getPadre();

				while (itemPadre != null) {

					if (hashMenu.get(itemPadre.getId()) == null) {
						rol.getMenues().add(itemPadre);
						hashMenu.put(itemPadre.getId(), "S");
						itemPadre = itemPadre.getPadre();
					} else {
						itemPadre = null;
					}
				}
			}
		}

	}

	public void verificarMenu(String pNombreMenu, Rol pRol)
			throws AccesoDenegadoException {

		rolDAO.verificarMenu(pNombreMenu, pRol);
	}

	public List<RolDTO> getRolesDTO() {
		List<RolDTO> listaRolesDTO = new ArrayList<RolDTO>();
		List<Rol> listaRoles = rolDAO.getRoles();

		for (Rol rol : listaRoles) {
			listaRolesDTO.add(ProviderDTO.getRolDTO(rol));
		}

		return listaRolesDTO;

	}

	public RolDTO getRolAdministrador() {
		Rol rolAdministrador = rolDAO.getRolAdministrador();
		return ProviderDTO.getRolDTO(rolAdministrador);

	}
}
