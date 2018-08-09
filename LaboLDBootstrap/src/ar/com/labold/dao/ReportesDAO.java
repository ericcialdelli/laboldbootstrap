package ar.com.labold.dao;

import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ar.com.labold.dto.ReporteFacturacionPorAnioDTO;
import ar.com.labold.negocio.Estudio;
import ar.com.labold.negocio.Reporte;

public class ReportesDAO extends HibernateDaoSupport {

	private InputStream obtenerReporte(String nombreReporte) throws SQLException {

		Criteria criteria = getSession().createCriteria(Reporte.class);
		criteria.add(Restrictions.eq("nombreReporte", nombreReporte));
		
		List<Reporte> lista = criteria.list();
		Reporte r = lista.get(0);
		
		return r.getArchivoReporte().getBinaryStream();
	}
	
	private void cargarSubReportes(String nombrePadre,
			Map<String, Object> parameters) throws SQLException {

		Criteria criteria = getSession().createCriteria(Reporte.class);
		criteria.add(Restrictions.eq("nombreReportePadre", nombrePadre));

		List<Reporte> lista = criteria.list();
		for (Reporte reporte : lista) {

			parameters.put(reporte.getNombreReporte(), reporte
					.getArchivoReporte().getBinaryStream());
		}
	}	
	
	public byte[] generarReporte(String nombreReporte,
			Map<String, Object> parameters) throws Exception {
		InputStream input = obtenerReporte(nombreReporte);
		this.cargarSubReportes(nombreReporte, parameters);
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(input);

		return JasperRunManager.runReportToPdf(jasperReport, parameters,
				getSession().connection());

	}
	
	public byte[] generarReporteColeccion(String nombreReporte,
			Map<String, Object> parameters, Collection lista) throws Exception {
		
		InputStream input = obtenerReporte(nombreReporte);
		this.cargarSubReportes(nombreReporte, parameters);
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(input);

		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(lista);
		
		return JasperRunManager.runReportToPdf(jasperReport, parameters,dataSource);

	}	
	
	public byte[] generarReporteFacturacionPorAnio(String nombreReporte)throws Exception {	
		
		Calendar c = Calendar.getInstance();
		Calendar cal = Calendar.getInstance();
		
		int cantEstudios = 0;
		double promedios = 0;
		int cantEstudiosAnioAnterior = 0;
		double porcentajeCrecimiento = 0.0;
		
		int anioActual = c.get(Calendar.YEAR);
		List<ReporteFacturacionPorAnioDTO> listaAnios = new ArrayList<ReporteFacturacionPorAnioDTO>();		
		ReporteFacturacionPorAnioDTO dto = null;
		
		for (int i = 2015; i < anioActual; i++) {

			porcentajeCrecimiento = 0.0;			
			
			dto = new ReporteFacturacionPorAnioDTO();
			
			c.set(Calendar.YEAR, i);
			c.set(Calendar.MONTH, 11); // 11 = december
			c.set(Calendar.DAY_OF_MONTH, 31); // new years eve		
			c.set(Calendar.HOUR_OF_DAY, 0);
			c.set(Calendar.MINUTE, 0);
			c.set(Calendar.SECOND, 0);	
			Date fechaHasta = c.getTime();		
						
			cal.set(Calendar.YEAR, i);
			cal.set(Calendar.MONTH, 0); // 0 = Enero
			cal.set(Calendar.DAY_OF_MONTH, 1);		
			cal.set(Calendar.HOUR_OF_DAY, 0);
			cal.set(Calendar.MINUTE, 0);
			cal.set(Calendar.SECOND, 0);	
			Date fechaDesde = cal.getTime();
			
			Criteria criteria = getSession().createCriteria(Estudio.class);		
			criteria.add(Restrictions.between("fecha", fechaDesde, fechaHasta));
			List<Reporte> lista = criteria.list();		
			
			cantEstudios = lista.size();
			promedios = cantEstudios/11.0;

			if(cantEstudiosAnioAnterior > 0){
				porcentajeCrecimiento = cantEstudios - cantEstudiosAnioAnterior;
				porcentajeCrecimiento = porcentajeCrecimiento/cantEstudiosAnioAnterior;
				porcentajeCrecimiento = porcentajeCrecimiento*100;
			}	
			
			dto.setAnio(String.valueOf(i));
			dto.setCantEstudios(String.valueOf(cantEstudios));
			dto.setPromedioCantEstudios(String.format("%.2f", promedios));
			dto.setPorcentajeCrecimiento(String.format("%.2f", porcentajeCrecimiento));								
			
			listaAnios.add(dto);			
			
			System.out.println("Año "+String.valueOf(i)+" ----> "+String.valueOf(cantEstudios)+" estudios - Promedio por mes: "+String.format("%.2f", promedios)+" - Crecimiento: "+String.format("%.2f", porcentajeCrecimiento)+"%");
			
			cantEstudiosAnioAnterior = cantEstudios;
		}
		
		return this.generarReporteColeccion(nombreReporte, null, listaAnios);
		
	}
	
	public static void main(String[] args) {
		
		
		/*int a = 541;
		System.out.println(a/11.0);
		System.out.println(String.format("%.2f", a/11.0));*/
		
		int cantEstudios = 550;
		double promedios = 0;
		int cantEstudiosAnioAnterior = 50;
		double porcentaje1 = cantEstudios - cantEstudiosAnioAnterior;
		porcentaje1 = porcentaje1/cantEstudiosAnioAnterior;
		porcentaje1 = porcentaje1*100;
		
		System.out.println(porcentaje1);
		System.out.println(String.format("%.2f", porcentaje1));
	}
	
}
