<div style=" margin-top: 5%;margin-left: 5%; float:left; width:45%;">
    <h2>Servicios</h2>
    </br>
    <table id="mitabla" width="100%" >
        <thead>
        <th>N°</th>
        <th>COD</th>
        <th>Servicio</th>
        <th>Servidor</th>
        <th width="15%">Precio</th>
        </thead>
        <tbody id="tServicios">
            <?php 
                    $cont=0;
                    $sumaS= 0;
                    foreach($ds as $d){
                    $cont++;
                    
                ?>
                <tr>
                    <td><?php echo $cont; ?></td>
                    <td><?php echo $d["idFactura"]; ?></td>
                    <td><?php echo $d["nombre"]; ?></td>
                    <td><?php echo $d["nombres"]." ".$d["pApellido"]; ?></td>
                    <td><?php echo $d["precioFactura"];?></td>
                    
                </tr>
                <?php $sumaS += $d["precio"]; } ?>


        </tbody>
    </table>
    <br>
    <h2>Total en Servicios: <?php echo $sumaS; ?></h2>

</div>
<div style=" margin-top: 5%; margin-left:5%;float:right; width: 40%;" id="vistaServicios">
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
        </thead>
        <tbody id="tProductos">
            <?php 
                    $cont=0;
                    $sumaP= 0;
                    foreach($dp as $d){
                    $cont++;
                    
                ?>
                <tr>
                    <td><?php echo $cont; ?></td>
                    <td><?php echo $d["idProducto"]; ?></td>
                    <td><?php echo $d["nombre"]; ?></td>
                    <td><?php echo $d["cantidad"]; ?></td>
                    <td><?php echo $d["precioVenta"];?></td>
                    <td><?php echo $d["precioVenta"]*$d["cantidad"];?></td>
                    
                </tr>
                <?php $sumaP += $d["precioVenta"]*$d["cantidad"]; } ?>

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
        <td align="center"><h2>TOTAL: <?php echo $sumaP + $sumaS; ?></h2></td>
    </tr>
</table>