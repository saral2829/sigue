document.addEventListener('DOMContentLoaded',()=>{
	//! cuando toda la página está cargada, entonces procede a ejecutar el callback, el cual es una función anónima de flecha
	implementaModalEspera(); //! esta funcion sale de misfunc.js
});

var buscarproductoxterm = function(term){
	var options = {
		type: 'POST',
		data : {
			'term' : term,
		},
		url:'index.php?page=compras&accion=buscarproductoxterm',
		dataType: 'html',
		success: function(response){
			$('#modales').html(response);
			//! en teoría esto se ejecutará cuando llegue acá, entonces, cuando llegue acá cerraré el modal de espera, cerraré el modal de espera antes de abrir el otro modal
			cerrarModal();
			$('#modal_registro').modal('show');
			$('#tabla_resultados').DataTable({
				language : spanishtable
			});
		}
	};
	//! Antes que se ejecute el ajax, abro un modal de espera, para que se de cuenta que está esperando a que algo pase xd
	abrirModal();
	$.ajax(options);
};

$(document).on('click', '#btn_buscar', function(event) {
	event.preventDefault();
	/* Act on the event */

	var term = $('#term').val();
	buscarproductoxterm(term);
});

$(document).on('keypress', '#term', function(e) {
	if (e.which == 13) {

		var term = $(this).val();

		buscarproductoxterm(term);

	}
});

var obtenerproducto = function(id){

	var options = {
		type: 'POST',
		data : {
			'id' : id,
		},
		url:'index.php?page=compras&accion=obtenerproducto',
		dataType: 'json',
		success: function(response){
			$('#nom_producto').html(response.nombre_producto);
			$('#nombre_producto').val(response.nombre_producto);
			$('#id_producto').val(response.id_producto);
			$('#id_proveedor').val(response.id_proveedor);
			$('#nom_proveedor').val(response.nom_proveedor);
			$('#unidad').html(response.options);
			$('#modal_registro').modal('hide');

		}
	};
	$.ajax(options);
};

$(document).on('click', '.seleccionar', function(event) {
	event.preventDefault();
	/* Act on the event */
	var id = $(this).data('id');

	obtenerproducto(id);
});

$(document).on('click', '#btn_agregar', function(event) {
	event.preventDefault();
	/* Act on the event */
	var nom_producto = $('#nombre_producto').val();
    var id_producto = $('#id_producto').val();
    var nom_unidad = $('#unidad :selected').text();
    var id_unidad = $('#unidad').val();
    var cantidad = $('#cantidad').val();
    var nom_proveedor = $('#nom_proveedor').val();
    var id_proveedor = $('#id_proveedor').val();


    console.log(nom_producto);
		$("#tabla_detalle > tbody").append(
			'<tr>'+
				'<td style="display:none;">'+id_producto+'</td>'+
                '<td>'+nom_producto+'</td>'+
                '<td style="display:none;">'+id_proveedor+'</td>'+
                '<td>'+nom_proveedor+'</td>'+
                '<td style="display :none;">'+id_unidad+'</td>'+
                '<td>'+nom_unidad+'</td>'+
                '<td>'+cantidad+'</td>'+
                '<td><button type="button" class="btn btn-xs btn-danger remover" ><i class="fa fa-fw fa-minus"></i></button> </td>'+
			'</tr>'

			);

});


$(document).on('click', '.remover', function(event) {
	event.preventDefault();
	/* Act on the event */
	$(this).parent().parent().remove();
	var caract = $(this).data('caract');

});


var registrarcompra = function(formData){

	var options = {
		type: 'POST',
		url:'index.php?page=compras&accion=registrarcompra',
		data:  formData,
		processData: false,  // tell jQuery not to process the data
		contentType: false,	 // tell jQuery not to set contentType
		dataType: 'json',
		success: function(response){

			bootbox.alert(response.msj, function(result){
                if (response.procede == true) {
				// window.location.href ="index.php?page=productos&accion=panelproductos";
                    location.reload();
                }
			});

		}
	};
	$.ajax(options);
};


$(document).on('click', '#btn_guardar', function(event) {
    event.preventDefault();
    /* Act on the event */
    var items = $('#tabla_detalle tbody tr').map(function(i, row) {
        return {
                'id_producto' :  $(this).find("td").eq(0).html(),
                'id_proveedor' :  $(this).find("td").eq(2).html(),
                'id_unidad' : $(this).find("td").eq(4).html(),
                'cantidad' : $(this).find("td").eq(6).html(),
                };
    }).get();

    var sucursal = $('#sucursal').val();
    var almacen = $('#almacen').val();

    var litems = JSON.stringify(items);

	var formData = new FormData();
	formData.append("litems", litems);
    formData.append("sucursal", sucursal);
    formData.append("almacen", almacen);

    registrarcompra(formData);
});


var almacenesxsuc = function(suc_id){

	var options = {
		type: 'POST',
		data : {
			'suc_id' : suc_id,
		},
		url:'index.php?page=compras&accion=almacenesxsuc',
		dataType: 'json',
		success: function(response){
			$('#almacen').html(response.options);
		}
	};
	$.ajax(options);
};

$(document).on('change', '#sucursal', function(event) {
	event.preventDefault();
	/* Act on the event */
	var sucursal = $(this).val();
	almacenesxsuc(sucursal);
});
