<?php
/* 
* To change this template, choose Tools | Templates
* and open the template in the editor.
*/

?>
<div id="cont-consulta">
   
                <table border="0" align="right" width="70%">
                     <tr><td style="text-align: center;"><h2>Consultar Productos</h2></td>
                   <td style="text-align: right;"><input type="text" name="idPersona" required placeholder="Nombre del Produto" class="box-text" ></td>
                </table>
                
                <div style="margin-top:10%;">
                 <table border="0" align="center" width="100%" id="mitabla">
                      <thead>
                         <th >Codigo</th>
                         <th width="30%">Nombre</th>
                         <th >Precio Venta</th>
                         <th >Catidad</th>
                         <th  width="5%"</th>
                         </thead>
                         <tbody>
                      <tr align="left">
                          <?php foreach($productos as $producto){ ?>
                         <td ><?php echo $producto->getIdProducto(); ?></td>
                         <td ><?php echo $producto->getNombre(); ?></td>
                         <td ><?php echo $producto->getPrecioVenta(); ?></td>
                         <td ><?php echo $producto->getUnidades(); ?></td>
                         <td style="text-align:right;"><button type="submit" class="button small red"  onclick="consultaProducto();">...</button></td>
                         </tr>
                         <?php } ?>
                         </tbody>
                     
                </table>
                </div>
                 </div>