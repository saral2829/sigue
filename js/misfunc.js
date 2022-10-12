//Agrega aquí la funcionalidad repetida.

const cargarLoader = (ocultar = false, ms = 0)=>{
    //Por ahora solo con JQuery
    if(!ocultar){
        setTimeout(function() {
            $("#modal_loading").modal({
                keyboard: false,
                backdrop: 'static'
            });
        },ms);
    }else{
        setTimeout(function(){
            $("#modal_loading").modal('hide');
        },ms);
    }
};
const timeout = (ocultar = false, ms = 0) =>{
    return new Promise((resolve, reject) =>{
        setTimeout(()=>{
            if(!ocultar){
                $("#modal_loading").modal({
                    keyboard: false,
                    backdrop: 'static'
                });
            }else{
                $("#modal_loading").modal('hide');
            }
            resolve('Hecho!')
        },ms);
    });
}
const cargarLoaderAsync = async(ocultar = false, ms = 0)=>{
    await timeout(ocultar,ms);
    return null;
}
const mostrarForm = (nombreForm = '')=>{
    try{
        $(`#${nombreForm}`).modal({
            keyboard: false,
            backdrop: 'static'
        });
    }catch(err){
        console.log('Advertencia: Ocurrió un error.');
    }
};

const fechaActualInput = (idInput = '') => {
    try{
        let f = new Date();
        let day = f.getDate();
        let dia_real = '';
        if (day < 10) {
            dia_real = '0' + day;
        } else {
            dia_real = day.toString();
        }
        let month = f.getMonth() + 1;
        let real_mes = '';
        if (month < 10) {
            real_mes = '0' + month;
        } else {
            real_mes = month;
        }
        if(idInput == ''){
            return `${f.getFullYear()}-${real_mes}-${dia_real}`;
        }
        $(`#${idInput}`).val(`${f.getFullYear()}-${real_mes}-${dia_real}`);
        return false;
    }catch(err){
        console.log('Advertencia: Ocurrió un error.', err);
    }
};

const formateaFecha = (fecha = '')=>{
    try{    
        let arr = fecha.split('-');
        return `${arr[2]}/${arr[1]}/${arr[0]}`;
    }catch(err){
        return '';
    }
};
/**
 * 
 * @param {String} id_select 
 * @param {Array} data 
 * @param {String} prop1 
 * @param {String} prop2 
 */
const cargarSelect2 = (id_select,data,name_id,name,no_elm = 'No hay elementos',primer_elemento = false)=>{
    let array_datos = Array();
    if(data != null){
        if(data.length != 0){
            if(primer_elemento){
                array_datos.push({"id": 0, "text": "Seleccione."});
            }
            data.forEach( elemento => {
                if(elemento != undefined){
                    array_datos.push({"id": elemento.nro_doc === undefined ? '' : elemento.nro_doc, "text": elemento.nombres === undefined ? '' : elemento.nombres});
                }
            });
        }else{
            array_datos.push({"id": 0, "text": no_elm});
        }
        //array_datos.push({"id": 0, "text": "SELECCIONE UN COBRADOR"});
    }else{
        array_datos.push({"id": 0, "text": no_elm});
    }
    $(`#${id_select}`).empty();
    $(`#${id_select}`).select2({
        language: "es",
        data: array_datos,
        //matcher: matchCustom
    });
};
const cargarSelect2Key = (id_select,data,name_id,name,no_elm = 'No hay elementos',primer_elemento = false, tags = false, messagePrimerElemento = 'Seleccione')=>{
    let array_datos = Array();
    if(data != null){
        if(data.length != 0){
            if(primer_elemento){
                array_datos.push({"id": 0, "text": messagePrimerElemento });
            }
            data.forEach( elemento => {
                if(elemento != undefined){
                    array_datos.push({"id": elemento[name_id] === undefined ? '' : elemento[name_id], "text": elemento[name] === undefined ? '' : elemento[name]});
                }
            });
        }else{
            array_datos.push({"id": 0, "text": no_elm});
        }
        //array_datos.push({"id": 0, "text": "SELECCIONE UN COBRADOR"});
    }else{
        array_datos.push({"id": 0, "text": no_elm});
    }
    $(`#${id_select}`).empty();
    $(`#${id_select}`).select2({
        tags,
        language: "es",
        data: array_datos,
        //matcher: matchCustom
    });
};
const matchCustom = (params, data)=> {
    // If there are no search terms, return all of the data
    if ($.trim(params.term) === '') {
      return data;
    }

    // Do not display the item if there is no 'text' property
    if (typeof data.text === 'undefined') {
      return null;
    }

    // `params.term` should be the term that is used for searching
    // `data.text` is the text that is displayed for the data object
    if (data.text.indexOf(params.term) > -1) {
      var modifiedData = $.extend({}, data, true);
      modifiedData.text += ' (matched)';

      // You can return modified objects from here
      // This includes matching the `children` how you want in nested data sets
      return modifiedData;
    }

    // Return `null` if the term should not be displayed
    return null;
}

