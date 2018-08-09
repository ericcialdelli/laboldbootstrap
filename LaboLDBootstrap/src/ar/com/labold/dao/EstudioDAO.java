package ar.com.labold.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.labold.negocio.Estudio;
import ar.com.labold.negocio.EstudioHistorico;
import ar.com.labold.negocio.ValorPractica;
import ar.com.labold.negocio.ValorSubItemPractica;
import ar.com.labold.negocio.ValorUnidadFacturacion;
import ar.com.labold.negocio.ValoresEstudio;
import ar.com.labold.utils.Fecha;

public class EstudioDAO extends HibernateDaoSupport {

	public void altaEstudio(Estudio estudio){
		
		this.getHibernateTemplate().saveOrUpdate(estudio);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();		
	}
	
	public List<Estudio> getEstudios(){
		
		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.addOrder(Order.asc("numero"));
		List<Estudio> estudios = criteria.list(); 
		
		return estudios;		
	}	
	
	public List<Estudio> getEstudios(Long idPaciente){
		
		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.add(Restrictions.eq("paciente.id", idPaciente));
		criteria.addOrder(Order.asc("numero"));
		List<Estudio> estudios = criteria.list(); 
		
		return estudios;		
	}	
	
	public Estudio getEstudio(Long idEstudio){
		
		return (Estudio)getHibernateTemplate().get(Estudio.class,idEstudio);
	}
	
	public Estudio getEstudioPorNroProtocolo(Long nroProtocolo){
		
		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.add(Restrictions.eq("numero", nroProtocolo));
		
		return (Estudio)criteria.uniqueResult();
	}
	
	public long getProximoNroEstudio(){
		
		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.addOrder(Order.desc("numero"));
		List<Estudio> estudios = criteria.list(); 
		
		if(estudios.size() > 0){
			return estudios.get(0).getNumero()+1;
		}
		else{
			
			return 1;
		}
	}
	
	public ValorPractica getValorPractica(Long idValorPractica){
		
		return (ValorPractica)getHibernateTemplate().get(ValorPractica.class,idValorPractica);
	}

	public ValorSubItemPractica getValorSubItemPractica(Long idValorSubItemPractica){
		
		return (ValorSubItemPractica)getHibernateTemplate().get(ValorSubItemPractica.class,idValorSubItemPractica);
	}		
	
	public ValoresEstudio getValorEstudio(Long idValorEstudio){
		
		return (ValoresEstudio)getHibernateTemplate().get(ValoresEstudio.class,idValorEstudio);
	}
	
	public ValorUnidadFacturacion recuperarValorUnidadFacturacion(){
		
		return (ValorUnidadFacturacion)getHibernateTemplate().get(ValorUnidadFacturacion.class,1L);		
	}	
	
	public void eliminarValorPractica(ValorPractica valorPractica){
				
		this.getHibernateTemplate().delete(valorPractica);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}
	
	public void eliminarValorSubItemPractica(ValorSubItemPractica vsip){
		
		this.getHibernateTemplate().delete(vsip);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}
	
	public void eliminarValoresEstudio(ValoresEstudio ve){
		
		this.getHibernateTemplate().delete(ve);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}
	
	public boolean existeEstudio(long numero, long id) {

		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.add(Restrictions.eq("numero", numero));
		criteria.add(Restrictions.ne("id", id));
		
		List<Estudio> estudios = criteria.list();

		return (estudios.size() > 0);
	}

	public boolean existeEstudio(long numero) {

		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.add(Restrictions.eq("numero", numero));
 
		List<Estudio> estudios = criteria.list();

		return (estudios.size() > 0);
	}	
	
	public void eliminarEstudio(Estudio estudio){
		
		this.getHibernateTemplate().delete(estudio);
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();		
	}
	
	public List<Estudio> recuperarUltimosEstudios(){
		
		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.addOrder(Order.desc("numero"));
		criteria.setMaxResults(10);
		List<Estudio> estudios = criteria.list(); 
		
		return estudios;		
	}	
	
	//ESTUDIO_HISTORICO
	public List<Estudio> getEstudiosEntreFechas(String pFechaDesde, String pFechaHasta){
		
		Date fechaDesde = Fecha.stringDDMMAAAAToUtilDate(pFechaDesde);
		Date fechaHasta = Fecha.stringDDMMAAAAToUtilDate(pFechaHasta);
		
		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.add(Restrictions.ge("fecha", fechaDesde)); 
		criteria.add(Restrictions.lt("fecha", fechaHasta));
		 
		List<Estudio> estudios = criteria.list();		
		return estudios;
	}

