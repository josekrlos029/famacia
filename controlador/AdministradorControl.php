<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of AdministradorControl
 *
 * @author JoseCarlos
 */
class AdministradorControl extends Controlador{
    
    public function __construct($modelo, $accion) {
        parent::__construct($modelo, $accion);
    }
    public function usuarioAdministrador(){
        try {
           
            if($this->verificarSession()){
                
            
            
            $this->vista->set('titulo', 'Usuario Administrador');
            $persona = new Persona();
            $rol = new Rol();
            $personas = $persona->leerPersonasPorRol($rol->getCliente());
            $this->vista->set('personas', $personas);
            $producto = new Producto();
            $productos = $producto->leerProductos();
            $this->vista->set('productos', $productos);
            $empleado = new Persona();
            $servicio = new Servicio();
            $empleados = $empleado->leerEmpleados();
            $servicios = $servicio->leerServicios();
            $this->vista->set('empleados', $empleados);
            $this->vista->set('servicios', $servicios);
            return $this->vista->imprimir();
            }
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }  
      public function registroPersona(){
        try {
           
            $this->vista->set('titulo', 'Registrar Persona');

            $rol = new Rol();
            $persona = new Persona();
            
            $personas = $persona->leerPersonasPorRol($rol->getCliente());
            $this->vista->set('personas', $personas);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
      public function inventarioProducto(){
        try {
           
            $this->vista->set('titulo', 'Registrar Persona');
            $producto = new Producto();
            $productos = $producto->leerProductos();
            $this->vista->set('productos', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function registroCita(){
        try {
           
            $this->vista->set('titulo', 'Registrar Persona');
            $servicio = new Servicio();
            $servicios = $servicio->leerServicios();
            $this->vista->set('servicios', $servicios);
            $cita = new Cita();
            $fecha = getdate();
            $FechaTxt=$fecha["year"]."-".$fecha["mon"]."-".$fecha["mday"];
            $citas = $cita->leerCitasDelDia($FechaTxt);
            $this->vista->set('citas', $citas);        
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function registroEmpleado(){
        try {
           
            $this->vista->set('titulo', 'Registro Empleado');
             
            $persona = new Persona();
            $servicio = new Servicio();
            $personas = $persona->leerEmpleados();
            $servicios = $servicio->leerServicios();
            $this->vista->set('personas', $personas);
            $this->vista->set('servicios', $servicios);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function gestionServicio(){
        try {
           
            $this->vista->set('titulo', 'Gestion Servicio');
            $servicio = new Servicio();
            $productos = $servicio->leerServicios();
            $this->vista->set('servicios', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function consultas(){
        try {
           
            $this->vista->set('titulo', 'Consultas');
            $servicio = new Servicio();
            $productos = $servicio->leerServicios();
            $this->vista->set('consultas', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function ingresoTotal(){
        try {
           
            $this->vista->set('titulo', 'Ingresos Totales');
            $servicio = new Servicio();
            $productos = $servicio->leerServicios();
            $this->vista->set('ingreso total', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function ingresoEmpleado(){
        try {
           
            $this->vista->set('titulo', 'Ingresos por Empleado');
            $servicio = new Servicio();
            $productos = $servicio->leerServicios();
            $this->vista->set('ingresos por empleado', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function ingresoServicio(){
        try {
           
            $this->vista->set('titulo', 'Ingresos por Servicio');
            $servicio = new Servicio();
            $servicios = $servicio->leerServicios();
            $this->vista->set('servicios', $servicios);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function ingresoProducto(){
        try {
           
            $this->vista->set('titulo', 'Ingresos por producto');
            $producto = new Producto();
            $productos = $producto->leerProductos();
            $this->vista->set('productos', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function cargaFecha(){
        try {
           
            $this->vista->set('titulo', 'Cargas por fecha');
            $producto = new Producto();
            $productos = $producto->leerProductos();
            $this->vista->set('productos', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        public function cargaProducto(){
        try {
           
            $this->vista->set('titulo', 'Cargas por producto');
            $producto = new Producto();
            $productos = $producto->leerProductos();
            $this->vista->set('productos', $productos);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
        
        
    public function registrarPersona(){
        try {
            $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
            $nombres = isset($_POST['nombres']) ? $_POST['nombres'] : NULL;
            $pApellido = isset($_POST['pApellido']) ? $_POST['pApellido'] : NULL;
            $sApellido = isset($_POST['sApellido']) ? $_POST['sApellido'] : NULL;
            $sexo = isset($_POST['sexo']) ? $_POST['sexo'] : NULL;
            $fNacimiento = isset($_POST['fNacimiento']) ? $_POST['fNacimiento'] : NULL;
            $telefono = isset($_POST['telefono']) ? $_POST['telefono'] : NULL;
            $celular = isset($_POST['celular']) ? $_POST['celular'] : NULL;
            $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : NULL;
            $correo = isset($_POST['correo']) ? $_POST['correo'] : NULL;
            $r = isset($_POST['rol']) ? $_POST['rol'] : NULL;
            
            
            $persona = new Persona();

            $persona->setIdPersona($idPersona);
            $persona->setNombres($nombres);
            $persona->setPApellido($pApellido);
            $persona->setSApellido($sApellido);
            $persona->setSexo($sexo);
            $persona->setFNacimiento($fNacimiento);
            $persona->setTelefono($telefono);
            $persona->setCelular($celular);
            $persona->setDireccion($direccion);
            $persona->setCorreo($correo);

            $persona->crearPersona($persona);
            
            $rol = new Rol();
            if($r == "C"){
                $idRol = $rol->getCliente();
            }elseif($r == "E"){
                $idRol = $rol->getEmpleado();
                $servicios = isset($_POST['servicios']) ? $_POST['servicios'] : NULL;
                $servicios = json_decode($servicios);
                
                $servicio = new Servicio();
                foreach ($servicios as $a){
                    
                    $servicio->crearServicioPersona($a, $idPersona);
                }
                
            }elseif($r == "M"){
                $idRol = $rol->getMedico();
                $servicios = isset($_POST['servicios']) ? $_POST['servicios'] : NULL;
                $servicios = json_decode($servicios);
                
                $usuario = new Usuario();
                $usuario->setIdPersona($idPersona);
                $usuario->setUsuario($idPersona);
                $usuario->setClave($idPersona);
                $usuario->crearUsuario($usuario);
                
                $servicio = new Servicio();
                foreach ($servicios as $a){
                    
                    $servicio->crearServicioPersona($a, $idPersona);
                }
                
            }
            
            $rol->crearRolPersona($idPersona, $idRol);
            
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }

        
        
    }
    
    public function registrarProducto(){
        
        try {
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : NULL;
            $precioVenta = isset($_POST['pVenta']) ? $_POST['pVenta'] : NULL;
            

            $producto = new Producto();

            $producto->setNombre($nombre);
            $producto->setPrecioVenta($precioVenta);
            

            $producto->crearProducto($producto);
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }

    }
    
    public function registrarIngresoProducto(){
        
        try {
            $idProducto = isset($_POST['idProducto']) ? $_POST['idProducto'] : NULL;
            $precio = isset($_POST['precio']) ? $_POST['precio'] : NULL;
            $cantidad = isset($_POST['unidades']) ? $_POST['unidades'] : NULL;
            
            $fecha = getdate();
            $FechaTxt=$fecha["year"]."-".$fecha["mon"]."-".$fecha["mday"];
            $producto = new IngresoProducto();
            $producto->setIdProducto($idProducto);
            $producto->setCantidad($cantidad);
            $producto->setPrecioFabrica($precio);
            $producto->setFechaIngreso($FechaTxt);
            
            $producto->crearProducto($producto);
            
            $p = new Producto();
            $pro = $p->leerProductoPorId($idProducto);
            
            $p->actualizarUnidades($idProducto, $pro->getUnidades()+$cantidad);
            
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }

    }
    
    public function registrarServicio(){
        
        try {
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : NULL;
            $tiempo = isset($_POST['tiempo']) ? $_POST['tiempo'] : NULL;
            $precio = isset($_POST['precio']) ? $_POST['precio'] : NULL;
            

            $servicio = new Servicio();

            $servicio->setNombre($nombre);
            $servicio->setTiempo($tiempo);
            $servicio->setPrecio($precio);
            

            $servicio->crearServicio($servicio);
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }

    }
    
    public function factura(){
        try {
           
            $this->vista->set('titulo', 'Facturar');
            
            $producto = new Producto();
            $productos = $producto->leerProductos();
                        
            $servicio = new Servicio();
            $servicios = $servicio->leerServicios();
            
            $this->vista->set('productos', $productos);
            $this->vista->set('servicios', $servicios);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
    }
        
    public function gestionCita(){
        try {
           
            $this->vista->set('titulo', 'Gestionar Cita');
            
            $servicio = new Servicio();
            $servicios = $servicio->leerServicios();
            
            $this->vista->set('servicios', $servicios);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
    }
        
    public function listarServidores($idServicio){
        
        try {
            $persona = new Persona();
        
        $personas = $persona->leerPorServicio($idServicio);
        
        $this->vista->set('personas', $personas);
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }

        
        
    }
    
    public function consultarProducto(){
        try {
                 $idProducto = isset($_POST['idProducto']) ? $_POST['idProducto'] : NULL;
                 $producto = new Producto();
                 $p = $producto->leerProductoPorId($idProducto);
                 
                 $ingresos = $producto->leerIngresoProducto($idProducto);
                 
                 foreach($ingresos as $ingreso){
                     
                     $p->setPrecioFabrica($ingreso["precioFabrica"]);
                     break;
                 }
                 
                 echo json_encode(array("idProducto"=>$p->getIdProducto(),"nombre"=>$p->getNombre(),"precio"=>$p->getPrecioVenta(),"precioFabrica"=>$p->getPrecioFabrica(),"unidades"=>$p->getUnidades()));      
                 
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }

    }
    
    public function consultarServicio(){
        try {
                 $idServicio = isset($_POST['idServicio']) ? $_POST['idServicio'] : NULL;
                 $servicio = new Servicio();
                 $s = $servicio->leerServicioPorId($idServicio);
                 
                 echo json_encode(array("idServicio"=>$s->getIdServicio(),"nombre"=>$s->getNombre(),"tiempo"=>$s->getTiempo(),"precio"=>$s->getPrecio()));      
                 
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }

    }
    public function consultarPersona(){
        try {
                 $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
                 $persona = new Persona();
                 $p = $persona->leerPorId($idPersona);
                 
                 echo json_encode(array("idPersona"=>$p->getIdPersona(),"nombre"=>$p->getNombres(),"primerApellido"=>$p->getPApellido(),"segundoApellido"=>$p->getSApellido(),"sexo"=>$p->getSexo(),"fechaNacimiento"=>$p->getFNacimiento()->format('Y-m-d'),"telefono"=>$p->getTelefono(),"celular"=>$p->getCelular(),"direccion"=>$p->getDireccion(),"correo"=>$p->getCorreo()));      
                 
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }

    }
    
    public function consultarNombrePersona(){
        try {
                 $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
                 $persona = new Persona();
                 $p = $persona->leerPorId($idPersona);
                 
                 if($p){
                     echo json_encode($p->getNombres()." ".$p->getPApellido()." ".$p->getSApellido());      
                 }else{
                     echo json_encode("No existe en la Base de Datos");      
                 }
                 
                 
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }

    }
    
    public function consultarPersonaPorServicio($idServicio){
        try {
           
            $this->vista->set('titulo', 'Gestionar Cita');
            
            $persona = new Persona();
            $personas = $persona->leerPersonasPorServicio($idServicio);
            
            $this->vista->set('personas', $personas);
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
    }
    
    public function modificarPersona(){
        try {
            $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
            $nombres = isset($_POST['nombres']) ? $_POST['nombres'] : NULL;
            $pApellido = isset($_POST['pApellido']) ? $_POST['pApellido'] : NULL;
            $sApellido = isset($_POST['sApellido']) ? $_POST['sApellido'] : NULL;
            $sexo = isset($_POST['sexo']) ? $_POST['sexo'] : NULL;
            $fNacimiento = isset($_POST['fNacimiento']) ? $_POST['fNacimiento'] : NULL;
            $telefono = isset($_POST['telefono']) ? $_POST['telefono'] : NULL;
            $celular = isset($_POST['celular']) ? $_POST['celular'] : NULL;
            $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : NULL;
            $correo = isset($_POST['correo']) ? $_POST['correo'] : NULL;
            
            $persona = new Persona();

            $persona->setIdPersona($idPersona);
            $persona->setNombres($nombres);
            $persona->setPApellido($pApellido);
            $persona->setSApellido($sApellido);
            $persona->setSexo($sexo);
            $persona->setFNacimiento($fNacimiento);
            $persona->setTelefono($telefono);
            $persona->setCelular($celular);
            $persona->setDireccion($direccion);
            $persona->setCorreo($correo);

            $persona->actualizarPersona($persona);
            
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }
   
    }

     public function modificarServicio(){
        try {
            
            $idServicio = isset($_POST['codServic']) ? $_POST['codServic'] : NULL;
            $nombreServicio = isset($_POST['nombreServic']) ? $_POST['nombreServic'] : NULL;
            $tiempoServicio = isset($_POST['tServic']) ? $_POST['tServic'] : NULL;
            $precioServicio = isset($_POST['pServic']) ? $_POST['pServic'] : NULL;
           
            
            $servicio = new Servicio();
            $servicio->setIdServicio($idServicio);
            $servicio->setNombre($nombreServicio);
            $servicio->setPrecio($precioServicio);
            $servicio->setTiempo($tiempoServicio);

            $servicio->actualizarServicio($servicio);
            
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }

        
        
    }

    
    public function guardarFactura(){
        try {
            $servicios = isset($_POST['servicios']) ? $_POST['servicios'] : NULL;
            $servicios = json_decode($servicios);
            $productos = isset($_POST['productos']) ? $_POST['productos'] : NULL;
            $productos = json_decode($productos);
            $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
            $fecha = getdate();
            $fecha = $fecha["year"]."-".$fecha["mon"]."-".$fecha["mday"];
            $hora = date("H:i:s");
            $factura = new Factura();
            $factura->setIdPersona($idPersona);
            $factura->setFecha($fecha);
            $factura->setHora($hora);
            $idFactura = $factura->crearFactura($factura);
            
            foreach ($productos as $p){
                
                $df = new DetalleProducto();
                $df->setIdFactura($idFactura);
                $df->setIdProducto($p[0]);
                $df->setCantidad($p[1]);
                $df->setPrecioVenta($p[2]);
                $df->crearDetalleProducto($df);
                
                $producto = new Producto();
                $pro = $producto->leerProductoPorId($p[0]);
                $producto->actualizarUnidades($pro->getIdProducto(), $pro->getUnidades() - $p[1]);
            }
            
            foreach ($servicios as $s){
                $ds = new DetalleServicio();
                $ds->setIdFactura($idFactura);
                $ds->setIdServicio($s[0]);
                $ds->setIdPersona($s[1]);
                $ds->setPrecio($s[2]);
                $ds->crearDetalleServicio($ds);
            }
            
            echo json_encode(array("respuesta"=>"exito","idFactura"=>$idFactura));
            
        } catch (Exception $exc) {
            echo json_encode($exc->getTraceAsString());
        }
        }
        
 public function tablaIngresoProducto(){
     $idProducto = isset($_POST['idProducto']) ? $_POST['idProducto'] : NULL;
     $inicio= isset($_POST['inicio']) ? $_POST['inicio'] : NULL;
     $fin = isset($_POST['fin']) ? $_POST['fin'] : NULL;
     
     
     $dp = new DetalleProducto();
     $detalles = $dp->leerPagosPorIdProductoyRangoFecha($idProducto, $inicio, $fin);
     
     $this->vista->set('detalles', $detalles);
     return $this->vista->imprimir();
     
 }       
 
 public function tablaIngresoServicio(){
     $idServicio = isset($_POST['idServicio']) ? $_POST['idServicio'] : NULL;
     $inicio= isset($_POST['inicio']) ? $_POST['inicio'] : NULL;
     $fin = isset($_POST['fin']) ? $_POST['fin'] : NULL;
     
     
     $ds = new DetalleServicio();
     $detalles = $ds->leerPagosPorIdServicioyRangoFecha($idServicio, $inicio, $fin);
     
     $this->vista->set('detalles', $detalles);
     return $this->vista->imprimir();
     
 }
 
 public function tablaIngresoEmpleado(){
     
     $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
     $inicio= isset($_POST['inicio']) ? $_POST['inicio'] : NULL;
     $fin = isset($_POST['fin']) ? $_POST['fin'] : NULL;
     
     $ds = new DetalleServicio();
     $detalles = $ds->leerServiciosPorIdPersonayRangoFecha($idPersona, $inicio, $fin);
     $this->vista->set('detalles', $detalles);
     return $this->vista->imprimir();
 }
        
    
 public function tablaIngresoTotal(){
  
     $inicio= isset($_POST['inicio']) ? $_POST['inicio'] : NULL;
     $fin = isset($_POST['fin']) ? $_POST['fin'] : NULL;
     
     $factura = new Factura();
     $detalles = $factura->leerFacturaPorRangoFecha($inicio, $fin);
     $this->vista->set('detalles', $detalles);
     return $this->vista->imprimir();   
 }
 
 public function tablaCargaFecha(){
  
     $inicio= isset($_POST['inicio']) ? $_POST['inicio'] : NULL;
     $fin = isset($_POST['fin']) ? $_POST['fin'] : NULL;
     
     $ingreso = new IngresoProducto();
     $detalles = $ingreso->leerIngresoPorRangoFecha($inicio, $fin);
     $this->vista->set('detalles', $detalles);
     return $this->vista->imprimir();   
 }
 
 public function consultarServiciosPersona() {
     $idPersona= isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
     
     $s = new Servicio();
     $servs = $s->leerServicios();
     $servicios = $s->leerServicioPorPersona($idPersona);
     
     $this->vista->set('servs', $servs);
     $this->vista->set('servicios', $servicios);
     return $this->vista->imprimir();   
     
 }
 
 public function agregarServiciosEmpleado(){
        try {
            $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
            $servicios = isset($_POST['servicios']) ? $_POST['servicios'] : NULL;
            $servicios = json_decode($servicios);
                
                $servicio = new Servicio();
                foreach ($servicios as $a){
                    
                    $s = $servicio->leerServicioPorIdServicioyPersona($idPersona, $a);
                    if($s == NULL){
                        $servicio->crearServicioPersona($a, $idPersona);
                    }
                    
                }
            
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }

    }
  public function configuracionUsuario(){
          try {
            if($this->verificarSession()){
            $this->vista->set('titulo', 'configuracion de Usuario');
            $idPersona = $_SESSION['idUsuario'];
             $pers = new Persona();
             $user = new Usuario();
             $persona = $pers->leerPorId($idPersona);
             $usuario = $user->leerPorId($idPersona);
             $this->vista->set('usuario', $usuario);
             $this->vista->set('persona', $persona);
            return $this->vista->imprimir();
            }
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
        }
    public function eliminarServiciosEmpleado(){
        try {
            $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
            $idServicio = isset($_POST['idServicio']) ? $_POST['idServicio'] : NULL;
            
            $servicio = new Servicio();
            $servicio->eliminarServicioPersona($idPersona, $idServicio);
            
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }
   
    }
    
    public function detallesFactura(){
        $idFactura= isset($_POST['idFactura']) ? $_POST['idFactura'] : NULL;
        
        $ds = new DetalleServicio();
        $dp = new DetalleProducto();
        
        $dServicios = $ds->leerServiciosPorIdFactura($idFactura);
        $dProductos = $dp->leerProductosPorIdFactura($idFactura);
     
        $this->vista->set('ds', $dServicios);
        $this->vista->set('dp', $dProductos);
        return $this->vista->imprimir();   
    }
    
    public function disponibilidadServidor(){
        
        $idPersona= isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
        $idServicio= isset($_POST['idServicio']) ? $_POST['idServicio'] : NULL;
        
        $persona= new Persona();
        $servicio = new Servicio();
        $p = $persona->leerPorId($idPersona);
        $serv = $servicio->leerServicioPorId($idServicio);
        $cita = new Cita();
        
        $citas = $cita->leerCitaPorId($idPersona);
        $array = array();
        foreach ($citas as $c) {
            
            $hora= $c["hora"];
            $ah = explode(":", $hora);
            
            $h = $ah[0];
            $m = $ah[1];
            $s= $ah[2];
            
            $nm= $m + $c["tiempo"];
            $nh= $h;
            if($nm>60){
                $nm -=60;
                $nh +=1;
            }
            
           $array[] = array(
                'id' => $c["idCita"],
                'title' => $c["nombre"]." Para:".$c["nombres"]." ".$c["pApellido"],
                'start' => $c["fecha"]." ".$h.":".$m,
                'end' => $c["fecha"]." ".$nh.":".$nm,
                'allDay'=>false
           );            
        }
        
        echo json_encode(array("idPersona"=>$p->getIdPersona(),"nombre"=>$p->getNombres()." ".$p->getPApellido(),"nombreS"=>$serv->getNombre(),"precio"=>$serv->getPrecio(),"tiempo"=>$serv->getTiempo(),"array"=>$array));
        
        
    }
    public function guardarCita(){
        try {
            $idPersona= isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
        $idServicio= isset($_POST['idServicio']) ? $_POST['idServicio'] : NULL;
        $idCliente= isset($_POST['idCliente']) ? $_POST['idCliente'] : NULL;
        $fecha= isset($_POST['fecha']) ? $_POST['fecha'] : NULL;
        $hora= isset($_POST['hora']) ? $_POST['hora'] : NULL;
        
        $persona = new Persona();
        $p = $persona->leerPorId($idCliente);
        
        $servicio = new Servicio();
        $s= $servicio->leerServicioPorId($idServicio);
        
        $cita = new Cita();
        $cita->setEstado($cita->getReservado());
        $cita->setFecha($fecha);
        $cita->setHora($hora);
        $cita->setIdCliente($idCliente);
        $cita->setIdServicio($idServicio);
        $cita->setIdPersona($idPersona);
        
        $cita->crearCita($cita);
        
        echo json_encode(array("mensaje"=>"Cita Guardada Correctamente","cliente"=>$p->getNombres()." ".$p->getPApellido(),"servicio"=>$s->getNombre(),"tiempo"=>$s->getTiempo()));
        
        
        } catch (Exception $exc) {
            echo json_encode(array("mensaje"=>"Error al Guardar Cita"));
        }

        
    }
    
    public function tablaCitas(){
        try {
           $fecha= isset($_POST['fecha']) ? $_POST['fecha'] : NULL;
            $cita = new Cita();
            
            $citas = $cita->leerCitasDelDia($fecha);
            $this->vista->set('citas', $citas);        
            return $this->vista->imprimir();
 
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }  
      
        }
    
    public function generarFactura($idFactura){
        
        $factura = new Factura();
        $dp = new DetalleProducto();
        $ds = new DetalleServicio();
        $persona = new Persona();
        $f = $factura->leerFacturaPorId($idFactura);
        $detp = $dp->leerProductosPorIdFactura($idFactura);
        $dets = $ds->leerServiciosPorIdFactura($idFactura);
        
        $p = $persona->leerPorId($f->getIdPersona());
        
        
        $pdf = new FPDF('P', 'cm', 'Letter');
        
        $x=1; $y=1;
        
        $pdf->AddPage();
        $pdf->SetFont("Arial", "B", 15);
        $pdf->SetXY($x,$y);
        $pdf->SetTextColor(53,187, 240);
        $pdf->cell(19, 1, utf8_decode("PALACE SPA MÉDICO ESTÉTICO"), 0, 0, "C");
        $pdf->Image('utiles/image/logo.jpg', 1, 1.25, 4.5);
        $pdf->SetTextColor(0,0,0);
        $pdf->SetFont("Arial", "", 10);
        $y+=.5;
        $pdf->SetXY($x,$y);
        $pdf->Cell(19, 1, utf8_decode("NIT. 42.493.910 - 8"), 0, 1, "C");
        $y+=.5;
        $pdf->SetXY($x,$y);
        $pdf->Cell(19, 1, utf8_decode("Carrera 19 # 7B - 14 Los Músicos"), 0, 1, "C");
        $y+=.5;
        $pdf->SetXY($x,$y);
        $pdf->Cell(19, 1, "Valledupar - Cesar", 0, 1, "C");
        $x=16; $y = 1;
        $pdf->SetXY($x,$y);
        $pdf->SetFillColor(53,187, 240);
        $pdf->SetTextColor(255,255, 255);
        $pdf->SetDrawColor(0,144,217);
        $pdf->Cell(4, 0.5, utf8_decode("Factura N°"), 1, 0, "L",1);
        $y += .5;
        $pdf->SetXY($x,$y);
        $pdf->SetTextColor(0,0,0);
        $pdf->SetFont("Arial", "", 12);
        $pdf->Cell(4, 1, $idFactura."    ", 1, 0, "R",0);
        $pdf->SetFont("Arial", "", 10);
        $y += 1.25;
        $pdf->SetXY($x,$y);
        $pdf->SetFillColor(53,187, 240);
        $pdf->SetTextColor(255,255, 255);
        $pdf->SetDrawColor(0,144,217);
        $pdf->Cell(4, 0.5, utf8_decode("Fecha"), 1, 0, "L",1);
        $y += .5;
        $pdf->SetXY($x,$y);
        $pdf->SetTextColor(0,0,0);
        $pdf->SetFont("Arial", "", 12);
        $pdf->Cell(4, 1, $f->getFecha()."    ", 1, 0, "R",0);
        $y += 1.25;
        $x = 1;
        $pdf->SetXY($x,$y);
        $pdf->SetTextColor(0,0,0);
        $pdf->SetFont("Arial", "", 10);
        $pdf->SetTextColor(255,255, 255);
        $pdf->Cell(19, 0.5, utf8_decode("Datos del Cliente"), 1, 0, "L",1);
        $y += .5;
        $pdf->SetXY($x,$y);
        $pdf->SetFont("Arial", "", 11);
        $pdf->SetTextColor(53,187, 240);
        $pdf->Cell(2, 1, "Nombre:", 0, 0, "R",0);
        $pdf->SetTextColor(0,0,0);
        $pdf->Cell(8, 1, utf8_decode($p->getNombres()." ".$p->getPApellido()." ".$p->getSApellido()), 0, 0, "L",0);
        $pdf->SetTextColor(53,187, 240);
        $pdf->Cell(2, 1, utf8_decode("Dirección:"), 0, 0, "R",0);
        $pdf->SetTextColor(0,0,0);
        $pdf->Cell(7, 1, utf8_decode($p->getDireccion()), 0, 0, "L",0);
        
        $y += .5;
        $pdf->SetXY($x,$y);
        $pdf->SetFont("Arial", "", 11);
        $pdf->SetTextColor(53,187, 240);
        $pdf->Cell(2, 1, "C.C:", 0, 0, "R",0);
        $pdf->SetTextColor(0,0,0);
        $pdf->Cell(8, 1, $p->getIdPersona(), 0, 0, "L",0);
        $pdf->SetTextColor(53,187, 240);
        $pdf->Cell(2, 1, utf8_decode("Teléfono:"), 0, 0, "R",0);
        $pdf->SetTextColor(0,0,0);
        $pdf->Cell(7, 1, $p->getCelular(), 0, 0, "L",0);
        
        $y-=.5;
        $pdf->SetXY($x,$y);
        $pdf->Cell(19, 1.5, "", 1, 0, "R",0);
        
        $y+=2;
        $pdf->SetXY($x,$y);
        $pdf->SetFont("Arial", "", 10);
         $pdf->SetTextColor(255,255, 255);
        $pdf->Cell(2.5, 0.5, "CANTIDAD", 1, 0, "C",1);
        $pdf->Cell(11.5, 0.5, "PRODUCTO/SERVICIO", 1, 0, "C",1);
        $pdf->Cell(2.5, 0.5, "PRECIO UNIT.", 1, 0, "C",1);
        $pdf->Cell(2.5, 0.5, "SUBTOTAL", 1, 0, "C",1);
        
        $y+=.5;
        $pdf->SetXY($x,$y);
        $pdf->Cell(2.5, 16, "", 1, 0, "R",0);
        $pdf->Cell(11.5, 16, "", 1, 0, "R",0);
        $pdf->Cell(2.5, 16, "", 1, 0, "R",0);
        $pdf->Cell(2.5, 16, "", 1, 0, "R",0);
        $yn = $y;
        
        $pdf->SetTextColor(0,0,0);
        $pdf->SetXY($x,$y);
        $suma=0;
        foreach ($dets as $det){
            
            $pdf->Cell(2.5, 0.5, "1", 0, 0, "R",0);
            $pdf->Cell(11.5, 0.5, $det["nombre"], 0, 0, "R",0);
            $pdf->Cell(2.5, 0.5, $det["precioFactura"], 0, 0, "R",0);
            $pdf->Cell(2.5, 0.5, $det["precioFactura"], 0, 0, "R",0);
            $suma +=$det["precioFactura"];
            $y+=.5;
            $pdf->SetXY($x,$y);
        }
        
        foreach ($detp as $det){
            $pdf->Cell(2.5, 0.5, $det["cantidad"], 0, 0, "R",0);
            $pdf->Cell(11.5, 0.5, $det["nombre"], 0, 0, "R",0);
            $pdf->Cell(2.5, 0.5, $det["precioVenta"], 0, 0, "R",0);
            $pdf->Cell(2.5, 0.5, $det["precioVenta"] * $det["cantidad"], 0, 0, "R",0);
            $suma += $det["precioVenta"] * $det["cantidad"];
            $y+=.5;
            $pdf->SetXY($x,$y);
            
        }
        
        $yn += 16;
        $pdf->SetXY($x,$yn);
        $pdf->SetTextColor(255,255,255);
        $pdf->Cell(2.5, 0.5, "", 0, 0, "R",0);
            $pdf->Cell(11.5, 0.5, "", 0, 0, "R",0);
            $pdf->Cell(2.5, 0.5,"TOTAL", 1, 0, "R",1);
            $pdf->SetTextColor(0,0,0);
            $pdf->Cell(2.5, 0.5, $suma, 1, 0, "R",0);
            
        $pdf->Output("Factura N° ".$idFactura, "I");
    }
        
}