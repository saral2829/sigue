var buscarxterm = function(term, tipo_busqueda){

	var options = {
		type: 'POST',
		data : {
			'term' : term,
			'tipo_busqueda' : tipo_busqueda,
		},
		url:'index.php?page=compras&accion=buscarpedidoterm',
		dataType: 'html',
		success: function(response){
			$('#modales').html(response);
			$('#modal_registro').modal('show');
			$('#tabla_resultados').DataTable({
				language : spanishtable
			});
		}
	};
	$.ajax(options);
};

$(document).on('click', '#btn_filtrar', function(event) {
	event.preventDefault();
	/* Act on the event */

	var term = $('#table_search').val();
	var tipo_busqueda = $('#tipo_busqueda:checked').val();
	buscarxterm(term, tipo_busqueda);
});


$(document).on('keypress', '#table_search', function(e) {
	if (e.which == 13) {

	var term = $('#table_search').val();
	var tipo_busqueda = $('#tipo_busqueda:checked').val();
	buscarxterm(term, tipo_busqueda);



		// if (term.length >= 3) {
		// 	buscarxterm(term);
		// } else {
		// 	swal({
		// 		title: 'Error',
		// 		html: 'Debe seleccionar ingresar al menos 3 caracteres!',
		// 		type: 'error',
		// 		allowOutsideClick : false,		
		// 	}).catch(swal.noop)	
		// }
	

	}
});