	//ESTUDIO_HISTORICO_POR_NRO
	public List<Estudio> getEstudiosEntreNro(Long pNroDesde, Long pNroHasta){
		
		Criteria criteria = getSession().createCriteria(Estudio.class);
		criteria.add(Restrictions.ge("numero", pNroDesde)); 
		criteria.add(Restrictions.le("numero", pNroHasta));
		 
		List<Estudio> estudios = criteria.list();		
		return estudios;
	}		
	
	//ESTUDIO_HISTORICO
	public void altaEstudioHistorico(EstudioHistorico estudioHistorico){
		
		this.getHibernateTemplate().saveOrUpdate(estudioHistorico);
		//this.getHibernateTemplate().flush();
		//this.getHibernateTemplate().clear();		
	}	
	
	//ESTUDIO_HISTORICO
	public void eliminarEstudioSinFlushClear(Estudio estudio){
		
		this.getHibernateTemplate().delete(estudio);		
	}	
	
	//ESTUDIO_HISTORICO
	public void flushClear(){
		this.getHibernateTemplate().flush();
		this.getHibernateTemplate().clear();
	}
	
	//RECUPERAR_ESTUDIO_HISTORICO
	public List<EstudioHistorico> getEstudiosHistoricosEntreFechas(String pFechaDesde, String pFechaHasta){
		
		Date fechaDesde = Fecha.stringDDMMAAAAToUtilDate(pFechaDesde);
		Date fechaHasta = Fecha.stringDDMMAAAAToUtilDate(pFechaHasta);
		
		Criteria criteria = getSession().createCriteria(EstudioHistorico.class);
		criteria.add(Restrictions.ge("fecha", fechaDesde)); 
		criteria.add(Restrictions.lt("fecha", fechaHasta));
		 
		List<EstudioHistorico> estudiosHistorico = criteria.list();		
		return estudiosHistorico;
	}

	//ESTUDIO_HISTORICO_POR_NRO
	public List<EstudioHistorico> getEstudiosHistoricosEntreFechasPorNro(Long pNroDesde, Long pNroHasta){

		Criteria criteria = getSession().createCriteria(EstudioHistorico.class);
		criteria.add(Restrictions.ge("numero", pNroDesde)); 
		criteria.add(Restrictions.le("numero", pNroHasta));
		 
		List<EstudioHistorico> estudiosHistorico = criteria.list();		
		return estudiosHistorico;
	}		
	
	//RECUPERAR_ESTUDIO_HISTORICO
	public void altaEstudioSinFlushClear(Estudio estudio){
		
		this.getHibernateTemplate().saveOrUpdate(estudio);		
	}
	
	//RECUPERAR_ESTUDIO_HISTORICO
	public void eliminarEstudioHistoricoSinFlushClear(EstudioHistorico estudioHistorico){
		
		this.getHibernateTemplate().delete(estudioHistorico);		
	}	
	
	public List<Estudio> recuperarEstudiosPorMedicoObraSocial(String pFechaDesde, String pFechaHasta, long idMedico, long idObraSocial){
		
		Criteria criteria = getSession().createCriteria(Estudio.class);		
		
		criteria.createAlias("paciente", "p");
		criteria.addOrder(Order.asc("p.apellido"));
		
		if(pFechaDesde != null && !pFechaDesde.equals("") && pFechaHasta != null && !pFechaHasta.equals("")){
			Date fechaDesde = Fecha.stringDDMMAAAAToUtilDate(pFechaDesde);
			Date fechaHasta = Fecha.stringDDMMAAAAToUtilDate(pFechaHasta);
					
			criteria.add(Restrictions.ge("fecha", fechaDesde)); 
			criteria.add(Restrictions.lt("fecha", fechaHasta));
		}
		if(idMedico >0){
			criteria.add(Restrictions.eq("medico.id", idMedico));	
		}
		if(idObraSocial >0){
			criteria.createAlias("paciente.obraSocial", "os");
			criteria.add(Restrictions.eq("os.id", idObraSocial));	
		}		
		 
		List<Estudio> estudios = criteria.list();		
		return estudios;
	}		
	
}
