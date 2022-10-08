<?php 

require_once 'model/clases/menus.php';

$menus = new Menu();
$lmenu = $menus->getmenuxperfil(($_SESSION['idperfil_per_sigue']));
?>

  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="assets/dist/img/avatar5.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><?php echo $_SESSION['usuario'] ?></p>
        </div>
      </div>



 <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MENU<?php echo $_SESSION['idperfil_per_sigue'] ?></li>

<!-- inicio menus -->

<!--         <li class="treeview">
          <a>
            <i class="fa fa-files-o"></i>
            <span>Compra</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/tables/pedido.html"><i class="fa fa-circle-o"></i> Pedido</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> Comprar</a></li>
          </ul>
        </li> -->
        	

      <?php foreach ($lmenu as $menu): ?>

			<?php if (($menu->menu_padre) == null): ?>

				<li class="treeview">
					<a href="#">
						<i class="<?php echo $menu->icono ?>"></i>
						<span><?php echo $menu->descripcion ?></span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<?php foreach ($lmenu as $menu1): ?>
							<?php if ($menu1->menu_padre == $menu->id_menu): ?>
					            <li><a href="<?php echo $menu1->link ?>"><i class="fa fa-circle-o"></i><?php echo $menu1->descripcion ?></a></li>
							<?php endif ?>

						<?php endforeach ?>
					</ul>		          
				</li>
			<?php else: ?>
				
			<?php endif ?>


        <?php endforeach ?>



<!-- fin menus -->




</ul>





     </section>
    </aside>