
   <script>
       function cargarHistorial(){
               $("#contenido").load("/palace/medico/historial");
               $("#titulo").html("<h1>Historial medico</h1>");
           }
   </script>    
       
            
            <div style="margin-left: 10%; margin-top: 5%;">
                <table width="45%">
                    <tr>
                        <td>
                            <h2>Consultar Pacientes</h2>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                            <input class="box-text" type="text" placeholder="Nombre del Paciente">
                        </td>
                    </tr>
                </table>
            </div>       
                <br><br>
                <div style=" margin-left: 5%; width: 90%">
                    <table id="mitabla" width="100%"  >
                        <thead>
                        <th >
                            Cedula
                        </th> 
                        <th >
                            Nombre
                        </th>  
                        <th width="25%">
                            Apellido
                        </th> 
                        <th>
                            Sexo
                        </th>
                        <th>
                            Celular
                        </th>  
                        <th>
                            Datos
                        </th> 
                        <th>
                            Historial
                        </th> 
                        
                    </thead>
                    <tbody>
                    <?php foreach($personas as $p){ ?>    
                     <tr align="left">
                         <td><?php echo $p->getIdPersona(); ?></td>
                         <td><?php echo $p->getNombres(); ?></td>
                         <td><?php echo $p->getPApellido(); ?></td>
                         <td><?php echo $p->getSexo(); ?></td>
                         <td><?php echo $p->getCelular(); ?></td>
                         <td style="text-align:right;"><input type="submit" class="button small red"  value="Ver +" onclick="consultaPersona('<?php echo $p->getIdPersona(); ?>');"></td> 
                         <td style="text-align:right;"><input type="submit" class="button small red"  value="..." onclick="cargarHistorial();"></td> 
                     </tr>
                     <?php } ?>
                     </tbody>
                </table>
                </div>     