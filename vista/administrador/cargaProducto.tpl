<script>
    
    function eliminarPedido(idIngreso){
        var x = $("#mensaje");
        cargando();
        x.html ("<p>Cargando...</p>");
        x.show("speed");
        
        var data = { 
            idIngreso: idIngreso
        };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/eliminarPedido",
            data: data
        }).done(function(msg) {
            var json = eval("(" + msg + ")");
            
            if (json.msj == "exito") {
                            
                    x.html ( "<p>Pedido Eliminado Correctamente</p>");
                    
                    exito();
                    ocultar();
                    setTimeout(function(){
                        cargarTablaP();
                    },2500);
                    
              } else if(json.msj == "imposible") {

                    x.html ( "<p>Es Imposible Deshacer el Pedido</p>");
                    
                    error();
                    ocultar();

              }else{

                    x.html ( "<p>Error al Deshacer Pedido</p>");
                    
                    error();
                    ocultar();

              }
            
        });

    }
    
    
    function cargarTablaP(){
        var x = $("#mensaje");
        cargando();
        x.html ("<p>Cargando...</p>");
        x.show("speed");
        
        
        var inicio = $("#inicio").val();
        var fin = $("#fin").val();
        var codigo = $("#producto").val();
        
        var data = { 
            idProducto: codigo,
            inicio: inicio,
            fin: fin
            
        };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/tablaCargaProducto",
            data: data
        }).done(function(msg) {

            //var json = eval("(" + msg + ")");
            $("#cargaTabla").html(msg);
            ocultar();
            
        });

    }
    
    $("#codigo2").keypress(function (e){
        
                var key = e.keyCode || e.which;
                if (key === 13) {
                    codigoBarras();
                }
        });
        
    function codigoBarras() {
        
        var codigo = $("#codigo2").val();

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/consultarProductoByCodigo",
            data: { codigo: codigo }
        })
                .done(function (msg) {
                    var json = eval("(" + msg + ")");

                    $("#producto").val(json.idProducto);
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
    
    <h2>Carga por producto</h2><br>
    <h3>Ingrese la fecha que desea consultar</h3><br>
    <table width="100%">
        <tr>
            <td align="right">Fecha Incio:</td>
            <td><input type="date" class="box-text" id="inicio"></td>
            <td align="right">Fecha Final:</td>
            <td><input type="date" class="box-text" id="fin"></td>
            
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td align="left">Producto:</td>
            <td></td>
        </tr>
        <tr>
            <td style="margin-left: 10px"><input type="text" id="codigo2" placeholder="Codigo Barras" class="box-text" style="margin-left: 10px"/></td>
            <td><select id="producto" class="box-text" >
                    <?php foreach($productos as $pro){ ?>
                        <option value="<?php echo $pro->getIdProducto(); ?>"><?php echo $pro->getNombre();?></option>
                    <?php } ?>
                </select></td>
        </tr>
        <tr>
            <td style="text-align:right;"><button type="submit" class="button orange large" onclick="cargarTablaP()">Buscar</button></td>
            <td></td>
        </tr>
    </table>
    
    <div id="cargaTabla"></div>
</div>