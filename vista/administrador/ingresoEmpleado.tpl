<script>
    function cargarTabla(){
        var x = $("#mensaje");
        cargando();
        x.html ("<p>Cargando...</p>");
        x.show("speed");
        
        var idPersona = $("#idPersona").val();
        var inicio = $("#inicio").val();
        var fin = $("#fin").val();
        var data = { 
            idPersona: idPersona,
            inicio: inicio,
            fin: fin
        };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/tablaIngresoEmpleado",
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
    
    <h2>Ingreso por Empleados</h2><br>
    <table width="100%">
        <tr>
            <td align="right">Fecha Inicio:</td>
            <td><input type="date" class="box-text" id="inicio"></td>
            <td align="right">Fecha Final:</td>
            <td><input type="date" class="box-text" id="fin"></td>
        </tr>
    </table>
    <div style="margin-left: 17%;">
    <table  width="100%">
        <tr>
            
                    <td width="40%"><select class="box-text" id="idPersona">
                                        <?php foreach($empleados as $e){ ?>
                                        <option value="<?php echo $e->getIdPersona(); ?>"><?php echo $e->getNombres()." ".$e->getPApellido(); ?></option>
                                        <?php } ?>
                                    </select></td>
            <td align="right" style="text-align:right;"><button type="submit" class="button orange large" onclick="cargarTabla()" >Buscar</button></td>
        </tr>
    </table>
    </div>    
    <div id="cargaTabla"></div>
</div>