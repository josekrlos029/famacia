<form action="javascript: return false;" id="form">
    <table border="0" align="left" width="100%" >
        <tr><td style="text-align: left;"><h2>Servicios</h2></td></tr>
                    <tr><td style="text-align: left;"><select multiple="" id="servs" class="box-text" >
                        <?php foreach($servs as $servicio){ ?>
                        <option value="<?php echo $servicio->getIdServicio(); ?>"><?php echo $servicio->getNombre(); ?></option>
                        <?php } ?>
                    </select></td></tr>
        <tr><td align="right"><button type="submit" class="button red small" onclick="agregarServicios()">Agregar</button></td></tr>
    </table>
</form> 
<br>
<br>
<table id="mitabla">
    <thead>
    <th>Servicio</th>
    <th>Eliminar</th>    
    </thead>
    <tbody>
        <?php foreach($servicios as $serv){ ?>
        <tr>
            <td><?php echo $serv->getNombre(); ?></td>
            <td><buttom type="submit" class="button small red"  onclick="eliminarServicio('<?php echo $serv->getIdServicio(); ?>');">x</buttom></td>
        </tr>
        <?php } ?>
    </tbody>
    
</table>
