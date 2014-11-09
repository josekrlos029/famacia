<table border="0" align="center" width="100%" id="mitabla">
    <thead>
    <th >Codigo</th>
    <th width="30%">Nombre</th>
    <th >Contiene</th>
    <th >Precio Venta</th>
    <th >Unds disponibles</th>
    <th >Unds Netas</th>
    <th >Cod. Barras</th>
    <th  width="5%">pedidos</th>

</thead>
<tbody id="table">
    <?php foreach($productos as $producto){ 
    if($producto->getUnidades() <= 0){
    $neto = 0;
    }else{
    $neto = $producto->getUnidades() / $producto->getUnidadesProducto();
    }
    ?>
    <tr align="left" class="recorrer">
        <td ><?php echo $producto->getIdProducto(); ?></td>
        <td ><?php echo $producto->getNombre(); ?></td>
        <td ><?php echo $producto->getUnidadesProducto(); ?></td>
        <td ><?php echo $producto->getPrecio(); ?></td>
        <td ><?php echo $neto ?></td>
        <td ><?php echo $producto->getUnidades(); ?></td>
        <td ><?php echo $producto->getCodigo(); ?></td>
        <td style="text-align:right;"><button class="button red small" onclick="consultaProducto('<?php echo $producto->getIdProducto();?>');">...</button></td>
    </tr>
    <?php } ?>
</tbody>

</table>