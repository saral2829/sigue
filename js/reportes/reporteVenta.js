const ajaxSimplificado = (url, data, siguienteFuncion = () => { }) => {
    $.ajax({
        type: 'POST',
        url,
        data,
        dataType: 'json',
        success: function (response) {
            siguienteFuncion(response);
        }
    });
}
const muestraSwal = (titulo = '', html = '', tipoIcono = ('warning' || 'success' || 'error'), mostrarBotonCancelar = false, textoBotonCancelar = 'Cancelar',cb = ()=>{}) => {
    Swal.fire({
        title: titulo,
        html,
        icon: tipoIcono,
        showCancelButton: mostrarBotonCancelar,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Aceptar',
        cancelButtonText: textoBotonCancelar,
        allowEscapeKey: false,
        allowOutsideClick: false
    }).then((result) => {
        cb(result);
    });
    // if (result.isConfirmed) {
    //     Swal.fire(
    //       'Deleted!',
    //       'Your file has been deleted.',
    //       'success'
    //     )
    //   }
}
document.addEventListener('DOMContentLoaded', () => {
    implementaModalEspera();
    listarVentas()
});
const columnasTablaVentasEm = [
    { "data": "dni" , render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
    { "data": "nombres" , render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
    { "data": "total", render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
    { "data": "fh_reg", render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
    // { "data": "cantidad", render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
];
const listarVentas = () => {
    abrirModal();
    ajaxSimplificado('controller/reportes-controlador.php', { action: 'listarVentas' }, (response) => {
        cerrarModal();
        //Implementar luego la data, pero procesar primero lo que tenemos de response
        if (!response.ok) { 
            muestraSwal('Sistema',response.message,'error',false,'');
            return false; 
        }
        //si no es falso procesar la DATA en la tabla
        procesarDataProductosuc(response.ventasem);
    });
};
const procesarDataProductosuc = (ventasem = [])=>{
    ventasem.forEach((ventasem)=>{
    //     if(!cliente.dni) cliente.nro_doc = cliente.ruc_per;
    //     else cliente.nro_doc = cliente.dni;

    ventasem.nombres = `${ventasem.apellidomat_per}${ventasem.apellidopat_per}${ventasem.nombres_per}`;

     });
    btn = [{
        extend: 'excelHtml5',
        text: '<i class="fa fa-table"></i>',
        titleAttr: 'Exportar a Excel',
        className: 'btn btn-success btn-circle',
        /*action: function () {
            exportTableToExcel('dataTable','table-data');
        }*/
    },
    {
        extend: 'print',
        text: '<i class="fa fa-print"></i>',
        titleAttr: 'Imprimir',
        className: 'btn btn-warning btn-circle'
    }];

    creaTablaBasica('dataTableVentas',columnasTablaVentasEm,ventasem,true,undefined,btn);
}