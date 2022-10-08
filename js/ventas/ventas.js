$(document).ready(function () {
  $(".select_2").select2({
    language: "es",
    placeholder: "Selecciona una opcion",
  });

  var suc = $("#sucursal").val();

  listaralmacenesxsuc(suc);
});

var listaralmacenesxsuc = function (suc) {
  var options = {
    type: "POST",
    data: {
      suc: suc,
    },
    url: "index.php?page=ventas&accion=listaralmacenesxsuc",
    dataType: "json",
    success: function (response) {
      $("#almacen").html(response.options);
    },
  };
  $.ajax(options);
};

$(document).on("change", "#sucursal", function (event) {
  event.preventDefault();
  /* Act on the event */
  var suc = $(this).val();

  listaralmacenesxsuc(suc);
});

var buscarproductoxterm = function (term, almacen) {
  var options = {
    type: "POST",
    data: {
      term: term,
      almacen: almacen,
    },
    url: "index.php?page=ventas&accion=buscarproductoxterm",
    dataType: "html",
    success: function (response) {
      $("#modales").html(response);
      $("#modal_registro").modal("show");
      $("#tabla_resultados").DataTable({
        language: spanishtable,
      });
    },
  };
  $.ajax(options);
};

$(document).on("click", "#btn_buscar", function (event) {
  event.preventDefault();
  /* Act on the event */

  var term = $("#term").val();
  var almacen = $("#almacen").val();

  buscarproductoxterm(term, almacen);
});

$(document).on("keypress", "#term", function (e) {
  if (e.which == 13) {
    var term = $(this).val();
    var almacen = $("#almacen").val();

    buscarproductoxterm(term, almacen);
  }
});

var verificarenDetalle = function (response) {
  //verifica si el producto del mismo almacen se encuentra en tabla de detalle

  var repetido = false;

  $("#tabla_detalle tbody tr")
    .map(function (i, row) {
      var almacen_origen = $(this).find("td").eq(10).html();
      var prod_id = $(this).find("td").eq(0).html();
      if (
        almacen_origen == response.almacen &&
        prod_id == response.id_producto
      ) {
        repetido = true;
      }
    })
    .get();

  // console.log(repetido);

  if (repetido == true) {
    $("#mensaje").html("<b>No se puede repetir</b>");
    $("#modal_registro").modal("hide");
  } else {
    $("#nom_producto").html(response.nombre_producto);
    $("#nombre_producto").val(response.nombre_producto);
    $("#id_producto").val(response.id_producto);
    $("#span_precio_venta").html("S/." + response.precio_venta);
    $("#precio_venta").val(response.precio_venta);
    $("#stock").val(response.stock);
    $("#span_stock").html(response.stock);
    // $('#id_proveedor').val(response.id_proveedor);
    // $('#nom_proveedor').val(response.nom_proveedor);
    $("#unidad").html(response.options);
    $("#modal_registro").modal("hide");
  }
};

var obtenerproducto = function (id, almacen) {
  var options = {
    type: "POST",
    data: {
      id: id,
      almacen: almacen,
    },
    url: "index.php?page=ventas&accion=obtenerproductoalm",
    dataType: "json",
    success: function (response) {
      $("#btn_agregar").prop("disabled", true);
      verificarenDetalle(response);

      // $('#nom_producto').html(response.nombre_producto);
      // $('#nombre_producto').val(response.nombre_producto);
      // $('#id_producto').val(response.id_producto);
      // $('#span_precio_venta').html('S/.'+response.precio_venta);
      // $('#precio_venta').val(response.precio_venta);
      // $('#stock').val(response.stock);
      // $('#span_stock').html(response.stock);
      // // $('#id_proveedor').val(response.id_proveedor);
      // // $('#nom_proveedor').val(response.nom_proveedor);
      // $('#unidad').html(response.options);
      // $('#modal_registro').modal('hide');
    },
  };
  $.ajax(options);
};

$(document).on("click", ".seleccionar", function (event) {
  event.preventDefault();
  /* Act on the event */
  var id = $(this).data("id");
  var almacen = $("#almacen").val();

  obtenerproducto(id, almacen);
});

var calcularTotal = function () {
  var total = 0;

  $("#tabla_detalle tbody tr")
    .map(function (i, row) {
      var subtotal = parseInt($(this).find("td").eq(8).html());
      total = subtotal + total;
    })
    .get();

  // console.log(total);
  $("#span_total").html("<b>S/. " + total + "</b>");
  $("#total").html(total);
};

