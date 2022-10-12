var gestionarpermiso = function (formData) {

  var options = {
    type: 'POST',
    url: 'index.php?page=permisos&accion=gestionarpermiso',
    data: formData,
    processData: false,  // tell jQuery not to process the data
    contentType: false,	 // tell jQuery not to set contentType		
    dataType: 'json',
    success: function (response) {

      bootbox.alert(response.msj, function (result) {
        window.location.href = "index.php?page=permisos&accion=panelpermisos";
      });

    }
  };
  $.ajax(options);
};

$(document).on('submit', '#formpermiso', function (event) {
  event.preventDefault();
  /* Act on the event */

  var formElement = document.getElementById("formpermiso");
  var formData = new FormData(formElement);

  gestionarpermiso(formData);

});