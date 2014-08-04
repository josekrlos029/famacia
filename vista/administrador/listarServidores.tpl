<?php foreach ($personas as $persona) { ?>
<option value="<?php echo $persona->getIdPersona(); ?>"><?php echo $persona->getNombres()." ".$persona->getPApellido(); ?></option>
<?php } ?>
