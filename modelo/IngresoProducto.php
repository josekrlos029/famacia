<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of IngresoProducto
 *
 * @author JuanMi Martinez
 */
Class IngresoProducto extends Modelo{
    
    public function __construct() {
        parent::__construct();
    }
    
    private $idIngreso;
    private $idProveedor;
    private $idProducto;
    private $cantidad;
    private $fecha;
    private $precio;
    
    public function getIdIngreso() {
        return $this->idIngreso;
    }

    public function getIdProveedor() {
        return $this->idProveedor;
    }

    public function getIdProducto() {
        return $this->idProducto;
    }

    public function getCantidad() {
        return $this->cantidad;
    }

    public function getFecha() {
        return $this->fecha;
    }

    public function getPrecio() {
        return $this->precio;
    }
    
    public function setIdIngreso($idIngreso) {
        $this->idIngreso = $idIngreso;
    }

    public function setIdProveedor($idProveedor) {
        $this->idProveedor = $idProveedor;
    }

    public function setIdProducto($idProducto) {
        $this->idProducto = $idProducto;
    }

    public function setCantidad($cantidad) {
        $this->cantidad = $cantidad;
    }

    public function setFecha($fecha) {
        $this->fecha = $fecha;
    }

    public function setPrecio($precio) {
        $this->precio = $precio;
    }

    
    private function mapearPedido(IngresoProducto $producto, array $props) {
        if (array_key_exists('idIngreso', $props)) {
            $producto->setIdIngreso($props['idIngreso']);
        }
        if (array_key_exists('idProveedor', $props)) {
            $producto->setIdProveedor($props['idProveedor']);
        }
        if (array_key_exists('idProducto', $props)) {
            $producto->setIdProducto($props['idProducto']);
        }
         if (array_key_exists('cantidad', $props)) {
            $producto->setCantidad($props['cantidad']);
        }
         if (array_key_exists('fecha', $props)) {
            $producto->setFecha($props['fecha']);
        }
        if (array_key_exists('precio', $props)) {
            $producto->setPrecio($props['precio']);
        }
 
    }
      
    private function getParametros(IngresoProducto $pro){
              
        $parametros = array(
            ':idProveedor' => $pro->getIdProveedor(),
            ':idProducto' => $pro->getIdProducto(),
            ':cantidad' => $pro->getCantidad(),
            ':fecha' => $pro->getFecha(),
            ':precio' => $pro->getPrecio()
        );
        return $parametros;
    }

    
    
public function crearProducto(IngresoProducto $producto) {
        $sql = "INSERT INTO ingreso_producto (idProveedor, idProducto, cantidad, fecha, precio) VALUES (:idProveedor, :idProducto, :cantidad, :fecha, :precio)";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros($producto));
    }

    public function leerIngresoPorRangoFecha($inicio,$fin){
        $sql = "SELECT * FROM ingreso_producto ip, producto p WHERE ip.idProducto=p.idProducto AND ip.fechaIngreso BETWEEN '".$inicio."' AND '".$fin."' ORDER BY ip.fechaIngreso DESC ";
        $this->__setSql($sql);
        return $this->consultar($sql);
        
        }
        
}

?>