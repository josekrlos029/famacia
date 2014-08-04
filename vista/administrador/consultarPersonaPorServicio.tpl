<table border="0" align="center" width="100%" id="mitabla">
    <thead>
    <th >N°</th>
    <th width="30%">Nombre del Cliente</th>
    <th></th>
</thead>
<tbody>
    <?php $c=0; foreach($personas as $persona){  $c++;?>
    <tr align="left">
        <td ><?php echo $c; ?></td>
        <td ><?php echo $persona->getNombres()." ".$persona->getPApellido(); ?></td>
        <td style="text-align:right;"><button type="submit" class="button small red"  onclick="consultaDisponibilidad('<?php echo $persona->getIdPersona(); ?>');">...</button></td>
    </tr>
    <?php } ?>
</tbody>
</table>
