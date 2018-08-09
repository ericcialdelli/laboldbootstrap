package ar.com.labold.fachada;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import ar.com.labold.dao.PracticaDAO;
import ar.com.labold.dto.GrupoPracticaDTO;
import ar.com.labold.dto.PracticaDTO;
import ar.com.labold.dto.SubItemPracticaDTO;
import ar.com.labold.negocio.EstudioPreSeteado;
import ar.com.labold.negocio.GrupoPractica;
import ar.com.labold.negocio.Practica;
import ar.com.labold.negocio.SubItemPractica;
import ar.com.labold.negocio.exception.NegocioException;
import ar.com.labold.providers.ProviderDominio;

@Transactional(rollbackFor = { Throwable.class })
public class PracticaFachada {

	private PracticaDAO practicaDAO;
	
	public PracticaFachada(){}
	
	public PracticaFachada(PracticaDAO pPracticaDAO){
		
		this.practicaDAO = pPracticaDAO;
	}
	
	public boolean existePractica(PracticaDTO practica){
		
		return practicaDAO.existePractica(practica.getNombre(),practica.getId(),practica.getGrupoPracticaDTO().getId());
	}	
	
	public boolean existeGrupoPractica(GrupoPracticaDTO grupoPractica){
		
		return practicaDAO.existeGrupoPractica(grupoPractica.getNombre(),grupoPractica.getId());
	}	
	
	public void altaPractica(PracticaDTO practicaDTO) throws NegocioException{
		
		GrupoPractica grupo = practicaDAO.getGrupoPractica(practicaDTO.getGrupoPracticaDTO().getId());
		SubItemPractica subItem = practicaDAO.getSubItemPractica(practicaDTO.getSubItemPracticaDTO().getId());
		
		practicaDAO.altaPractica(ProviderDominio.getPractica(practicaDTO,grupo,subItem));
	}
	
	public void altaGrupoPractica(GrupoPracticaDTO grupoPracticaDTO) throws NegocioException{
		
		practicaDAO.altaGrupoPractica(ProviderDominio.getGrupoPractica(grupoPracticaDTO));
	}	

	public void altaSubItemPractica(SubItemPracticaDTO subItemPracticaDTO) throws NegocioException{
		
		GrupoPractica grupoPractica = practicaDAO.getGrupoPractica(subItemPracticaDTO.getGrupoPractica().getId());
		practicaDAO.altaSubItemPractica(ProviderDominio.getSubItemPractica(subItemPracticaDTO,grupoPractica));
	}		
	
	public long modificacionPractica(PracticaDTO practicaDTO) throws NegocioException{
		
		Practica practica = practicaDAO.getPractica(practicaDTO.getId());
		
		practicaDAO.altaPractica(ProviderDominio.getPractica(practica,practicaDTO));
		
		return practica.getGrupoPractica().getId();
	}	

	public void modificacionGrupoPractica(GrupoPracticaDTO grupopracticaDTO) throws NegocioException{
		
		GrupoPractica grupoPractica = practicaDAO.getGrupoPractica(grupopracticaDTO.getId());
		
		practicaDAO.altaGrupoPractica(ProviderDominio.getGrupoPractica(grupoPractica,grupopracticaDTO));
	}		
	
	public List<Practica> getPracticas(){
		
		return practicaDAO.getPracticas();
	}
	
	public List<Practica> getPracticasPorGrupo(Long idGrupo){
		
		return practicaDAO.getPracticasPorGrupo(idGrupo);
	}
	
	public Map<Long,List<Practica>> getPracticasPorGrupoYSubItem(Long idGrupo){
		
		Map<Long,List<Practica>> map = new HashMap<Long, List<Practica>>();
		List<Practica> lista = practicaDAO.getPracticasPorGrupo(idGrupo);
		long idSubItem;
		List<Practica> listaAux;
		
		for (Practica practica : lista) {
			
			idSubItem = (practica.getSubItemPractica() == null)? 0 : practica.getSubItemPractica().getId();
			listaAux = (map.get(idSubItem) == null)? new ArrayList<Practica>() : map.get(idSubItem); 
			listaAux.add(practica);
			map.put(idSubItem, listaAux);
		}
		
		return map;
	}	
	
	public Practica getPractica(Long id){
		
		return practicaDAO.getPractica(id);
	}	
	
	public List<GrupoPractica> getGruposPractica(){
		
		return practicaDAO.getGruposPractica();
	}	

	public GrupoPractica getGrupoPractica(Long id){
		
		return practicaDAO.getGrupoPractica(id);
	}	
	
	public List<SubItemPractica> getSubItemsPorGrupoPractica(Long idGrupo){
		
		return practicaDAO.getSubItemsPorGrupoPractica(idGrupo);
	}
	
	public List<SubItemPractica> getListaSubItemsConNula(Long id){
		
		List<SubItemPractica> listaSubItems = new ArrayList<SubItemPractica>();
		SubItemPractica si = new SubItemPractica();
		si.setId(0L);
		si.setNombre("");
		listaSubItems.add(si);
		
		GrupoPractica grupo = practicaDAO.getGrupoPractica(id);
		listaSubItems.addAll(grupo.getSubItemsPractica());
		
		return listaSubItems;
	}
	
	//PRESELECCION
	public void altaEstudioPreSeteado(String nombre, List<PracticaDTO> listaPracticasDTO){
		
		List<Practica> listaPracticas = new ArrayList<Practica>(); 
		for (PracticaDTO practicaDTO : listaPracticasDTO) {
			listaPracticas
			.add(practicaDAO.getPractica(practicaDTO.getId()));
		}
		
		EstudioPreSeteado estudio = new EstudioPreSeteado();
		estudio.setNombre(nombre);
		estudio.setListaPracticas(listaPracticas);
		
		practicaDAO.altaEstudioPreSeteado(estudio);
	}
	
	//PRESELECCION
	public void modificacionEstudioPreSeteado(String id, String nombre, List<PracticaDTO> listaPracticasDTO){
		
		List<Practica> listaPracticas = new ArrayList<Practica>(); 
		for (PracticaDTO practicaDTO : listaPracticasDTO) {
			listaPracticas
			.add(practicaDAO.getPractica(practicaDTO.getId()));
		}
		
		EstudioPreSeteado estudio = getEstudioPreSeteado(Long.valueOf(id));
		estudio.setNombre(nombre);
		estudio.setListaPracticas(listaPracticas);
		
		practicaDAO.altaEstudioPreSeteado(estudio);
	}	
	
	//PRESELECCION
	public List<EstudioPreSeteado> getEstudiosPreSeteados(){
		
		return practicaDAO.getEstudiosPreSeteados();
	}
	
	//PRESELECCION
	public EstudioPreSeteado getEstudioPreSeteado(Long id){
	
		return practicaDAO.getEstudioPreSeteado(id);
	}
	
	//PRESELECCION
	public String[] obtenerEstudioPreSeteado(String id){
		
		EstudioPreSeteado estudio = practicaDAO.getEstudioPreSeteado(Long.valueOf(id));
		List<String> lista = new ArrayList<String>();		
		String[] l = new String[estudio.getListaPracticas().size()];
		
		int i=0;
		for (Practica practica : estudio.getListaPracticas()) {
			l[i]=String.valueOf(practica.getId());
			i++;
		}
		return l;
	}
	
	//PRESELECCION
	public void eliminarEstudioPreSeteado(Long id){
		
		EstudioPreSeteado estudio = practicaDAO.getEstudioPreSeteado(id);
		practicaDAO.eliminarEstudioPreSeteado(estudio);	
	}
}
