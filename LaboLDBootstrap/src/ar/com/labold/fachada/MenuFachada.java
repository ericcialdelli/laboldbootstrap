package ar.com.labold.fachada;

import java.util.List;

import ar.com.labold.dao.MenuDAO;
import ar.com.labold.negocio.ItemMenu;
import ar.com.labold.negocio.exception.DataBaseException;
import ar.com.labold.negocio.exception.NegocioException;

import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = { Throwable.class })
public class MenuFachada{

	private MenuDAO menuDAO;

	/**
	 * Constructor por defecto.
	 * 
	 */
	public MenuFachada() {
	}

	public MenuFachada(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}

	public List<ItemMenu> getItemsMenu(String pRol) throws NegocioException {

		try{
			return menuDAO.getItemsMenu(pRol);
		
		} catch (DataBaseException e) {
			throw new NegocioException(e.getMessage());
		}			
	}

}
