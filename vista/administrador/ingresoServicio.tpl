<script>
    function cargarTabla(){
        var x = $("#mensaje");
        cargando();
        x.html ("<p>Cargando...</p>");
        x.show("speed");
        
        var idServicio = $("#idServicio").val();
        var inicio = $("#inicio").val();
        var fin = $("#fin").val();
        var data = { 
            idServicio: idServicio,
            inicio: inicio,
            fin: fin
        };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/tablaIngresoServicio",
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
    
    <h2>Ingreso por servicio</h2><br>
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
            <td align="right" width="18%">Servicio:</td>
            <td> 
                <select class="box-text" id="idServicio">
                <?php foreach($servicios as $ser){ ?>
                        <option value="<?php echo $ser->getIdServicio(); ?>"><?php echo $ser->getNombre();?></option>
                        <?php } ?>
            </select>
            </td>    
            <td style="text-align:right;"><button type="submit" class="button orange large" onclick="cargarTabla()" >Buscar</button></td>
        </tr>
    </table>
    <div id="cargaTabla"></div>
</div>