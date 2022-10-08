</div>
<footer class="main-footer">
    <div class="pull-right hidden-xs">
        <b>Version</b> 1.0.0
    </div>
    <strong>Copyright &copy; <?=('Y')?> <a href="http://apps.gruva.net/" target="_blank">Gruva Apps</a>.</strong> Todos los derechos reservados.
</footer>

</div>
<!-- jQuery 2.2.3 -->
<script src="assets-v2/jquery-3.6.1.min.js"></script>
<script src="assets/plugins/jQueryUI/jquery-ui.js"></script>
<!--Datatable -->
<script src="assets-v2/datatables/datatables.min.js"></script>
<script src="assets-v2/datatables/Buttons-2.2.3/js/dataTables.buttons.min.js"></script>
<script src="assets-v2/datatables/Buttons-2.2.3/js/buttons.print.min.js"></script>
<script src="assets-v2/datatables/pdfmake-0.1.36/pdfmake.min.js"></script>
<script src="assets-v2/datatables/JSZip-2.5.0/jszip.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="assets/plugins/select2/select2.js"></script>
<!-- Slimscroll -->
<script src="assets/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="assets/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="assets/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="js/bootbox.min.js"></script>
<script src="js/jquery.fancytree.js"></script>
<script src="assets-v2/sweet-alert.js"></script>
<!-- ACÁ SOLICITA TU JS -->
<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
//! desde tu función debes mandar un array [], con la ruta de tus script, todos deben estar en la carpeta JS
if(!isset($_SESSION['scriptsPage'])) echo '<script>console.warn("No has mandado ningún script.")</script>';
else{
    //! Procesar los scripts acá
    $scripts = $_SESSION['scriptsPage'];
    if(!is_array($scripts)) echo '<script>console.warn("Debes enviar una array que contenga los nombres de tus scripts, así contenga un script.")</script>';
    else{
        foreach($scripts as $script){
            $nombreScript = '"js/'.$script.'"';
            echo "<script src=$nombreScript></script>";
        }
    }
}
?>
</body>
</html>