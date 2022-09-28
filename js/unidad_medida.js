var registrarunidadmedidaa = function(formData){

	var options = {
		type: 'POST',
		url:'index.php?page=mantenimientos&accion=registrarunidadmedidaa',
		data:  formData,
		processData: false,  // tell jQuery not to process the data
		contentType: false,	 // tell jQuery not to set contentType		
		dataType: 'json',
		success: function(response){

			bootbox.alert(response.msj, function(result){
				window.location.href = response.url;
			});			

		}
	};
	$.ajax(options);
};



$(document).on('submit', '#formregistro', function(event) {
	event.preventDefault();
	/* Act on the event */

	var formElement = document.getElementById("formregistro");
	var formData = new FormData(formElement);

	registrarunidadmedidaa(formData);

});

