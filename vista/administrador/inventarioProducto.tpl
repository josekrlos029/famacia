</head>
<script type="text/javascript">

function agregarPresentacion(){
    var x = $("#mensaje");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("slow");
        
        var idProducto = $("#codProducto").val();
        var nombre = $("#nombrePresentacionProducto").val();
        var cantidad = $("#cantidadPresentacionProducto").val();
        var data = { 
            idProducto: idProducto,
            nombre: nombre,
            cantidad: cantidad
        };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/agregarPresentacion",
            data: data
        }).done(function(msg) {

            var json = eval("(" + msg + ")");
              document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'
            if (json == "exito") {

                  x.html ( "<p>Presentación Agregada Correctamente</p>");
                  exito();
                  ocultar();
                  
            } else if(json == 23000) {

                  limpiarCajas();
                  x.html ( "<p>Error al Agregar Presentación</p>");
                  error();
                  ocultar();

            }else{
                limpiarCajas();
                  x.html ( "<p>Error al Agregar Presentación</p>");
                  error();
                  ocultar();
            }
            consultaProducto(idProducto);
        });
}

function eliminarPresentacion(idPresentacion){
    var x = $("#mensaje");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("slow");
        
        var idProducto = $("#codProducto").val();
        
        var data = { 
            idPresentacion: idPresentacion
        };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/eliminarPresentacion",
            data: data
        }).done(function(msg) {

            var json = eval("(" + msg + ")");
              document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'
            if (json == "exito") {

                  x.html ( "<p>Presentación ELiminada Correctamente</p>");
                  
                  exito();
                  ocultar();
                  
            } else if(json == 23000) {

                  limpiarCajas();
                  x.html ( "<p>Error al ELiminar Presentación</p>");
                  y.html();
                  error();
                  ocultar();

            }else{
                limpiarCajas();
                  x.html ( "<p>Error al ELiminar Presentación</p>");
                  
                  error();
                  ocultar();
            }
            consultaProducto(idProducto);
        });
}


