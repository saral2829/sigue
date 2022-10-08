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
    listarProductoSuc()
});
const columnasTablaProductoSucursal = [
    { "data": "idproducto" , render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
    { "data": "nombre_producto" , render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
    { "data": "razonsocial_suc", render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
    { "data": "alm_nombre", render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
    { "data": "cantidad", render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
];
const listarProductoSuc = () => {
    abrirModal();
    ajaxSimplificado('controller/reportes-controlador.php', { action: 'listarProductoSuc' }, (response) => {
        cerrarModal();
        //Implementar luego la data, pero procesar primero lo que tenemos de response
        if (!response.ok) { 
            muestraSwal('Sistema',response.message,'error',false,'');
            return false; 
        }
        //si no es falso procesar la DATA en la tabla
        procesarDataProductosuc(response.productosuc);
    });
};
const procesarDataProductosuc = (productosuc = [])=>{
    // clientes.forEach((productosuc)=>{
    //     if(!cliente.dni) cliente.nro_doc = cliente.ruc_per;
    //     else cliente.nro_doc = cliente.dni;

    //     cliente.nombres = `${cliente.apellidomat_per}${cliente.apellidopat_per}${cliente.nombres_per}${cliente.razonsoc_per}`;

    // });
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

    creaTablaBasica('dataTableProductoSuc',columnasTablaProductoSucursal,productosuc,true,undefined,btn);
}