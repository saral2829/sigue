$(document).ready(function() {
	$("#fechanac").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
	$('.select2').select2();
});

var gestionarcliente = function(formData){

	var options = {
		type: 'POST',
		url:'index.php?page=mantenimientos&accion=gestionarcliente',
		data:  formData,
		processData: false,  // tell jQuery not to process the data
		contentType: false,	 // tell jQuery not to set contentType
		dataType: 'json',
		success: function(response){

			bootbox.alert(response.msj, function(result){
				window.location.href ="index.php?page=mantenimientos&accion=panelempleados";
			});

		}
	};
	$.ajax(options);
};



$(document).on('submit', '#formcliente', function(event) {
	event.preventDefault();
	/* Act on the event */

	var formElement = document.getElementById("formcliente");
	var formData = new FormData(formElement);

	gestionarcliente(formData);

});
