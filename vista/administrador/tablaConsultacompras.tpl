<h3>Compras</h3>
<div id="mitabla">
        <table width="100%">
                <thead> 
                <th>N°</th>
                <th width="30%">Codigo Compra</th>
                <th width="30%">Fecha</th>
                <th width="30%">Proveedor</th>
                <th width="40%">Valor</th>
                <th width="">Ver+</th>
                <th width="">Eliminar</th>
                </thead>
                <tbody>
                    <?php 
                    $cont=0;
                    $sum= 0;
                    foreach($detalles as $d){
                    $cont++;
                    $idCompra =$d["idCompra"];
                    ?>
                    <tr>
                        <td><?php echo $cont; ?></td>
                        <td><?php echo $d["idCompra"]; ?></td>
                        <td><?php echo $d["fecha"]; ?></td>
                        <td><?php echo $d["nombre"]; ?></td>
                        <td><?php echo round($d["sumaProductos"], 2); ?></td>
                        <td width="5%" style="text-align:right;"><buttom type="submit" class="button small red"  onclick="consultaCompra('<?php echo $idCompra; ?>');">...</buttom></td> 
                        <td width="5%" style="text-align:right;"><buttom type="submit" class="button small red"  onclick="eliminarCompra('<?php echo $idCompra; ?>');">X</buttom></td> 

                </tr>
                <?php $sum += $d["sumaProductos"]; } 
                $sumaI = $sum;
                ?>
                </tbody>
            </table>
    </div>
    <div style="margin-top: 5%; margin-left: 70%;">
        <a>Ingreso Total:</a>
        <input type="number" class="box-text" value="<?php echo round($sum, 2); ?>" disabled>
    </div>
<button class='button small red' onclick='imprimir()'>Imprimir</button>