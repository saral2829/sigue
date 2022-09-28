var modalcategoria = function(modo, data){

    var options = {
        type: 'POST',
        url:'index.php?page=categorias&accion=modalcategoria',
        data:  {
            'data' : data,
            'modo' : modo,
        },   
        dataType: 'html',
        success: function(response){
            $('#divmodal_categoria').html(response);
            var element = '#tree_modal';
            cargarcategoria(element, true, modo);            
            $('#modal_categoria').modal('show');

         
        }
    };
    $.ajax(options);
};


$(document).on('click', '#btn_nuevo', function(event) {
  event.preventDefault();
  /* Act on the event */


        var modo = 'add';
        modalcategoria(modo);
});


$(document).on('click', '#btn_editar', function(event) {
    event.preventDefault();
    /* Act on the event */

        var tree = $("#tree").fancytree("getTree"),
        node = tree.getActiveNode();

        var modo = 'edit';

        if (node != null) {
            modalcategoria(modo, node.data);
        }

});

var registrarcategoria = function(formData){

    var options = {
        type: 'POST',
        url:'index.php?page=categorias&accion=registrarcategoria',
        data:  formData,
        processData: false,  // tell jQuery not to process the data
        contentType: false,  // tell jQuery not to set contentType      
        dataType: 'json',
        success: function(response){
            $('#modal_categoria').modal('hide');            
            bootbox.alert(response.msj, function(result){

                window.location.href = response.url;
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


    var chk_cambiar = $('#chk_cambiar').prop('checked');

    if (chk_cambiar == true) {
        var tree = $("#tree_modal").fancytree("getTree"),
            node = tree.getActiveNode();

        formData.append('nuevo_padre', node.data.categoria_padre)
    }

    registrarcategoria(formData);

});


var mostrar_info = function (data) {

  $('#div_infocat').show();

  $('#span_nombre').html(data.nombre);

  $('#span_descripcion').html(data.descripcion);

  if (data.vigencia == 1) {
      var vigencia ='Activo';
    } else {
      var vigencia ='Inactivo';
    }

  $('#span_vigencia').html(vigencia);
  
}


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
          console.log(data.node.data);
        },
        activate: function(event, data) {
          $("#status").text("Activate " + data.node);

          if (modal== true) {
            $('#id_padre').val(data.node.data.categoria_padre);
                        
          } else {
            $('#div_infocat').show();
            mostrar_info(data.node.data);
          }

          //console.log(data.node.data.categoria_padre);
        },

      });


  // $(".fancytree-container").toggleClass("fancytree-connectors");

      
            if (modo == 'edit') {
                $("#tree_modal").fancytree("disable");
            }  

      $("#button1").click(function(event){
        var tree = $("#tree").fancytree("getTree"),
            node = tree.getActiveNode();

        alert("Actie node " + node);
      });

    }
  };
  $.ajax(options);

};



$(function(){
    var element = "#tree";
  cargarcategoria(element, false);
});



$(document).on('change', '#chk_cambiar', function(event) {
    event.preventDefault();
    /* Act on the event */
    var cambiar = $(this).prop('checked');

    if (cambiar == true) {
        $('#tree_modal').fancytree('enable');    
    } else {
        $('#tree_modal').fancytree('disable');
    }
    
});

