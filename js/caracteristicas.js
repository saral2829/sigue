var infocaract = function(id){

	var options = {
		type: 'POST',
		url:'index.php?page=caracteristicas&accion=infocaract',
		data: {
			'id' : id
		},
		dataType: 'html',
		success: function(response){
			$('#div_infocaract').html(response);
			$('#div_infocaract').show();
			// $('#divinfocamas').fadeOut("fast");
		}
	};
	$.ajax(options);
};

var cargarcaracteristicas = function(){

	var options = {
		type: 'POST',
		url:'index.php?page=caracteristicas&accion=cargarcaracteristicas',
		dataType: 'html',
		success: function(response){
			$('#tabla_caract').html(response);
			$('#tabla_caract').show();
			$('#div_infocaract').hide();
		}
	};
	$.ajax(options);
};

$(document).ready(function() {
	cargarcaracteristicas();
});


$(document).on('click', '.caract', function(event) {
	event.preventDefault();
	/* Act on the event */

	var id = $(this).data('id');

	$('.caract').each(function(){
		$(this).removeClass('seleccionado');
	});

	$(this).addClass('seleccionado');

	infocaract(id);

});


var modalcaracteristicas = function(modo, tipo, id_padre, id){

	var options = {
		type: 'POST',
		url:'index.php?page=caracteristicas&accion=modalcaracteristicas',
		data: {
			'modo' : modo,
			'tipo' : tipo,
			'id_padre' : id_padre,
			'id' : id,
		},
		dataType: 'html',
		success: function(response){
			$('#div_modalcaract').html(response);
			$('#modal_caracteriticas').modal('show');

		}
	};
	$.ajax(options);
};


$(document).on('click', '.btn_aniadir', function(event) {
	event.preventDefault();
	/* Act on the event */

	var modo = 'add';

	var tipo = $(this).data('tipo');
	if (tipo == 1) {
		var id_padre = null;
	} else {
		var id_padre = $('.seleccionado').data('id');		
	}

	modalcaracteristicas(modo, tipo, id_padre);


});

$(document).on('click', '.edit', function(event) {
	event.preventDefault();
	/* Act on the event */

	var modo = 'edit';

	var tipo = $(this).data('tipo');
	if (tipo == 1) {
		var id_padre = null;
	} else {
		var id_padre = $('.seleccionado').data('id');		
	}

	var id = $(this).data('id');

	modalcaracteristicas(modo, tipo, id_padre, id);


});

var registrarcaracteristica = function(formData){

    var options = {
        type: 'POST',
        url:'index.php?page=caracteristicas&accion=registrarcaracteristica',
        data:  formData,
        processData: false,  // tell jQuery not to process the data
        contentType: false,  // tell jQuery not to set contentType      
        dataType: 'json',
        success: function(response){
            $('#modal_caracteriticas').modal('hide'); 
            bootbox.alert(response.msj, function(result){

            	if (response.tipo == 1) {
            		cargarcaracteristicas();
            	} else {
            		var id_padre = $('.seleccionado').data('id');
            		infocaract(id_padre);
            	}

            });

        }
    };
    $.ajax(options);
};





$(document).on('submit', '#form_registro', function(event) {
    event.preventDefault();
    /* Act on the event */
    // console.log('hola');

    var formElement = document.getElementById("form_registro");
    var formData = new FormData(formElement);
    // var ciex_detalle =  JSON.stringify(detalle);
    // formData.append("ciex_detalle", ciex_detalle);

    registrarcaracteristica(formData);

});
