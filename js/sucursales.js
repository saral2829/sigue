var gestionarsucursal = function(formData){

	var options = {
		type: 'POST',
		url:'index.php?page=mantenimientos&accion=gestionarsucursal',
		data:  formData,
		processData: false,  // tell jQuery not to process the data
		contentType: false,	 // tell jQuery not to set contentType		
		dataType: 'json',
		success: function(response){

			bootbox.alert(response.msj, function(result){
				window.location.href ="index.php?page=mantenimientos&accion=panelsucursal";
			});			

		}
	};
	$.ajax(options);
};



$(document).on('submit', '#formsucursal', function(event) {
	event.preventDefault();
	/* Act on the event */

	var formElement = document.getElementById("formsucursal");
	var formData = new FormData(formElement);

	gestionarsucursal(formData);

});



