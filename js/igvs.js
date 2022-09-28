var gestionarigv = function(formData){

	var options = {
		type: 'POST',
		url:'index.php?page=mantenimientos&accion=gestionarigv',
		data:  formData,
		processData: false,  // tell jQuery not to process the data
		contentType: false,	 // tell jQuery not to set contentType		
		dataType: 'json',
		success: function(response){

			bootbox.alert(response.msj, function(result){
				window.location.href ="index.php?page=mantenimientos&accion=paneligv";
			});			

		}
	};
	$.ajax(options);
};



$(document).on('submit', '#formigv', function(event) {
	event.preventDefault();
	/* Act on the event */

	var formElement = document.getElementById("formigv");
	var formData = new FormData(formElement);

	gestionarigv(formData);

});



