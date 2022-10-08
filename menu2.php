 <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/avatar5.png" class="img-circle" alt="User Image">
          <span class="hidden-xs"><?php echo $_SESSION['usuario'] ?></span>
            
        </div>
        <div class="pull-left info">
        <p><?php echo $_SESSION['usuario'] ?></p>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MENU </li>
        <li class="treeview">
          <a>
            <i class="fa fa-shopping-cart"></i>
            <span>Compra</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/tables/pedido.html"><i class="fa fa-circle-o"></i> Pedido</a></li>
            <li><a href="pages/tables/compra.html"><i class="fa fa-circle-o"></i> Comprar</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-home"></i>
            <span>Almacén</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/tables/producto.html"><i class="fa fa-circle-o"></i> Productos</a></li>
            <li><a href="pages/tables/movimiento.html"><i class="fa fa-circle-o"></i> Movimiento de Productos</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-line-chart"></i>
            <span>Venta</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i> Vender</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> Proformar</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> Guía de Remisión</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> Anular Venta</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-calculator"></i> <span>Caja</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i> Control de caja</a></li>
            <li>
              <a href="#"><i class="fa fa-circle-o"></i> Pagos
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-circle-o"></i> Letras de Venta</a></li>
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Letras de Compra
                    
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-cog"></i> <span>Mantenimientos</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="treeview">
              <a href="#">
              <i class="fa fa-circle-o"></i> <span>Clientes</span>
                <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
                <ul class="treeview-menu">
                  <li><a href="pages/tables/simple.html"><i class="fa fa-circle-o"></i> Jurídicos</a></li>
                  <li><a href="pages/tables/naturales.html"><i class="fa fa-circle-o"></i> Naturales</a></li>
                </ul>
            </li>
            <li><a href="pages/tables/proveedor.html"><i class="fa fa-circle-o"></i> Proveedores</a></li>
            <li><a href="pages/tables/sucursal.html"><i class="fa fa-circle-o"></i> Sucursales</a></li>
            <li><a href="pages/tables/usuario.html"><i class="fa fa-circle-o"></i> Usuarios</a></li>
            <li><a href="pages/tables/usuariosucursal.html"><i class="fa fa-circle-o"></i> Usuarios por sucursal</a></li>
            <li><a href="pages/tables/area.html"><i class="fa fa-circle-o"></i> Área de trabajo</a></li>
            <li><a href="pages/tables/unidad.html"><i class="fa fa-circle-o"></i> Unidad de Medida</a></li>
            <li><a href="pages/tables/clase.html"><i class="fa fa-circle-o"></i> Clase de Producto</a></li>
            <li><a href="pages/tables/categoria.html"><i class="fa fa-circle-o"></i> Categoría de Producto</a></li>
            <li><a href="pages/tables/producto.html"><i class="fa fa-circle-o"></i> Producto</a></li>
            <li><a href="pages/tables/igv.html"><i class="fa fa-circle-o"></i> Actualizar IGV</a></li>
            <li><a href="pages/tables/numeracion.html"><i class="fa fa-circle-o"></i> Numeración de Documentos</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-edit"></i> <span>Reportes</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i> Clientes</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> Ventas por Vendedor</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> Montos por Cobrar</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> Montos por Pagar</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> Productos por sucursal</a></li>
          </ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>