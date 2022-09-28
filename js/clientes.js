$(document).ready(function () {
  $("#fechanac").inputmask("dd/mm/yyyy", { placeholder: "dd/mm/yyyy" });
  $(".select2").select2();
});

var gestionarcliente = function (formData) {
  var options = {
    type: "POST",
    url: "index.php?page=mantenimientos&accion=gestionarcliente",
    data: formData,
    processData: false, // tell jQuery not to process the data
    contentType: false, // tell jQuery not to set contentType
    dataType: "json",
    success: function (response) {
      bootbox.alert(response.msj, function (result) {
        window.location.href =
          "index.php?page=mantenimientos&accion=panelcliente";
      });
    },
  };
  $.ajax(options);
};

$(document).on("submit", "#formcliente", function (event) {
  event.preventDefault();
  /* Act on the event */

  var formElement = document.getElementById("formcliente");
  var formData = new FormData(formElement);

  gestionarcliente(formData);
});

$(document).on("change", "#tipo_persona", function (event) {
  event.preventDefault();
  /* Act on the event */

  var tipo = $(this).val();

  if (tipo == 1) {
    $("#div_natural").show();
    $("#div_juridico").hide();
    $("#div_juridico input").val("");
  } else {
    $("#div_natural").hide();
    $("#div_natural input").val("");
    $("#div_juridico").show();
  }
});

$(document).on("change", "#proveedor", function (event) {
  event.preventDefault();
  /* Act on the event */
  var proveedor = $(this).prop("checked");

  if (proveedor == true) {
    $("#div_referencia").show();
  } else {
    $("#div_referencia").hide();
    // $('#div_referencia').re();
  }
});

$(document).on("change", "#empleado", function (event) {
  event.preventDefault();
  /* Act on the event */
  var empleado = $(this).prop("checked");

  if (empleado == true) {
    $("#div_empleado").show();
  } else {
    $("#div_empleado").hide();
  }
});
