package ar.com.labold.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.labold.negocio.ItemMenu;
import ar.com.labold.negocio.Rol;
import ar.com.labold.negocio.Usuario;
import ar.com.labold.negocio.exception.NegocioException;
import ar.com.labold.utils.Constantes;

public class LoginDAO extends HibernateDaoSupport {

	public Usuario login(String usuario, String password) throws NegocioException {

		Criteria criteria = getSession().createCriteria(Usuario.class);
		criteria.add(Restrictions.conjunction().add(Restrictions.eq("nombreUsuario", usuario))
				.add(Restrictions.eq("password", password))
				.add(Restrictions.eq("habilitado", true)));

		List<Usuario> usuarios = criteria.list();

		if (usuarios.size() == 0) {
			throw new NegocioException(Constantes.USUARIO_INVALIDO);
		}
		
		return (Usuario) usuarios.get(0);			
	}

	public Usuario getUsuario(Long id){

		Usuario u = (Usuario) this.getHibernateTemplate().get(Usuario.class, id);
		return u;		
	}

	private void xtestRol() {

		Rol rol = (Rol) this.getHibernateTemplate().get(Rol.class, 4L);
		ItemMenu menu1 = (ItemMenu) this.getHibernateTemplate().get(ItemMenu.class, 5L);

		List<ItemMenu> menues = new ArrayList<ItemMenu>();
		menues.add(menu1);

		rol.setMenues(menues);

		this.getHibernateTemplate().saveOrUpdate(rol);
	}
}