const creaTablaBasica = (idTabla = '', columnas = [], _data, buttons = true, sort = "asc", btn_opc = null,dom = 'Bflrtip') => {
    let btn = [];
    if(buttons) {
        btn = [{
            extend: 'excelHtml5',
            text: '<i class="fas fa-table"></i>',
            titleAttr: 'Exportar a Excel',
            className: 'btn btn-success btn-circle',
            /*action: function () {
                exportTableToExcel('dataTable','table-data');
            }*/
        },
        {
            extend: 'pdfHtml5',
            text: '<i class="fas fa-file-pdf-o"></i>',
            titleAttr: 'Exportar a Pdf',
            className: 'btn btn-danger btn-circle'
        },
        {
            extend: 'print',
            text: '<i class="fas fa-print"></i>',
            titleAttr: 'Imprimir',
            className: 'btn btn-warning btn-circle'
        },
        {
            text: '<i class="fas fa-check-square-o"></i>',
            className: 'edit btn btn-success btn-circle',
            //titleAttr: 'Pagar todos los pagos recibidos',
            action: function () {
                /*var table = $("#dataTablaEntidad").DataTable();
                var data = table.row('.selected').data();
                if (data != null) {
                    getData(data);
                    $("#modal_entidad_nueva").modal({
                        keyboard: false,
                        backdrop: 'static'
                    });
                    $('#btn_agregar_cliente').text('Modificar cliente');
                } else
                    swal("Seleccione un Item");*/
            }
        }];
    }
    if(btn_opc !== null){
        btn = btn_opc;
    }
    $(`#${idTabla}`).DataTable({
        "destroy": true,
        "processing": true,
        "bJQueryUI": true,
        "iDisplayLength": 10,
        data: _data,
        "order": [[ 0, sort ]],
        "columns": columnas,
        "lengthMenu": [[15, 30, 100, 150, -1], [15, 30, 100, 150, "All"]],
        "language": {
            "lengthMenu": "Mostrar _MENU_ registros",
            "zeroRecords": "No se encontraron resultados",
            "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "infoEmpty": "Mostrando registros del 0 al 9 en un total de 0 registros",
            "sSearch": "Buscar",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Ultimo",
                "sNext": ">>",
                "sPrevious": "<<",
            },
            "sProccessing": "Procesando...",
        },
        dom,
        buttons: btn
    });
    if(!buttons){
        $(`#${idTabla}`).DataTable().buttons().remove();
    }
    /** *EJEMPLO COLUMNAS
        [{
            "data": "unidad",
            render: function(data) { if(data == null) return '-'; else {return data} }
        },
        {
            "data": "descripcion_subdivision",
            render: function(data) { if(data == null) return '-'}
        },
        ]
     */
}
const regresaMes = (nro_mes = '')=>{
    try{
        switch(Number(nro_mes)){
            case 1:
                return "Enero";
            break;
            case 2: 
                return "Febrero";
            break;
            case 3: 
                return "Marzo";
            break;
            case 4: 
                return "Abril";
            break;
            case 5: 
                return "Mayo";
            break;
            case 6: 
                return "Junio";
            break;
            case 7: 
                return "Julio";
            break;
            case 8: 
                return "Agosto";
            break;
            case 9: 
                return "Septiembre";
            break;
            case 10: 
                return "Octubre";
            break;
            case 11: 
                return "Noviembre";
            break;
            case 12: 
                return "Diciembre";
            break;
        }
    }catch(e){
        return '';
    }
}
const llenaInput = (valor,...elementos)=>{
    try{
        elementos.forEach((e) =>{
            document.getElementById(e).value = valor;
        });
    }catch(errr){
        return '';
    }
}

