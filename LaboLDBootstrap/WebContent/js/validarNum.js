//Funci�n que permite que s�lo se ingresen n�meros si el campo es de tipo numerico
var type;
if (navigator.userAgent.indexOf("Opera")!=-1 && document.getElementById) type="OP"; 
if (document.all) type="IE"; 
if (!document.all && document.getElementById) type="MO"; 

function stop(event) {
    if (event.preventDefault) {
      event.preventDefault();
      event.stopPropagation();
    } else {
      event.returnValue = false;
      event.cancelBubble = true;
    }
 }

function esNumerico(event) {
 	var ok;
 	var key;
	if (type=="IE") { 
		key = event.keyCode;
	}

	if (type=="MO" || type=="OP") {
		key = event.which;		  
	}
	
	if ((key >8 && key < 48) || key > 57) {
		stop(event);
	}else{
		event.returnValue = true;
	}
}

function validarNumeroConDecimal(e, field) {

	key = e.keyCode ? e.keyCode : e.which
	// backspace
	if (key == 8) return true
	// 0-9
	if (key > 47 && key < 58) {

	    if (field.value == "") return true
	    regexp = /.[0-9]{20}$/
		return !(regexp.test(field.value))
	}

	// .
	if (key == 46) {
	    if (field.value == "") return false
	    regexp = /^[0-9]+$/
		return regexp.test(field.value)
	}
	// other key
	return false
}

function esNumericoConDecimal(event) {
	var ok;
 	var key;
	 if (type=="IE") { 
		key = event.keyCode;
	}
	 if (type=="MO" || type=="OP") {
		key = event.which;		  
	 }

	 if ((key != 46) && ((key >8 && key < 48) || key > 57)) {
	 	stop(event);
	 }
	 else{
		event.returnValue = true;
	}
}

function esDouble(ob) { 
	if (ob.value.length > 0) {
	
		var valor = parseFloat(ob.value);	
		if (isNaN(valor)) { 
			alert("No es un valor v�lido");
			ob.focus();
		} else ob.value = valor;
	}
 }


function leftPad(item ,cPad, cant) {
	newItem = new String(item);
	while (newItem.length < cant) {
		newItem = cPad + newItem;
	}
	return newItem;
}

//Estas son numericas
function DotJ_isPositiveInteger (s) {
	return (DotJ_isInteger(s) && parseInt(s,10) > 0);
}
function DotJ_isInteger (s) {
	var re = /^(\+|\-)?\d+$/
	var isMatch = re.exec(s);
	return (isMatch != null && s == isMatch[0]);
}

function DotJ_isIntegerInRange (s, a, b) {
	if (!DotJ_isInteger(s)) return false;
	var num = s - 0;
	return ((num >= a) && (num <= b));
}
