<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="utiles/css/style-index.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="utiles/css/registroPersona.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="utiles/css/botones.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="utiles/css/formularios.css" rel="stylesheet" type="text/css" media="screen"/>
        <title>Inicio de sesion</title>
        <script src="utiles/js/jquery-1.11.0.min.js" type="text/javascript"></script>
        <script>
                  
        function envio(){
              
              var user =$("#usuario").val();
              var clave=$("#clave").val();
              
              var usuario = { usuario: user,
                              clave: clave};
              
              if(user != "" && clave != ""){
              
                    $.ajax({
                      type: "POST",
                      url: "/palace/inicio/autenticar",
                      data: usuario
                  })
                  .done(function(msg) {

                      var json = eval("(" + msg + ")");
                      if (json === "error") {
                          alert("Verifique usuario o contraseña");

                      } else {

                          window.location.href = json;

                      }
                  });
              }
              
          }  
            
        </script>
    </head>
    <body>
    <div style="width: 75%; height:100%; float:left;">
        <div style="margin-left:15%; margin-top:10%;"><img src="utiles/image/logo.jpg" /></div>
    </div>
    <div style="width: 24%; height:100%; float:right; border-left:2px solid #3bc3f5;">
        <div style="margin-top: 60%; margin-left: 25%; ">
            <h1>Iniciar Sesion</h1>
        </div>
        <form onsubmit="return false;" id="formulario">
        
        <div style=" width: 80%; height: 20%; margin-top: 15%;margin-left: 10%; text-align: center;  ">
            
               <table width="100%">
                <tr>
                    <td>
                        <input class="box-text" type="text" id="usuario" name="usuario" placeholder="Usuario" required >
                    </td>
                </tr> 
                <tr>
                    <td>
                        <input class="box-text" type="password" id="clave" name="clave" placeholder="Contraseña" required >
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <input name="iniciar" id="iniciar" type="submit" class="button large blue" value="Iniciar Sesion" onclick="envio()" >
                    </td>
                </tr>
            </table>  
            
        </div>
        
        </form>
        <div style=" margin-top: 10%; margin-left: 30%;">¿Olvidaste tu Contraseña?</div>
    </div>
    </body>    
</html>