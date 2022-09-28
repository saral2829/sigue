var gestionarusuario = function(formData){

	var options = {
		type: 'POST',
		url:'index.php?page=mantenimientos&accion=gestionarusuario',
		data:  formData,
		processData: false,  // tell jQuery not to process the data
		contentType: false,	 // tell jQuery not to set contentType		
		dataType: 'json',
		success: function(response){

			bootbox.alert(response.msj, function(result){
				window.location.href ="index.php?page=mantenimientos&accion=panelusuario";
			});			

		}
	};
	$.ajax(options);
};



$(document).on('submit', '#formusuario', function(event) {
	event.preventDefault();
	/* Act on the event */

	var formElement = document.getElementById("formusuario");
	var formData = new FormData(formElement);

	gestionarusuario(formData);

});



