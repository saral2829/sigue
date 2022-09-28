var provinciasDepartamento = function(departamento){

	var options = {
		type: 'POST',
		url:'index.php?page=mantenimientos&accion=provinciasDepartamento',
        data:  {
            'departamento' : departamento,
        },   	
		dataType: 'html',
		success: function(response){
			$('#provincia').html(response);
		}
	};
	$.ajax(options);
};

var distritosProvincia = function(provincia){

	var options = {
		type: 'POST',
		url:'index.php?page=mantenimientos&accion=distritosProvincia',
        data:  {
            'provincia' : provincia,
        },   	
		dataType: 'html',
		success: function(response){
			$('#distrito').html(response);
		}
	};
	$.ajax(options);
};



$(document).on('change', '#departamento', function(event) {
	event.preventDefault();
	/* Act on the event */

	var departamento = $(this).val();

	provinciasDepartamento(departamento);

});


$(document).on('change', '#provincia', function(event) {
	event.preventDefault();
	/* Act on the event */

	var provincia = $(this).val();

	distritosProvincia(provincia);	
});