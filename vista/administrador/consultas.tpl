<script>
            function cargarIngresoTotal() {
                $("#cont-consulta").load("/famacia/administrador/ingresoTotal");
                $("#titulo").html("<h1>Consultas</h1>");
            }
            
            function cargarIngresoEmpleado() {
                $("#cont-consulta").load("/famacia/administrador/ingresoEmpleado");
                $("#titulo").html("<h1>Consultas</h1>");
            }
            
            function cargarIngresoProducto() {
                $("#cont-consulta").load("/famacia/administrador/ingresoProducto");
                $("#titulo").html("<h1>Consultas</h1>");
            }
</script>

<div  id="overlay"></div>
            <div  id="mensaje">
              <div style="float:right">
                  <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><img src="../utiles/image/close.png"/></a>
             </div>
                
            </div>
<div id="cont-form">
    <form id="form" action="javascript: return false;">
     <div style="margin-top: 5%;"><h2>Consultar</h2></div>
     <br>
     <table border="0" align="left" width="100%" >
                    
                     <tr><td style="text-align: left;"><a onclick="cargarIngresoTotal()" href="#">Ingresos totales</a></td></tr> 
                     <tr><td style="text-align: left;"><a onclick="cargarIngresoEmpleado()" href="#">Ingresos por empleado</a></td>      
                     <tr><td style="text-align: left;"><a onclick="cargarIngresoProducto()" href="#">Ingresos por producto</a></td></tr>
                     
                     
                    

                    
                </table>
    </form>
 </div>
 <div id="cont-consulta">
   
                
                 
                </div>


                <div id="fade" class="overlay"></div>
            <div id="light" class="modal">
              <div style="float:right">
                  <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><img src="../utiles/image/close.png"/></a>
             </div>
                
            </div>
                  