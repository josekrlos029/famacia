<style>

	#light {
		margin: 0;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendario {
		width: 700px;
		margin: 40px auto;
	}

</style>
<script type="text/javascript">
    
    var servidor, calendario;
    
    function consultaPorFecha(){
        
        var fecha = $("#fechaC").val();
        var data = {
           fecha: fecha
           
        };
        
        $.ajax({
            type: "POST",
            url: "/palace/administrador/tablaCitas",
            data: data
        }).done(function(msg) {
            $("#cargaTabla").html(msg);
            
        });
        
    }
    
    function buscar() {

        var idServicio = $("#servicio").val();
        $("#consulta").load("/palace/administrador/consultarPersonaPorServicio/" + idServicio);

    }
    
    function guardarCita(){
        $("#msj").text("Cargando");
        var idServicio = $("#servicio").val();
        var idCliente = $("#idCliente").val();
        var idPersona = servidor;
        var fecha = $("#fechaCita").val();
        var hora = $("#horaCita").val();
        var tiempo = $("#tiempo").text();
        var array =hora.split(":");
        var h = array[0];
        var m = array[1];
        var s = array[2];
        var hn = parseInt(h);
        var mn = parseInt(m) + parseInt(tiempo);
        
        if (mn>60){
            hn++;
            mn -= 60;
        }
        
        var data = {
           idServicio : idServicio,
           idCliente : idCliente,
           idPersona : idPersona,
           fecha: fecha,
           hora: hora
        };
        
        $.ajax({
            type: "POST",
            url: "/palace/administrador/guardarCita",
            data: data
        }).done(function(msg) {

            var json = eval("(" + msg + ")");
            $("#msj").text(json.mensaje);
            calendar.fullCalendar('renderEvent',
            {
                    title: json.servicio+" Para: "+json.cliente,
                    start: fecha+" "+hora,
                    end: fecha+" "+hn+":"+mn,
                    allDay: false
            },
            false // make the event "stick"
    );
        
        });
        
        
    }
    
    function consultaDisponibilidad(idPersona) {
        
        var idServicio = $("#servicio").val();
        
        $("#calendario").html("");
        var data = { 
            idPersona: idPersona,
            idServicio: idServicio
        };

        $.ajax({
            type: "POST",
            url: "/palace/administrador/disponibilidadServidor",
            data: data
        }).done(function(msg) {

            var json = eval("(" + msg + ")");
            $("#serv1").text(json.nombreS);
            $("#serv2").text(json.nombre);
            $("#precio").text(json.precio);
            $("#tiempo").text(json.tiempo);
            servidor = json.idPersona;
            calendar = $('#calendario').fullCalendar({
		       header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			editable: false,
			defaultView: 'agendaDay',
			events: json.array,
			loading: function(bool) {
				if (bool) $('#loading').show();
				else $('#loading').hide();
			}
			
		});
        });

        $(".fc-button-today").click();
        document.getElementById('light').style.display = 'block';
        document.getElementById('fade').style.display = 'block';        
        
    }

    
</script>
<div id="cont-form">   
    <table border="0" align="left" width="100%" >
        <tr><td style="text-align: left;"><h2>Servicios</h2></td></tr>

        <tr>
            <td style="text-align: left;">
                <select id="servicio" onchange="buscar();" class="box-text">
                    <option> </option>
                    <?php foreach($servicios as $servicio){ ?>
                    <option value="<?php echo $servicio->getIdServicio(); ?>"><?php echo $servicio->getNombre(); ?></option>
                    <?php } ?>
                </select>
            </td>
        </tr>

    </table> 
    <br>
    <div id="consulta">

    </div>


</div>
<div id="cont-consulta">

    <table border="0" align="right" width="70%">
        <tr><td style="text-align: center;"><h2>Consultar Citas</h2></td>
            <td style="text-align: right;"><input type="date" required class="box-text" id="fechaC"></td>
            <td style="text-align: right;"><button type="submit" class="button small red" onclick="consultaPorFecha()">Consultar</button></td>
    </table>
    <div style="margin-top:10%;" id="cargaTabla">
        <table border="0" align="center" width="100%" id="mitabla">
            <thead>
            <th>Cedula del Cliente</th>
            <th>Nombre del Cliente</th>
            <th>Servicio</th>
            <th>Servidor</th>
            <th>Fecha</th>
            <th >Hora</th>
            
            </thead>
            <tbody>
                <?php foreach($citas as $cita){ ?>
                <tr align="left">
                    <td><?php echo $cita["idCliente"]; ?></td>
                    <td ><?php echo $cita["nombres"]." ".$cita["pApellido"]; ?></td>
                    <td><?php echo $cita["nombre"]; ?></td>
                    <td ><?php echo $cita["nombreCliente"]." ".$cita["apellidoCliente"]; ?></td>
                    <td><?php echo $cita["fecha"]; ?></td>
                    <td><?php echo $cita["hora"]; ?></td>
                    
                </tr>
                <?php } ?>
            </tbody>

        </table>
    </div>

</div>
<div id="fade" class="overlay"></div>
<div id="light" class="modal1">
    <div style="float:right">
        <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display = 'none';
           document.getElementById('fade').style.display = 'none'"><img src="../utiles/image/close.png"/></a>
       
    </div>  
    <div style="margin-top: 5%; margin-left: 10%; float: left">
        <h2>Datos</h2>
           <br><br>
           <table width="200%">
               <tr>
                   <td>
                       Servicio: 
                   </td>
                   <td id="serv1">
                       
                   </td>
                </tr>
                <tr>
                   <td>
                       Servidor:
                   </td>
                
                   <td id="serv2">
                       
                   </td>
               </tr>
               <tr>
                   <td>
                       Precio: 
                   </td>
                   <td id="precio">
                       
                   </td>
                </tr>
                <tr>
                   <td>
                       Duración:
                   </td>
                
                   <td id="tiempo">
                       
                   </td>
               </tr>
               
           </table>
       </div>
    <div style="margin-top: 5%; float: right; margin-right: 10%">
        <h2>Agregar Cita</h2>
           <br><br>
           <table width="70%">
               <tr>
                   <td>
                       <input type="number" id="idCliente"  required>
                   </td>
                </tr>
               <tr>
                   <td>
                       Fecha:
                   </td>
                </tr>
                <tr>
                   <td>
                       <input type="date" id="fechaCita" > 
                   </td>
                </tr>
                <tr>
                   <td>
                       Hora:
                   </td>
                </tr>
                <tr>
                   <td>
                       <input type="time" id="horaCita" > 
                   </td>
               </tr>
               <tr>
                   <td>
                       <button type="submit" class="button small red" onclick="guardarCita()"> Guardar</button>
                   </td>
                   
                </tr>
                <tr>
                   <td>
                       <p id="msj"></p>
                   </td>
                   
                </tr>
                
           </table>
       </div>
    <br>
    <h2 style="margin-left: 10%;margin-top:25%">Horario Servidor</h2>
    <div id="loading"></div>
    <div id="calendario"></div>
   
</div>