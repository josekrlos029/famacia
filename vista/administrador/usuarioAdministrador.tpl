<?php
/* 
* To change this template, choose Tools | Templates
* and open the template in the editor.
*/

?>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="../utiles/css/style-index.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/menu.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/formularios.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/botones.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/tablas.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../utiles/css/fullcalendar.css" rel="stylesheet" type="text/css" media="screen"/>
        
        <script src="../utiles/js/jquery-1.11.0.min.js" type="text/javascript"></script>
        <script src="../utiles/js/js.js" type="text/javascript"></script>
        <script type='text/javascript' src='../utiles/js/jquery-ui.custom.min.js'></script>
        <script src="../utiles/js/fullcalendar.min.js"></script>

        <title>Administrador</title>

        <script>

            function cargarRegistroPersona() {
                $("#titulo").html("<h1>Gestion de Clientes</h1>");
                $("#contenido").load("/palace/administrador/registroPersona");

            }
                function configuracionUsuario() {
                $("#titulo").html("<h1>Configuracion de Usuario</h1>");
                $("#contenido").load("/palace/administrador/configuracionUsuario");

            }
            function cargarRegistroProducto() {
                $("#contenido").load("/palace/administrador/inventarioProducto");
                $("#titulo").html("<h1>Inventario de Productos</h1>");
            }
            function cargarCitas() {
                $("#contenido").load("/palace/administrador/registroCita");
                $("#titulo").html("<h1>Gestion de Citas</h1>");
            }
            function cargarGestionEmpleado() {
                $("#contenido").load("/palace/administrador/registroEmpleado");
                $("#titulo").html("<h1>Gestion de Empleados</h1>");
            }
            function cargarGestionServicio() {
                $("#contenido").load("/palace/administrador/gestionServicio");
                $("#titulo").html("<h1>Gestion de Servicios</h1>");
            }

            function cargarFactura() {
                $("#contenido").load("/palace/administrador/factura");
                $("#titulo").html("<h1>Facturar Servicio</h1>");
            }
            
            function cargarConsultas() {
                $("#contenido").load("/palace/administrador/consultas");
                $("#titulo").html("<h1>Consultas</h1>");
            }


        </script>

    </head> 

    <body>
        <div id="menu">
            <div id="cont-title">
                <a  href="/palace/administrador/usuarioAdministrador" ><h1><spam>Usuario</spam> | Administrador</h1></a>
                <div id="hora">
                    <?php

                    echo date("r");
                    ?>    
                </div>
            </div>
            <div style="margin-top:20px;"> 
                <ul class="accordion">
                    <li id="one" class="clientes"><a onclick="cargarRegistroPersona()" href="#">Clientes<span><?php echo count($personas); ?></span></a>
                        <!-- <ul class="sub-menu">
                             <li><a href="#"><em>01</em>Registrar Cliente<span</span></a></li>
                             <li><a href="#"><em>02</em>Consultar Cliente<span></span></a></li> 
                             <li><a href="#"><em>03</em>Modificar Cliente<span></span></a></li> 
                         </ul>-->
                    </li>

                    <li id="three" class="citas"><a onclick="cargarCitas()" href="#">Citas<span>0</span></a>

                    </li>
                    <li id="six" class="empleados"><a onclick="cargarGestionEmpleado()" href="#">Empleados<span><?php echo count($empleados); ?></span></a></li>
                    <li id="two" class="productos"><a onclick="cargarRegistroProducto()" href="#">Inventario de Productos<span><?php echo count($productos); ?></span></a>
                    </li>
                    <li id="five" class="servicio"><a onclick="cargarGestionServicio()" href="#">Servicios<span><?php echo count($servicios); ?></span></a></li>
                    <li id="six" class="factura"><a onclick="cargarFactura()" href="#">Facturar</a></li>
                    <li id="seven" class="consulta"><a onclick="cargarConsultas()" href="#">Consultas</a></li>

                </ul>
            </div> 

        </div>
    </div>
    <div id="cuerpo">
        <div id="menu-horizontal">
            <div id="titulo"></div>
            <div id=cont-conf> <li id="" class="conf"><a onclick="configuracionUsuario()" href="#">Configuracion de Usuario</a></div>
            <div id="cont-logo">
                <h1>Droguería San Miguel</h1>
            </div>
        </div>

        <div id="contenido">

        </div>

    </div> 
    
</body>
</html>
