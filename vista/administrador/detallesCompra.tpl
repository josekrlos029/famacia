<div style=" margin-top: 5%; margin-left:5%;float:left; width: 40%;" id="vistaServicios">
    <h2>Productos</h2>
    </br>
    <table id="mitabla" width="100%" >
        <thead>
        <th>N°</th>    
        <th>COD</th>
        <th>Producto</th>
        <th>Cantidad</th> 
        <th width="15%">Precio Unid.</th>
        <th width="15%">Subtotal</th>
        <th width="15%">Devolver</th>
        </thead>
        <tbody id="tProductos">
            <?php 
                    $cont=0;
                    $sumaP= 0;
                    foreach($dp as $d){
                    $cont++;
                    $idIngreso = $d["idIngreso"];
                ?>
                <tr>
                    <td><?php echo $cont; ?></td>
                    <td><?php echo $d["idProducto"]; ?></td>
                    <td><?php echo $d["nombre"]; ?></td>
                    <td><?php echo $d["cantidad"]; ?></td>
                    <td><?php echo $d["precioVenta"];?></td>
                    <td><?php echo $d["cantidad"]*($d["precioVenta"]+($d["precioVenta"]*($d["iva"]/100)));?></td>
                    <td width="5%" style="text-align:right;"><buttom type="submit" class="button small red"  onclick="eliminarProductoP('<?php echo $idIngreso; ?>');">X</buttom></td> 
                </tr>
                <?php $sumaP += $d["cantidad"]*($d["precioVenta"]+($d["precioVenta"]*($d["iva"]/100))); } ?>

        </tbody>
        
    </table>
    <br>
    <h2>Total en Productos: <?php echo $sumaP; ?></h2>
</div>
<br>
<br>
<br>
<table width="100%">
    <tr>
        <td align="center"><h2>TOTAL: <?php echo $sumaP; ?></h2></td>
    </tr>
</table>