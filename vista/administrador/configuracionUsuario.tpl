<?php
/* 
* To change this template, choose Tools | Templates
* and open the template in the editor.
*/

?><script type="text/javascript">
  $("#form").submit(function() {
        var x = $("#mensaje");
        var y = $("#overlay");
        cargando();
        x.html("<p>Cargando...</p>");
        x.show("speed");
        y.show("speed");

        var user = $("#user").val();
        var aPass = $("#aPass").val();
        var nPass = $("#nPass").val();
        
        var usuario = {
            user: user,
            aPass: aPass,
            nPass: nPass
        };

        $.ajax({
            type: "POST",
            url: "/famacia/administrador/modificarUsuario",
            data: usuario
        })
                .done(function(msg) {

                    var json = eval("(" + msg + ")");

                    if (json == "exito") {
                    
                    
                        limpiarCajas();
                        x.html("<p>datos modificados Correctamente</p>");
                        y.html();
                        exito();
                        ocultar();


                    } else if (json == 23000) {

                        limpiarCajas();
                        x.html("<p>Error no se puediron configurar los datos</p>");
                        y.html();
                        error();
                        ocultar();

                    }
                });



    });
    </script>
<div  id="overlay"></div>
            <div  id="mensaje">
              <div style="float:right">
                  <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><img src="../utiles/image/close.png"/></a>
             </div>
                
            </div>
 <form action="javascript: return false;" id="form">
     <div style="margin-top:10%;">
        <table border="0" align="center" width="40%" >
            <tr><td style="text-align: left;"><input type="text" id="user" required placeholder="nombre de Usuario"  class="box-text" ></td></tr>
            <tr><td style="text-align: left;"><input type="text" id="aPass" required placeholder="contraseña Acual"  class="box-text" ></td></tr
            <tr><td style="text-align: left;"><input type="text" id="nPass" required placeholder="contraseña Nueva"  class="box-text" ></td></tr>
            <tr><td style="text-align:right;"><button type="submit" class="button orange large" >Guardar </button></td></tr>
        </table>
     </div>
    </form> 