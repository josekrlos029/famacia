<html>

    <script>
        
        function calcularPresentacion(){
            
            var idProducto = $("#producto").val();

            $.ajax({
                type: "POST",
                url: "/famacia/administrador/consultarProducto2",
                data: { idProducto: idProducto }
            })
                    .done(function (msg) {
                        var json = eval("(" + msg + ")");
                        
                        var presentacion = $("#presentacion  option:selected").html();
                        var arrayPresentacion = presentacion.split("/");
                        
                        var cantidad = parseInt(arrayPresentacion[1]);
                        
                        var precio = parseInt(json.precio);
                        
                        $("#precioUnid").val(parseInt(precio.toFixed(2)) * cantidad);
                        var total = precio + (precio.toFixed(2) * (parseFloat(json.iva).toFixed(2) / 100) * cantidad);
                        $("#precioTotal").val(parseInt(json.unidadPrincipal) * total.toFixed(2));
                        $("#iva").val(json.iva);
                        $("#cantidad").val(0);
                        $("#codigo").val(json.codigoBarras);
                        $("#pp").val(json.precioFabrica);
                        $("#unidades").val(json.unidades);
                        $("#cantidad").focus();
                    });
        }
        
        function seleccionar(obj) {
            if (obj.nodeName.toLowerCase() == 'textarea' || (obj.nodeName.toLowerCase() == 'input' && obj.type == 'text')) {
                obj.select();
                return;
            }
            if (window.getSelection) {
                var sel = window.getSelection();
                var range = document.createRange();
                range.selectNodeContents(obj);
                sel.removeAllRanges();
                sel.addRange(range);
            }
            else if (document.selection) {
                document.selection.empty();
                var range = document.body.createTextRange();
                range.moveToElementText(obj);
                range.select();
            }
        }

        $(document).ready(function () {

            $("#idPersona").focus();

        });
        $("#codigo").keypress(function (e) {

            var key = e.keyCode || e.which;
            if (key === 13) {
                codigoBarras();
            }
        });

        $("#producto").keypress(function (e) {

            var key = e.keyCode || e.which;
            if (key === 13) {
                agregarProducto();
            }
        });

        $("#cantidad").keyup(function (e) {

            var key = e.keyCode || e.which;
            if (key === 13) {
                $("#precioUnid").focus();
            } else {
                
                var unidades = parseFloat($("#unidades").val());
                var presentacion = $("#presentacion  option:selected").html();
                var arrayPresentacion = presentacion.split("/");
                var cantidadPresentacion = parseInt(arrayPresentacion[1]);
                var cantidad = parseInt($("#cantidad").val());
                
                if(unidades < (cantidadPresentacion*cantidad)){
                    alert("Esta cantidad no está disponible en el inventario");
                    $("#cantidad").val(0);
                }else{
                    calcularTotal();
                }
                
                
            }
        });
        
        $("#precioUnid").keyup(function (e) {

            var key = e.keyCode || e.which;
            if (key === 13) {
                agregarProducto();
            } else {

                calcularTotal();

            }
        });

        function quitarProducto(idProducto) {
            $("#tProductos .rc").each(function (index) {

                var band = false;
                var precio;
                var total;
                $(this).children("td").each(function (index2) {
                    switch (index2) {
                        case 0:
                            if ($(this).text() == idProducto) {
                                band = true;
                            }
                            break;
                        case 4:
                            precio = $(this).text();
                    }

                });
                if (band == true) {
                    $(this).remove();
                    total = parseInt($("#total").val());
                    precio = parseInt(precio);
                    $("#total").val(total - precio);
                }

            });
            $("#codigo").focus();
        }

        function guardar() {

            if ($("#idPersona").val() == null || $("#idPersona").val() == "" || $("#nombre").val() == "No existe en la Base de Datos") {
                alert("Por Favor seleccione un Cliente Valido");
            } else {

                var x = $("#mensaje");
                cargando();
                x.html("<p>Cargando...</p>");
                x.show("speed");

                var arregloProductos = new Array();
                var i = 0;
                $("#tProductos .rc").each(function (index) {
                    var idProducto, nombreProducto, cantidad, precio, subtotal, iva, idPresentacion;

                    $(this).children("td").each(function (index2) {
                        switch (index2) {
                            case 0:
                                idProducto = $(this).text();
                                break;
                            case 1:
                                nombreProducto = $(this).text();
                                break;
                            case 3:
                                cantidad = $(this).text();
                                break;
                            case 4:
                                precio = $(this).text();
                                break;
                            case 5:
                                iva = $(this).text();
                                break;
                            case 6:
                                subtotal = $(this).text();
                                break;
                            case 8:
                                idPresentacion = $(this).text();
                                break;

                        }
                        $(this).css("background-color", "#ECF8E0");
                    });
                    cantidad = parseInt(cantidad);
                    if (iva == "") {
                        iva = 0;
                    } else {
                        iva = parseFloat(iva);
                    }

                    arregloProductos[i] = new Array(idProducto, cantidad, iva, precio, idPresentacion);
                    i++;
                });

                var productos = JSON.stringify(arregloProductos);

                var factura = {
                    idPersona: $("#idPersona").val(),
                    productos: productos,
                    formaPago: $("#formaPago").val(),
                    idFarmaceutico: $("#idFarmaceutico").val()
                };
                
                $.ajax({
                    type: "POST",
                    url: "/famacia/administrador/guardarFactura",
                    data: factura
                })
                        .done(function (msg) {
                            var json = eval("(" + msg + ")");
                            if (json.respuesta == "exito") {
                                x.html("<p>Factura Guardada Correctamente</p>");
                                window.open("/famacia/administrador/generarFactura/" + json.idFactura);
                                exito();
                                ocultar();
                                setTimeout(function () {
                                    location.href= "/famacia/administrador/factura";
                                }, 2000);
                            } else {
                                x.html("<p>Error al Guardar Factura</p>");

                                error();
                                ocultar();
                            }

                        });

            }
        }



        $('#idPersona').keypress(function (event) {
            var keycode = (event.which) ? event.which : event.keyCode;

            if (keycode == '13') {
                $.ajax({
                    type: "POST",
                    url: "/famacia/administrador/consultarNombrePersona",
                    data: { idPersona: $("#idPersona").val() }
                })
                        .done(function (msg) {
                            var json = eval("(" + msg + ")");

                            $("#nombre").html(json);
                            $("#idPersona").attr("disabled", "disabled");
                            $("#codigo").focus();
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
                url: "/famacia/administrador/consultarProducto2",
                data: { idProducto: idProducto }
            })
                    .done(function (msg) {
                        var json = eval("(" + msg + ")");
                        
                        $("#presentacion").html(json.tabla);
                        var presentacion = $("#presentacion  option:selected").html();
                        var arrayPresentacion = presentacion.split("/");
                        
                        var cantidad = parseInt(arrayPresentacion[1]);
                        
                        var precio = parseInt(json.precio);
                        
                        $("#precioUnid").val(parseInt(precio.toFixed(2)) * cantidad);
                        var total = precio + (precio.toFixed(2) * (parseFloat(json.iva).toFixed(2) / 100) * cantidad);
                        $("#precioTotal").val(parseInt(json.unidadPrincipal) * total.toFixed(2));
                        $("#iva").val(json.iva);
                        $("#cantidad").val(0);
                        $("#codigo").val(json.codigoBarras);
                        $("#pp").val(json.precioFabrica);
                        $("#unidades").val(json.unidades);
                        $("#presentacion").focus();
                    });
        }

        function codigoBarras() {

            $("#servicio").attr("disabled", "disabled");
            $("#servicio").css("background-color", "#B5A6A6");
            $("#servidor").attr("disabled", "disabled");
            $("#servidor").css("background-color", "#B5A6A6");

            var codigo = $("#codigo").val();

            $.ajax({
                type: "POST",
                url: "/famacia/administrador/consultarProductoByCodigo",
                data: { codigo: codigo }
            })
                    .done(function (msg) {
                        var json = eval("(" + msg + ")");

                        var precio = parseFloat(json.precio) / parseInt(json.unidadesProducto);
                        $("#precioUnid").val(precio.toFixed(2));
                        var total = precio + (precio.toFixed(2) * (parseFloat(json.iva).toFixed(2) / 100));
                        $("#precioTotal").val(parseInt(json.unidadPrincipal) * total.toFixed(2));
                        $("#iva").val(json.iva);
                        $("#cantidad").val(0);
                        $("#producto").val(json.idProducto);
                        $("#cantidad").focus();
                    });
        }

        function calcularTotal() {

            var pp = parseFloat($("#pp").val());
            var precio = parseFloat($("#precioUnid").val());
            var cantidad = parseInt($("#cantidad").val());
            var iva = parseFloat($("#iva").val());
            var total = precio + (precio * (iva / 100));
            $("#precioTotal").val(total * cantidad);
        }

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
            $("#iva").val("");
            $("#codigo").val("");
            $("#codigo").focus();
        }

        function consultarTotal() {

            var suma = 0;

            $("#tProductos .rc").each(function (index) {


                $(this).children("td").each(function (index2) {
                    switch (index2) {

                        case 6:
                            suma += parseInt($(this).text());
                            break;

                    }

                });

            });

            $("#total").val(suma);
        }
        function habilitarPrecio() {
            $("#precioUnid").removeAttr("disabled");
        }

        function agregarProducto() {
            var producto = $("#producto  option:selected").html();
            var presentacion = $("#presentacion  option:selected").html();
            var arrayPresentacion = presentacion.split("/");
            var idPresentacion = $("#presentacion").val();
            var nombrePresentacion= arrayPresentacion[0];
            var cantidad = parseInt(arrayPresentacion[1]);
            var idProducto = $("#producto").val();
            var cantidad = $("#cantidad").val();
            var precioU = $("#precioUnid").val();
            var precioT = $("#precioTotal").val();
            var iva = $("#iva").val();
            var pp = $("#pp").val();
            var unidades = $("#unidades").val();

            if (pp >= precioU) {
                alert("Error: El precio de Venta es menor o igual que el precio del Proveedor");
            } else if (unidades == 0) {
                alert("Error: No hay unidades Disponibles de este producto");
            } else {
                var band = 0;
                $("#tProductos .rc").each(function (index) {
                    var x, c, preu, iv;
                    $(this).children("td").each(function (index2) {

                        switch (index2) {
                            case 0:
                                if ($(this).text() == idProducto) {
                                    band = 1;
                                    alert("El Producto ya existe en la factura, debe eliminarlo para agregarlo nuevamente");
                                }
                                break;

                        }

                    });

                });
                if (band == 0) {
                    $("#tProductos").append("<tr class='rc'><td>" + idProducto + "</td><td>" + producto + "</td>><td>" + nombrePresentacion + "</td><td>" + cantidad + "</td><td>" + precioU + "</td><td>" + iva + "</td><td>" + precioT + "</td><td><button class='button small red' onclick='quitarProducto(" + idProducto + ")'>x</button></td><td hidden>"+idPresentacion+"</td></tr>");
                }

                limpiar();
                consultarTotal();
                //$("#detallesProducto").append("<tr><td>"+producto+"</td><td>"+cantidad+"</td><td></td><td></td></tr>");
            }



        }
        function validarNro(e) {
            var key;
            if (window.event) // IE
            {
                key = e.keyCode;
            }
            else if (e.which) // Netscape/Firefox/Opera
            {
                key = e.which;
            }

            if (key < 48 || key > 57)
            {
                if (key == 46 || key == 8) // Detectar . (punto) y backspace (retroceso)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            return true;
        }

        function validar_texto(e) {
            tecla = (document.all) ? e.keyCode : e.which;

            //Tecla de retroceso para borrar, siempre la permite
            if (tecla == 8)
                return true;

            // Patron de entrada, en este caso solo acepta letras
            patron = /[A-Za-z\s]/;

            tecla_final = String.fromCharCode(tecla);
            return patron.test(tecla_final);
        }

        function calcularCambio() {

            var dinero = parseInt($("#dinero").val());
            var total = parseFloat($("#total").val());

            $("#cambio").val(dinero - total);

        }

    </script>

    <div  id="overlay"></div>
    <div  id="mensaje">
        <div style="float:right">
            <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display = 'none';
                    document.getElementById('fade').style.display = 'none'"><img src="../utiles/image/close.png"/></a>
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
            <tr >
                <td>Forma de Pago:</td>
                <td>
                    <select id="formaPago">
                        <option value="efectivo">Efectivo</option>
                        <option value="tarjeta">Tarjeta</option>
                        <option value="bono">Cupón / Bono</option>
                    </select>
                </td>
            </tr>
            <tr >
                <td>Vendedor:</td>
                <td>
                    <select id="idFarmaceutico">
                        <?php foreach($personas as $pro){ ?>
                        <option value="<?php echo $pro->getIdPersona(); ?>"><?php echo $pro->getNombres()." ".$pro->getPApellido();?></option>
                        <?php } ?>
                    </select>
                </td>
            </tr>
        </table>
        <br>
        <table id="mitabla" width="100%" >
            <thead>
            <th>Cod.Barras</th>
            <th>Producto</th>
            <th width="10%">Presentacion</th>
            <th width="10%">Cantidad</th>
            <th width="15%">Precio Present.</th>
            <th width="15%">IVA%</th>
            <th width="15%">Precio total</th>
            </thead>
            <tr>
                <td><input class="box-text" id="codigo" type="text"/></td>
                <td>
                    <select class="box-text" id="producto" onchange="producto()">
                        <option></option>
                        <?php foreach($productos as $pro){ ?>
                        <option value="<?php echo $pro->getIdProducto(); ?>"><?php echo $pro->getNombre();?></option>
                        <?php } ?>
                    </select>
                </td>
                <td><select id="presentacion" onchange="calcularPresentacion()" class="box-text"></select></td>
                <td><input class="box-text" onfocus="seleccionar(this)" id="cantidad" type="text" onkeypress="javascript:return validarNro(event)"/></td>
                <td><input class="box-text" id="precioUnid" type="text" onkeypress="javascript:return validarNro(event)" onfocus="seleccionar(this)"/></td>
                <td><input class="box-text" id="iva" disabled type="number" /></td>
                <td><input class="box-text" id="precioTotal" disabled type="number" /><input class="box-text" id="pp" hidden type="number" /><input class="box-text" id="unidades" hidden type="number" /></td>
            </tr>
        </table>

        <div style="float: right;width: 100%;">
            <div> <h2> Productos</h2></div> 
            <table id="mitabla" width="100%" >
                <thead>

                <th width="10%">COD</th>
                <th>Producto</th>
                <th width="8%">Presentación</th> 
                <th width="8%">Cantidad</th> 
                <th width="15%">Precio Present.</th>
                <th width="10%">IVA%.</th>
                <th width="15%">Subtotal</th>
                <th width="5%">.</th>

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
                <tr>
                    <td>
                        Dinero:
                    </td>
                    <td>
                        <input class="box-text" id="dinero" type="number" onkeyup="calcularCambio()" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Cambio:
                    </td>
                    <td>
                        <input class="box-text" id="cambio" type="number" disabled />
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
