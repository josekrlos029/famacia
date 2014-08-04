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
        <!--<script type='text/javascript' src='../utiles/js/jquery-1.9.1.min.js'></script>-->
        <script src="../utiles/js/jquery-1.11.0.min.js" type="text/javascript"></script>
         <script type='text/javascript' src='../utiles/js/jquery-ui.custom.min.js'></script>
        <title>Medico</title>
    </head> 
    
    <script>
            
           function cargarPaciente(){
               $("#titulo").html("<h1>Informaciòn de pacientes</h1>");
               $("#contenido").load("/palace/medico/paciente");
               
           }
           
           function cargarMedicamentos(){
               $("#contenido").load("/palace/medico/medicamentos");
               $("#titulo").html("<h1>Informacion de Medicamentos</h1>");
           }
           function cargarCitas(){
               $("#contenido").load("/palace/administrador/registroCita");
               $("#titulo").html("<h1>Gestion de Citas</h1>");
           }
           function cargarHistorial(){
               $("#contenido").load("/palace/medico/historial");
               $("#titulo").html("<h1>Historial medico</h1>");
           }
           function cargarRegistroPersona(){
               $("#contenido").load("/palace/administrador/registroPersona");
           }
           
            
        </script>
   
    <body>
       <div id="menu">
           <div id="cont-title">
               <h1><spam>Usuario</spam> | Mèdico</h1>
               <div id="hora">
                <?php
                    
                     echo date("r");
                ?>    
                </div>
           </div>
        <div style="margin-top:20px;"> 
           <ul class="accordion">
                <li id="one" class="files"><a onclick="cargarPaciente()" href="#">Pacientes<span><?php echo count($personas); ?></span></a>
                           <!-- <ul class="sub-menu">
                                <li><a href="#"><em>01</em>Registrar Cliente<span</span></a></li>
                                <li><a href="#"><em>02</em>Consultar Cliente<span></span></a></li> 
                                <li><a href="#"><em>03</em>Modificar Cliente<span></span></a></li> 
                            </ul>-->
                </li>
                
                <li id="three" class="citas"><a href="#three">Citas<span><?php echo count($citas); ?></span></a>
                      
                </li>
                
          </ul>
        </div> 
          
</div>
       </div>
        <div id="cuerpo">
            <div id="menu-horizontal">
                <div id="cont-logo">
                    <img src="../utiles/image/logo.jpg" width="150px" height="60px"/> 
                </div>
            </div>
            <div id="contenido">
                
            </div>
        </div> 
    </body>
    
</html>