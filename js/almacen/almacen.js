var cargarcaract = function(id){

    var options = {
        type: 'POST',
        url:'index.php?page=almacenes&accion=cargarcaract',
        data : {
        	'id' : id
        },
        dataType: 'json',
        success: function(response){
        	$('#caracteristica').html(response.options);
        	$('.select2').select2();
        }
    };
    $.ajax(options);
};


$(document).on('change', '#caract_padre', function(event) {
	event.preventDefault();
	/* Act on the event */

	var caract_padre = $(this).val();

	cargarcaract(caract_padre);

});

$(document).ready(function() {
	var caract_padre = $('#caract_padre').val();

	cargarcaract(caract_padre);	

    var sucursal = $('#sucursal').val();

    listaralmacenes(sucursal);

});


var cargartabla = function(term, caract, almacen, caract_padre){

    var options = {
        type: 'POST',
        url:'index.php?page=almacenes&accion=cargartabla',
        data : {
        	'term' : term,
        	'caract' : caract,
        	'almacen' : almacen,
            'caract_padre' : caract_padre,
        },
        dataType: 'html',
        success: function(response){
        	$('#resultados').html(response);
            $('#tabla_busqueda').DataTable({
                language : spanishtable,
                responsive: true
            });            
        }
    };
    $.ajax(options);
};


$(document).on('click', '#btn_buscar', function(event) {
	event.preventDefault();
	/* Act on the event */

	var term = $('#term').val();

	var caracteristica = $('#caracteristica').val();

	var almacen = $('#almacen').val();

    var caract_padre = $('#caract_padre').val();

	cargartabla(term, caracteristica, almacen, caract_padre);

});

$(document).on('keypress', '#term', function(e) {
	if (e.which == 13) {

		var term = $('#term').val();

		var caracteristica = $('#caracteristica').val();

		var almacen = $('#almacen').val();
    
        var caract_padre = $('#caract_padre').val();

		cargartabla(term, caracteristica, almacen, caract_padre);

	}
});

var modalprecio = function(producto, almacen, sucursal){

    var options = {
        type: 'POST',
        data : {
            'producto' : producto,
            'almacen' : almacen,
            'sucursal' : sucursal,
        },
        url:'index.php?page=almacenes&accion=modalprecio',
        dataType: 'html',
        success: function(response){
            $('#modales').html(response);
            $('#modal_precio').modal('show');

        }
    };
    $.ajax(options);
};

$(document).on('click', '.precio', function(event) {
    event.preventDefault();
    /* Act on the event */

    var producto = $(this).data('id');
    var almacen = $('#almacen').val();
    var sucursal = $('#sucursal').val();

    modalprecio(producto, almacen, sucursal);
});


var listaralmacenes = function(sucursal){

    var options = {
        type: 'POST',
        data : {
            'sucursal' : sucursal,
        },
        url:'index.php?page=almacenes&accion=listaralmacenes',
        dataType: 'json',
        success: function(response){
            $('#almacen').html(response.options);
            $('.select_2').select2();
            var almacen = $('#almacen').val();
            // listaralmacenesdisp(almacen);
        }
    };
    $.ajax(options);
};

$(document).on('change', '#sucursal', function(event) {
    event.preventDefault();
    /* Act on the event */

    var sucursal = $(this).val();

    listaralmacenes(sucursal);
});


$(document).on('change', '#editar', function(event) {
    event.preventDefault();
    /* Act on the event */

    var editar = $(this).prop('checked');

    var button_salir = '<button type="button" class="btn btn-danger pull-left" data-dismiss="modal"><i class="fa fa-fw fa-sign-out"></i> Salir</button>';
    var button_guardar = '<button type="submit" class="btn btn-primary" id="btn_guardar"><i class="fa fa-fw fa-save"></i> Guardar</button>';

    if (editar == true) {
        $('#span_precio').hide();
        $('#precio').show();
        $('#div_footer').empty();
        $('#div_footer').html(button_salir+button_guardar);
    } else {
        $('#span_precio').show();
        $('#precio').hide();
        $('#div_footer').empty();
        $('#div_footer').html(button_salir);
    }

});

var actualizarprecio = function(prod_id, almacen, precio){

    var options = {
        type: 'POST',
        data : {
            'prod_id' : prod_id,
            'almacen' : almacen,
            'precio' : precio,
        },
        url:'index.php?page=almacenes&accion=actualizarprecio',
        dataType: 'json',
        success: function(response){
            bootbox.alert(response.msj, function(result){

                var term = $('#term').val();

                var caracteristica = $('#caracteristica').val();

                var almacen = $('#almacen').val();

                var caract_padre = $('#caract_padre').val();

                cargartabla(term, caracteristica, almacen, caract_padre);                
            }); 

        }
    };
    $.ajax(options);
};



$(document).on('click', '#btn_guardar', function(event) {
    event.preventDefault();
    /* Act on the event */

    var prod_id = $('#prod_id').val();
    var almacen = $('#almacen').val();
    var precio = $('#precio').val();

    actualizarprecio(prod_id, almacen, precio);
    $('#modal_precio').modal('hide');
});