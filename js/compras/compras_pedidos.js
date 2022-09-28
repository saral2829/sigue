$(document).ready(function() {

  $('#sucursal').select2({
    language: "es",
     placeholder: "Selecciona una opcion",
  });



});


var modalbusqueda = function(){

	var options = {
		type: 'POST',
		url:'index.php?page=compras&accion=modalbusqueda',
		dataType: 'html',
		success: function(response){
			$('#modales').html(response);
			$('#modal_pedido').modal('show');
		}
	};
	$.ajax(options);
};

$(document).on('click', '#btn_buscar', function(event) {
	event.preventDefault();
	/* Act on the event */

    modalbusqueda();

});

var buscarxterm = function(term){

	var options = {
		type: 'POST',
		data : {
			'term' : term
		},
		url:'index.php?page=compras&accion=buscarxterm',
		dataType: 'html',
		success: function(response){

			$('#resultados').html(response);
			$('#tabla_busqueda').DataTable();

		}
	};
	$.ajax(options);
};


$(document).on('click', '#btm_buscar_modal', function(event) {
	event.preventDefault();
	/* Act on the event */

	var term = $('#term').val();

	buscarxterm(term);

});


$(document).on('keypress', '#term', function(e) {
	if (e.which == 13) {

        var term = $('#term').val();

    	buscarxterm(term);


	}
});


var obtenerproducto = function(id){

	var options = {
		type: 'POST',
		data : {
			'id' : id
		},
		url:'index.php?page=compras&accion=obtenerproducto',
		dataType: 'json',
		success: function(response){
			$('#modal_pedido').modal('hide');
			$('#nom_producto').val(response.nombre_producto);
            $('#producto').val(response.id_producto);
            $('#tipo_cantidad').html(response.options);
            $('#nom_proveedor').val(response.nom_proveedor);
            $('#id_proveedor').val(response.id_proveedor);
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


$(document).on('click', '#btn_aniadir', function(event) {
	event.preventDefault();
	/* Act on the event */

	var nom_producto = $('#nom_producto').val();
    var id_producto = $('#producto').val();
    var nom_unidad = $('#tipo_cantidad :selected').text();
    var id_unidad = $('#tipo_cantidad').val();
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

$(document).on('click', '.seleccionar', function(event) {
	event.preventDefault();
	/* Act on the event */

	var id = $(this).data('id');

	console.log(id);

});


$(document).on('click', '.remover', function(event) {
	event.preventDefault();
	/* Act on the event */
	$(this).parent().parent().remove();
	var caract = $(this).data('caract');

});


var registrarpedido = function(formData){

	var options = {
		type: 'POST',
		url:'index.php?page=compras&accion=registrarpedido',
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

    var litems = JSON.stringify(items);

    // var formElement = document.getElementById("form_registro");
	var formData = new FormData();
	formData.append("litems", litems);
    formData.append("sucursal", sucursal);

    registrarpedido(formData);
});
