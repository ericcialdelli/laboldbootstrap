package ar.com.labold.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.labold.negocio.Estudio;
import ar.com.labold.negocio.Medico;
import ar.com.labold.negocio.ObraSocial;
import ar.com.labold.negocio.exception.NegocioException;
import ar.com.labold.utils.Constantes;

public class MedicoDAO extends HibernateDaoSupport {

	public boolean existeMedico(String matricula, Long id){
		
		Criteria criteria = getSession().createCriteria(Medico.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("matricula", matricula));
		if (id != null) {
			conj.add(Restrictions.ne("id", id));
		}
		criteria.add(conj);

		List<Medico> medicos = criteria.list();
		return (medicos.size() > 0);		
	}	
	
	public Medico altaMedico(Medico medico) throws NegocioException {
		
		/*if (existeMedico(medico.getNombre(), medico.getId())) {
			throw new NegocioException(Constantes.EXISTE_MEDICO);
		}*/
		this.getHibernateTemplate().saveOrUpdate(medico);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();	
		
		return medico;
	}
	
	public List<Medico> getMedicos(){
		
		Criteria criteria = getSession().createCriteria(Medico.class);
		criteria.addOrder(Order.asc("apellido"));

		return (List<Medico>) criteria.list();		
	}
	
	public Medico getMedico(Long idMedico){
		
		return (Medico)getHibernateTemplate().get(Medico.class,idMedico);	
	}
	
	
	public void trimMedicos(){
		
		List<Medico> lista = this.getMedicos();
		for (Medico medico : lista) {
			medico.setNombre(medico.getNombre().trim());

		}
	}
	
	public Medico getMedico(String nombre, String apellido){
		
		Criteria criteria = getSession().createCriteria(Medico.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("nombre", nombre));
		conj.add(Restrictions.eq("apellido", apellido));
		
		criteria.add(conj);

		List<Medico> medicos = criteria.list();
		if(medicos.size()>0){
			return medicos.get(0);
		}
		return null;
	}
	
	/*public void agregarMedicos(){
		
		Criteria criteria = getSession().createCriteria(Estudio.class);
		List<Estudio> lista = (List<Estudio>) criteria.list();
		for (Estudio estudio : lista) {
			if(estudio.getSolicitadoPor()!=null && !estudio.getSolicitadoPor().equals("-") && !estudio.getSolicitadoPor().equals("")){
				
				String solicitadoPor = estudio.getSolicitadoPor();
				int pos = solicitadoPor.indexOf(",");
				
				if(pos>0){
					String apellido = solicitadoPor.substring(0, pos);
					String nombre = solicitadoPor.substring(pos+2,solicitadoPor.length());
					
					Medico medico = getMedico(nombre,apellido);
					if(medico==null){
						medico = new Medico();
						medico.setNombre(nombre);
						medico.setApellido(apellido);
						
						this.getHibernateTemplate().saveOrUpdate(medico);
						this.getHibernateTemplate().flush();
						this.getHibernateTemplate().clear();						
					}
					estudio.setMedico(medico);

					this.getHibernateTemplate().saveOrUpdate(estudio);
					this.getHibernateTemplate().flush();
					this.getHibernateTemplate().clear();					
				}
			}								
		}
	}*/
	
}
