<table border="0" align="center" width="100%" id="mitabla">
            <thead>
            <th>Cedula del Cliente</th>
            <th>Nombre del Cliente</th>
            <th>Servicio</th>
            <th>Servidor</th>
            <th>Fecha</th>
            <th >Hora</th>
            
            </thead>
            <tbody>
                <?php foreach($citas as $cita){ ?>
                <tr align="left">
                    <td><?php echo $cita["idCliente"]; ?></td>
                    <td ><?php echo $cita["nombres"]." ".$cita["pApellido"]; ?></td>
                    <td><?php echo $cita["nombre"]; ?></td>
                    <td ><?php echo $cita["nombreCliente"]." ".$cita["apellidoCliente"]; ?></td>
                    <td><?php echo $cita["fecha"]; ?></td>
                    <td><?php echo $cita["hora"]; ?></td>
                    
                </tr>
                <?php } ?>
            </tbody>

        </table>
    