var cargarcategoria = function(element, modal, modo){

  var options = {
    type: 'POST',
    url:'index.php?page=categorias&accion=cargarcategorias&modal='+modal+'',
    dataType: 'json',
    success: function(response){
      var sampleSource = response;
      $(element).fancytree({
        source: sampleSource,
        lazyLoad: function(event, data) {
            // $(".fancytree-container").toggleClass("fancytree-connectors");
          var id = data.node.data.id
          // data.result = { url: "sample1.json" };
          data.result = { url: "index.php?page=categorias&accion=cargarcategoriashijo&id="+id+"&modal="+modal+"" };

          // data.result = lazydata;
          //console.log(data.node.data);
        },
        activate: function(event, data) {
          $("#status").text("Activate " + data.node);
          //console.log(data.node.parent.data);
        // var tree = $(element).fancytree("getTree"),
        //     node = tree.getActiveNode();
        },

      });

    }
  };
  $.ajax(options);

};


function obtener_parent(nodo) {

	return 'Hola';
}


$(document).on('click', '#btn_indicar', function(event) {
	event.preventDefault();
	/* Act on the event */
        function getnuevopariente(parent) {
        	// console.log(parent.data);
        	// console.log(parent.parent);

        	if (parent.parent != null) {
        		anterior = parent.data.nombre+' > '+anterior;
        		// console.log(anterior);
        		getnuevopariente(parent.parent);
        	}

        }

    var tree = $('#tree_modal').fancytree("getTree"),
        node = tree.getActiveNode();

        //console.log(node.parent.data);
        var data = node.parent.data;
        var cantidad = Object.keys(data).length;


        if (cantidad > 0) {
        	//console.log(data);
        	var anterior = data.nombre+' > ';
        	getnuevopariente(node.parent.parent);
        }

        console.log(anterior);

        if (node != null) {
        	$('#modal_categoria').modal('hide');

        	if (anterior == null) {
        		$('#span_categoria').html(node.data.nombre);
        	} else {
        		$('#span_categoria').html(anterior+node.data.nombre)
        	}

        	$('#idcategoria').val(node.data.id);
        }

});

var modalcategoria = function(){

    var options = {
        type: 'POST',
        url:'index.php?page=productos&accion=modalcategoria',
        dataType: 'html',
        success: function(response){
            $('#divmodal_categoria').html(response);
            var element = '#tree_modal';
            cargarcategoria(element, false);
            $('#modal_categoria').modal('show');
        }
    };
    $.ajax(options);
};



$(document).on('click', '#indicar_categoria', function(event) {
	event.preventDefault();
	/* Act on the event */

	modalcategoria();

});



var valorescaracteristica = function(caract){

    var options = {
        type: 'POST',
        url:'index.php?page=productos&accion=valorescaracteristica',
        data:  {
            'caract' : caract,
        },
        dataType: 'html',
        success: function(response){

        	$('#valor').html(response);

        }
    };
    $.ajax(options);
};



$(document).on('change', '#caract', function(event) {
	event.preventDefault();
	/* Act on the event */

	var caract = $(this).val();

	valorescaracteristica(caract);

});


$(document).on('click', '#add_caract', function(event) {
	event.preventDefault();
	/* Act on the event */

	var valor = $('#valor').val();
	var producto = $('#nombre_producto').val();
	var caract = $('#caract').val();
	var txt_caract = $('#caract').find(':selected').text();
	var txt_valor = $('#valor').find(':selected').text();


	var detalle_caract = $('#tabla_caract tbody tr').map(function(i, row) {
		return {
				'caract' : row.cells[1].textContent,
				'valor' : row.cells[3].textContent,
				'existe' : row.cells[5].textContent,

				};
		}).get();

	var previo =  JSON.stringify(detalle_caract);
	var tipo = 4;

	$.ajax({
		url: 'index.php?page=productos&accion=verificarproducto',
		type: 'POST',
		dataType: 'json',
		data: {
			'valor': valor,
			'producto': producto,
			'tipo': tipo,
			'term' : previo
		},
	})
	.done(function(response) {


		var html = '<tr>'+
				'<td>'+response.msj+'</td>'+
				'<td hidden>'+caract+'</td>'+
				'<td>'+txt_caract+'</td>'+
				'<td hidden>'+valor+'</td>'+
				'<td>'+txt_valor+'</td>'+
				'<td hidden>'+response.existe+'</td>'+
				'<td><button data-caract='+caract+' type="button" class="btn btn-danger  remover btn-xs"><i class="fa fa-fw fa-minus"></i></button></td></tr>';



		if (caract == -1|| valor == -1) {
			bootbox.alert('Debe seleccionar una opcion');
		} else {
			// $("#tablaciex_modal > tbody").append(html);
			$("#caract option[value=" + caract + "]").prop('disabled', true);
			$('#caract option:eq(0)').prop('selected', true);
			$('#valor option:eq(0)').prop('selected', true);
			$('#valor').html('<option value="-1">Seleccionar</option>');
			$('#tabla_caract>tbody').append(html);

			$('#caract').select2();
		}


			var valores_excluidos = $('#tabla_caract tbody tr').map(function(i, row) {
				return {
						'caract' : row.cells[1].textContent,
						'valor' : row.cells[3].textContent,
						};
				}).get();

			// $("#caract option:selected").prop('disabled', true);

		//console.log(valores_excluidos);

		verificar_repetidos();
	});





	//console.log(detalle_caract);

});


