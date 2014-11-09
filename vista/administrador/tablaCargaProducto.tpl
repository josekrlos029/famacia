<div id="mitabla">
        <table width="100%">
            <thead>
                        <th>N°</th>
                         <th width="30%">Codigo Producto</th>
                         <th width="30%">Nombre</th>
                         <th width="40%">Fecha</th>
                         <th width="30%">Cantidad</th>
                         <th width="40%">Precio Proveedor</th>
                         <th width="40%">Subtotal</th>
                         <th width="40%">Deshacer</th>
            </thead>
            <tbody>
                <?php 
                    $cont=0;
                    $sum= 0;
                    foreach($detalles as $d){
                    $cont++;
                    $idIngreso = $d["idIngreso"];
                ?>
                <tr>
                    <td><?php echo $cont; ?></td>
                    <td><?php echo $d["idProducto"]; ?></td>
                    <td><?php echo $d["nombre"]; ?></td>
                    <td><?php echo $d["fecha"]; ?></td>
                    <td><?php echo $d["cantidad"]; ?></td>
                    <td><?php echo $d["precio"]; ?></td>
                    <td><?php echo $d["precio"] * $d["cantidad"]; ?></td>
                    <td width="5%" style="text-align:right;"><buttom type="submit" class="button small red"  onclick="eliminarPedido('<?php echo $idIngreso; ?>');">x</buttom></td> 
                </tr>
                <?php $sum +=  $d["precio"] * $d["cantidad"]; } ?>
            </tbody>
        </table>
    </div>
    <div style="margin-top: 5%; margin-left: 70%;">
        <a>Ingreso Total:</a>
        <input type="number"  dir class="box-text" disabled value="<?php echo $sum; ?>">
    </div>