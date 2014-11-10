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
class AdministradorControl extends Controlador {

    public function __construct($modelo, $accion) {
        parent::__construct($modelo, $accion);
    }

    public function usuarioAdministrador() {
        try {

            if ($this->verificarSession()) {
                $this->vista->set('titulo', 'Usuario Administrador');
                $persona = new Persona();
                $rol = new Rol();
                $personas = $persona->leerPersonasPorRol($rol->getCliente());
                $this->vista->set('personas', $personas);
                $producto = new Producto();
                $productos = $producto->leerProductos();
                $this->vista->set('productos', $productos);
                $empleado = new Persona();
                $empleados = $empleado->leerPersonasPorRol($rol->getFarmaceutico());
                $this->vista->set('empleados', $empleados);
                $proveedor = new Proveedor();
                $proveedores = $proveedor->leerProveedores();
                $this->vista->set('proveedores', $proveedores);
                
                $laboratorio = new Laboratorio();
                $laboratorios = $laboratorio->leerLaboratorios();
                $this->vista->set('laboratorios', $laboratorios);
                return $this->vista->imprimir();
            }
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }

    public function registroPersona() {
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

    public function registroProveedor() {
        try {

            $this->vista->set('titulo', 'Registrar Proveedor');

            $proveedor = new Proveedor();

            $proveedores = $proveedor->leerProveedores();
            $this->vista->set('proveedores', $proveedores);
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }
    
    public function registroLaboratorios() {
        try {

            $this->vista->set('titulo', 'Registrar Laboratorio');

            $laboratorio = new Laboratorio();

            $laboratorios = $laboratorio->leerLaboratorios();
            $this->vista->set('proveedores', $laboratorios);
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }

    public function inventarioProducto() {
        try {

            $this->vista->set('titulo', 'Registrar Persona');
            $producto = new Producto();
            $productos = $producto->leerProductos();
            $proveedor = new Proveedor();
            $proveedores = $proveedor->leerProveedores();
            $laboratorio = new Laboratorio();
            $laboratorios = $laboratorio->leerLaboratorios();
            $this->vista->set('productos', $productos);
            $this->vista->set('proveedores', $proveedores);
            $this->vista->set('laboratorios', $laboratorios);
            return $this->vista->imprimir();
            
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }

    public function registroCita() {
        try {

            $this->vista->set('titulo', 'Registrar Persona');
            $servicio = new Servicio();
            $servicios = $servicio->leerServicios();
            $this->vista->set('servicios', $servicios);
            $cita = new Cita();
            $fecha = getdate();
            $FechaTxt = $fecha["year"] . "-" . $fecha["mon"] . "-" . $fecha["mday"];
            $citas = $cita->leerCitasDelDia($FechaTxt);
            $this->vista->set('citas', $citas);
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }

    public function registroEmpleado() {
        try {
            $this->vista->set('titulo', 'Registro Empleado');

            $persona = new Persona();
            $rol = new Rol();
            $personas = $persona->leerPersonasPorRol($rol->getFarmaceutico());
            $this->vista->set('personas', $personas);
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }

    public function gestionServicio() {
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

    public function consultas() {
        try {

            $this->vista->set('titulo', 'Consultas');
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }

    public function ingresoTotal() {
        try {
            $factura = new Factura();
            $fecha = getdate();
            $FechaTxt = $fecha["year"] . "-" . $fecha["mon"] . "-" . $fecha["mday"];
            $detalles = $factura->leerFacturaPorRangoFecha($FechaTxt, $FechaTxt);
            $this->vista->set('detalles', $detalles);
            $ingreso = new IngresoProducto();
            $detalles2 = $ingreso->leerIngresoPorRangoFecha($FechaTxt, $FechaTxt);
            $this->vista->set('detalles2', $detalles2);
            
            $this->vista->set('titulo', 'Ingresos Totales');
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }

    public function ingresoEmpleado() {
        try {

            $this->vista->set('titulo', 'Ingresos por Empleado');
            $persona = new Persona();
            $rol = new Rol();
            $empleados = $persona->leerPorRol($rol->getFarmaceutico());
            $this->vista->set('empleados', $empleados);
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }

    public function ingresoServicio() {
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

    public function ingresoProducto() {
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

    public function cargaFecha() {
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

    public function cargaProducto() {
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

    public function registrarPersona() {
        try {
            $identificacion = isset($_POST['identificacion']) ? $_POST['identificacion'] : NULL;
            $tipoIdentificacion = isset($_POST['tipoIdentificacion']) ? $_POST['tipoIdentificacion'] : NULL;
            $nombres = isset($_POST['nombres']) ? $_POST['nombres'] : NULL;
            $pApellido = isset($_POST['pApellido']) ? $_POST['pApellido'] : NULL;
            $sApellido = isset($_POST['sApellido']) ? $_POST['sApellido'] : NULL;
            $sexo = isset($_POST['sexo']) ? $_POST['sexo'] : NULL;
            $fNacimiento = isset($_POST['fNacimiento']) ? $_POST['fNacimiento'] : NULL;
            $telefono = isset($_POST['telefono']) ? $_POST['telefono'] : NULL;
            $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : NULL;
            $r = isset($_POST['rol']) ? $_POST['rol'] : NULL;


            $persona = new Persona();

            $persona->setIdentificacion($identificacion);
            $persona->setTipoIdentificacion($tipoIdentificacion);
            $persona->setNombres($nombres);
            $persona->setPApellido($pApellido);
            $persona->setSApellido($sApellido);
            $persona->setSexo($sexo);
            $persona->setFNacimiento($fNacimiento);
            $persona->setTelefono($telefono);
            $persona->setDireccion($direccion);
            $idPersona = $persona->crearPersona($persona);

            $rol = new Rol();
            if ($r == "C") {
                $idRol = $rol->getCliente();
            } elseif ($r == "F") {
                $idRol = $rol->getFarmaceutico();
            }
            $rol->crearRolPersona($idPersona, $idRol);

            echo json_encode("exito");
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }
    }

    public function registrarProducto() {

        try {
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : NULL;
            $precio = isset($_POST['precio']) ? $_POST['precio'] : NULL;
            $unidadPrincipal = isset($_POST['unidadPrincipal']) ? $_POST['unidadPrincipal'] : NULL;
            $comision = isset($_POST['comision']) ? $_POST['comision'] : NULL;
            $iva = isset($_POST['iva']) ? $_POST['iva'] : NULL;
            $codigo = isset($_POST['codigo']) ? $_POST['codigo'] : NULL;
            $idLaboratorio = isset($_POST['idLaboratorio']) ? $_POST['idLaboratorio'] : NULL;
            $estante = isset($_POST['estante']) ? $_POST['estante'] : NULL;
            
            $presentaciones = isset($_POST['presentaciones']) ? $_POST['presentaciones'] : NULL;
            $presentaciones = json_decode($presentaciones);
            
            $producto = new Producto();

            $producto->setNombre($nombre);
            $producto->setPrecio($precio);
            $producto->setComision($comision);
            $producto->setUnidadPrincipal($unidadPrincipal);
            $producto->setIva($iva);
            $producto->setUnidades(0);
            $producto->setCodigo($codigo);
            $producto->setIdEstante($estante);
            $producto->setIdLaboratorio($idLaboratorio);
            
            $idProducto = $producto->crearProducto($producto);
            
            foreach ($presentaciones as $pre){
                
                $producto->crearPresentacionProducto($idProducto, $pre[0], $pre[1]);
                
            }
                
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }
    }

    public function registrarProveedor() {

        try {
            
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : NULL;
            $descripcion = isset($_POST['descripcion']) ? $_POST['descripcion'] : NULL;
            
            $proveedor = new Proveedor();

            $proveedor->setNombre($nombre);
            $proveedor->setDescripcion($descripcion);
            
            $proveedor->crearProveedor($proveedor);
            echo json_encode("exito");
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }
    }

    public function registrarIngresoProducto() {

        try {
            $idProducto = isset($_POST['idProducto']) ? $_POST['idProducto'] : NULL;
            $precio = isset($_POST['precio']) ? $_POST['precio'] : NULL;
            $cantidad = isset($_POST['unidades']) ? $_POST['unidades'] : NULL;
            $idProveedor = isset($_POST['idProveedor']) ? $_POST['idProveedor'] : NULL;
            $fechaVencimiento = isset($_POST['fechaVencimiento']) ? $_POST['fechaVencimiento'] : NULL;

            $fecha = getdate();
            $FechaTxt = $fecha["year"] . "-" . $fecha["mon"] . "-" . $fecha["mday"];
            $producto = new IngresoProducto();
            $producto->setIdProducto($idProducto);
            $producto->setCantidad($cantidad);
            $producto->setPrecio($precio);
            $producto->setFecha($FechaTxt);
            $producto->setFechaVencimiento($fechaVencimiento);
            $producto->setIdProveedor($idProveedor);
            $producto->crearProducto($producto);

            $p = new Producto();
            $pro = $p->leerProductoPorId($idProducto);
            
            $cant = $cantidad * $pro->getUnidadesProducto();
            $p->actualizarUnidades($idProducto, $pro->getUnidades() + $cant);

            echo json_encode("exito");
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }
    }

    public function registrarServicio() {

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

    public function factura() {
        try {

            $this->vista->set('titulo', 'Facturar');

            $producto = new Producto();
            $productos = $producto->leerProductos();

            $this->vista->set('productos', $productos);

            $persona = new Persona();
            $rol = new Rol();

            $personas = $persona->leerPersonasPorRol($rol->getFarmaceutico());

            $this->vista->set('personas', $personas);
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }
    
    public function compra() {
        try {

            $this->vista->set('titulo', 'Compras');

            $producto = new Producto();
            $productos = $producto->leerProductos();

            $this->vista->set('productos', $productos);
            
            $proveedor = new Proveedor();
            $proveedores  = $proveedor->leerProveedores();
            $this->vista->set('proveedores', $proveedores);
            
            $persona = new Persona();
            $rol = new Rol();

            $personas = $persona->leerPersonasPorRol($rol->getFarmaceutico());

            $this->vista->set('personas', $personas);
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }

    public function gestionCita() {
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

    public function listarServidores($idServicio) {

        try {
            $persona = new Persona();

            $personas = $persona->leerPorServicio($idServicio);

            $this->vista->set('personas', $personas);
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function consultarProducto() {
        try {
            $idProducto = isset($_POST['idProducto']) ? $_POST['idProducto'] : NULL;
            $producto = new Producto();
            $p = $producto->leerProductoPorId($idProducto);

            $ingresos = $producto->leerIngresoProducto($idProducto);
            $pf = 0;
            foreach ($ingresos as $ingreso) {

                $pf = $ingreso["precio"];
                break;
            }
            
            $presentaciones = $producto->leerPresentacionesProducto($idProducto);
            
            $table = '<table border="0" align="center" width="100%" id="mitabla">
                         <thead>
                            <th>Nombre</th>
                            <th>Cantidad</th>
                            <th>Existencias</th>
                            <th width="10%">Eliminar</th>
                        </thead>
                        <tbody>';
            foreach ($presentaciones as $prp) {
                
                $table .= '
                        <tr align="left" class="recorrer">
                            <td >' . $prp["nombreP"] . '</td>
                            <td >' . $prp["cantidad"] . '</td>
                            <td >' . ($p->getUnidades()/$prp["cantidad"]) . '</td>
                            <td ><a href="#" onclick="eliminarPresentacion(' . $prp["idPresentacion"] . ')">Eliminar</a></td> 
                        </tr>';
            }

            $table .= '</tbody></table>';
            
            echo json_encode(array("idProducto" => $p->getIdProducto(), "nombre" => $p->getNombre(), "precio" => $p->getPrecio(), "precioFabrica" => $pf, "unidades" => $p->getUnidades(), "iva" => $p->getIva(), "codigoBarras"=>$p->getCodigo(),"unidadPrincipal"=>$p->getUnidadPrincipal(), "comision"=>$p->getComision(), "idLaboratorio"=>$p->getIdLaboratorio(), "estante"=>$p->getIdEstante(), "tabla"=>$table));
            
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
    
    public function consultarProducto2() {
        try {
            $idProducto = isset($_POST['idProducto']) ? $_POST['idProducto'] : NULL;
            $producto = new Producto();
            $p = $producto->leerProductoPorId($idProducto);

            $ingresos = $producto->leerIngresoProducto($idProducto);
            $pf = 0;
            foreach ($ingresos as $ingreso) {

                $pf = $ingreso["precio"];
                break;
            }
            
            $presentaciones = $producto->leerPresentacionesProducto($idProducto);
            
            $table = '';
            foreach ($presentaciones as $prp) {
                
                $table .= '<option value="'.$prp["idPresentacion"].'">'.$prp["nombreP"]." /".$prp["cantidad"].'</option>';
            }

            echo json_encode(array("idProducto" => $p->getIdProducto(), "nombre" => $p->getNombre(), "precio" => $p->getPrecio(), "precioFabrica" => $pf, "unidades" => $p->getUnidades(), "iva" => $p->getIva(), "codigoBarras"=>$p->getCodigo(),"unidadPrincipal"=>$p->getUnidadPrincipal(), "comision"=>$p->getComision(), "tabla"=>$table));
            
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
    
    public function imprimirContenido($html){
        echo $html;
    }
    
    public function consultarProductoByCodigo() {
        try {
            $codigo = isset($_POST['codigo']) ? $_POST['codigo'] : NULL;
            $producto = new Producto();
            $p = $producto->leerProductoPorCodigo($codigo);

            $ingresos = $producto->leerIngresoProducto($p->getIdProducto());
            $pf = 0;
            foreach ($ingresos as $ingreso) {

                $pf = $ingreso["precio"];
                break;
            }
            $pfu= $pf/$p->getUnidadesProducto();
            echo json_encode(array("idProducto" => $p->getIdProducto(), "nombre" => $p->getNombre(), "descripcion" => $p->getDescripcion(), "contenido" => $p->getContenido(), "precio" => $p->getPrecio(), "precioFabrica" => $pfu, "unidades" => $p->getUnidades(), "iva" => $p->getIva(), "codigoBarras"=>$p->getCodigo(),"unidadPrincipal"=>$p->getUnidadPrincipal(), "unidadesProducto"=>$p->getUnidadesProducto(), "comision"=>$p->getComision()));
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function consultarServicio() {
        try {
            $idServicio = isset($_POST['idServicio']) ? $_POST['idServicio'] : NULL;
            $servicio = new Servicio();
            $s = $servicio->leerServicioPorId($idServicio);

            echo json_encode(array("idServicio" => $s->getIdServicio(), "nombre" => $s->getNombre(), "tiempo" => $s->getTiempo(), "precio" => $s->getPrecio()));
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
    
    public function consultarProveedor() {
        try {
            $idProveedor = isset($_POST['idProveedor']) ? $_POST['idProveedor'] : NULL;
            $proveedor = new Proveedor();
            $p = $proveedor->leerProveedorPorId($idProveedor);
            
            echo json_encode(array("idProveedor" => $p->getIdProveedor(), "nombre" => $p->getNombre(),"descripcion" => $p->getDescripcion()));
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function consultarPersona() {
        try {
            $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
            $persona = new Persona();
            $p = $persona->leerPorId($idPersona);

            echo json_encode(array("idPersona" => $p->getIdPersona(), "identificacion" => $p->getIdentificacion(), "tipoIdentificacion" => $p->gettipoIdentificacion(), "nombre" => $p->getNombres(), "primerApellido" => $p->getPApellido(), "segundoApellido" => $p->getSApellido(), "sexo" => $p->getSexo(), "fechaNacimiento" => $p->getFNacimiento()->format('Y-m-d'), "telefono" => $p->getTelefono(), "direccion" => $p->getDireccion()));
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function consultarNombrePersona() {
        try {
            $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
            $persona = new Persona();
            $p = $persona->leerPorCedula($idPersona);

            if ($p) {
                echo json_encode($p->getNombres() . " " . $p->getPApellido() . " " . $p->getSApellido());
            } else {
                echo json_encode("No existe en la Base de Datos");
            }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function consultarPersonaPorServicio($idServicio) {
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

    public function modificarPersona() {
        try {
            $idPersona = isset($_POST['identificacion']) ? $_POST['identificacion'] : NULL;
            $nombres = isset($_POST['nombres']) ? $_POST['nombres'] : NULL;
            $pApellido = isset($_POST['pApellido']) ? $_POST['pApellido'] : NULL;
            $sApellido = isset($_POST['sApellido']) ? $_POST['sApellido'] : NULL;
            $sexo = isset($_POST['sexo']) ? $_POST['sexo'] : NULL;
            $fNacimiento = isset($_POST['fNacimiento']) ? $_POST['fNacimiento'] : NULL;
            $telefono = isset($_POST['telefono']) ? $_POST['telefono'] : NULL;
            
            $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : NULL;
            
            $tipoIdentificacion=isset($_POST['tipoIdentificacion']) ? $_POST['tipoIdentificacion'] : NULL;
            
            $persona = new Persona();

            $persona->setIdentificacion($idPersona);
            $persona->setNombres($nombres);
            $persona->setPApellido($pApellido);
            $persona->setSApellido($sApellido);
            $persona->setSexo($sexo);
            $persona->setTipoIdentificacion($tipoIdentificacion);
            $persona->setFNacimiento($fNacimiento);
            $persona->setTelefono($telefono);
            $persona->setDireccion($direccion);
            

            $persona->actualizarPersona($persona);

            echo json_encode("exito");
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }
    }
    
    public function modificarProducto() {
        try {
            $idProducto = isset($_POST['id']) ? $_POST['id'] : NULL;
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : NULL;
            $precio = isset($_POST['pVenta']) ? $_POST['pVenta'] : NULL;
            $unidadPrincipal = isset($_POST['unidadPrincipal']) ? $_POST['unidadPrincipal'] : NULL;
            $iva = isset($_POST['iva']) ? $_POST['iva'] : NULL;
            $comision = isset($_POST['comision']) ? $_POST['comision'] : NULL;
            $codigo = isset($_POST['codigo']) ? $_POST['codigo'] : NULL;
            $idLaboratorio = isset($_POST['idLaboratorio']) ? $_POST['idLaboratorio'] : NULL;
            $estante = isset($_POST['estante']) ? $_POST['estante'] : NULL;
            
            $producto = new Producto();

            $producto->setIdProducto($idProducto);
            $producto->setNombre($nombre);
            $producto->setPrecio($precio);
            $producto->setUnidadPrincipal($unidadPrincipal);
            $producto->setIva($iva);
            $producto->setComision($comision);
            $producto->setCodigo($codigo);
            $producto->setIdLaboratorio($idLaboratorio);
            $producto->setIdEstante($estante);
            
            $producto->actualizarProducto($producto);

            echo json_encode("exito");
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }
    }
    
    public function modificarProveedor() {
        try {
            $idProveedor = isset($_POST['idProveedor']) ? $_POST['idProveedor'] : NULL;
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : NULL;
            $descripcion = isset($_POST['descripcion']) ? $_POST['descripcion'] : NULL;
            
            $proveedor = new Proveedor();

            $proveedor->setIdProveedor($idProveedor);
            $proveedor->setNombre($nombre);
            $proveedor->setDescripcion($descripcion);
            
            $proveedor->actualizarProveedor($proveedor);

            echo json_encode("exito");
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }
    }

    public function modificarServicio() {
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
    
    public function guardarFactura() {
        try {

            $productos = isset($_POST['productos']) ? $_POST['productos'] : NULL;
            $productos = json_decode($productos);
            $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
            $idFarmaceutico = isset($_POST['idFarmaceutico']) ? $_POST['idFarmaceutico'] : NULL;
            $formaPago = isset($_POST['formaPago']) ? $_POST['formaPago'] : NULL;
            $fecha = getdate();
            $fecha = $fecha["year"] . "-" . $fecha["mon"] . "-" . $fecha["mday"];
            $hora = date("H:i:s");

            $persona = new Persona();
            $p = $persona->leerPorCedula($idPersona);

            $factura = new Factura();
            $factura->setIdPersona($p->getIdPersona());
            $factura->setFecha($fecha);
            $factura->setHora($hora);
            $factura->setFormaPago($formaPago);
            $factura->setIdFarmaceutico($idFarmaceutico);
            $idFactura = $factura->crearFactura($factura);

            foreach ($productos as $p) {
               
                $df = new DetalleFactura();
                $df->setIdFactura($idFactura);
                $df->setIdProducto($p[0]);
                $df->setCantidad($p[1]);
                $df->setIva($p[2]);
                $df->setPrecioVenta($p[3]);
                $df->crearDetalleProducto($df);

                $producto = new Producto();
                $presentacion = $producto->leerPresentacionPorId($p[4]);
                $pro = $producto->leerProductoPorId($p[0]);
                $producto->actualizarUnidades($pro->getIdProducto(), $pro->getUnidades() - ($p[1]*$presentacion[0]["cantidad"]));
            }

            echo json_encode(array("respuesta" => "exito", "idFactura" => $idFactura));
        } catch (Exception $exc) {
            echo json_encode($exc->getTraceAsString());
        }
    }
    
    public function guardarCompra() {
        try {

            $productos = isset($_POST['productos']) ? $_POST['productos'] : NULL;
            $productos = json_decode($productos);
            $idProveedor = isset($_POST['idProveedor']) ? $_POST['idProveedor'] : NULL;
            $formaPago = isset($_POST['formaPago']) ? $_POST['formaPago'] : NULL;
            $fecha = getdate();
            $fecha = $fecha["year"] . "-" . $fecha["mon"] . "-" . $fecha["mday"];
            $hora = date("H:i:s");

            $compra = new Compra();
            $compra->setFecha($fecha);
            $compra->setIdProveedor($idProveedor);
            $idCompra = $compra->crearCompra($compra);

            foreach ($productos as $p) {
               
                $df = new IngresoProducto();
                $df->setIdCompra($idCompra);
                $df->setIdProducto($p[0]);
                $df->setCantidad($p[1]);
                $df->setPrecio($p[2]);
                $df->setFechaVencimiento($p[4]);
                
                $df->crearProducto($df);

                $producto = new Producto();
                $presentacion = $producto->leerPresentacionPorId($p[3]);
                $pro = $producto->leerProductoPorId($p[0]);
                $producto->actualizarUnidades($pro->getIdProducto(), $pro->getUnidades() + ($p[1]*$presentacion[0]["cantidad"]));
            }

            echo json_encode(array("respuesta" => "exito", "idCompra" => $idCompra));
        } catch (Exception $exc) {
            echo json_encode($exc->getTraceAsString());
        }
    }

    public function tablaIngresoProducto() {
        $idProducto = isset($_POST['idProducto']) ? $_POST['idProducto'] : NULL;
        $inicio = isset($_POST['inicio']) ? $_POST['inicio'] : NULL;
        $fin = isset($_POST['fin']) ? $_POST['fin'] : NULL;


        $dp = new DetalleFactura();
        $detalles = $dp->leerPagosPorIdProductoyRangoFecha($idProducto, $inicio, $fin);

        $this->vista->set('detalles', $detalles);
        return $this->vista->imprimir();
    }

    public function tablaIngresoServicio() {
        $idServicio = isset($_POST['idServicio']) ? $_POST['idServicio'] : NULL;
        $inicio = isset($_POST['inicio']) ? $_POST['inicio'] : NULL;
        $fin = isset($_POST['fin']) ? $_POST['fin'] : NULL;


        $ds = new DetalleServicio();
        $detalles = $ds->leerPagosPorIdServicioyRangoFecha($idServicio, $inicio, $fin);

        $this->vista->set('detalles', $detalles);
        return $this->vista->imprimir();
    }

    public function tablaIngresoEmpleado() {

        $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
        $inicio = isset($_POST['inicio']) ? $_POST['inicio'] : NULL;
        $fin = isset($_POST['fin']) ? $_POST['fin'] : NULL;

        $ds = new DetalleFactura();
        $detalles = $ds->leerServiciosPorIdPersonayRangoFecha($idPersona, $inicio, $fin);
        $factura = new Factura();
        $comision = $factura->leerComision($idPersona, $inicio , $fin);
        $this->vista->set('detalles', $detalles);
        $this->vista->set('comision', $comision);
        return $this->vista->imprimir();
    }

    public function tablaIngresoTotal() {

        $inicio = isset($_POST['inicio']) ? $_POST['inicio'] : NULL;
        $fin = isset($_POST['fin']) ? $_POST['fin'] : NULL;

        $factura = new Factura();
        $detalles = $factura->leerFacturaPorRangoFecha($inicio, $fin);
        $this->vista->set('detalles', $detalles);
        $ingreso = new IngresoProducto();
        $detalles2 = $ingreso->leerIngresoPorRangoFecha($inicio, $fin);
        $this->vista->set('detalles2', $detalles2);
        return $this->vista->imprimir();
    }

    public function tablaCargaFecha() {

        $inicio = isset($_POST['inicio']) ? $_POST['inicio'] : NULL;
        $fin = isset($_POST['fin']) ? $_POST['fin'] : NULL;

        $ingreso = new IngresoProducto();
        $detalles = $ingreso->leerIngresoPorRangoFecha($inicio, $fin);
        $this->vista->set('detalles', $detalles);
        return $this->vista->imprimir();
    }
    
    public function tablaCargaProducto() {

        $inicio = isset($_POST['inicio']) ? $_POST['inicio'] : NULL;
        $fin = isset($_POST['fin']) ? $_POST['fin'] : NULL;
        $idProducto = isset($_POST['idProducto']) ? $_POST['idProducto'] : NULL;

        $ingreso = new IngresoProducto();
        $detalles = $ingreso->leerIngresoPorRangoFechaProducto($inicio, $fin, $idProducto);
        $this->vista->set('detalles', $detalles);
        return $this->vista->imprimir();
    }

    public function consultarServiciosPersona() {
        $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;

        $s = new Servicio();
        $servs = $s->leerServicios();
        $servicios = $s->leerServicioPorPersona($idPersona);

        $this->vista->set('servs', $servs);
        $this->vista->set('servicios', $servicios);
        return $this->vista->imprimir();
    }

    public function agregarServiciosEmpleado() {
        try {
            $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
            $servicios = isset($_POST['servicios']) ? $_POST['servicios'] : NULL;
            $servicios = json_decode($servicios);

            $servicio = new Servicio();
            foreach ($servicios as $a) {

                $s = $servicio->leerServicioPorIdServicioyPersona($idPersona, $a);
                if ($s == NULL) {
                    $servicio->crearServicioPersona($a, $idPersona);
                }
            }

            echo json_encode("exito");
        } catch (Exception $exc) {
            echo json_encode($exc->getCode());
        }
    }

    public function configuracionUsuario() {
        try {
            if ($this->verificarSession()) {
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

    public function eliminarServiciosEmpleado() {
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

    public function detallesFactura() {
        $idFactura = isset($_POST['idFactura']) ? $_POST['idFactura'] : NULL;


        $dp = new DetalleFactura();

        $dProductos = $dp->leerProductosPorIdFactura($idFactura);

        $this->vista->set('dp', $dProductos);
        return $this->vista->imprimir();
    }

    public function disponibilidadServidor() {

        $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
        $idServicio = isset($_POST['idServicio']) ? $_POST['idServicio'] : NULL;

        $persona = new Persona();
        $servicio = new Servicio();
        $p = $persona->leerPorId($idPersona);
        $serv = $servicio->leerServicioPorId($idServicio);
        $cita = new Cita();

        $citas = $cita->leerCitaPorId($idPersona);
        $array = array();
        foreach ($citas as $c) {

            $hora = $c["hora"];
            $ah = explode(":", $hora);

            $h = $ah[0];
            $m = $ah[1];
            $s = $ah[2];

            $nm = $m + $c["tiempo"];
            $nh = $h;
            if ($nm > 60) {
                $nm -=60;
                $nh +=1;
            }

            $array[] = array(
                'id' => $c["idCita"],
                'title' => $c["nombre"] . " Para:" . $c["nombres"] . " " . $c["pApellido"],
                'start' => $c["fecha"] . " " . $h . ":" . $m,
                'end' => $c["fecha"] . " " . $nh . ":" . $nm,
                'allDay' => false
            );
        }

        echo json_encode(array("idPersona" => $p->getIdPersona(), "nombre" => $p->getNombres() . " " . $p->getPApellido(), "nombreS" => $serv->getNombre(), "precio" => $serv->getPrecio(), "tiempo" => $serv->getTiempo(), "array" => $array));
    }

    public function guardarCita() {
        try {
            $idPersona = isset($_POST['idPersona']) ? $_POST['idPersona'] : NULL;
            $idServicio = isset($_POST['idServicio']) ? $_POST['idServicio'] : NULL;
            $idCliente = isset($_POST['idCliente']) ? $_POST['idCliente'] : NULL;
            $fecha = isset($_POST['fecha']) ? $_POST['fecha'] : NULL;
            $hora = isset($_POST['hora']) ? $_POST['hora'] : NULL;

            $persona = new Persona();
            $p = $persona->leerPorId($idCliente);

            $servicio = new Servicio();
            $s = $servicio->leerServicioPorId($idServicio);

            $cita = new Cita();
            $cita->setEstado($cita->getReservado());
            $cita->setFecha($fecha);
            $cita->setHora($hora);
            $cita->setIdCliente($idCliente);
            $cita->setIdServicio($idServicio);
            $cita->setIdPersona($idPersona);

            $cita->crearCita($cita);

            echo json_encode(array("mensaje" => "Cita Guardada Correctamente", "cliente" => $p->getNombres() . " " . $p->getPApellido(), "servicio" => $s->getNombre(), "tiempo" => $s->getTiempo()));
        } catch (Exception $exc) {
            echo json_encode(array("mensaje" => "Error al Guardar Cita"));
        }
    }

    public function tablaCitas() {
        try {
            $fecha = isset($_POST['fecha']) ? $_POST['fecha'] : NULL;
            $cita = new Cita();

            $citas = $cita->leerCitasDelDia($fecha);
            $this->vista->set('citas', $citas);
            return $this->vista->imprimir();
        } catch (Exception $exc) {
            echo 'Error de aplicacion: ' . $exc->getMessage();
        }
    }

    public function generarFactura($idFactura) {
        $factura = new Factura();
        $dp = new DetalleFactura();
        $persona = new Persona();
        $f = $factura->leerFacturaPorId($idFactura);
        $detp = $dp->leerProductosPorIdFactura($idFactura);
        $p = $persona->leerPorId($f->getIdPersona());
        $farmaceutico = new Persona();
        $far = $farmaceutico->leerPorId($f->getIdFarmaceutico());
        $this->vista->set('idFactura', $idFactura);
        $this->vista->set('f', $f);
        $this->vista->set('p', $p);
        $this->vista->set('detp', $detp);
        $this->vista->set('far', $far);
        return $this->vista->imprimir();
        
    }


    public function prueba() {

        /*$pdf = new PDF();
        $pdf->AddPage();
        $pdf->SetFont('Arial', '', 12);
        for ($i = 1; $i <= 300; $i++)
            $pdf->Cell(0, 5, "Line $i", 0, 1);
        $pdf->Output();*/
        
        $Archivo_q_se_crea = fopen("ESDPRT001", "w");
        

// aqui comienzo a crear o digamos llenar el archivos con algunos datos fwrite($Archivo_q_se_crea,"================================="); fwrite($Archivo_q_se_crea,"TITULO"); fwrite($Archivo_q_se_crea,"CANTIDAD"); fwrite($Archivo_q_se_crea,"Nombre".$dato ); fwrite($Archivo_q_se_crea," :: AQUI VAN LOS COMANDOS DE LA IMPRESORA ::");
        fwrite($Archivo_q_se_crea," :: ESTO DEPENDE DEL MODELO ::");
        fwrite($Archivo_q_se_crea," :: AQUI TAMBIEN PODEMOS PONER EL COMANDO QUE HABRE LA GABETA DE DINERO O EL CAJON ::");
        fwrite($Archivo_q_se_crea," Gracias por Comprar en VideosconVida.com");
        
        for($i = 0; $i < 300 ; $i++){
            echo "<p>line".$i."</p>";
        }

// ahora cerramos el archivo creado fclose($Archivo_q_se_crea); // cierra el fichero

//y por ultimo mandamos todos los codigos almacenados en el archivo "$Archivo_q_se_crea",(IMPRIMIMOS)
        shell_exec('lpr "ESDPRT001"'); 
        
    }
    
    public function tablaConsulta(){
        try {
            $producto = new Producto();
            $productos = $producto->leerProductos();
            $proveedor = new Proveedor();
            $proveedores = $proveedor->leerProveedores();
            $this->vista->set('productos', $productos);
            $this->vista->set('proveedores', $proveedores);
            return $this->vista->imprimir();
            
        } catch (Exception $ex) {
            echo $ex->getMessage();
        }
        
    }
    
    public function eliminarPedido(){
        
        try {
            $idIngreso = isset($_POST['idIngreso']) ? $_POST['idIngreso'] : NULL;
        
            $ingreso = new IngresoProducto();
            $ingresos = $ingreso->leerIngresoPorId($idIngreso);

            $producto = new Producto();
            $band =0;
            foreach ($ingresos as $in){

               $p = $producto->leerProductoPorId($in["idProducto"]);
               if($p->getUnidades() >= $in["cantidad"]){
                   $band = 1;
                   break;
               }

            }
        
        if($band == 1){
            $ingreso->eliminarProducto($idIngreso);
            $producto->actualizarUnidades($in["idProducto"], $p->getUnidades() - ($in["cantidad"] * $p->getUnidadesProducto()));
            echo json_encode(array("msj"=>"exito"));
        }else{
            echo json_encode(array("msj"=>"imposible"));
        }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
        
    }
    
    public function agregarPresentacion(){
        try {
            
            $idProducto = isset($_POST['idProducto']) ? $_POST['idProducto'] : NULL;
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : NULL;
            $cantidad = isset($_POST['cantidad']) ? $_POST['cantidad'] : NULL;
            
            $producto = new Producto();
            $producto->crearPresentacionProducto($idProducto, $nombre, $cantidad);
            
            echo json_encode("exito");
            
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
        }
        
        public function eliminarPresentacion(){
            
            $idPresentacion = isset($_POST['idPresentacion']) ? $_POST['idPresentacion'] : NULL;
            
            $producto = new Producto();
            
            try {
                
                $producto->eliminarPresentacionProducto($idPresentacion);
                echo json_encode("exito");
                
            } catch (Exception $exc) {
                echo $exc->getTraceAsString();
            }
        }

}