const ajaxSimplificado = (url, data = {action : ''}, siguienteFuncion = () => { }) => {
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
    abrirModal();
    listarSucursales();
    inicializarTablaProductosElegidos();
    listarTodosLosProductos();
});
const listarSucursales = ()=>{
    
    ajaxSimplificado('controller/comprasv2-controlador.php',{action: 'listarSucursales'},(response)=>{
        if(!response.ok) muestraSwal('Sistema',response.message,'error',false);
        //! Ejecutar acá que se carguen el select2
        cargarSelect2Key('select_sucursal',response.sucursales,'id_sucursal','razonsoc_suc','',true,false,'TODAS LAS SUCURSALES');
        //! por defecto el primer elemento que le administré será "todas las sucursales", siempre el valor del primer elemento será 0, por tanto podemos buscar
        listarAlmacenesSucursal(0);
    });
};
const listarAlmacenesSucursal = (idsucursal = 0)=>{
    ajaxSimplificado('controller/comprasv2-controlador.php',{action: 'listarAlamacenxSucursal', idsucursal},(response)=>{
        if(!response.ok) muestraSwal('Sistema',response.message,'error',false);
        cargarSelect2Key('select_almacen',response.almacenes,'alm_id','alm_nombre','',false,false);
    });
};
let productoElegido = null;
let listadoProductosElegidos = [];
//! Escuchando por si cambia una elección del select de la sucursal
$('#select_sucursal').change(()=>{
    //clg
    abrirModal();
    listarAlmacenesSucursal($('#select_sucursal').val());
    cerrarModal();
});