function agregar() {
        var pr = $("#nombrePresentacion").val();
        var cantidad = $("#cantidadPresentacion").val();
        
        if (cantidad < 1) {
            alert("Digita una Cantidad Validad");
        } else {
            $(".tp").show();
            var band = 0;
            $("#tablePresentaciones .rc").each(function(index) {

                $(this).children("td").each(function(index2) {

                    switch (index2) {
                        case 0:
                            if ($(this).text() == pr) {
                                band = 1;
                                alert("El Producto ya Existe en la tabla de Piezas");
                            }
                            break;
                    }

                });

            });
            if (band == 0) {
                $("#tablePresentaciones").append("<tr class='rc'><td>" + pr + "</td><td>" + cantidad + "</td><td><button class='button small red' onclick='quitarProducto(" + pr + ")'>x</button></td></tr>");
                $("#cant").val("");
                $("#nombrePresentacion").val("");
                $("#cantidadPresentacion").val("");
            }
        }

    }
    
    function quitarProducto(idProducto) {
        $("#tablePresentaciones .rc").each(function(index) {

            var band = false;
            var precio;
            var total;
            $(this).children("td").each(function(index2) {
                switch (index2) {
                    case 0:
                        if ($(this).text() == idProducto) {
                            band = true;
                        }
                        break;
                }

            });
            if (band == true) {
                $(this).remove();

            }

        });
    }

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
            url: "/famacia/administrador/consultarProducto",
            data: data
        }).done(function(msg) {

            var json = eval("(" + msg + ")");
            $("#codProducto").val(json.idProducto);
            $("#nombreProducto").val(json.nombre);
            $("#pVentaProducto").val(json.precio);
            $("#unidades").val(json.unidades);
            $("#unidadPrincipalProducto").val(json.unidadPrincipal);
            $("#ivaProducto").val(json.iva);
            $("#laboratorioProducto").val(json.idLaboratorio);
            $("#estanteProducto").val(json.estante);
            $("#comisionProducto").val(json.comision);
            $("#codigoProducto").val(json.codigoBarras);
            
            $("#tablePresentacionesProducto").html(json.tabla);
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
        var idLaboratorioC = $("#laboratorioProducto").val();
        var pVentaProductoC = $("#pVentaProducto").val();
        var unidadPrincipal = $("#unidadPrincipalProducto").val();
        var iva = $("#ivaProducto").val();
        var comision= $("#comisionProducto").val();
        var estante = $("#estanteProducto").val();
        var codigo = $("#codigoProducto").val();
         
       
        var producto ={ id:codProductoC,          
                        nombre:nombreProductoC,
                        pVenta: pVentaProductoC,
                        unidadPrincipal: unidadPrincipal,
                        iva: iva,
                        comision: comision,
                        codigo: codigo,
                        idLaboratorio:idLaboratorioC,
                        estante: estante
        };
     
        $.ajax({
                
        
                      type: "POST",
                      url: "/famacia/administrador/modificarProducto",
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
                            $("#contenido").load("/famacia/administrador/inventarioProducto");
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
        var precio = $("#precio").val();        
        var unidadPrincipal = $("#unidadPrincipal").val();
        var comision = $("#comision").val();
        var iva = $("#iva").val();
        var codigo = $("#codigo").val();
        var idLaboratorio = $("#laboratorio").val();
        var estante = $("#estante").val();
        
        var arregloPresentaciones = new Array();
            var i = 0;
            $("#tablePresentaciones .rc").each(function(index) {
                var nombre, cantidad;

                $(this).children("td").each(function(index2) {
                    switch (index2) {
                        case 0:
                            nombre = $(this).text();
                            break;
                        case 1:
                            cantidad = $(this).text();
                            break;
                    }
                    $(this).css("background-color", "#ECF8E0");
                });

                arregloPresentaciones[i] = new Array(nombre, cantidad);
                i++;
            });
            
        var presentaciones = JSON.stringify(arregloPresentaciones);
        
        var producto = {
            nombre: nombre,
            precio: precio,
            unidadPrincipal: unidadPrincipal,
            comision: comision,
            iva: iva,
            codigo: codigo,
            presentaciones: presentaciones,
            idLaboratorio: idLaboratorio,
            estante: estante
        };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/registrarProducto",
            data: producto
        })
                .done(function(msg) {

                    var json = eval("(" + msg + ")");

                    if (json == "exito") {

                        x.html("<p>Producto Registrado Correctamente</p>");
                        y.html();
                        exito();
                        ocultar();
                        $("#contenido").load("/famacia/administrador/inventarioProducto");

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
        var idProveedor = $("#pv").val();
        var fechaVencimiento = $("#fechaVencimiento").val();
        
        var x = $("#mensaje");
        var y = $("#overlay");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("speed");
        y.show("speed");

        var producto = {
            idProducto: idProducto,
            precio: precio,
            unidades: unidades,
            idProveedor: idProveedor,
            fechaVencimiento: fechaVencimiento
        };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/registrarIngresoProducto",
            data: producto
        })
                .done(function(msg) {

                    var json = eval("(" + msg + ")");

                    if (json == "exito") {
                        cerrarVentana();
                        x.html("<p>Pedido Registrado Correctamente</p>");
                        y.html();
                        exito();
                        ocultar();
                        $("#contenido").load("/famacia/administrador/inventarioProducto");

                    } else if (json == 23000) {
                        cerrarVentana();
                        x.html("<p>Error al registrar Producto</p>");
                        y.html();
                        error();
                        ocultar();

                    }
                });



    }
    
    function cargarConsultaFecha() {
                $("#cont-consulta").load("/famacia/administrador/cargaFecha");
                $("#titulo").html("<h1>Consultas</h1>");
            }
            
            
            
            function cargarConsultaProducto() {
                $("#cont-consulta").load("/famacia/administrador/cargaProducto");
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
        
        function cerrarVentana(){
            
            document.getElementById('light').style.display = 'none';
            document.getElementById('fade').style.display = 'none';
            
        }
        
        function tablaConsulta(){
         
            var x = $("#mensaje");
            var y = $("#overlay");
            cargando();
            x.html("<p>Cargando...</p>");
            x.show("speed");
            y.show("speed");

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/tablaConsulta",
            data: { }
        })
                .done(function(msg) {

                    $("#tablaConsulta").html(msg);
                    ocultar();

                    
                });
        }
        
        function eliminarPedido(){
            
            
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
            <tr><td style="text-align: left;"><input type="text" id="unidadPrincipal"  required placeholder="Unidad Principal"  class="box-text" ></td></tr>
            <tr><td style="text-align: left;"><input type="number" id="precio" required placeholder="Precio de Venta"  class="box-text" onkeypress="javascript:return validarNro(event)"></td></tr>
            
            <tr><td style="text-align: left;"><input type="text" id="estante" required placeholder="Ubicación"  class="box-text" ></td></tr>
            <tr><td style="text-align: left;">Laboratorio:<select id="laboratorio" class="box-text">
                    <?php foreach($laboratorios as $laboratorio){ ?>
                    <option value="<?php echo $laboratorio->getIdLaboratorio(); ?>"><?php echo $laboratorio->getNombre(); ?></option>
                    <?php } ?>
                        </select></td></tr>
            <tr><td style="text-align: left;">%Iva:<input type="number" id="iva" style="width: 90%" required placeholder="Iva%" value="0" class="box-text" onkeypress="javascript:return validarNro(event)"></td></tr>
            <tr><td style="text-align: left;">Comisiòn:<input type="number" id="comision"  required placeholder="Comisión?" value="0" class="box-text" onkeypress="javascript:return validarNro(event)"></td></tr>
            <tr><td style="text-align: left;"><input type="text" id="codigo" required placeholder="Codigo De Barras"  class="box-text"></td></tr>
            
            <tr style="text-align: left; padding-top: 10px"><td><h2 style="padding-top: 15px">Agregar Presentaciones:</h2></td></tr>
            <tr><td style="text-align: left;"><input type="text" id="nombrePresentacion"  placeholder="Nombre Presentación"  class="box-text" ></td></tr>
            <tr style="text-align: left; padding-top: 10px" ><td style="padding-top: 10px">Cantidad:<input class="box-text" type="number" id="cantidadPresentacion" /></td></tr>
            <tr style="text-align: left; padding-top: 10px"><td style="text-align:center;"><button type="button" onclick="agregar()" class="button orange small" >Agregar </button></td></tr>
            
        </table>
        <table hidden border="0" align="center" width="100%" id="mitabla" class="tp">
            <thead>
            <th width="60%">Nombre</th>
            <th width="10%">cant</th>
            <th width="10%">x</th>
            </thead>
            <tbody id="tablePresentaciones">

            </tbody>
        </table>
         <button type="submit" class="button orange large" >Guardar </button>
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
                <th >Unid. Ppal.</th>
                <th >Unds.</th>
                <th >Cod. Barras</th>
                <th  width="5%">Modificar</th>
            </thead>
            <tbody id="table">
                <?php $prod = new Producto(); 
                    
                    foreach($productos as $producto){ 
                    
                    if($producto->getUnidades() <= 0){
                        $neto = 0;
                    }else{
                        $neto = $producto->getUnidades();
                    }
                ?>
                <tr align="left" class="recorrer">
                    <td ><?php echo $producto->getIdProducto(); ?></td>
                    <td ><?php echo $producto->getNombre(); ?></td>
                    <td ><?php echo $producto->getPrecio(); ?></td>
                    <td ><?php echo $producto->getUnidadPrincipal(); ?></td>
                    <td ><?php echo $producto->getUnidades(); ?></td>
                    <td ><?php echo $producto->getCodigo(); ?></td>
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
    <div id="cont-consulta" style=" margin-top: 3%;margin-left: 1%; float:left; width:45%;">
        <h2>Datos del producto</h2>
        </br>
        <table width="100%">
            <tr style="margin-bottom: 10px">
                <td>
                    Codigo:
                </td>
                <td>
                    <input class="box-text-disable" value="" id="codProducto" type="text" disabled >
                </td>                          
            </tr>
            <tr style="margin-bottom: 10px">
                <td>
                    Nombre del producto:
                </td>
                <td>
                    <input class="box-text" value="" id="nombreProducto" type="text" >
                </td>                          
            </tr>
            <tr style="margin-bottom: 10px">
                <td>
                    Ubicación:
                </td>
                <td>
                    <input class="box-text" value="" id="estanteProducto" type="text" >
                </td>                          
            </tr>
            <tr style="margin-bottom: 10px">
                <td>
                    Ultimo Costo:
                </td>
                <td>
                    <input class="box-text-disable" value="" id="pProveedor" type="number" disabled>
                </td>                          
            </tr>
            <tr style="margin-bottom: 10px">
                <td>
                    Precio Venta:
                </td>
                <td>
                    <input class="box-text" value="" id="pVentaProducto" type="number" >
                </td>                          
            </tr>
            <tr><td style="text-align: left;">Laboratorio:</td><td><select id="laboratorioProducto" class="box-text">
                    <?php foreach($laboratorios as $laboratorio){ ?>
                    <option value="<?php echo $laboratorio->getIdLaboratorio(); ?>"><?php echo $laboratorio->getNombre(); ?></option>
                    <?php } ?>
                        </select></td></tr>
            <tr style="margin-bottom: 10px">
                <td>
                    Existencias:
                </td>
                <td>
                    <input class="box-text-disable" value="" id="unidades" type="number" disabled >
                </td>                          
            </tr>
            <tr style="margin-bottom: 10px">
                <td>
                    Unidad Principal:
                </td>
                <td>
                    <input type="text" class="box-text" id="unidadPrincipalProducto"  required placeholder="Unidad Principal"  class="box-text" >
                </td>                          
            </tr>
            <tr style="margin-bottom: 10px">
                <td>
                    IVA%:
                </td>
                <td>
                    <input type="number" id="ivaProducto" style="width: 90%" required placeholder="Iva%"  class="box-text" onkeypress="javascript:return validarNro(event)">%
                </td>                          
            </tr>
            <tr style="margin-bottom: 10px">
                <td>
                    Comisión:
                </td>
                <td>
                    <input type="number" id="comisionProducto"  required placeholder="Comisión?"  class="box-text" onkeypress="javascript:return validarNro(event)">
                </td>                          
            </tr>
            <tr style="margin-bottom: 10px">
                <td>
                    Codigo de Barras:
                </td>
                <td>
                    <input type="text" id="codigoProducto" required placeholder="Codigo De Barras"  class="box-text">
                </td>                          
            </tr>
            
            <tr>
                <td></td>
                <td><button type="submit" class="button red small" onclick="modificarProducto()">Modificar</button></td>
            </tr>
            
        </table>
    </div>
    <div style=" margin-top: 5%; margin-left:2%;float:right; width: 40%;">
        
        <h2>Gestionar Presentaciones</h2>
        <table>
            <tr><td style="text-align: left;"><input type="text" id="nombrePresentacionProducto" required placeholder="Nombre"  class="box-text" ></td></tr>
            <tr><td style="text-align: left;"><input type="number" id="cantidadPresentacionProducto" required placeholder="Cantidad"  class="box-text" ></td></tr>
            <tr style="text-align: left; padding-top: 10px"><td style="text-align:center;"><button type="button" onclick="agregarPresentacion()" class="button orange small" >Agregar</button></td></tr>
        </table>
        <div id="tablePresentacionesProducto">
            
        </div>
        <br>
        <br>
        <!--
        <form action="javascript: return false;" id="form">
            <table border="0" align="left" width="100%" >
                <tr><td style="text-align: left;"><h2>Registrar Pedidos</h2></td></tr>
                <tr><td style="text-align: left;"><input type="number" id="unidadesP" required placeholder="unidades"  class="box-text" ></td></tr>
                <tr><td style="text-align: left;"><input type="number" id="pProveedorP" required placeholder="Precio Proveedor"  class="box-text" ></td></tr>
                <tr><td style="text-align: left;">Fecha de Vencimiento<input type="date" id="fechaVencimiento" required class="box-text" ></td></tr>
                <tr><td style="text-align: left;">Laboratorio:<select id="pv">
                    <?php foreach($proveedores as $proveedor){ ?>
                    <option value="<?php echo $proveedor->getIdProveedor(); ?>"><?php echo $proveedor->getNombre(); ?></option>
                    <?php } ?>
                        </select></td></tr>
                <tr><td style="text-align:right;"><button type="submit" class="button orange large" onclick="registrarPedido()">Guardar </button></td></tr>
            </table>
        </form> -->
    </div>