package ar.com.labold.utils;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Vector;

public class InputOutput {

	public InputOutput() {
	}

	/**
	 *  Copia el contenido del Stream in en el out
	 * @throws IOException 
	 */
	public static void copyStream(InputStream in, OutputStream out) throws IOException {

		byte[] buffer = new byte[1024];
		int bytesRead = in.read(buffer);
		while (bytesRead != -1) {
			out.write(buffer, 0, bytesRead);
			bytesRead = in.read(buffer);
		}
		out.flush();
		in.close();
		out.close();

	} //copyStream

	/**
	 *  Graba un InputStream en disco
	 *  Si el archivo ya existe lo sobreescribe
	 * @throws Throwable 
	 */
	public static void grabarArchivo(InputStream pFile, String pFilePath, String pFileName) throws Throwable{
		byte[] buffer = new byte[1024];
		int cant;

		crearCarpeta(pFilePath);

		FileOutputStream fos = new FileOutputStream(pFilePath + "/" + pFileName);

		while ((cant = pFile.read(buffer)) != -1) {
			fos.write(buffer, 0, cant);
		}

		if (fos != null) {
			fos.flush();
			fos.close();
		}
	}

	/**
	 *  Crea una carpeta en un directorio si es que no existe
	 * @throws Throwable 
	 */
	public static void crearCarpeta(String pPath) throws Throwable {
		try {
			File f = new File(pPath);

			if (!f.exists()) {
				//boolean ok = f.mkdirs();
			}
		} catch (Throwable e_Throwable) {
			e_Throwable.printStackTrace();
			throw e_Throwable;
		}
	}

	/**
	 *  Recupera los archivos de un directorio
	 * @throws IOException 
	 */
	public static Vector listarDirectorio(String pPath, String pFiltro) throws IOException{
		Vector archivos = null;
		File dir = null;

		archivos = new Vector();

		dir = new File(pPath);
		dir.getCanonicalPath();

		File[] contenido = dir.listFiles();

		if (contenido != null) {
			int cantidad = contenido.length;

			for (int i = 0; i < cantidad; i++) {
				String archivo = contenido[i].getName();

				if (archivo.lastIndexOf(pFiltro) != -1) {
					archivos.add(archivo);
				}
			}
		}

		return archivos;
	}

	public static String readInputStreamAsString(InputStream in) throws IOException {

		BufferedInputStream bis = new BufferedInputStream(in);
		ByteArrayOutputStream buf = new ByteArrayOutputStream();
		int result = bis.read();
		while (result != -1) {
			byte b = (byte) result;
			buf.write(b);
			result = bis.read();
		}
		return buf.toString();
	}
	/**
	 *  Lee un file grabado en disco
	 *
	 public void leerArchivo(String pFilePath, String pFileName,
	 HttpServletResponse pResponse)
	 throws InputOutputException, ErrorInesperadoException {
	 try {
	 if ((pFileName == "") || (pFileName == null)) {
	 InputOutputException ioe = new InputOutputException();
	 ioe.setMensaje("Nombre del comprobante sin contenido");
	 ioe.setDato(pFileName);
	 throw ioe;
	 }

	 File f = new File(pFilePath + "/" + pFileName);

	 if (!f.exists()) {
	 InputOutputException ioe = new InputOutputException();
	 ioe.setMensaje("Comprobante inexistente");
	 ioe.setDato(pFileName);
	 throw ioe;
	 }

	 // PRUEBA PARA HTTPS
	 //            pResponse.setContentType("multipart/xml");
	 pResponse.setContentType("application/txt");
	 pResponse.setHeader("Content-Disposition",
	 "attachment; filename=" + pFileName);
	 pResponse.setContentLength((int) f.length());

	 OutputStream os = pResponse.getOutputStream();
	 FileInputStream stream = new FileInputStream(f);

	 BufferedInputStream bis = new BufferedInputStream(stream);
	 InputStream is = new BufferedInputStream(bis);

	 int count;
	 byte[] buf = new byte[4096];

	 while ((count = is.read(buf)) > -1) {
	 os.write(buf, 0, count);
	 }

	 if (is != null) {
	 is.close();
	 }

	 if (os != null) {
	 os.flush();
	 os.close();
	 }
	 } catch (InputOutputException ioe) {
	 throw ioe;
	 } catch (IOException ioexc) {
	 InputOutputException ioe = new InputOutputException();
	 ioe.setMensaje(ioexc.getMessage());
	 ioe.setDato(pFileName);
	 throw ioe;
	 } catch (Throwable e_Throwable) {
	 throw new ErrorInesperadoException("InputOutput", "leerArchivo",
	 e_Throwable.getMessage());
	 }
	 }
	 */

}
