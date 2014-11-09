<div id="mitabla">
        <table width="100%">
            <thead>
                        <th>N°</th>
                         <th width="30%">Codigo Venta</th>
                         <th width="30%">Fecha</th>
                         <th width="40%">Precio</th>
                         <th width="30%">IVA%</th>
                         <th width="30%">Cantidad</th>                         
                         <th width="40%">Total</th>
                         
            </thead>
            <tbody>
                <?php 
                    $cont=0;
                    $sum= 0;
                    foreach($detalles as $d){
                    $cont++;
                ?>
                <tr>
                    <td><?php echo $cont; ?></td>
                    <td><?php echo $d["idFactura"]; ?></td>
                    <td><?php echo $d["fecha"]; ?></td>
                    <td><?php echo $d["precioVenta"]; ?></td>
                    <td><?php echo $d["iva"]; ?></td>
                    <td><?php echo $d["cantidad"]; ?></td>
                    <td><?php echo $d["cantidad"]*($d["precioVenta"]+($d["precioVenta"]*($d["iva"]/100))); ?></td>
                </tr>
                <?php $sum += $d["cantidad"]*($d["precioVenta"]+($d["precioVenta"]*($d["iva"]/100))); } ?>
            </tbody>
        </table>
    </div>
    <div style="margin-top: 5%; margin-left: 70%;">
        <a>Ingreso Total:</a>
        <input type="number" dir class="box-text" value="<?php echo $sum; ?>">
    </div>
<button class='button small red' onclick='imprimir()'>Imprimir</button>