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
            url: "/famacia/administrador/tablaConsultaCompras",
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
    
    function consultaCompra(idCompra) {
        var x = $("#mensaje");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("speed");


        var data = { idCompra: idCompra };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/detallesCompra",
            data: data
        }).done(function (msg) {

            $("#cargaDiv").html(msg);
            ocultar();
            document.getElementById('light').style.display = 'block';
            document.getElementById('fade').style.display = 'block';

        });

    }
    
    function eliminarCompra(idCompra) {
        var x = $("#mensaje");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("speed");


        var data = { idCompra: idCompra };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/eliminarCompra",
            data: data
        }).done(function (msg) {
            var json = eval("(" + msg + ")");
            if(json.msj=="exito"){
                x.html("<p>Compra eliminada Correctamente</p>");
                exito();
                ocultar();
                cargarTabla();
            }else{
                x.html("<p>Error al Eliminar Compra</p>");
                error();
            }
         
        });

    }
    
    function eliminarProductoP(idDetalle) {
        var x = $("#mensaje");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("speed");
        document.getElementById('light').style.display = 'none';
        document.getElementById('fade').style.display = 'none';

        var data = { idIngreso: idDetalle };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/eliminarDetalleCompra",
            data: data
        }).done(function (msg) {
            var json = eval("(" + msg + ")");
            if(json.msj=="exito"){
                
                exito();
                x.html("<p>Producto Devuelto Correctamente</p>");
                ocultar();
                cargarTabla();
            }else{
                x.html("<p>Error al Devolver Producto</p>");
                error();
            }
                
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