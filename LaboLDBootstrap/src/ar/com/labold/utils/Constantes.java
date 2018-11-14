package ar.com.labold.utils;

public class Constantes {

	public static final String USER_LABEL_SESSION = "usuario";

	public static final Long ID_ROL_ADMINISTRADOR = 1L;

	// USUARIO
	public static final String TITULO_ALTA_USUARIO = "Alta de Usuario";

	public static final String TITULO_MODIFICACION_USUARIO = "Modificación de Usuario";// solo
																						// para
																						// cuando
																						// no
																						// es
																						// Administrador

	public static final String EXISTE_USUARIO = "Ya existe un Usuario con este nombre";

	public static final String USUARIO_INVALIDO = "Usuario y/o Contraseña invalido";

	public static final String EXITO_ALTA_USUARIO = "El Usuario se ha dado de alta con exito";

	public static final String EXITO_MODIFICACION_USUARIO = "El Usuario se ha modificado con exito";

	public static final String ERROR_ALTA_USUARIO = "Ha ocurrido un error en el alta del usuario";

	public static final String ERROR_MODIFICACION_USUARIO = "Ha ocurrido un error en la modificación del usuario";

	public static final String ERROR_RECUPERACION_USUARIOS = "Ha ocurrido un error en la recuperación de los usuarios";

	public static final String ERROR_RECUPERACION_USUARIO = "Ha ocurrido un error en la recuperación del usuario";

	public static final String ERROR_LOGIN_USUARIO = "Ha ocurrido un error en el login del usuario";
	// FIN USUARIO

	// ROL
	public static final String ADMINISTRADOR = "Administrador";

	public static final String EXISTE_ROL = "Ya existe un Rol con ese nombre";

	public static final String EXITO_ALTA_ROL = "El Rol se ha dado de alta con exito";

	public static final String EXITO_MODIFICACION_ROL = "El Rol se ha modificado con exito";

	public static final String ERROR_ALTA_ROL = "Ha ocurrido un error en el alta del rol";

	public static final String ERROR_MODIFICACION_ROL = "Ha ocurrido un error en la modificación del rol";

	public static final String ERROR_RECUPERACION_ROLES = "Ha ocurrido un error en la recuperación de los roles";

	public static final String ERROR_RECUPERACION_ROL = "Ha ocurrido un error en la recuperación del rol";

	public static final String ERROR_RECUPERACION_MENUES = "Ha ocurrido un error en la recuperación de los menues";

	public static final String ERROR_RECUPERACION_MENU = "Ha ocurrido un error en la recuperación del menÃº";
	// FIN ROL

	//OBRA SOCIAL
	public static final String EXITO_ALTA_OBRA_SOCIAL = "La Obra Social se ha dado de alta con exito";
	
	public static final String EXITO_MODIFICACION_OBRA_SOCIAL = "La Obra Social se ha modificado con exito";	
	
	public static final String EXISTE_OBRA_SOCIAL = "Ya existe una Obra Social con ese nombre";
	//FIN OBRA SOCIAL

	//MEDICO
	public static final String EXITO_ALTA_MEDICO = "El Médico se ha dado de alta con exito";
	
	public static final String EXISTE_MEDICO = "Ya existe un Médico con esa matricula";
	
	public static final String EXITO_MODIFICACION_MEDICO = "El Médico se ha modificado con exito";
	//FIN MEDICO	
	
	//PACIENTE
	public static final String EXITO_ALTA_PACIENTE = "El Paciente se ha dado de alta con exito";
	
	public static final String EXITO_MODIFICACION_PACIENTE = "El Paciente se ha modificado con exito";	
	
	public static final String EXISTE_PACIENTE = "Ya existe un Paciente con ese DNI";
	//FIN PACIENTE	
	
	//PRACTICA
	public static final String EXITO_ALTA_PRACTICA = "La Práctica se ha dado de alta con exito";
	
	public static final String EXITO_ALTA_GRUPO_PRACTICA = "El Grupo Practica se ha dado de alta con exito";
	
	public static final String EXITO_ALTA_SUBITEM_PRACTICA = "El SubItem se ha dado de alta con exito";
	
	public static final String EXITO_MODIFICACION_PRACTICA = "La Práctica se ha modificado con exito";
	
	public static final String EXITO_MODIFICACION_GRUPO_PRACTICA = "El Grupo se ha modificado con exito";	
	
	public static final String EXISTE_PRACTICA = "Ya existe una Práctica con ese nombre";
	
	public static final String EXISTE_GRUPO_PRACTICA = "Ya existe un Grupo Práctica con ese nombre";
	
	public static final String EXITO_ALTA_ESTUDIO_PRESETEADO = "El Estudio Pre Seteado se ha dado de alta con exito";
	
	public static final String EXITO_MODIFICACION_ESTUDIO_PRESETEADO = "El Estudio Pre Seteado se ha modificado con exito";
	
	public static final String EXITO_ELIMINAR_ESTUDIO_PRESETEADO = "El Estudio Pre Seteado se ha eliminado con exito";
	//FIN PRACTICA	
	
	//ESTUDIO
	public static final String EXITO_ALTA_ESTUDIO = "Se ha dado de alta el Estudio con ";
	
	public static final String EXITO_ALTA_ESTUDIO2 = " unidades de facturación";

	public static final String EXITO_MODIFICACION_ESTUDIO = "El Estudio se ha modificado con exito";
	
	public static final String EXITO_COMPLETAR_ESTUDIO = "El Estudio se ha completado con exito";
	
	public static final String EXITO_ELIMINAR_PRACTICA_DE_ESTUDIO = "Las Practicas se han eliminado con exito";
	
	public static final String EXITO_ENTREGA_ESTUDIO = "El Estudio se ha entregado con exito";
	//FIN ESTUDIO		

	//FACTURACION
	public static final String EXITO_ELIMINAR_PRACTICA_PARA_FACTURACION = "Las Practicas se han eliminado con exito de la Facturacion";
	
	public static final String EXITO_RESTABLECER_PRACTICA_PARA_FACTURACION = "Las Practicas se han restablecido con exito de la Facturacion";
	
	public static final String EXITO_MODIFICAR_VALOR_UNIDAD_FACTURACION = "Se ha modificado con exito el Valor de Unidad de Facturacion";
	//FIN FACTURACION
	
	// REPORTES
	public static final String REPORTE_ESTUDIOS_A_REALIZAR_ENTRE_FECHAS = "reporteEstudiosARealizarEntreFechas";
	
	public static final String PLANILLA_PRACTICAS_EN_ESTUDIOS_POR_GRUPOS = "planillaPracticasEnEstudiosPorGrupos";
	
	public static final String REPORTE_ESTUDIO = "reporteEstudio";
	
	public static final String REPORTES_ESTUDIOS = "superReporteEstudio";
	
	public static final String REPORTE_FACTURACION_ENTRE_FECHAS = "reporteFacturacionEntreFechas";
	
	public static final String REPORTE_FACTURACION_ENTRE_FECHAS_POR_OBRA_SOCIAL = "reporteFacturacionEntreFechasPorObraSocial";
	
	public static final String REPORTE_PRESUPUESTO_ESTUDIO = "reportePresupuestoEstudio";
	
	public static final String REPORTE_FACTURACION_POR_ANIO = "reporteFacturacionPorAnio";
	// FIN REPORTES
}
