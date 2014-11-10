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
    
    
     function consultaPersona(idProveedor) {
        var x = $("#mensaje");
        cargando();
        x.html ("<p>Cargando...</p>");
        x.show("speed");
      
        var data = { idProveedor: idProveedor };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/consultarProveedor",
            data: data
        }).done(function(msg) {

            var json = eval("(" + msg + ")");
            $("#idProveedor").val(json.idProveedor);
            $("#nombreP").val(json.nombre);
            $("#descripcionP").val(json.descripcion);
            ocultar();
            document.getElementById('light').style.display = 'block';
            document.getElementById('fade').style.display = 'block';
            
        });


    }  
    
function modificarPersona(){
   
        var x = $("#mensaje");
        var y = $("#overlay");
        cargando();
        x.html ("<p>Cargando...</p>");
        x.show("speed");
        y.show("speed");
      
 
        var idProveedor = $("#idProveedor").val();
        var nombre = $("#nombreP").val();
        var descripcion = $("#descripcionP").val();
        
        var persona ={ idProveedor:idProveedor,
                    nombre: nombre,
                    descripcion: descripcion
        };
        
        $.ajax({
                      type: "POST",
                      url: "/famacia/administrador/modificarProveedor",
                      data: persona
                  })
                  .done(function(msg) {
                      
                      var json = eval("(" + msg + ")");
              
                      if (json == "exito") {
                      
                         document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'
                         
                            
                            x.html ( "<p>Proveedor Modificado Correctamente</p>");
                            y.html();
                            exito();
                            ocultar();
                      } else if(json == 23000) {

                            limpiarCajas();
                            x.html ( "<p>Error al Modificar Proveedor</p>");
                            y.html();
                            error();
                            ocultar();

                      }
                  });
    }

    $("#form").submit(function() {

        var x = $("#mensaje");
        var y = $("#overlay");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("slow");
        y.show("speed");

        var descripcion = $("#descripcion").val();
        var nombre = $("#nombre").val();
        
        var persona ={
                    descripcion: descripcion,
                    nombre: nombre
        };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/registrarProveedor",
            data: persona
        })
                .done(function(msg) {

                    var json = eval("(" + msg + ")");

                    if (json == "exito") {

                        limpiarCajas();
                        x.html("<p>Proveedor Registrado Correctamente</p>");
                        y.html();
                        exito();
                        ocultar();


                    } else if (json == 23000) {

                        limpiarCajas();
                        x.html("<p>Error al registrar Proveedor</p>");
                        y.html();
                        error();
                        ocultar();

                    }
                });

    });
    
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
        <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display = 'none';
                document.getElementById('fade').style.display = 'none'"><img src="../utiles/image/close.png"/></a>
    </div>

</div>
<div id="cont-form">   
    <form id="form" action="javascript: return false;">
        <table border="0" align="left" width="100%" >
            <tr><td style="text-align: left;"><h2>Registro de Proveedores</h2></td></tr>
            <tr><td style="text-align: left;"><input type="text" name="nombre" id="nombre" required placeholder="Nombre"  class="box-text"></td></tr> 
            <tr><td style="text-align: left;"><textarea id="descripcion" rows="5" cols="30" placeholder="Descripción"></textarea></td></tr>
            <tr><td style="text-align:right;"><button type="submit" class="button orange large"  >Guardar</button></td></tr>
        </table>
    </form>
</div>

<div id="cont-consulta">

    <table border="0" align="right" width="70%">
        <tr><td style="text-align: center;"><h2>Consulta de Proveedores</h2></td>
            <td style="text-align: right;"><input type="text" name="idPersona" required placeholder="Buscar" class="box-text" id="filter"></td>
    </table>

    <div style="margin-top:10%;">
        <table border="0" align="center" width="100%" id="mitabla" >
            <thead>
            <th>Cod</th>
            <th>Nombre</th>
            <th>Descripcion</th>
            <th width="5%"></th>
            </thead>
            <tbody id="table">
                <?php foreach($proveedores as $proveedor){ ?>
                <tr class="recorrer" align="left">
                    <td width="20%"><?php echo $proveedor->getIdProveedor(); ?></td>
                    <td width="30%"><?php echo $proveedor->getNombre(); ?></td>
                    <td width="30%" ><?php echo $proveedor->getDescripcion(); ?></td>
                    <td width="5%" style="text-align:right;"><buttom type="submit" class="button small red"  onclick="consultaPersona('<?php echo $proveedor->getIdProveedor(); ?>');">...</buttom></td> 
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
        <h2>Datos del Empleado</h2>
        </br>
        <table width="100%">
            <tr>
                <td>
                    Código:
                </td>
                <td>
                    <input class="box-text-disable" value="" id="idProveedor" type="text" disabled >
                </td>                          
            </tr>
            <tr>
                <td>
                    Nombre:
                </td>
                <td>
                    <input class="box-text" value="" id="nombreP" type="text" >
                </td>                          
            </tr>
            <tr>
                <td>
                    Descripción:
                </td>
                <td>
                    <input class="box-text" value="" id="descripcionP" type="text">
                </td>                          
            </tr>
           <tr><td align="right"><button type="submit" class="button red small" onclick="modificarPersona()">Modificar</button></td></tr>
        </table>
        </div>
    <div style=" margin-top: 5%; margin-left:5%;float:right; width: 40%;" id="vistaServicios">
        
    </div>
    </div>  
          
