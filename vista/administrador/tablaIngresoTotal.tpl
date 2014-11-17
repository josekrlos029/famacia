<h3>Ingresos</h3>
<div id="mitabla">
        <table width="100%">
                <thead> 
                <th>N°</th>
                <th width="30%">Codigo Venta</th>
                <th width="30%">Fecha</th>
                <th width="30%">Vendedor</th>
                <th width="40%">Valor</th>
                <th width="40%">Pagó</th>
                <th width="">Ver+</th>
                <th width="">Eliminar</th>
                </thead>
                <tbody>
                    <?php 
                    $cont=0;
                    $sum= 0;
                    foreach($detalles as $d){
                    $cont++;
                    $idFactura =$d["idFactura"];
                    ?>
                    <tr>
                        <td><?php echo $cont; ?></td>
                        <td><?php echo $d["idFactura"]; ?></td>
                        <td><?php echo $d["fecha"]; ?></td>
                        <td><?php echo $d["nombres"]." ". $d["pApellido"]; ?></td>
                        <td><?php echo round($d["sumaProductos"], 2); ?></td>
                        <td><?php echo $d["formaPago"]; ?></td>
                        <td width="5%" style="text-align:right;"><buttom type="submit" class="button small red"  onclick="consultaFactura('<?php echo $idFactura; ?>');">...</buttom></td> 
                        <td width="5%" style="text-align:right;"><buttom type="submit" class="button small red"  onclick="eliminarFactura('<?php echo $idFactura; ?>');">...</buttom></td> 

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