$(document).on("click", "#btn_agregar", function (event) {
  event.preventDefault();
  /* Act on the event */
  var nom_producto = $("#nombre_producto").val();
  var id_producto = $("#id_producto").val();
  var nom_unidad = $("#unidad :selected").text();
  var id_unidad = $("#unidad").val();
  var cantidad = $("#cantidad").val();
  var precio_venta = $("#precio_venta").val();
  var span_precio_venta = $("#span_precio_venta").text();
  var subtotal = parseInt(cantidad) * parseInt(precio_venta);
  var almacen = $("#almacen").val();
  // console.log(nom_producto);
  $("#tabla_detalle > tbody").append(
    "<tr>" +
      '<td style="display:none;">' +
      id_producto +
      "</td>" +
      "<td>" +
      nom_producto +
      "</td>" +
      '<td style="display :none;">' +
      id_unidad +
      "</td>" +
      "<td>" +
      nom_unidad +
      "</td>" +
      '<td style="display :none;">' +
      cantidad +
      "</td>" +
      '<td><b class="prod_cant" style="cursor:pointer; color:blue"><u>' +
      cantidad +
      "</u></b></td>" +
      '<td style="display :none;">' +
      precio_venta +
      "</td>" +
      "<td>" +
      span_precio_venta +
      "</td>" +
      '<td style="display :none;">' +
      subtotal +
      "</td>" +
      "<td>S/. " +
      subtotal +
      "</td>" +
      '<td style="display :none;">' +
      almacen +
      "</td>" +
      '<td><button type="button" class="btn btn-xs btn-danger remover" ><i class="fa fa-fw fa-minus"></i></button> </td>' +
      "</tr>"
  );

  $("#nombre_producto").val("");
  $("#id_producto").val("");
  $("#cantidad").val("");
  $("#nom_producto").html("");
  $("#stock").val("");
  $("#span_stock").html("");
  $("#span_precio_venta").html("");
  $("#precio_venta").val("");

  calcularTotal();
});

$(document).on("click", ".remover", function (event) {
  event.preventDefault();
  /* Act on the event */
  $(this).parent().parent().remove();
  var caract = $(this).data("caract");
  calcularTotal();
});

var registrarventa = function (formData) {
  var options = {
    type: "POST",
    url: "index.php?page=ventas&accion=registrarventa",
    data: formData,
    processData: false, // tell jQuery not to process the data
    contentType: false, // tell jQuery not to set contentType
    dataType: "json",
    success: function (response) {
      // bootbox.alert(response.msj, function(result){
      //     if (response.procede == true) {
      //         location.reload();
      //     }
      // });

      swal({
        title: "",
        html: response.msj,
        type: response.tipo,
        allowOutsideClick: false,
      })
        .then(function () {
          if (response.procede == true) {
            location.reload();
          }
        })
        .catch(swal.noop);
    },
  };
  $.ajax(options);
};

$(document).on("click", "#btn_guardar", function (event) {
  event.preventDefault();
  /* Act on the event */
  var items = $("#tabla_detalle tbody tr")
    .map(function (i, row) {
      return {
        prod_id: $(this).find("td").eq(0).html(),
        unidad_id: $(this).find("td").eq(2).html(),
        cantidad: $(this).find("td").eq(4).html(),
        precio_venta: $(this).find("td").eq(6).html(),
        subtotal: $(this).find("td").eq(8).html(),
        almacen: $(this).find("td").eq(10).html(),
      };
    })
    .get();

  var sucursal = $("#sucursal").val();
  var total = $("#total").text();

  var litems = JSON.stringify(items);

  var formData = new FormData();
  formData.append("litems", litems);
  formData.append("suc_id", sucursal);
  formData.append("total", total);

  swal({
    title: "",
    html: "<b>¡¿Esta seguro de registrar venta?!</b>",
    type: "question",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    cancelButtonText: "Cancelar",
    confirmButtonText: "Si, registrar!",
    allowOutsideClick: false,
  })
    .then(function (result) {
      if (result.value) {
        registrarventa(formData);
      }
    })
    .catch(swal.noop);
});

var listarhistorico = function (fecha) {
  var options = {
    type: "POST",
    url: "index.php?page=ventas&accion=listarhistorico",
    data: {
      fecha: fecha,
    },
    dataType: "html",
    success: function (response) {
      $("#resultados").html(response);
      $("#tabla_historica").DataTable({
        language: spanishtable,
      });
    },
  };
  $.ajax(options);
};

$(document).on("click", "#btn_mostrar", function (event) {
  var fecha = $("#fecha").val();
  listarhistorico(fecha);
});

