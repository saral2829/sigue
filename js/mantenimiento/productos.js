var cargarcaract = function (id) {
  var options = {
    type: "POST",
    url: "index.php?page=productos&accion=cargarcaract",
    data: {
      id: id,
    },
    dataType: "json",
    success: function (response) {
      $("#caracteristica").html(response.options);
      $(".select2").select2();
    },
  };
  $.ajax(options);
};

$(document).on("change", "#caract_padre", function (event) {
  event.preventDefault();
  /* Act on the event */

  var caract_padre = $(this).val();

  cargarcaract(caract_padre);
});

$(document).ready(function () {
  var caract_padre = $("#caract_padre").val();

  cargarcaract(caract_padre);
});

var cargartabla = function (term, caract, caract_padre) {
  var options = {
    type: "POST",
    url: "index.php?page=productos&accion=cargartabla",
    data: {
      term: term,
      caract: caract,
      caract_padre: caract_padre,
    },
    dataType: "html",
    success: function (response) {
      $("#cargando").hide();
      $("#resultados").html(response);
      $("#tabla_productos").DataTable();
    },
  };
  $.ajax(options);
};

$(document).on("click", "#btn_buscar", function (event) {
  event.preventDefault();
  /* Act on the event */

  var term = $("#term").val();

  var caracteristica = $("#caracteristica").val();

  var caract_padre = $("#caract_padre").val();

  if (caract_padre == "-1" && term == "") {
    bootbox.alert(
      "<b> No puede buscar todos los productos sin una referencia de busqueda </b>"
    );
  } else {
    $("#cargando").show();
    cargartabla(term, caracteristica, caract_padre);
  }
});

$(document).on("keypress", "#term", function (e) {
  if (e.which == 13) {
    var term = $("#term").val();

    var caracteristica = $("#caracteristica").val();

    var caract_padre = $("#caract_padre").val();

    if (caract_padre == "-1" && term == "") {
      bootbox.alert(
        "<b> No puede buscar todos los productos sin una referencia de busqueda </b>"
      );
    } else {
      $("#cargando").show();
      cargartabla(term, caracteristica, caract_padre);
    }
  }
});
