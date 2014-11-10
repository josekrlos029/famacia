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
            $(document).ready(function(){
                $("#titulo").html("<h1>Facturar</h1>");
                $("#contenido").load("/famacia/administrador/factura");
            });
            
            function cargarRegistroPersona() {
                $("#titulo").html("<h1>Gestion de Clientes</h1>");
                $("#contenido").load("/famacia/administrador/registroPersona");

            }
            function cargarRegistroProducto() {
                $("#contenido").load("/famacia/administrador/inventarioProducto");
                $("#titulo").html("<h1>Inventario de Productos</h1>");
            }
            function cargarCitas() {
                $("#contenido").load("/famacia/administrador/registroCita");
                $("#titulo").html("<h1>Gestion de Citas</h1>");
            }
            function cargarGestionEmpleado() {
                $("#contenido").load("/famacia/administrador/registroEmpleado");
                $("#titulo").html("<h1>Gestion de Empleados</h1>");
            }
            function cargarGestionServicio() {
                $("#contenido").load("/famacia/administrador/gestionServicio");
                $("#titulo").html("<h1>Gestion de Servicios</h1>");
            }

            function cargarFactura() {
                $("#contenido").load("/famacia/administrador/factura");
                $("#titulo").html("<h1>Facturar</h1>");
            }
            
            function cargarConsultas() {
                $("#contenido").load("/famacia/administrador/consultas");
                $("#titulo").html("<h1>Consultas</h1>");
            }
            
            function cargarProveedores(){
                
                $("#contenido").load("/famacia/administrador/registroProveedor");
                $("#titulo").html("<h1>Gestion de Proveedores</h1>");
            
            }
            
            function cargarLaboratorios(){
                
                $("#contenido").load("/famacia/administrador/registroLaboratorios");
                $("#titulo").html("<h1>Gestion de Laboratorios</h1>");
            
            }

            function cargarCompra(){
                
                $("#contenido").load("/famacia/administrador/compra");
                $("#titulo").html("<h1>Gestion de Compras</h1>");
            
            }
        </script>

    </head> 

    <body>
        <div id="menu">
            <div id="cont-title">
                <a  href="/famacia/administrador/usuarioAdministrador" ><h1><spam>Usuario</spam> | Administrador</h1></a>
                <div id="hora">
                    <?php

                    echo date("r");
                    ?>    
                </div>
            </div>
            <div style="margin-top:20px;"> 
                <ul class="accordion">
                    <?php if($_SESSION['idUsuario']==1){ ?>
                    <li id="six" class="factura"><a onclick="cargarFactura()" href="#">Facturar</a> </li>
                    <li id="six" class="factura"><a onclick="cargarCompra()" href="#">Compras</a></li>
                    
                    <li id="one" class="clientes"><a onclick="cargarRegistroPersona()" href="#">Clientes<span><?php echo count($personas); ?></span></a></li>
                    <li id="two" class="productos"><a onclick="cargarRegistroProducto()" href="#">Inventario de Productos<span><?php echo count($productos); ?></span></a></li>
                    <li id="six" class="empleados"><a onclick="cargarLaboratorios()" href="#">Laboratorios<span><?php echo count($laboratorios); ?></span></a></li>
                    <li id="six" class="empleados"><a onclick="cargarProveedores()" href="#">Proveedores<span><?php echo count($proveedores); ?></span></a></li>
                    <li id="six" class="empleados"><a onclick="cargarGestionEmpleado()" href="#">Farmaceuticos<span><?php echo count($empleados); ?></span></a></li>
                    <li id="seven" class="consulta"><a onclick="cargarConsultas()" href="#">Consultas</a></li>
                    <?php }else{ ?>
                    <li id="one" class="clientes"><a onclick="cargarRegistroPersona()" href="#">Clientes<span><?php echo count($personas); ?></span></a></li>
                    <li id="six" class="factura"><a onclick="cargarFactura()" href="#">Facturar</a></li>
                    <?php } ?>
                </ul>
            </div> 

        </div>
    </div>
    <div id="cuerpo">
        <div id="menu-horizontal">
            <div id="titulo"></div>
            <div id=cont-conf></div>
            <div id="cont-logo">
                <h1>Droguería San Miguel</h1>
            </div>
        </div>

        <div id="contenido">

        </div>

    </div> 
    
</body>
</html>
