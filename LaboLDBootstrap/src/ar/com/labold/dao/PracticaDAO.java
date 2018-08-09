package ar.com.labold.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.labold.negocio.EstudioPreSeteado;
import ar.com.labold.negocio.GrupoPractica;
import ar.com.labold.negocio.Practica;
import ar.com.labold.negocio.SubItemPractica;
import ar.com.labold.negocio.exception.NegocioException;
import ar.com.labold.utils.Constantes;

public class PracticaDAO extends HibernateDaoSupport {

	public boolean existePractica(String nombre, Long id, Long idGrupo){
		
		Criteria criteria = getSession().createCriteria(Practica.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("nombre", nombre));
		conj.add(Restrictions.eq("grupoPractica.id", idGrupo));
		if (id != null) {
			conj.add(Restrictions.ne("id", id));
		}
		criteria.add(conj);

		List<Practica> practicas = criteria.list();
		return (practicas.size() > 0);			
	}
	
	public boolean existeGrupoPractica(String nombre, Long id){
		
		Criteria criteria = getSession().createCriteria(GrupoPractica.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("nombre", nombre));
		if (id != null) {
			conj.add(Restrictions.ne("id", id));
		}
		criteria.add(conj);

		List<Practica> practicas = criteria.list();
		return (practicas.size() > 0);			
	}	
	
	public void altaPractica(Practica practica) throws NegocioException{
		
		if (existePractica(practica.getNombre(), practica.getId(), practica.getGrupoPractica().getId())) {
			throw new NegocioException(Constantes.EXISTE_PRACTICA);
		}
		this.getHibernateTemplate().saveOrUpdate(practica);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}
	
	public void altaGrupoPractica(GrupoPractica grupoPractica) throws NegocioException{
		
		if (existeGrupoPractica(grupoPractica.getNombre(), grupoPractica.getId())) {
			throw new NegocioException(Constantes.EXISTE_GRUPO_PRACTICA);
		}
		this.getHibernateTemplate().saveOrUpdate(grupoPractica);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();	
	}	
	
	public void altaSubItemPractica(SubItemPractica subItemPractica) throws NegocioException{
		
		this.getHibernateTemplate().saveOrUpdate(subItemPractica);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}		
	
	public Practica getPractica(Long id){
		
		return (Practica)getHibernateTemplate().get(Practica.class,id);
	}		
	
	public List<Practica> getPracticas(){
		
		Criteria criteria = getSession().createCriteria(Practica.class);
		criteria.addOrder(Order.asc("nombre"));

		return (List<Practica>) criteria.list();		
	}
	
	public List<Practica> getPracticasPorGrupo(Long idGrupo){
		
		Criteria criteria = getSession().createCriteria(Practica.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("grupoPractica.id", idGrupo));
		criteria.add(conj);		
		criteria.addOrder(Order.asc("orden"));

		return (List<Practica>) criteria.list();	
	}	
	
	public List<GrupoPractica> getGruposPractica(){
		
		Criteria criteria = getSession().createCriteria(GrupoPractica.class);
		criteria.addOrder(Order.asc("nombre"));

		List<GrupoPractica> lista = (List<GrupoPractica>) criteria.list();
		for (GrupoPractica grupoPractica : lista) {
			Hibernate.initialize(grupoPractica.getPracticas());
		}					
		return lista;
	}
	
	public GrupoPractica getGrupoPractica(Long id){
		
		return (GrupoPractica)getHibernateTemplate().get(GrupoPractica.class,id);
	}
	
	public List<SubItemPractica> getSubItemsPorGrupoPractica(Long idGrupo){
		
		Criteria criteria = getSession().createCriteria(SubItemPractica.class);
		//criteria.createAlias("provinciaDestino", "pd");
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("grupoPractica.id", idGrupo));
		criteria.add(conj);
		
		List<SubItemPractica> subItemsPractica = criteria.list();
		return subItemsPractica;		
	}

	public SubItemPractica getSubItemPractica(Long id){
		
		return (SubItemPractica)getHibernateTemplate().get(SubItemPractica.class,id);
	}
	
	public void altaEstudioPreSeteado(EstudioPreSeteado estudio){
		
		this.getHibernateTemplate().saveOrUpdate(estudio);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}	
	
	public List<EstudioPreSeteado> getEstudiosPreSeteados(){
		
		Criteria criteria = getSession().createCriteria(EstudioPreSeteado.class);
		criteria.addOrder(Order.asc("nombre"));

		List<EstudioPreSeteado> lista = (List<EstudioPreSeteado>) criteria.list();
		for (EstudioPreSeteado estudioPreSeteado : lista) {
			Hibernate.initialize(estudioPreSeteado.getListaPracticas());
		}					
		return lista;
	}	
	
	public EstudioPreSeteado getEstudioPreSeteado(Long id){
		
		return (EstudioPreSeteado)getHibernateTemplate().get(EstudioPreSeteado.class,id);
	}
	
	public void eliminarEstudioPreSeteado(EstudioPreSeteado estudio){
		
		this.getHibernateTemplate().delete(estudio);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();	
	}	
}
