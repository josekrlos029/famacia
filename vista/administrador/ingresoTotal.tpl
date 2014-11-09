<script>
    function cargarTabla() {
        var x = $("#mensaje");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("speed");

        var inicio = $("#inicio").val();
        var fin = $("#fin").val();
        var data = {
            inicio: inicio,
            fin: fin
        };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/tablaIngresoTotal",
            data: data
        }).done(function (msg) {

            //var json = eval("(" + msg + ")");
            $("#cargaTabla").html(msg);
            ocultar();

        });


    }
    
    function imprimir(){
        var contenido = $("#cargaTabla").html().toString();
        var cc =contenido.replace("\n"," ");
        var c=cc.replace(' ','');
        
        alert(c);
        window.open("/famacia/administrador/imprimirContenido/"+c);
    }
    
    function consultaFactura(idFactura) {
        var x = $("#mensaje");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("speed");


        var data = { idFactura: idFactura };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/detallesFactura",
            data: data
        }).done(function (msg) {

            $("#cargaDiv").html(msg);
            ocultar();
            document.getElementById('light').style.display = 'block';
            document.getElementById('fade').style.display = 'block';

        });


    }
</script>
<div  id="overlay"></div>
<div  id="mensaje">
    <div style="float:right">
        <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display = 'none';
                document.getElementById('fade').style.display = 'none'"><img src="../utiles/image/close.png"/></a>
    </div>
</div>
<div style=" margin-left: 5%; margin-top: 5%">
    <h2>Ingreso Total</h2><br>
    <h3>Ingrese el rango de fecha que desea consultar</h3><br>
    <table width="100%">
        <tr>
            <td align="right">Fecha Inicio:</td>
            <td><input type="date" class="box-text" id="inicio"></td>
            <td align="right">Fecha Final:</td>
            <td><input type="date" class="box-text" id="fin"></td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td style="text-align:right;"><button type="submit" class="button orange large" onclick="cargarTabla()" >Buscar</button></td>
        </tr>
    </table>
    <div id="cargaTabla">
        <h3>Ingresos de Hoy</h3>
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
        <br>
        <h3>Egresos</h3>
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
                </thead>
                <tbody>
                    <?php 
                    $cont=0;
                    $sum= 0;
                    foreach($detalles2 as $d){
                    $cont++;
                    ?>
                    <tr>
                        <td><?php echo $cont; ?></td>
                        <td><?php echo $d["idProducto"]; ?></td>
                        <td><?php echo $d["nombre"]; ?></td>
                        <td><?php echo $d["fecha"]; ?></td>
                        <td><?php echo $d["cantidad"]; ?></td>
                        <td><?php echo $d["precio"]; ?></td>
                        <td><?php echo $d["precio"] * $d["cantidad"]; ?></td>
                    </tr>
                    <?php $sum +=  $d["precio"] * $d["cantidad"]; }
                    $sumaE = $sum;
                    ?>
                </tbody>
            </table>
        </div>
        <div style="margin-top: 5%; margin-left: 70%;">
            <a>Ingreso Total:</a>
            <input type="number"  dir class="box-text" disabled value="<?php echo $sum; ?>">
            
        </div>
        <br>
        <h1>UTILIDAD</h1>
        <h2><?php echo $sumaI - $sumaE; ?></h2>
        <button class='button small red' onclick='imprimir()'>Imprimir</button>
    </div>
</div>
<div id="fade" class="overlay"></div>
<div id="light" class="modal">
    <div style="float:right">
        <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display = 'none';
                          document.getElementById('fade').style.display = 'none'"><img src="../utiles/image/close.png"/></a>
    </div>
    <div id="cargaDiv">

    </div>    

</div>