var verificar_repetidos = function () { //funcion para contabilizar los items totales y los duplicados por cada accion

	var prod_repetido =  $('#idprod_repetido').val();
	var prov_repetido = $('#proveedor_repetido').val();

	var procede = false;

	var detalle_caract = $('#tabla_caract tbody tr').map(function(i, row) {
		return {
				'caraact_repertido' : row.cells[5].textContent,

				};
		}).get();


	if (prod_repetido == 'false') {
		procede = true;
	}

	if (procede == false) {
		if (prov_repetido == 'false') {
			procede = true;
		}
	}


	if (procede == false) {

		var detalle_caract_rep = $('#tabla_caract tbody tr').map(function(i, row) {
			return {
					'caract_repetido' : row.cells[5].textContent,
					};
			}).get();

		$.each(detalle_caract_rep, function(index, val) {
			 /* iterate through array or object */
			if (procede == false) {
				if (val.caract_repetido == 'false') {
					procede = true;
				}
			}
			 // console.log( index + ": " + val.caract_repetido );
		});

	}


	//console.log(detalle_caract_rep);
	//console.log(prod_repetido, prov_repetido, procede);

	var modo_form = $('#modo_form').val();

	if (modo_form == 'add') {
		if (procede == true) {
			$('#btn_registrar').prop('disabled', false);
		}else{
			$('#btn_registrar').prop('disabled', true);
		}
	}

}


var verificarproducto = function(tipo, term){
	var options = {
		type: 'POST',
		url:'index.php?page=productos&accion=verificarproducto',
		data:  {
			'tipo' : tipo,
			'term' : term,
		},
		dataType: 'json',
		success: function(response){
			$(response.span).html(response.msj);
			//console.log(response);
			if (tipo == 1) {
				$('#idprod_repetido').val(response.existe);
			}else if(tipo == 3){
				$('#proveedor_repetido').val(response.existe);
			}
			verificar_repetidos();
		}
	};
	$.ajax(options);
};



$(document).on('input', '#nombre_producto', function() {
	var producto = $(this).val();
	if (producto.length >=3 ) {
		var tipo = 1;
		verificarproducto(tipo, producto);
	}

});




$(document).on('change', '#proveedor', function() {

	var proveedor = $(this).val();
	var producto = $('#nombre_producto').val();
	var tipo = 3;

	var detalle = {'proveedor' : proveedor, 'producto' : producto};

	verificarproducto(tipo,JSON.stringify(detalle));

	//verificarproducto(tipo, proveedor);

});