var calcular_disponible = function (tipo_form, cantidad) {
  var button_salir =
    '<button type="button" class="btn btn-danger pull-left" data-dismiss="modal"><i class="fa fa-fw fa-sign-out"></i> Salir</button>';
  var button_guardar =
    '<button type="submit" class="btn btn-primary" id="btn_upt_cantidad"><i class="fa fa-fw fa-save"></i> Guardar</button>';

  if (tipo_form == "modal") {
    var stock = $("#stock_actual_modal").val();
  } else {
    var stock = $("#stock").val();
  }

  var new_disponible = parseInt(stock) - parseInt(cantidad);

  if (tipo_form == "modal") {
    $("#disponible_modal").val(new_disponible);
    $("#span_disponible_modal").html(new_disponible);

    if (new_disponible >= 0 && cantidad != 0) {
      $("#div_footer").empty();
      $("#div_footer").html(button_salir + button_guardar);
    } else {
      $("#div_footer").empty();
      $("#div_footer").html(button_salir);
    }
  } else {
    var new_disponible = parseInt(stock) - parseInt(cantidad);

    // console.log(tipo_form, cantidad);

    if (new_disponible >= 0 && cantidad != 0) {
      $("#mensaje").empty();
      $("#btn_agregar").prop("disabled", false);
    } else {
      if (new_disponible < 0) {
        $("#mensaje").html("Excede el Stock");
      }
      if (cantidad == "" || cantidad == 0) {
        $("#mensaje").html("Cantidad incorrecta");
      }

      $("#btn_agregar").prop("disabled", true);
    }
  }

  // console.log(tipo_form, stock, cantidad, new_disponible);
};

$(document).on("input", ".cantidad", function (event) {
  event.preventDefault();
  /* Act on the event */
  var tipo_form = $(this).data("tipo_form");
  var cantidad = $(this).val();

  //console.log(tipo_form, cantidad);
  calcular_disponible(tipo_form, cantidad);
});

var modalcantidad = function (prod_id, almacen, cantidad) {
  var options = {
    type: "POST",
    data: {
      prod_id: prod_id,
      almacen: almacen,
      cantidad: cantidad,
    },
    url: "index.php?page=almacenes&accion=modalcantidad",
    dataType: "html",
    success: function (response) {
      $("#modales").html(response);
      $("#modal_cantidad").modal("show");
    },
  };
  $.ajax(options);
};

$(document).on("click", ".prod_cant", function (event) {
  event.preventDefault();
  /* Act on the event */

  var tr = $(this).parent().parent();

  var prod_id = tr.find("td").eq(0).html();
  var cantidad = tr.find("td").eq(4).html();
  var almacen = tr.find("td").eq(10).html();

  console.log(prod_id, cantidad);

  $(".prod_cant").each(function () {
    $(this).removeClass("tr_seleccionada");
    $(this).parent().parent().removeAttr("style");
  });

  $(this).addClass("tr_seleccionada");

  tr.attr("style", "background-color: #f7ec8d7a;");

  modalcantidad(prod_id, almacen, cantidad);
});

$(document).on("click", "#btn_upt_cantidad", function (event) {
  event.preventDefault();
  /* Act on the event */

  var cantidad = $("#cantidad_modal").val();

  var tr = $(".tr_seleccionada").parent().parent();
  var precio_unitario = tr.find("td").eq(6).html();
  var sub_total = parseInt(cantidad) * parseInt(precio_unitario);
  // console.log(sub_total);
  tr.find("td").eq(4).html(cantidad);
  tr.find("td")
    .eq(5)
    .html(
      '<b class="prod_cant" style="cursor:pointer; color:blue"><u>' +
        cantidad +
        "</u></b>"
    );
  tr.find("td").eq(8).html(sub_total);
  tr.find("td")
    .eq(9)
    .html("S7. " + sub_total);

  $("#modal_cantidad").modal("hide");

  calcularTotal();
});

var modaldetalle = function (id) {
  var options = {
    type: "POST",
    data: {
      id: id,
    },
    url: "index.php?page=ventas&accion=modaldetalle",
    dataType: "html",
    success: function (response) {
      $("#modales").html(response);
      $("#modal_detalle").modal("show");
    },
  };
  $.ajax(options);
};

$(document).on("click", ".detalle_historico", function (event) {
  event.preventDefault();
  /* Act on the event */

  var id = $(this).data("id");

  modaldetalle(id);
});
$(document).on("change", "#tipo_busq", function (event) {
  event.preventDefault();
  /* Act on the event */

  var tipo = $(this).val();

  if (tipo == 1) {
    //$(".busq-manual").show();
    $(".busq-codigo").hide();
    $(".busq-codigo input").val("");
  } else {
    //$(".busq-manual").hide();
    $(".busq-manual input").val("");
    $(".busq-codigo").show();
  }
});
