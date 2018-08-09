
//Tanto el agregarMedico como el modificarMedico se usan en altaEstudio.jsp y en modificarEstudio.jsp//

//------Agregar Medico---------//
	
	function abrirVentantAgregarMedico(){

		$('#textoErrorMedico').text("");
		$('#tdAceptarMedico').show();
		$('#tdModificarMedico').hide();
		$('#medico').val("");
		$('#nombreMedico').val("");
		$('#apellidoMedico').val("");
		$('#telefonoMedico').val("");
		$('#matriculaMedico').val("");
		$('#especialidadMedico').val("");			
		$('#dialogoMedico').dialog({title: 'Agregar Médico', height: 350, width: 500, modal: true});
	}

	function agregarMedico(){
			
		var form = $('#medicoFormId').serialize(); 
		var url = '../../medico.do?metodo=validar&validador=validarMedicoForm&form=MedicoForm&formJsp=medicoFormId';		
		$.post(url,form,validarMedicoFormCallBack);		
	}

	function validarMedicoFormCallBack(xmlDoc){

	   	var nodos = xmlDoc.getElementsByTagName('error');
	    if (nodos.length==0){

			MedicoFachada.altaMedicoDesdeAltaEstudio($('#nombreMedico').val(),$('#apellidoMedico').val(),$('#telefonoMedico').val(),
													 $('#matriculaMedico').val(),$('#especialidadMedico').val(),mostrarMedicoCallback);
	    	
	    } else {
	    	$('#textoErrorMedico').text("");
		    for(var i=0; i < nodos.length; i++) { 
			    $('#textoErrorMedico').append( '<div>* ' + nodos[i].firstChild.nodeValue + '</div>');
		    }
		    $('#textoErrorMedico').show();
	    }
	}

	function mostrarMedicoCallback(medico){

		$('#comboMedicos').hide();
		$('#comboMedicos').html("");
		$('#inputMedico').show();
		$('#idMedicoAgregado').val(medico.id);		
		$('#nombreMedicoAgregado').val(medico.apellido+", "+medico.nombre+" - "+medico.matricula);

		cerrarVentanaAgregarMedico();
	}

//------Fin Agregar Medico---------//

	function cambioMedico(){

		if($('#idMedico').val()!=-1){
			$('#botonModificarMedico').removeAttr("disabled");
		}else{
			$('#botonModificarMedico').attr("disabled","disabled");
		}
	}

//------Modificar Medico---------//
	
	function abrirVentantModificarMedico(){
		MedicoFachada.getMedico($('#idMedico').val(),mostrarMedicoModificacionCallback);
		
	}

	function mostrarMedicoModificacionCallback(medico){
		
		$('#textoErrorMedico').text("");
		$('#tdAceptarMedico').hide();
		$('#tdModificarMedico').show();
		$('#dialogoMedico').dialog({title: 'Modificar Medico', height: 350, width: 500, modal: true});
		
		$('#medico').val(medico.id);
		$('#nombreMedico').val(medico.nombre);
		$('#apellidoMedico').val(medico.apellido);
		$('#telefonoMedico').val(medico.telefono);
		$('#matriculaMedico').val(medico.matricula);
		$('#especialidadMedico').val(medico.especialidad);		
	}

	function modificarMedico(){
		
		var form = $('#medicoFormId').serialize(); 
		var url = '../../medico.do?metodo=validar&validador=validarMedicoForm&form=MedicoForm&formJsp=medicoFormId';		
		$.post(url,form,validarModificacionMedicoFormCallBack);		
	}

	function validarModificacionMedicoFormCallBack(xmlDoc){

	   	var nodos = xmlDoc.getElementsByTagName('error');
	    if (nodos.length==0){

			MedicoFachada.modificarMedicoDesdeAltaEstudio($('#medico').val(),$('#nombreMedico').val(),$('#apellidoMedico').val(),$('#telefonoMedico').val(),
					$('#matriculaMedico').val(),$('#especialidadMedico').val(),cerrarVentanaAgregarMedico);
				    	
	    } else {
	    	$('#textoErrorMedico').text("");
		    for(var i=0; i < nodos.length; i++) { 
			    $('#textoErrorMedico').append( '<div>* ' + nodos[i].firstChild.nodeValue + '</div>');
		    }
		    $('#textoErrorMedico').show();
	    }
	}

	function cerrarVentanaAgregarMedico(){

		$('#textoErrorMedico').hide();		
		$('#dialogoMedico').dialog( "close" );
	}
		
//------Fin Modificar Medico---------//