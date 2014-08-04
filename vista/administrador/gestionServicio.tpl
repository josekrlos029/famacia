   <script type="text/javascript">
$('#filter').keyup(function(){
    var table = $('#table');
    var value = this.value;
    table.find('.recorrer').each(function(index, row) {
        var allCells = $(row).find('td');
        if(allCells.length > 0) {
            var found = false;
            allCells.each(function(index, td) {
                var regExp = new RegExp(value, 'i');
                if(regExp.test($(td).text())) {
                    found = true;
                    return false;
                }
            });
            if (found == true) $(row).show();
            else $(row).hide();
        }
    });
});       
   function consultaServicio(codServicio) {
        var x = $("#mensaje");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("slow");

        var data = { idServicio: codServicio };

        $.ajax({
            type: "POST",
            url: "/palace/administrador/consultarServicio",
            data: data
        }).done(function(msg) {

            var json = eval("(" + msg + ")");
            $("#codServicio").val(json.idServicio);
            $("#nombreServicio").val(json.nombre);
            
            $("#pServicio").val(json.precio);
            
            $("#tServicio").val(json.tiempo);

            document.getElementById('light').style.display = 'block';
            document.getElementById('fade').style.display = 'block';
            ocultar();
        });


    }   

$("#form").submit(function(){
        
        var x = $("#mensaje");
        var y = $("#overlay");
        cargando();
        x.html ("<p>Cargando...</p>");
        x.show("slow");
        y.show("speed");
 
        
        var nombre = $("#nombre").val();
        var tiempo = $("#tiempo").val();
        var precio = $("#precio").val();
        
        var servicio ={ nombre:nombre,
                    tiempo:tiempo,
                    precio:precio                    
        };
        
        $.ajax({
                      type: "POST",
                      url: "/palace/administrador/registrarServicio",
                      data: servicio
                  })
                  .done(function(msg) {
                      
                      var json = eval("(" + msg + ")");
              
                      if (json == "exito") {
                      
                            limpiarCajas();
                            x.html ( "<p>Servicio Registrado Correctamente</p>");
                            y.html();
                            exito();
                            ocultar();
                         

                      } else if(json == 23000) {

                            limpiarCajas();
                            x.html ( "<p>Error al registrar Servicio</p>");
                            y.html();
                            error();
                            ocultar();

                      }
                  });
        
    });
    
    function modificarServicio(){
   
        var x = $("#mensaje");
        var y = $("#overlay");
        cargando();
        x.html ("<p>Cargando...</p>");
        x.show("speed");
        y.show("speed");
      
        var codServicioC   = $("#codServicio").val();
        var nombreServicioC = $("#nombreServicio").val();
        var tServicioC = $("#tServicio").val();
        var pServicioC = $("#pServicio").val();
     
       
        var servicio ={ codServic:codServicioC,          
                        nombreServic:nombreServicioC,
                        tServic:tServicioC,
                        pServic: pServicioC
                    
        };
     
        $.ajax({
                
        
                      type: "POST",
                      url: "/palace/administrador/modificarServicio",
                      data: servicio
                  })
                  .done(function(msg) {
                      
                      var json = eval("(" + msg + ")");
                     
                      if (json == "exito") {
                      
                         document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'
                         
                            
                            x.html ( "<p>Producto Modificado Correctamente</p>");
                            y.html();
                            exito();
                            ocultar();
                      } else if(json == 23000) {

                            limpiarCajas();
                            x.html ( "<p>Error al Modificar Producto</p>");
                            y.html();
                            error();
                            ocultar();

                      }
                  });
    }
    function validarNro(e) {
           var key;
            if(window.event) // IE
	         {
	             key = e.keyCode;
	         }
             else if(e.which) // Netscape/Firefox/Opera
	         {
	            key = e.which;
	         }

                if (key < 48 || key > 57)
                {
                  if(key == 46 || key == 8) // Detectar . (punto) y backspace (retroceso)
                { return true; }
             else 
               { return false; }
               }
              return true;
             }

    function validar_texto(e) {
           tecla = (document.all) ? e.keyCode : e.which;

            //Tecla de retroceso para borrar, siempre la permite
             if (tecla==8) return true; 

             // Patron de entrada, en este caso solo acepta letras
                 patron =/[A-Za-z\s]/; 

                   tecla_final = String.fromCharCode(tecla);
                  return patron.test(tecla_final); 
        } 
