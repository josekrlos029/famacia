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
    private $idProducto;
    private $idCompra;
    private $cantidad;
    private $fechaVencimiento;
    private $precio;
    private $ventas;
    
    public function getIdIngreso() {
        return $this->idIngreso;
    }

    public function getIdProducto() {
        return $this->idProducto;
    }

    public function getCantidad() {
        return $this->cantidad;
    }

    public function getPrecio() {
        return $this->precio;
    }
    
    public function setIdIngreso($idIngreso) {
        $this->idIngreso = $idIngreso;
    }

    public function setIdProducto($idProducto) {
        $this->idProducto = $idProducto;
    }

    public function setCantidad($cantidad) {
        $this->cantidad = $cantidad;
    }

    public function setPrecio($precio) {
        $this->precio = $precio;
    }
    
    function getFechaVencimiento() {
        return $this->fechaVencimiento;
    }

    function setFechaVencimiento($fechaVencimiento) {
        $this->fechaVencimiento = $fechaVencimiento;
    }

    function getIdCompra() {
        return $this->idCompra;
    }

    function setIdCompra($idCompra) {
        $this->idCompra = $idCompra;
    }
    
    function getVentas() {
        return $this->ventas;
    }

    function setVentas($ventas) {
        $this->ventas = $ventas;
    }

            
    private function mapearIngreso(IngresoProducto $producto, array $props) {
        if (array_key_exists('idIngreso', $props)) {
            $producto->setIdIngreso($props['idIngreso']);
        }
        if (array_key_exists('idCompra', $props)) {
            $producto->setIdCompra($props['idCompra']);
        }
        if (array_key_exists('idProducto', $props)) {
            $producto->setIdProducto($props['idProducto']);
        }
         if (array_key_exists('cantidad', $props)) {
            $producto->setCantidad($props['cantidad']);
        }
        if (array_key_exists('fechaVencimiento', $props)) {
            $producto->setFechaVencimiento($props['fechaVencimiento']);
        }
        if (array_key_exists('precio', $props)) {
            $producto->setPrecio($props['precio']);
        }
        if (array_key_exists('ventas', $props)) {
            $producto->setVentas($props['ventas']);
        }
 
 
    }
      
    private function getParametros(IngresoProducto $pro){
              
        $parametros = array(
            ':idCompra' => $pro->getIdCompra(),
            ':idProducto' => $pro->getIdProducto(),
            ':cantidad' => $pro->getCantidad(),
            ':fechaVencimiento' => $pro->getFechaVencimiento(),
            ':precio' => $pro->getPrecio()
        );
        return $parametros;
    }

     
    public function crearProducto(IngresoProducto $producto) {
        $sql = "INSERT INTO ingresoproducto (idCompra, idProducto, cantidad, fechaVencimiento, precio) VALUES (:idCompra, :idProducto, :cantidad, :fechaVencimiento, :precio)";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros($producto));
    }
    
    public function eliminarProducto($idIngreso) {
        $sql = "DELETE FROM ingresoproducto WHERE idIngreso=:idIngreso";
        $this->__setSql($sql);
        $this->ejecutar(array(":idIngreso"=>$idIngreso));
    }

    public function leerIngresoPorId($idIngreso){
        $sql = "SELECT * FROM ingresoproducto ip, producto p WHERE ip.idProducto=p.idProducto AND ip.idIngreso=".$idIngreso;
        $this->__setSql($sql);
        return $this->consultar($sql);
        
        }
        
    public function leerProductosCompra($idCompra){
        $sql = "SELECT *, ip.precio as precioVenta FROM ingresoproducto ip, producto p WHERE ip.idProducto=p.idProducto AND ip.idCompra=".$idCompra;
        $this->__setSql($sql);
        return $this->consultar($sql);

    }
    
    public function leerIngresoPorRangoFecha($inicio,$fin){
        $sql = "SELECT * FROM ingresoproducto ip, producto p WHERE ip.idProducto=p.idProducto AND ip.fecha BETWEEN '".$inicio."' AND '".$fin."' ORDER BY ip.fecha DESC ";
        $this->__setSql($sql);
        return $this->consultar($sql);
        
        }
        
        public function leerIngresoPorRangoFechaProducto($inicio,$fin, $idProducto){
        $sql = "SELECT * FROM ingresoproducto ip, producto p WHERE ip.idProducto=p.idProducto AND p.idProducto=".$idProducto." AND ip.fecha BETWEEN '".$inicio."' AND '".$fin."' ORDER BY ip.fecha DESC ";
        $this->__setSql($sql);
        return $this->consultar($sql);
        
        }
        
}
?>