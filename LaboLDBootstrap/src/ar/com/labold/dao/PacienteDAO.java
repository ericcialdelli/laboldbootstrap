package ar.com.labold.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.labold.negocio.Paciente;

public class PacienteDAO extends HibernateDaoSupport {

	public void altaPaciente(Paciente paciente){
		
		this.getHibernateTemplate().saveOrUpdate(paciente);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();		
	}	
	
	public List<Paciente> getPacientes(){
		
		Criteria criteria = getSession().createCriteria(Paciente.class);
		criteria.addOrder(Order.asc("apellido"));
		List<Paciente> pacientes = criteria.list(); 
		
		return pacientes;		
	}
	
	public boolean existePaciente(int dni, Long id){
		Criteria criteria = getSession().createCriteria(Paciente.class);
		Conjunction conj = Restrictions.conjunction();
		conj.add(Restrictions.eq("dni", dni));
		if (id != null) {
			conj.add(Restrictions.ne("id", id));
		}
		criteria.add(conj);
		
		List<Paciente> pacientes = criteria.list(); 
		return (pacientes.size() > 0);
	}
	
	public Paciente getPaciente(Long idPaciente){
		
		return (Paciente)getHibernateTemplate().get(Paciente.class,idPaciente);
	}
	
	public void eliminarPaciente(Paciente paciente){
		
		this.getHibernateTemplate().delete(paciente);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();		
	}
}