//Modal - idModal
const implementaModalEspera = (id="modal_espera")=>{
    const modal = `<div class="modal fade" id="modal_loading" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" style="display: none;" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Cargando, espera <span class="one">.</span><span class="two">.</span><span class="three">.</span>​</h5>
                    </div>

                    <div class="modal-body">
                        <div class="row text-center">
                            <div class="col-md-12" id="__modalHelpHTML">
                            
                            </div>
                            <div class="col-md-12">
                                <div class="spinner-border text-primary" role="status">
                                    <span class="sr-only">Loading...</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>`;
    const elemento = document.getElementById(id); 
    //*Verificar que no exista otro modal dentro
    const elemento_a_crear = document.getElementById('modal_loading');
    if(!elemento_a_crear){
        elemento.innerHTML = modal;
    }
}
const abrirModal = (id='modal_espera')=>{
    try{
        // document.getElementById(id).children[0].style.display = 'block';
        $(`#${id} > #modal_loading`).modal({backdrop: 'static', keyboard: false},'show');
    }catch(error){
        console.error("El modal no ha podido ser cerrado, verificar.");
        return false;
    }
}
const agregaMensajeModal = (id='modal_espera',text = '') => {
    try{
        if(text !== ''){
            $(`#${id}`).find(`#__modalHelpHTML`).html(text);
        }
    }catch(error){
        console.error("El modal no ha podido ser cerrado, verificar.");
        return false;
    }
}
const cerrarModal = (id='modal_espera')=>{
    try{
        // document.getElementById(id).children[0].style.display = 'none';
        setTimeout(()=>{
            $(`#${id} > #modal_loading`).modal('hide');
            $(`#${id}`).find(`#__modalHelpHTML`).html('');
        },500); //*Medioo segundo por sea caso
    }catch(error){
        console.error("El modal no ha podido ser cerrado, verificar.");
        return false;
    }
}
const abrirModalGenerico = (id= '')=>{
    try{
        // document.getElementById(id).children[0].style.display = 'block';
        $(`#${id}`).modal({backdrop: 'static', keyboard: false},'show');
    }catch(error){
        console.error("El modal no ha podido ser cerrado, verificar.");
        return false;
    }
};
const cerrarModalGenerico = (id = '')=>{
    try{
        setTimeout(()=>{
            $(`#${id}`).modal('hide');
        },500);
    }catch(error){
        console.error("El modal no ha podido ser cerrado, verificar.");
        return false;
    }
};

//Activar selecciones en una tabla, e incluso enviar un callback, para una función que requieras hacer
const permitirSelecciones = (id, callback)=>{
    //* If selected is equal to null, the function won't return selectedd element
    $(`#${id} tbody`).on('click', 'tr', function () {
        var table = $(`#${id}`).DataTable();
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
            $(this).removeClass('bg-info');
            $(this).removeClass('text-white');
            callback(null);
        } else {
            table.$('tr.selected').removeClass('selected');
            table.$('tr.bg-info').removeClass('bg-info');
            table.$('tr.text-white').removeClass('text-white');
            $(this).addClass('selected');
            $(this).addClass('bg-info');
            $(this).addClass('text-white');
            //* add callback
            var obj = table.row(".selected").data();
            //*Obj refiere a lo seleccionado
            callback(obj); //*El callback recibirá el obj como parametro
        }
    });
}

const post_params = {
    method: 'POST', // *GET, POST, PUT, DELETE, etc.
    mode: 'cors', // no-cors, *cors, same-origin
    cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
    credentials: 'same-origin', // include, *same-origin, omit
    headers: {
        'Content-Type': 'application/json',
        // 'Content-Type': 'application/x-www-form-urlencoded',
        'X-CSRF-TOKEN': ""
    },
    redirect: 'follow', // manual, *follow, error
    referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
    body: ""
};

const cambiarEstadoBotones = ( btns = [], desactivar = true ) => {
    try{
        btns.forEach(e=>{document.getElementById(e).disabled = desactivar});
    }catch(err){
        console.warn(err);
        console.log('Problema seteando los botones...');
    }
}

const postUrl = async( url,obj,token,options = post_params)=>{
    try{
        options.body = JSON.stringify(obj);
        options.headers["X-CSRF-TOKEN"] = token;
        const resp = await fetch(url, options);
        if(resp.status !== 200){
            const data = await resp.json();
            return {
                "data": null,
                "message" : data.message,
                "error": true,
            }
        }
        const data = await resp.json();  
        return { data, error : false, message : !!data.message ? data.message : 'OK' };
    }catch(e){
        console.log(e);
        console.warn(`Error rastreando ${url}`);
        return false;
    }
}
    
