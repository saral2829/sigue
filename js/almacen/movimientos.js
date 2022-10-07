$(document).ready(function() {

    $('#sucursal').select2({
    language: "es",
     placeholder: "Selecciona una opcion",
    });

    var sucursal = $('#sucursal').val();

    listaralmacenes(sucursal);
    implementaModalEspera();

});

var buscarproductoxterm = function(term, almacen){

    var options = {
        type: 'POST',
        data : {
            'term' : term,
            'almacen' : almacen,
        },
        url:'index.php?page=almacenes&accion=buscarproductoxterm',
        dataType: 'html',
        success: function(response){
            $('#modales').html(response);
            cerrarModal();
            $('#modal_registro').modal('show');
            $('#tabla_resultados').DataTable({
                language : spanishtable
            });
        }
    };
    abrirModal();
    $.ajax(options);
};

$(document).on('click', '#btn_buscar', function(event) {
    event.preventDefault();
    /* Act on the event */

    var term = $('#term').val();
    var almacen = $('#almacen').val();

    buscarproductoxterm(term, almacen);
});

$(document).on('keypress', '#term', function(e) {
    if (e.which == 13) {

        var term = $(this).val();
        var almacen = $('#almacen').val();
        
        buscarproductoxterm(term, almacen);

    }
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
            listaralmacenesdisp(almacen);
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


// $(document).on('click', '.seleccionar', function(event) {
//     event.preventDefault();
//     /* Act on the event */
//     var id = $(this).data('id', 'value')
// });

var verificarenDetalle = function (response) { //verifica si el producto del mismo almacen se encuentra en tabla de detalle

    var repetido = false;

    $('#tabla_detalle tbody tr').map(function(i, row) {
        var almacen_origen = $(this).find("td").eq(9).html();
        var prod_id = $(this).find("td").eq(0).html();
        if ((almacen_origen == response.almacen) && (prod_id == response.id_producto) ) {
            repetido = true;
        }

    }).get();

    // console.log(repetido);



    if (repetido == true) {
        $('#mensaje').html('<b>No se puede repetir</b>')
        $('#modal_registro').modal('hide');        
    } else {
        $('#nom_producto').html(response.nombre_producto);
        $('#nombre_producto').val(response.nombre_producto);
        $('#id_producto').val(response.id_producto);
        $('#id_proveedor').val(response.id_proveedor);
        $('#nom_proveedor').val(response.nom_proveedor);
        $('#unidad').html(response.options);
        $('#modal_registro').modal('hide');
        $('#stock').val(response.stock);
        $('#span_stock').html(response.stock);
        $('#btn_agregar').prop('disabled', false);         
    }


}

var modalcantidad = function(prod_id, almacen, cantidad){

    var options = {
        type: 'POST',
        data : {
            'prod_id' : prod_id,
            'almacen' : almacen,
            'cantidad' : cantidad,
        },
        url:'index.php?page=almacenes&accion=modalcantidad',
        dataType: 'html',
        success: function(response){
            $('#modales').html(response);
            $('#modal_cantidad').modal('show');

        }
    };
    $.ajax(options);
};

$(document).on('click', '.prod_cant', function(event) {
    event.preventDefault();
    /* Act on the event */

    var tr = $(this).parent().parent();

    var prod_id = tr.find("td").eq(0).html();
    var cantidad = tr.find("td").eq(6).html();
    var almacen =  tr.find("td").eq(9).html();

    console.log(prod_id, cantidad);

    $('.prod_cant').each(function(){
        $(this).removeClass('tr_seleccionada');
        $(this).parent().parent().removeAttr('style');
    });

    $(this).addClass('tr_seleccionada');

    tr.attr('style', 'background-color: #f7ec8d7a;');


    modalcantidad(prod_id, almacen, cantidad);
});

var calcular_disponible = function (tipo_form, cantidad) {
    
    var button_salir = '<button type="button" class="btn btn-danger pull-left" data-dismiss="modal"><i class="fa fa-fw fa-sign-out"></i> Salir</button>';
    var button_guardar = '<button type="submit" class="btn btn-primary" id="btn_upt_cantidad"><i class="fa fa-fw fa-save"></i> Guardar</button>';

    if (tipo_form == 'modal') {
        var stock = $('#stock_actual_modal').val();
    } else {
        var stock = $('#stock').val();
    }

    var new_disponible = parseInt(stock) - parseInt(cantidad);

    if (tipo_form == 'modal') {
        $('#disponible_modal').val(new_disponible);
        $('#span_disponible_modal').html(new_disponible);

        if (new_disponible >= 0 && cantidad != 0) {
            $('#div_footer').empty();
            $('#div_footer').html(button_salir+button_guardar);
        } else {
            $('#div_footer').empty();
            $('#div_footer').html(button_salir);
        }
    } else {

        var new_disponible = parseInt(stock) -  parseInt(cantidad);

        // console.log(tipo_form, cantidad);

        if (new_disponible >= 0 && cantidad != 0) {
            $('#mensaje').empty(); 
            $('#btn_agregar').prop('disabled', false);
        } else {
            if (new_disponible <0 ) {

               $('#mensaje').html('Excede el Stock'); 
            }
            if (cantidad == '' || cantidad == 0) {
                $('#mensaje').html('Cantidad incorrecta'); 
            }

            $('#btn_agregar').prop('disabled', true);
        }

    }

    // console.log(tipo_form, stock, cantidad, new_disponible);
}


$(document).on('click', '#btn_upt_cantidad', function(event) {
    event.preventDefault();
    /* Act on the event */

    var cantidad = $('#cantidad_modal').val();

    var tr = $('.tr_seleccionada').parent().parent();
    tr.find("td").eq(6).html(cantidad);
    tr.find("td").eq(7).html('<b class="prod_cant" style="cursor:pointer; color:blue"><u>'+cantidad+'</u></b>');

    $('#modal_cantidad').modal('hide');

});



$(document).on('input', '.cantidad', function(event) {
    event.preventDefault();
    /* Act on the event */
    var tipo_form = $(this).data('tipo_form');
    var cantidad = $(this).val();

    //console.log(tipo_form, cantidad);
    calcular_disponible(tipo_form, cantidad);
});


var obtenerproducto = function(id, almacen){

    var options = {
        type: 'POST',
        data : {
            'id' : id,
            'almacen' : almacen,
        },
        url:'index.php?page=compras&accion=obtenerproducto',
        dataType: 'json',
        success: function(response){

            verificarenDetalle(response);

        }
    };
    $.ajax(options);
};

$(document).on('click', '.seleccionar', function(event) {
    event.preventDefault();
    /* Act on the event */
    var id = $(this).data('id');
    var almacen = $('#almacen').val();

    obtenerproducto(id, almacen);
});


var listaralmacenesdisp = function(almacen){

    var options = {
        type: 'POST',
        data : {
            'almacen' : almacen,
        },
        url:'index.php?page=almacenes&accion=listaralmacenesdisp',
        dataType: 'json',
        success: function(response){
            $('#almacen_destino').html(response.options);
            $('#almacen_destino').select2();
        }
    };
    $.ajax(options);
};

$(document).on('change', '#almacen', function(event) {
    event.preventDefault();
    /* Act on the event */

    var almacen = $(this).val();

    listaralmacenesdisp(almacen);

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
    var nombre_origen = $('#almacen').find("option:selected").text();
    var origen_id = $('#almacen').val();
    var nombre_destino = $('#almacen_destino').find("option:selected").text();
    var destino_id = $('#almacen_destino').val();


    console.log(nom_producto);
        $("#tabla_detalle > tbody").append(
            '<tr>'+
                '<td style="display:none;">'+id_producto+'</td>'+
                '<td>'+nom_producto+'</td>'+
                '<td style="display:none;">'+id_proveedor+'</td>'+
                '<td>'+nom_proveedor+'</td>'+
                '<td style="display :none;">'+id_unidad+'</td>'+
                '<td>'+nom_unidad+'</td>'+
                '<td style="display :none;">'+cantidad+'</td>'+
                '<td><b class="prod_cant" style="cursor:pointer; color:blue"><u>'+cantidad+'</u></b></td>'+
                '<td>'+nombre_origen+'</td>'+
                '<td style="display :none;">'+origen_id+'</td>'+
                '<td>'+nombre_destino+'</td>'+
                '<td style="display :none;">'+destino_id+'</td>'+
                '<td><button type="button" class="btn btn-xs btn-danger remover" ><i class="fa fa-fw fa-minus"></i></button> </td>'+
            '</tr>'

            );


        $('#btn_agregar').prop('disabled', true);
        $('#nombre_producto').val('');
        $('#id_producto').val('');
        $('#cantidad').val('');
        $('#nom_producto').html('');
        $('#stock').val('');
        $('#span_stock').html('');

}); 


$(document).on('click', '.remover', function(event) {
    event.preventDefault();
    /* Act on the event */
    $(this).parent().parent().remove();
    var caract = $(this).data('caract');

});


var registrarmovimientos = function(formData){

    var options = {
        type: 'POST',
        url:'index.php?page=almacenes&accion=registrarmovimientos',
        data:  formData,
        processData: false,  // tell jQuery not to process the data
        contentType: false,  // tell jQuery not to set contentType
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
                'almacen_origen' : $(this).find("td").eq(9).html(),
                'almacen_destino' : $(this).find("td").eq(11).html(),
                };
    }).get();

    var sucursal = $('#sucursal').val();


    var litems = JSON.stringify(items);

    var formData = new FormData();
    formData.append("litems", litems);
    formData.append("sucursal", sucursal);
    formData.append("almacen", almacen);

    registrarmovimientos(formData);
});
