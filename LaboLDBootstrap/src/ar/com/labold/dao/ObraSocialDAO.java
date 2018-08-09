package ar.com.labold.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.labold.dto.ObraSocialDTO;
import ar.com.labold.negocio.ObraSocial;
import ar.com.labold.negocio.exception.NegocioException;
import ar.com.labold.providers.ProviderDominio;
import ar.com.labold.utils.Constantes;

public class ObraSocialDAO extends HibernateDaoSupport {

	public List<ObraSocial> getObrasSociales(){
		
		Criteria criteria = getSession().createCriteria(ObraSocial.class);
		criteria.addOrder(Order.asc("nombre"));

		return (List<ObraSocial>) criteria.list();		
	}
	
	public boolean existeObraSocial(String nombre, Long id){
		
		Criteria criteria = getSession().createCriteria(ObraSocial.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("nombre", nombre));
		if (id != null) {
			conj.add(Restrictions.ne("id", id));
		}
		criteria.add(conj);

		List<ObraSocial> obrasSociales = criteria.list();
		return (obrasSociales.size() > 0);		
	}
	
	public void altaObraSocial(ObraSocial obraSocial) throws NegocioException {
		
		if (existeObraSocial(obraSocial.getNombre(), obraSocial.getId())) {
			throw new NegocioException(Constantes.EXISTE_OBRA_SOCIAL);
		}
		this.getHibernateTemplate().saveOrUpdate(obraSocial);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();	
	}
	
	public ObraSocial getObraSocial(Long id){
		
		return (ObraSocial)getHibernateTemplate().get(ObraSocial.class,id);
	}
}
