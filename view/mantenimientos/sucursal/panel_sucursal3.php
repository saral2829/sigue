<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<table border="1px">
	<thead>
		<tr>
			<th>Nombre Sucursal</th>
			<th>Telefono</th>
		</tr>	
	</thead>
	<tbody>
<!-- 		<tr>
			<td>Suc1</td>
			<td>123456</td>
		</tr> -->
		<?php foreach ($lsucursales as $sucursal): ?>
			<tr>
				<td><?php echo $sucursal->razonsoc_suc ?></td>
				<td><?php echo $sucursal->telefonofij_suc ?></td>
			</tr>
		<?php endforeach ?>
	</tbody>
</table>
</body>
</html>