</script>
<div  id="overlay"></div>
            <div  id="mensaje">
              <div style="float:right">
                  <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><img src="../utiles/image/close.png"/></a>
             </div>
                
            </div>
<div id="cont-form">
    <form id="form" action="javascript: return false;">
     <table border="0" align="left" width="100%" >
                     <tr><td style="text-align: left;"><h2>Registro de Servicio</h2></td></tr>
                  
 
                    <tr><td style="text-align: left;"><input type="text" id="nombre" required placeholder="Nombre del Servicio"  class="box-text" ></td></tr> 
                    <tr><td style="text-align: left;"><input type="number" id="tiempo" required placeholder="Tiempo de duracion en min."  class="box-text" onkeypress="javascript:return validarNro(event)"></td>      
                    <tr><td style="text-align: left;"><input type="number" id="precio" required placeholder="Precio"  class="box-text" onkeypress="javascript:return validarNro(event)"></td></tr>
                     
                    

                    <tr><td style="text-align:right;"><button type="submit" class="button orange large" >Guardar</button></td></tr>
                </table>
    </form>
 </div>
 <div id="cont-consulta">
   
                <table border="0" align="right" width="70%">
                     <tr><td style="text-align: center;"><h2>Consultar Servicios</h2></td>
                         <td style="text-align: right;"><input type="text" name="idServicio" required placeholder="Buscar" id="filter" class="box-text" ></td>
                </table>
                <div style="margin-top:10%;">
                 <table border="0" align="center" width="100%" id="mitabla">
                      <thead>
                         <th >COD del Servicio</th>
                         <th width="30%">Servicio</th>
                         <th >Tiempo</th>
                          <th >Precio</th>
                          <th></th>
                         </thead>
                         <tbody id="table">
                      <?php foreach($servicios as $servicio){ ?>
                      <tr align="left" class="recorrer">
                         <td ><?php echo $servicio->getIdServicio(); ?></td>
                         <td ><?php echo $servicio->getNombre(); ?></td>
                         <td ><?php echo $servicio->getTiempo(); ?></td>
                         <td ><?php echo $servicio->getPrecio(); ?></td>
                         <td style="text-align:right;"><button type="submit" class="button small red"  onclick="consultaServicio('<?php echo $servicio->getIdServicio(); ?>');">...</button></td>
                         </tr>
                      <?php } ?>   
                         </tbody>
                     
                </table>
                </div>
                 
                </div>
                <div id="fade" class="overlay"></div>
            <div id="light" class="modal">
              <div style="float:right">
                  <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><img src="../utiles/image/close.png"/></a>
             </div>
                 <div style=" margin-top: 5%;margin-left: 5%; float:left; width:45%;">
        <h2>Datos del producto</h2>
        </br>
        <table width="100%">
            <tr>
                <td>
                    Codigo:
                </td>
                <td>
                    <input class="box-text-disable" value="" id="codServicio" type="text" disabled >
                </td>                          
            </tr>
            <tr>
                <td>
                    Nombre del servicio:
                </td>
                <td>
                    <input class="box-text" value="" id="nombreServicio" type="text" >
                </td>                          
            </tr>
            <tr>
                <td>
                    Tiempo estimado:
                </td>
                <td>
                    <input class="box-text" value="" id="tServicio" type="number" >
                </td>                          
            </tr>
            <tr>
                <td>
                    Precio:
                </td>
                <td>
                    <input class="box-text" value="" id="pServicio" type="number" >
                </td>                          
            </tr>
            
            <tr>
                <td></td>
                <td><button type="submit" class="button red small" onclick="modificarServicio()">Modificar</button></td>
            </tr>
        </table>
    </div>
                
            </div>
                  