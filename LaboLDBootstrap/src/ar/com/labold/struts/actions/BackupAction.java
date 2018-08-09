package ar.com.labold.struts.actions;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.context.WebApplicationContext;

import ar.com.labold.exception.BackupException;
import ar.com.labold.fachada.ParametroFachada;
import ar.com.labold.negocio.Parametro;
import ar.com.labold.struts.actions.forms.BackupForm;
import ar.com.labold.struts.utils.Validator;
import ar.com.labold.utils.Fecha;
import ar.com.labold.utils.MyLogger;

public class BackupAction extends ValidadorAction {

	@SuppressWarnings("unchecked")
	public ActionForward mostrarRealizarBackup(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoMostrarRealizarBackup";

		try {
			WebApplicationContext ctx = getWebApplicationContext();
			ParametroFachada parametroFachada = (ParametroFachada)ctx.getBean("parametroFachada");
			
			String carpeta = parametroFachada.getNombreCarpetaBackup();
			
			//request.setAttribute("nombreArchivo", "c:"+File.separatorChar+"LaboLD_"+Fecha.dateToStringAAAAMMDD(new Date())+".sql");
			request.setAttribute("nombreArchivo", carpeta+File.separatorChar+"LaboLD_"+Fecha.dateToStringAAAAMMDD(new Date())+".sql");
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}
			
	@SuppressWarnings("unchecked")
	public ActionForward realizarBackup(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String strForward = "exitoBackup";

		try {
			BackupForm backupForm = (BackupForm)form;
			this.backup(backupForm.getNombre());
			//request.setAttribute("mensaje", "El backup se ha realizado con exito en el archivo: "+"C:"+File.separatorChar+"LaboLD_"+Fecha.dateToStringAAAAMMDD(new Date())+".sql");
			request.setAttribute("mensaje", "El backup se ha realizado con exito en el archivo: "+backupForm.getNombre());
			request.setAttribute("error", null);
			
		} catch (BackupException t) {

			request.setAttribute("error", t.getMessage());
			request.setAttribute("mensaje",null);
			
		} catch (Throwable t) {
			MyLogger.logError(t);
			//request.setAttribute("error", "Error Inesperado");
			request.setAttribute("error", "Error Inesperado - "+t.getMessage());
			strForward = "error";
		}

		return mapping.findForward(strForward);
	}	
	
	private void backup(String nombre) throws Exception {
	   try {
			WebApplicationContext ctx = getWebApplicationContext();
			ParametroFachada parametroFachada = (ParametroFachada)ctx.getBean("parametroFachada");		   
			String carpeta = parametroFachada.getNombreCarpetaMotorBD(); 
   
			Process p = Runtime.getRuntime()
								.exec(carpeta+File.separatorChar+"mysqldump --opt --password=labold --user=labold labold");
							   //.exec("C:"+File.separatorChar+"Program Files"+File.separatorChar+"MySQL"+File.separatorChar+"MySQL Server 5.1"+File.separatorChar+"bin"+File.separatorChar+"mysqldump --opt --password=labold --user=labold labold");	            	           

			InputStream is = p.getInputStream();
			//FileOutputStream fos = new FileOutputStream("c:"+File.separatorChar+"LaboLD_"+Fecha.dateToStringAAAAMMDD(new Date())+".sql");
			FileOutputStream fos = new FileOutputStream(nombre);
			byte[] buffer = new byte[1000];

			int leido = is.read(buffer);
  
			if(leido < 0){
				throw new BackupException("Error al realizar el backup");
			}
      
			while (leido > 0) {
				fos.write(buffer, 0, leido);
				leido = is.read(buffer);
			}

			fos.close();
	
	   } catch (FileNotFoundException e) {
		   e.printStackTrace();
		   throw new BackupException(e.getMessage());	
	   } catch (Exception e) {
		   e.printStackTrace();
		   throw e;
	   }
	}	
	
	public boolean validarBackupForm(StringBuffer error, ActionForm form) {
		try {
			BackupForm backupForm = (BackupForm)form;

			boolean b1 = Validator.requerido(backupForm.getNombre(),"Nombre", error);
	
			return b1;

		} catch (Throwable t) {
			MyLogger.logError(t);
			Validator.addErrorXML(error, "Error Inesperado - "+t.getMessage());
			return false;
		}

	}	
}
