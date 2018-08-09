package ar.com.labold.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.labold.negocio.Parametro;

public class ParametroDAO extends HibernateDaoSupport {

	public Parametro getParametro(Long parametro){
		
		Parametro p = (Parametro)getHibernateTemplate().get(Parametro.class,parametro);
		return p;
	}
	
	public String getNombreCarpetaBackup(){
		
		Parametro p = this.getParametro(1L);
		return p.getValor();
	}
	
	public String getNombreCarpetaMotorBD(){
		
		Parametro p = this.getParametro(2L);
		return p.getValor();
	}
	
	public List<Parametro> getParametros(){
		
		Criteria criteria = getSession().createCriteria(Parametro.class);
		criteria.addOrder(Order.asc("clave"));

		return (List<Parametro>) criteria.list();		
	}	
	
	public void modificarParametros(Parametro parametro){
		
		this.getHibernateTemplate().saveOrUpdate(parametro);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}	
}
