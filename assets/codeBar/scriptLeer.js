var _scannerIsRunning = false;

function startScanner() {
  Quagga.init(
    {
      inputStream: {
        name: "Live",
        type: "LiveStream",
        target: document.querySelector("#scanner-container"),
        constraints: {
          width: 480,
          height: 320,
          facingMode: "environment",
        },
      },
      decoder: {
        readers: [
          /*"code_128_reader",
          "ean_reader",*/
          "ean_8_reader" /*
          "code_39_reader",
          "code_39_vin_reader",
          "codabar_reader",
          "upc_reader",
          "upc_e_reader" 
          "i2of5_reader",*/,
        ],
        debug: {
          showCanvas: true,
          showPatches: true,
          showFoundPatches: true,
          showSkeleton: true,
          showLabels: true,
          showPatchLabels: true,
          showRemainingPatchLabels: true,
          boxFromPatches: {
            showTransformed: true,
            showTransformedBox: true,
            showBB: true,
          },
        },
      },
    },
    function (err) {
      if (err) {
        console.log(err);
        return;
      }

      console.log("Initialization finished. Ready to start");
      Quagga.start();

      // Establecer bandera en se está ejecutando
      _scannerIsRunning = true;
    }
  );

  Quagga.onProcessed(function (result) {
    var drawingCtx = Quagga.canvas.ctx.overlay,
      drawingCanvas = Quagga.canvas.dom.overlay;

    if (result) {
      if (result.boxes) {
        drawingCtx.clearRect(
          0,
          0,
          parseInt(drawingCanvas.getAttribute("width")),
          parseInt(drawingCanvas.getAttribute("height"))
        );
        result.boxes
          .filter(function (box) {
            return box !== result.box;
          })
          .forEach(function (box) {
            Quagga.ImageDebug.drawPath(box, { x: 0, y: 1 }, drawingCtx, {
              color: "green",
              lineWidth: 2,
            });
          });
      }

      if (result.box) {
        Quagga.ImageDebug.drawPath(result.box, { x: 0, y: 1 }, drawingCtx, {
          color: "#00F",
          lineWidth: 2,
        });
      }

      if (result.codeResult && result.codeResult.code) {
        Quagga.ImageDebug.drawPath(
          result.line,
          { x: "x", y: "y" },
          drawingCtx,
          { color: "red", lineWidth: 3 }
        );
      }
    }
  });

  Quagga.onDetected(function (result) {
    console.log(
      "Barcode detected and processed : [" + result.codeResult.code + "]"
    );
    var codebar = result.codeResult.code;

    var options = {
      type: "POST",
      data: {
        codebar: codebar.substring(0, 7),
      },
      url: "index.php?page=ventas&accion=obtenerproductoalmcodigobar",
      dataType: "json",
      success: function (response) {

        $("#nom_producto").html(response.nombre_producto);

        $('#nombre_producto').val(response.nombre_producto);
        $('#id_producto').val(response.id_producto);
        $('#span_precio_venta').html('S/.' + response.precio_venta);
        $('#precio_venta').val(response.precio_venta);
        $('#stock').val(response.stock);
        $('#span_stock').html(response.stock);
        $('#id_proveedor').val(response.id_proveedor);
        $('#nom_proveedor').val(response.nom_proveedor);
        $('#unidad').html(response.options);
        // $('#modal_registro').modal('hide');
      },
      error: alert(codebar.substring(0, 7)),
    };
    $.ajax(options);
  });
}

// Iniciar / detener el escáner
document.getElementById("btn_start").addEventListener("click", function () {
  if (_scannerIsRunning) {
    Quagga.stop();
    _scannerIsRunning = true;
  } else {
    startScanner();
  }
});

document.getElementById("btn_start").addEventListener("click", function () {
  if (_scannerIsRunning) {
    Quagga.stop();
    _scannerIsRunning = false;
    $("#scanner-container video").hide();
  } else {
    startScanner();
    $("#scanner-container video").show();
  }
});