const listarTodosLosProductos = ()=>{
    abrirModal();
    agregaMensajeModal(undefined,'Estamos obteniendo tu listado de productos');
    ajaxSimplificado('controller/comprasv2-controlador.php',{action: 'listarProductosCaracteristicas'},(response)=>{
        if(!response.ok) muestraSwal('Sistema',response.message,'error',false);
        agregaMensajeModal(undefined,'Listo, procesando tus procesando...! :D');
        llenarModalProductos(response.productos);
        cerrarModal();
    });
}
const llenarModalProductos = (productos = [])=>{
    // console.log(productos);
    const columnasTablaProducto = [
        { "data": "nombre_producto" , render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
        { "data": "caracteristicas" , render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
        { "data": "descripcion_categoria" , render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
        { "data": "opcion", render: function(data) { return `<button class="btn btn-success seleccionaProd">Seleccionar</button>`; }},
    ];
    creaTablaBasica('tabla_productos',columnasTablaProducto,productos,false);
}
document.getElementById('abrirModalProductos').addEventListener('click',(e)=>{
    e.preventDefault();
    abrirModalGenerico('modal_buscar_producto');
});
$("#tabla_productos tbody").on("click","button.seleccionaProd",function(){
    let table = $("#tabla_productos").DataTable();
    let row = table.row($(this).parents("tr")).data();
    console.log(row);
    productoElegido = row;
    document.getElementById('producto_elegido').value = row.nombre_producto;
    cerrarModalGenerico('modal_buscar_producto');
    //! Llamar a la función para traer las unidades del producto
    obtenerUnidadesDeProducto(row.idproducto);
});
const obtenerUnidadesDeProducto = (idProducto)=>{
    abrirModal();
    ajaxSimplificado('controller/comprasv2-controlador.php',{action: 'obtenerUnidadesProductos',idproducto: idProducto},(response)=>{
        cerrarModal();
        if(!response.ok) muestraSwal('Sistema',response.message,'error',false);
        cargarSelect2Key('select_unidad_producto_elegido',response.unidades,'idunidad','unidadmed_ume','No hay elementos',false);
    });
}
document.getElementById('btnAgregarProductoElegido').addEventListener('click',(e)=>{
    e.preventDefault();
    let cantidad = document.getElementById('cantidad_unidad_elegido').value;
    let unidadMedidaProductoId = $('#select_unidad_producto_elegido').val();
    if(productoElegido === null) return muestraSwal('Sistema','Debes elegir un producto primero.','warning',false);
    if(cantidad === '' || cantidad == null) return muestraSwal('Sistema','Debe agregar la cantidad a agregar','warning',false);
    if(unidadMedidaProductoId === '0' || unidadMedidaProductoId == '0') return muestraSwal('Sistema','Este producto no tiene unidades de medida, error.','warning',false);
    const nombreUnidadProducto = $('#select_unidad_producto_elegido :selected').text();

    productoElegido.idunidadproducto = unidadMedidaProductoId;
    productoElegido.nombreUnidadProducto =  nombreUnidadProducto;
    let posicion = buscarRepetido(productoElegido); 
    agregarProductoAlListado(productoElegido,cantidad,posicion);
    agregarALaTabla();
    borrarDatosProductoElegido();
});
const buscarRepetido = (productoAEvaluar)=>{
    let pos = -1;
    listadoProductosElegidos.forEach((producto,i)=>{
        if(producto.idproducto === productoAEvaluar.idproducto ){ 
            if( producto.idunidadproducto === productoAEvaluar.idunidadproducto ){
                pos =  i; 
            }
        }
    });
    return pos; //! No encontró ninguno;
}
const agregarProductoAlListado = (productoElegido,cantidad,posicion)=>{
    console.log(posicion)
    if(posicion === -1){
        //! Agregar acá con sus parametros
        productoElegido.cantidadAgregar = parseInt(cantidad);
        listadoProductosElegidos.push(productoElegido);
    }else{
        listadoProductosElegidos[posicion]['cantidadAgregar'] += parseInt(cantidad);
    }
}
const tablasProductosElegidos = [
    { "data": "idproducto" , render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
    { "data": "nombre_producto" , render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
    { "data": "descripcion_categoria" , render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
    { "data": "nombreUnidadProducto" , render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
    { "data": "cantidadAgregar" , render: function(data) { if(data == null || data == '') return '-'; else {return data} }},
    { "data": "opcion", render: function(data) { return `<button class="btn btn-danger remover" title="Borrar elemento"><i class="fa fa-times"></i></button>`; }},
]; 
const inicializarTablaProductosElegidos = ()=>{
    creaTablaBasica('tabla_productos_elegidos',tablasProductosElegidos,[],false);
}
const agregarALaTabla = ()=>{
    creaTablaBasica('tabla_productos_elegidos',tablasProductosElegidos,listadoProductosElegidos,false);
}
const borrarDatosProductoElegido = ()=>{
    productoElegido = null;
    document.getElementById('producto_elegido').value = '';
    document.getElementById('cantidad_unidad_elegido').value = '';
    $('#select_unidad_producto_elegido').empty().trigger("change");
};
$("#tabla_productos_elegidos tbody").on("click","button.remover",function(){
    let table = $("#tabla_productos_elegidos").DataTable();
    let row = table.row($(this).parents("tr")).data();
    listadoProductosElegidos = listadoProductosElegidos.filter((producto)=>{
        if(producto.idproducto === row.idproducto ){ 
            if( producto.idunidadproducto !== row.idunidadproducto ){
                return producto;
            }
        }else
            return producto;
    });
    agregarALaTabla();
});
document.getElementById('comprarProductos').addEventListener('click',(e)=>{
    e.preventDefault();

    muestraSwal("¿Deseas enviar las compras?",`Harás la compra el almacén: ${$('#select_almacen :selected').text()}, deseas continuar? `,'question',true,'Cancelar',(result)=>{
        if(result.isConfirmed){
            //!Ejecutar acá
            abrirModal();
            enviarDatos();
        }
    });
});
const enviarDatos = ()=>{
    ajaxSimplificado('controller/comprasv2-controlador.php',{ action: 'registrarCompra',listadoProductos : JSON.stringify(listadoProductosElegidos), idAlmacen : $('#select_almacen').val(),idSucursal : $('#select_sucursal').val()},(response)=>{
        if(!response.ok) { cerrarModal(); return muestraSwal('Sistema',response.message,'error')}; 
        muestraSwal('Sistema',response.message,'success',false,'',(resultado)=>{
            if(resultado.isConfirmed){
                location.reload();
            }
        })
        cerrarModal();
    });
} 