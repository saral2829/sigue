$(document).on('change', '.tipo_busqueda', function(event) {
	event.preventDefault();
	/* Act on the event */
	
	var tipo_busqueda = $(this).val();

	if (tipo_busqueda == 'prod') {
		$('#buscador_proveedor').hide();
	} else {
		$('#buscador_proveedor').show();
	}

});


$(document).ready(function() {
	
  $('#sucursal').select2({
    language: "es",
     placeholder: "Selecciona una opcion",
  });
	
  cargarproductos();

  
});

var cargarproductos = function () {
	var contador = 0;
$("#buscar_producto").select2({
  language: "es",
  ajax: {
    // url: "https://api.github.com/search/repositories",
    url : 'index.php?page=compras&accion=buscarproductoremoto',

    dataType: 'json',
    delay: 250,
    data: function (params) {
      return {
        q: params.term, // search term
        page: params.page
      };
    },
    processResults: function (data, page) {
      return {
        results: data.items  
      };
    },
    cache: true
  },
  escapeMarkup: function (markup) { 
    
    return markup; 
  }, // let our custom formatter work
  minimumInputLength: 1,
  templateResult: formatRepo, // omitted for brevity, see the source of this page
  templateSelection: formatRepoSelection, // omitted for brevity, see the source of this page  


});

contador = 0;
function formatRepo (repo) {
	if (repo.loading) return repo.text;
	var markup = '<div >' + repo.full_name + '</div>';
	 return markup;
}


 function formatRepoSelection (repo) {
  contador = contador +1;

  obtenerunidadesmedida(repo.idproducto);
  return repo.full_name|| repo.text;

 }

}


var obtenerunidadesmedida = function(id){

    var options = {
        type: 'POST',
        url:'index.php?page=compras&accion=obtenerunidadesmedida',
        data:  {
            'id' : id,
        },   
        dataType: 'json',
        success: function(response){
          $('#tipo_cantidad').html(response.options);
          //console.log(response.options);
         
        }
    };
    $.ajax(options);
};

$(document).on('click', '#btn_aniadir', function(event) {
  event.preventDefault();
  /* Act on the event */

  var producto = $('#buscar_producto').val();
  var tipo_cantidad = $('#tipo_cantidad').val();
  var cantidad = $('#cantidad').val();
  var txtcantidad = $("#tipo_cantidad option:selected" ).text();

  if (producto == null || tipo_cantidad == null || cantidad == '') {
    swal(
      '',
      'Debe seleccionar producto, la unidad y la cantidad',
      'error'
    ).catch(swal.noop);

  } else {
    // swal(
    //   'Good job!',
    //   'You clicked the button!',
    //   'success'
    // ).catch(swal.noop); 

  aniadirproductos(producto, txtcantidad, cantidad);


  $('#cantidad').val('');
  $('#tipo_cantidad').prop('selectedIndex',0);
  cargarproductos();
  }



});


var aniadirproductos = function(producto, txtcantidad, cantidad){

    var options = {
        type: 'POST',
        url:'index.php?page=compras&accion=aniadirproductos',
        data:  {
          'producto': producto,
          'txtcantidad': txtcantidad,
          'cantidad': cantidad,
        },   
        dataType: 'json',
        success: function(response){
          $('#detalle').append('<tr>'+
                                '<td hidden>'+response.oproducto.idproducto+'</td>'+
                                '<td>'+response.oproducto.nombre_producto+'</td>'+
                                '<td>'+response.proveedor+'</td>'+
                                '<td>20.00</td>'+
                                '<td>'+txtcantidad+'</td>'+
                                '<td> '+cantidad+'</td>'+
                                '<td>'+
                                  '<button class="btn btn-xs btn-danger remover"><i class="fa fa-times" aria-hidden="true"></i></button>'+
                                '</td>'+
                              '</tr> '
                              );  
         
        }
    };
    $.ajax(options);
};



$(document).on('click', '.remover', function(event) {
  event.preventDefault();
  /* Act on the event */
  $(this).parent().parent().remove();

});



var registrarpedido = function(idsucursal, detalle){

    var options = {
        type: 'POST',
        url:'index.php?page=compras&accion=registrarpedido',
        data:  {
            'idsucursal' : idsucursal,
            'detalle' : detalle,
        },   
        dataType: 'json',
        success: function(response){
          $('#tipo_cantidad').html(response.options);
          //console.log(response.options);
         
        }
    };
    $.ajax(options);
};


$(document).on('click', '#btn_guardar', function(event) {
  event.preventDefault();
  /* Act on the event */
  var sucursal = $('#sucursal').val();

  var pre_detalle = $('#detalle tr').map(function(i, row) {
    return {
        'idproducto' : $(this).find("td").eq(0).html(),
        'precio' : $(this).find("td").eq(3).html(),
        'cantidad' : $(this).find('td').eq(5).html(),
        
        };
    }).get();  

  var detalle = JSON.stringify(pre_detalle);

  registrarpedido(sucursal, detalle);

});