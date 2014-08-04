
</head>
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
      
        
    function consultaProducto(idProducto) {
        var x = $("#mensaje");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("slow");

        var data = { idProducto: idProducto };

        $.ajax({
            type: "POST",
            url: "/palace/administrador/consultarProducto",
            data: data
        }).done(function(msg) {

            var json = eval("(" + msg + ")");
            $("#codProducto").val(json.idProducto);
            $("#nombreProducto").val(json.nombre);
            $("#tituloProducto").html(json.nombre);
            $("#pVentaProducto").val(json.precio);
            $("#unidades").val(json.unidades);
            $("#pProveedor").val(json.precioFabrica);

            document.getElementById('light').style.display = 'block';
            document.getElementById('fade').style.display = 'block';
            ocultar();
        });


    }
 function modificarProducto(){
   
        var x = $("#mensaje");
        var y = $("#overlay");
        cargando();
        x.html ("<p>Cargando...</p>");
        x.show("speed");
        y.show("speed");
      
        var codProductoC   = $("#codProducto").val();
        var nombreProductoC = $("#nombreProducto").val();
        var pVentaProductoC = $("#pVentaProducto").val();
     ;
       
        var producto ={ codProduct:codProductoC,          
                        nombreProduct:nombreProductoC,
                        pVentaProduct: pVentaProductoC
                    
        };
     
        $.ajax({
                
        
                      type: "POST",
                      url: "/palace/administrador/modificarProducto",
                      data: producto
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
    $("#form").submit(function() {
        var x = $("#mensaje");
        var y = $("#overlay");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("speed");
        y.show("speed");

        var nombre = $("#nombre").val();
        var pVenta = $("#pVenta").val();

        var producto = {
            nombre: nombre,
            pVenta: pVenta
        };

        $.ajax({
            type: "POST",
            url: "/palace/administrador/registrarProducto",
            data: producto
        })
                .done(function(msg) {

                    var json = eval("(" + msg + ")");

                    if (json == "exito") {
                    
                    
                        limpiarCajas();
                        x.html("<p>Producto Registrado Correctamente</p>");
                        y.html();
                        exito();
                        ocultar();


                    } else if (json == 23000) {

                        limpiarCajas();
                        x.html("<p>Error al registrar Producto</p>");
                        y.html();
                        error();
                        ocultar();

                    }
                });



    });
    
    
    function registrarPedido(){
        
        var idProducto = $("#codProducto").val();
        var precio = $("#pProveedorP").val();
        var unidades = $("#unidadesP").val();
        
        var x = $("#mensaje");
        var y = $("#overlay");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("speed");
        y.show("speed");

        var producto = {
            idProducto: idProducto,
            precio: precio,
            unidades: unidades
        };

        $.ajax({
            type: "POST",
            url: "/palace/administrador/registrarIngresoProducto",
            data: producto
        })
                .done(function(msg) {

                    var json = eval("(" + msg + ")");

                    if (json == "exito") {
                    
                        x.html("<p>Pedido Registrado Correctamente</p>");
                        y.html();
                        exito();
                        ocultar();


                    } else if (json == 23000) {
   
                        x.html("<p>Error al registrar Producto</p>");
                        y.html();
                        error();
                        ocultar();

                    }
                });



    }
    
    function cargarConsultaFecha() {
                $("#cont-consulta").load("/palace/administrador/cargaFecha");
                $("#titulo").html("<h1>Consultas</h1>");
            }
            
            
            
            function cargarConsultaProducto() {
                $("#cont-consulta").load("/palace/administrador/cargaProducto");
                $("#titulo").html("<h1>Consultas</h1>");
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
    <form action="javascript: return false;" id="form">
        <table border="0" align="left" width="100%" >
            <tr><td style="text-align: left;"><h2>Registro de Productos</h2></td></tr>
            <tr><td style="text-align: left;"><input type="text" id="nombre" required placeholder="Nombre del Producto"  class="box-text" ></td></tr>
            <tr><td style="text-align: left;"><input type="text" id="pVenta" required placeholder="Precio Venta"  class="box-text" onkeypress="javascript:return validarNro(event)"></td></tr>
            <tr><td style="text-align:right;"><button type="submit" class="button orange large" >Guardar </button></td></tr>
        </table>
        
        <div>
        <h2 >Consultas</h2>
        </div>
        <table border="0" align="left" width="100%" >
                    
                     <tr><td style="text-align: left;"><a onclick="cargarConsultaFecha()" href="#">Consultar carga por fecha</a></td></tr> 
                     <tr><td style="text-align: left;"><a onclick="cargarConsultaProducto()" href="#">Consultar carga por producto</a></td>      
                     
        </table>
    </form> 
    
    


</div>
<div id="cont-consulta">

    <table border="0" align="right" width="70%">
        <tr><td style="text-align: center;"><h2>Consultar Productos</h2></td>
            <td style="text-align: right;"><input type="text" name="idPersona" required placeholder="Buscar" id="filter" class="box-text" ></td>
    </table>

   <div id="tablaConsulta"> 
        <table border="0" align="center" width="100%" id="mitabla">
            <thead>
            <th >Codigo</th>
            <th width="30%">Nombre</th>
            <th >Precio Venta</th>
            <th >Unds disponibles</th>
            <th  width="5%">pedidos</th>
            </thead>
            <tbody id="table">
                <?php foreach($productos as $producto){ ?>
                <tr align="left" class="recorrer">
                    <td ><?php echo $producto->getIdProducto(); ?></td>
                    <td ><?php echo $producto->getNombre(); ?></td>
                    <td ><?php echo $producto->getPrecioVenta(); ?></td>
                    <td ><?php echo $producto->getUnidades(); ?></td>
                    <td style="text-align:right;"><button class="button red small" onclick="consultaProducto('<?php echo $producto->getIdProducto();?>');">...</button></td>
                </tr>
                <?php } ?>
            </tbody>

        </table>
    </div>
</div>


<div id="fade" class="overlay"></div>
<div id="light" class="modal">
    <div style="float:right">
        <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display = 'none';
                document.getElementById('fade').style.display = 'none'"><img src="../utiles/image/close.png"/></a>
    </div>
    <div id="cont-consulta" style=" margin-top: 5%;margin-left: 5%; float:left; width:45%;">
        <h2>Datos del producto</h2>
        </br>
        <table width="100%">
            <tr>
                <td>
                    Codigo:
                </td>
                <td>
                    <input class="box-text-disable" value="" id="codProducto" type="text" disabled >
                </td>                          
            </tr>
            <tr>
                <td>
                    Nombre del producto:
                </td>
                <td>
                    <input class="box-text" value="" id="nombreProducto" type="text" >
                </td>                          
            </tr>
            <tr>
                <td>
                    Precio Proveedor:
                </td>
                <td>
                    <input class="box-text-disable" value="" id="pProveedor" type="number" disabled>
                </td>                          
            </tr>
            <tr>
                <td>
                    Precio Venta:
                </td>
                <td>
                    <input class="box-text" value="" id="pVentaProducto" type="number" >
                </td>                          
            </tr>
            <tr>
                <td>
                    Unidades Disponibles:
                </td>
                <td>
                    <input class="box-text-disable" value="" id="unidades" type="number" disabled >
                </td>                          
            </tr>
            <tr>
                <td></td>
                <td><button type="submit" class="button red small" onclick="modificarProducto()">Modificar</button></td>
            </tr>
        </table>
    </div>
    <div style=" margin-top: 5%; margin-left:5%;float:right; width: 40%;">
        <form action="javascript: return false;" id="form">
            <table border="0" align="left" width="100%" >
                <tr><td style="text-align: left;"><h2>Registrar Pedidos</h2></td></tr>
                <tr><td style="text-align: left;"><h1 id="tituloProducto"></h1></td></tr>
                <tr><td style="text-align: left;"><input type="number" id="unidadesP" required placeholder="unidades"  class="box-text" ></td></tr>
                <tr><td style="text-align: left;"><input type="number" id="pProveedorP" required placeholder="Precio Proveedor"  class="box-text" ></td></tr>
                <tr><td style="text-align:right;"><button type="submit" class="button orange large" onclick="registrarPedido()">Guardar </button></td></tr>
            </table>
        </form> 

    </div>