<script>
    function cargarTabla(){
        var x = $("#mensaje");
        cargando();
        x.html ("<p>Cargando...</p>");
        x.show("speed");
        
        var idProducto = $("#producto").val();
        var inicio = $("#inicio").val();
        var fin = $("#fin").val();
        var data = { 
            idProducto: idProducto,
            inicio: inicio,
            fin: fin
        };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/tablaCargaFecha",
            data: data
        }).done(function(msg) {

            //var json = eval("(" + msg + ")");
            $("#cargaTabla").html(msg);
            ocultar();
            
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
    
    <h2>Carga por fecha</h2><br>
    <h3>Ingrese la fecha que desea consultar</h3><br>
    <table width="100%">
        <tr>
            <td align="right">Fecha Incio:</td>
            <td><input type="date" class="box-text" id="inicio"></td>
            <td align="right">Fecha Final:</td>
            <td><input type="date" class="box-text" id="fin"></td>
            
        </tr>
    </table>
    <div style="margin-left: 80%;">
        <button type="submit" class="button orange large" onclick="cargarTabla()">Buscar</button>
    </div>
    
    <div id="cargaTabla"></div>
</div>