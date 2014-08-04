<html>

    <script>

        function quitarProducto(idProducto){
            $("#tProductos .rc").each(function(index) {
                
                var band = false; var precio; var total;
                $(this).children("td").each(function(index2) {
                    switch (index2) {
                        case 0:
                            if($(this).text()== idProducto){
                                band=true;
                            }
                            break;
                        case 4:
                            precio = $(this).text();
                    }
                    
                });
                if (band==true){
                    $(this).remove();
                    total = parseInt($("#total").val());
                    precio = parseInt(precio);
                    $("#total").val(total- precio);
                }
                    
            });
        }
        
        function quitarServicio(idServicio){
            $("#tServicios .rs").each(function(index) {
                var band = false; var precio; var total;

                $(this).children("td").each(function(index2) {
                    switch (index2) {
                        case 0:
                             if($(this).text()== idServicio){

                                band = true;
                            }
                            break;
                        case 4:
                            precio = $(this).text();    
                                                
                    }
                   
                });
               if (band==true){
                    $(this).remove();
                    total = parseInt($("#total").val());
                    precio = parseInt(precio);
                    
                    $("#total").val(total- precio);
                } 
            });
        }

        function guardar() {
            
            if($("#idPersona").val()== null || $("#idPersona").val()== "" || $("#nombre").val()== "No existe en la Base de Datos"){
                alert("Por Favor seleccione un Cliente Valido");
            }else{
            
            var x = $("#mensaje");
            cargando();
            x.html ("<p>Cargando...</p>");
            x.show("speed");
            
            var arregloServicios = new Array();
            var i =0;
            $("#tServicios .rs").each(function(index) {
                var idServicio, nombreServicio, nombreServidor, idPersona, precio;

                $(this).children("td").each(function(index2) {
                    switch (index2) {
                        case 0:
                            idServicio = $(this).text();
                            break;
                        case 1:
                            nombreServicio = $(this).text();
                            break;
                        case 2:
                            nombreServidor = $(this).text();
                            break;
                        case 3:
                            idPersona = $(this).text();
                            break;
                        case 4:
                            precio = $(this).text();
                            break;
                        
                    }
                    $(this).css("background-color", "#ECF8E0");
                });
                arregloServicios[i] = new Array(idServicio, idPersona, precio);
                i++;
            });

            var arregloProductos = new Array();
            i =0;
            $("#tProductos .rc").each(function(index) {
                var idProducto, nombreProducto, cantidad, precio, subtotal;

                $(this).children("td").each(function(index2) {
                    switch (index2) {
                        case 0:
                            idProducto = $(this).text();
                            break;
                        case 1:
                            nombreProducto = $(this).text();
                            break;
                        case 2:
                            cantidad = $(this).text();
                            break;
                        case 3:
                            precio = $(this).text();
                            break;
                        case 4:
                            subtotal = $(this).text();
                            break;
                        
                    }
                    $(this).css("background-color", "#ECF8E0");
                });
                arregloProductos[i] = new Array(idProducto, cantidad, precio);
                i++;
            });
            var servicios = JSON.stringify(arregloServicios);
            var productos = JSON.stringify(arregloProductos);
            
            var factura = {
                idPersona: $("#idPersona").val(),
                servicios: servicios,
                productos: productos
            };
            
            $.ajax({
                    type: "POST",
                    url: "/palace/administrador/guardarFactura",
                    data: factura
                })
                        .done(function(msg) {
                            var json = eval("(" + msg + ")");
                            if(json.respuesta == "exito"){
                                x.html ( "<p>Factura Guardada Correctamente</p>");
                                window.open("/palace/administrador/generarFactura/"+json.idFactura);
                                exito();
                                ocultar();
                            }else{
                                x.html ( "<p>Error al Guardar Factura</p>");

                                error();
                                ocultar();
                            }
                            
                });
            
        }
        }



        $('#idPersona').keypress(function(event) {
            var keycode = (event.which) ? event.which : event.keyCode;
            
            if (keycode == '13') {
                $.ajax({
                    type: "POST",
                    url: "/palace/administrador/consultarNombrePersona",
                    data: { idPersona: $("#idPersona").val() }
                })
                        .done(function(msg) {
                            var json = eval("(" + msg + ")");

                            $("#nombre").html(json);
                            $("#idPersona").attr("disabled","disabled");
                        });
            } else if (keycode == '8' || keycode == '46') {

                $("#nombre").html("");

            }
        });

        function producto() {
            $("#servicio").attr("disabled", "disabled");
            $("#servicio").css("background-color", "#B5A6A6");
            $("#servidor").attr("disabled", "disabled");
            $("#servidor").css("background-color", "#B5A6A6");

            var idProducto = $("#producto").val();

            $.ajax({
                type: "POST",
                url: "/palace/administrador/consultarProducto",
                data: { idProducto: idProducto }
            })
                    .done(function(msg) {
                        var json = eval("(" + msg + ")");

                        $("#precioUnid").val(json.precio);
                        $("#precioTotal").val(json.precio);
                        $("#cantidad").val("1");
                    });

        }

        $("#cantidad").keyup(function() {

            var precio = parseInt($("#precioUnid").val());
            var cantidad = parseInt($("#cantidad").val());
            
            $("#precioTotal").val(precio * cantidad);

        });

        function limpiar() {
            $("#servicio").removeAttr("disabled");
            $("#servicio").css("background-color", "#fffff");
            $("#servidor").removeAttr("disabled");
            $("#servidor").css("background-color", "#fffff");
            $("#producto").removeAttr("disabled");
            $("#producto").css("background-color", "#fffff");
            $("#cantidad").removeAttr("disabled");
            $("#cantidad").css("background-color", "#fffff");
            
            $("#precioTotal").css("background-color", "#fffff");
            $("#modPrecio").css("display", "none");
            $("#servicio").val("");
            $("#servidor").val("");
            $("#producto").val("");
            $("#cantidad").val("");
            $("#precioUnid").val("");
            $("#precioTotal").val("");

    }
    
    function consultarTotal(){
        
            var suma =0;
            $("#tServicios .rs").each(function(index) {
                

                $(this).children("td").each(function(index2) {
                    switch (index2) {
                        
                        case 4:
                            suma += parseInt($(this).text());
                            break;
                        
                    }
                    
                });
                
            });

            
            $("#tProductos .rc").each(function(index) {
                

                $(this).children("td").each(function(index2) {
                    switch (index2) {
                        
                        case 4:
                            suma += parseInt($(this).text());
                            break;
                        
                    }
                    
                });
                
            });
            
            $("#total").val(suma);
    }

        function servidores() {

            var servicio = document.getElementById("servicio").value;
            
            $("#producto").val("");
            
            $.ajax({
                type: "POST",
                url: "/palace/administrador/listarServidores/" + servicio,
                data: {}
            })
                    .done(function(msg) {
                        $("#servidor").html(msg);
                    });
            $("#producto").attr("disabled", "disabled");
            $("#producto").css("background-color", "#B5A6A6");
            $("#cantidad").attr("disabled", "disabled");
            $("#cantidad").css("background-color", "#B5A6A6");
            $("#precioUnid").attr("disabled", "disabled");
            $("#precioTotal").attr("disabled", "disabled");
            $("#precioTotal").css("background-color", "#B5A6A6");

            $.ajax({
                type: "POST",
                url: "/palace/administrador/consultarServicio",
                data: {idServicio: servicio}
            })
                    .done(function(msg) {
                        var json = eval("(" + msg + ")");

                        $("#precioUnid").val(json.precio);
                        $("#modPrecio").css("display", "block");
                    });
                    
}
        

        function habilitarPrecio() {
            $("#precioUnid").removeAttr("disabled");
        }
        function agregarProducto() {
            var producto = $("#producto  option:selected").html();
            var idProducto = $("#producto").val();
            var idServicio = $("#servicio").val();
            var servicio = $("#servicio  option:selected").html();
            var servidor = $("#servidor  option:selected").html();
            var idServidor = $("#servidor").val();
            var cantidad = $("#cantidad").val();
            var precioU = $("#precioUnid").val();
            var precioT = $("#precioTotal").val();
            

            if ($("#servicio").attr("disabled") == "disabled") {
                //Agregar Producto
                var band =0;
                $("#tProductos .rc").each(function(index) {
                var x, c, preu;
                $(this).children("td").each(function(index2) {
                    
                    switch (index2) {
                        case 0:
                            if( $(this).text()== idProducto){
                             band=1;
                             x=prompt("El Producto ya Existe en la factura \nElige una de las Siguientes opciones DIGITANDO SOLO EL NUMERO DE LA OPCIÓN \n \n 1. Reemplazar Cantidad \n 2. Añadir Cantidad","");
                            }
                            break;
                        
                        case 2:
                            
                            if(x == "1"){
                                
                                $(this).text(cantidad);
                                 c= parseInt(cantidad);
                            }else if(x=="2"){
                                var cant = $(this).text();
                                cant = parseInt(cant);
                                cantidad = parseInt(cantidad);
                                c=cant + cantidad;
                                $(this).text(c);
                            } else{
                                var cant = $(this).text();
                                c =parseInt(cant);
                            }
                            break;
                        case 3:
                            preu = parseInt($(this).text());
                            
                            break;
                        case 4:
                            $(this).text(preu*c);
                            break;
                        
                    }
                   
                });
                
                });
                if(band==0){
                    $("#tProductos").append("<tr class='rc'><td>" + idProducto + "</td><td>" + producto + "</td><td>" + cantidad + "</td><td>" + precioU + "</td><td>" + precioT + "</td><td><button class='button small red' onclick='quitarProducto("+idProducto+")'>x</button></td></tr>");
                }  
            } else if ($("#producto").attr("disabled") == "disabled") {
                //Agregar Servicio
                $("#tServicios").append("<tr class='rs'><td>" + idServicio + "</td><td>" + servicio + "</td><td>" + servidor + "</td><td hidden>" + idServidor + "</td><td>" + precioU + "</td><td><button class='button small red' onclick='quitarServicio("+idServicio+")'>x</button></td></tr>");
            }

            limpiar();
            consultarTotal();
            //$("#detallesProducto").append("<tr><td>"+producto+"</td><td>"+cantidad+"</td><td></td><td></td></tr>");

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
    <div style=" width: 80%; margin-left: 10%; margin-top: 3%;"> 
        <div> <h2> Datos Personales</h2></div> 
        <br><br>
        <table width="60%" >
            <tr>
                <td>Cedula:</td>
                <td><input id="idPersona" class="box-text" type="number" onkeypress="javascript:return validarNro(event)" /></td>
            </tr>

            <tr >
                <td>Nombre Cliente:</td>
                <td id="nombre">

                </td>
            </tr>

        </table>
        <br>
        <table id="mitabla" width="100%" >
            <thead>

            <th>Servicio</th>
            <th>Servidor</th>
            <th>Producto</th>
            <th width="10%">Cantidad</th>
            <th width="15%">Precio Unid.</th>
            <th width="15%">Precio total</th>
            <th width="8%">Agregar</th>
            </thead>
            <tr>

                <td >
                    <select id="servicio" class="box-text" onchange="servidores()">
                        <option></option>
                        <?php foreach($servicios as $ser){ ?>
                        <option value="<?php echo $ser->getIdServicio(); ?>"><?php echo $ser->getNombre();?></option>
                        <?php } ?>
                    </select>
                </td>
                <td>
                    <select class="box-text" id="servidor">

                    </select>  
                </td>
                <td >

                    <select class="box-text" id="producto" onchange="producto()">
                        <option></option>
                        <?php foreach($productos as $pro){ ?>
                        <option value="<?php echo $pro->getIdProducto(); ?>"><?php echo $pro->getNombre();?></option>
                        <?php } ?>
                    </select>
                </td>
                <td><input class="box-text" id="cantidad" type="text" onkeypress="javascript:return validarNro(event)"/></td>
                <td><input class="box-text" id="precioUnid" type="number" onkeypress="javascript:return validarNro(event)" /></td>
                <td ><input class="box-text" id="precioTotal" disabled type="number" /></td>
                <td><button id="agregarProducto" class="button small red" onclick="agregarProducto()">Agregar</button></td>
            </tr>
            <tr style="background-color: #ffffff;">
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><button style="display: none" id="modPrecio" class="button small red" onclick="habilitarPrecio()">Modificar</button></td>
                <td></td>
                <td></td>

            </tr>
        </table>

        <div style="float: left;width: 40%;">
            <div> <h2> Servicios</h2></div> 
            <table id="mitabla" width="100%" >
                <thead>

                <th>COD</th>
                <th>Servicio</th>
                <th>Servidor</th>
                <th hidden>ced Servidor</th>
                <th width="15%">Precio</th>
                <th>.</th>

                </thead>
                <tbody id="tServicios">



                </tbody>
            </table>
        </div>
        <div style="float: right;width: 40%;">
            <div> <h2> Productos</h2></div> 
            <table id="mitabla" width="100%" >
                <thead>

                <th>COD</th>
                <th>Producto</th>
                <th>Cantidad</th> 
                <th width="15%">Precio Unid.</th>
                <th width="15%">Subtotal</th>
                <th>.</th>

                </thead>
                <tbody id="tProductos">

                </tbody>
            </table>
        </div>

        <div style="margin-left: 70%;">
            <table>
                <tr>
                    <td>
                        Total:
                    </td>
                    <td>
                        <input class="box-text" id="total" type="number" disabled />
                    </td>
                </tr>
            </table>
        </div>
        <div style="margin-left: 70%; margin-top: 3%;"> 
            <button type="submit" class="button small red" onclick="guardar()"> Guardar</button>
            
        </div>
        <br>



    </div>

</html>            
