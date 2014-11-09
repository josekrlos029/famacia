<div id="mitabla">
    <table width="100%">
        <thead>
        <th>N°</th>
        <th width="20%">Codigo Venta</th>
        <th width="20%">Fecha</th>
        <th width="40%">Valor</th>

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
                    <td><?php echo round($d["precio"], 2); ?></td>
                    
                </tr>
                <?php $sum += $d["precio"]; } ?>
        </tbody>
    </table>
</div>
<div style="margin-top: 5%; margin-left: 70%;">
    <a>Ingreso Total:</a>
    <input type="number" class="box-text" value="<?php echo $sum; ?>" disabled>
</div>
<br>
<h1>Comisión</h1>
<div id="mitabla">
    
    <table width="100%">
        <thead>
        <th>N°</th>
        <th width="20%">Codigo Venta</th>
        <th width="20%">Nombre Producto</th>
        <th width="40%">Valor comisión</th>
        <th width="40%">Fecha</th>
        </thead>
        <tbody>
            <?php 
                    $cont=0;
                    $sum= 0;
                    foreach($comision as $c){
                    $cont++;
                ?>
                <tr>
                    <td><?php echo $cont; ?></td>
                    <td><?php echo $c["idFactura"]; ?></td>
                    <td><?php echo $c["nombre"]; ?></td>
                    <td><?php echo round($c["comision"], 2); ?></td>
                    <td><?php echo $c["fecha"]; ?></td>
                </tr>
                <?php $sum += $c["comision"]; } ?>
        </tbody>
    </table>
</div>
<div style="margin-top: 5%; margin-left: 70%;">
    <a>Comisión Total:</a>
    <input type="number" class="box-text" value="<?php echo $sum; ?>" disabled>
</div>
<button class='button small red' onclick='imprimir()'>Imprimir</button>