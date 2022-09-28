var gestionararea = function(formData){

	var options = {
		type: 'POST',
		url:'index.php?page=mantenimientos&accion=gestionararea',
		data:  formData,
		processData: false,  // tell jQuery not to process the data
		contentType: false,	 // tell jQuery not to set contentType		
		dataType: 'json',
		success: function(response){

			bootbox.alert(response.msj, function(result){
				window.location.href ="index.php?page=mantenimientos&accion=panelarea";
			});			

		}
	};
	$.ajax(options);
};



$(document).on('submit', '#formarea', function(event) {
	event.preventDefault();
	/* Act on the event */

	var formElement = document.getElementById("formarea");
	var formData = new FormData(formElement);

	gestionararea(formData);

});