$(document).on('click', '#add_caract2', function(event) {
	event.preventDefault();
	/* Act on the event */

	var caract = $('#caract').val();
	var txt_caract = $('#caract').find(':selected').text();

	var valor = $('#valor').val();
	var txt_valor = $('#valor').find(':selected').text();

	// console.log(txt_caract, caract, valor, txt_valor);

	// var html += '';

	var producto = $('#nombre_producto').val();

	var detalle = JSON.stringify({'producto': producto, 'caracteristica' : valor});
	var tipo = 4;
	//crear una funcion ajax para retornar

	$.ajax({
		url: 'index.php?page=productos&accion=verificarproducto',
		type: 'POST',
		dataType: 'json',
		data: {
			'term': detalle,
			'tipo': tipo,
		},
	})
	.done(function(response) {


		var html = '<tr>'+
				'<td>'+response.msj+'</td>'+
				'<td hidden>'+caract+'</td>'+
				'<td>'+txt_caract+'</td>'+
				'<td hidden>'+valor+'</td>'+
				'<td>'+txt_valor+'</td>'+
				'<td><button data-caract='+caract+' type="button" class="btn btn-danger  remover btn-xs"><i class="fa fa-fw fa-minus"></i></button></td></tr>';


		console.log(caract);

		if (caract == -1|| valor == -1) {
			bootbox.alert('Debe seleccionar una opcion');
		} else {
			// $("#tablaciex_modal > tbody").append(html);

			$("#caract option[value=" + caract + "]").hide();
			$('#caract option:eq(0)').prop('selected', true);
			$('#valor option:eq(0)').prop('selected', true);
			$('#valor').html('<option value="-1">Seleccionar</option>');
			$('#tabla_caract>tbody').append(html);
		}

	});



});

$(document).on('click', '.remover', function(event) {
	event.preventDefault();
	/* Act on the event */
	$(this).parent().parent().remove();
	var caract = $(this).data('caract');

	$("#caract option[value=" + caract + "]").prop('disabled', false);
	$('#caract').select2();

	verificar_repetidos();

});

var registrarprducto = function(formData){

	var options = {
		type: 'POST',
		url:'index.php?page=productos&accion=registrarprducto',
		data:  formData,
		processData: false,  // tell jQuery not to process the data
		contentType: false,	 // tell jQuery not to set contentType
		dataType: 'json',
		success: function(response){

			bootbox.alert(response.msj, function(result){
				window.location.href ="index.php?page=productos&accion=panelproductos";
			});

		}
	};
	$.ajax(options);
};



$(document).on('submit', '#form_registro', function(event) {
	event.preventDefault();
	/* Act on the event */
	var formElement = document.getElementById("form_registro");
	var formData = new FormData(formElement);

	var detalle_caract = $('#tabla_caract tbody tr').map(function(i, row) {
		return {
				'caract' : row.cells[1].textContent,
				'valor' : row.cells[3].textContent,

				};
		}).get();

	var caracteristicas =  JSON.stringify(detalle_caract);
	formData.append("caracteristicas", caracteristicas);

	var detalle_unidades = $('#tabla_unidades tbody tr').map(function(i, row) {
		return {
				'id_unidad' : row.cells[0].textContent,
				'unidad' : row.cells[1].textContent,

				};
		}).get();

	var unidades =  JSON.stringify(detalle_unidades);
	formData.append("unidades", unidades);


	var idcategoria = $('#idcategoria').val();
	if (idcategoria == ''  || detalle_caract.length == 0 || detalle_unidades.length == 0) {
		bootbox.alert('<code><b>Debe completar todos los campos para el registro</b></code>');
	} else {
		bootbox.confirm("¿Esta seguro de realizar este registro?",
			function(result){
			// console.log('This was logged in the callback: ' + result);
			if (result) {
				registrarprducto(formData);
			}
		});


	}



});





$(document).on('click', '#add_unidad', function(event) {
	event.preventDefault();
	/* Act on the event */

	var s_unidades = $('#s_unidades').val();
	var txt_unidad = $('#s_unidades').find(':selected').text();

	// var valor = $('#valor').val();
	// var txt_valor = $('#valor').find(':selected').text();


	console.log(s_unidades, txt_unidad);

	// var html += '';

	var html = '<tr>'+
			'<td hidden>'+s_unidades+'</td>'+
			'<td>'+txt_unidad+'</td>'+
			'<td><button data-uni='+s_unidades+' type="button" class="btn btn-danger  remover_uni btn-xs"><i class="fa fa-fw fa-minus"></i></button></td></tr>';


	// console.log(caract);

	if (s_unidades == -1) {
		bootbox.alert('Debe seleccionar una opcion');
	} else {
	// $("#tablaciex_modal > tbody").append(html);
	$("#s_unidades option[value=" + s_unidades + "]").prop('disabled', true);
	$('#s_unidades option:eq(0)').prop('selected', true);
	// $('#valor option:eq(0)').prop('selected', true);
	// $('#valor').html('<option value="-1">Seleccionar</option>');
	$('#tabla_unidades>tbody').append(html);
	$('#s_unidades').select2();
	}



});

$(document).on('click', '.remover_uni', function(event) {
	event.preventDefault();
	/* Act on the event */
	$(this).parent().parent().remove();
	var uni = $(this).data('uni');

	$("#s_unidades option[value=" + uni + "]").prop('disabled', false);
	$('#s_unidades').select2();


});

// $(document).on('input', '#nombre', function(event) {
// 	event.preventDefault();
// 	/* Act on the event */



// });
