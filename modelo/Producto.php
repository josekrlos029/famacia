<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Producto
 *
 * @author JoseJimenez  
 */
Class Producto extends Modelo{
    
    public function __construct() {
        parent::__construct();
    }
    
    private $idProducto;
    private $nombre;
    private $descripcion;
    private $contenido;
    private $precio;
    private $fechaVencimiento;
    private $iva;
    private $descuento;
    private $unidades;
    
    public function getIdProducto() {
        return $this->idProducto;
    }

    public function getNombre() {
        return $this->nombre;
    }

    public function getDescripcion() {
        return $this->descripcion;
    }

    public function getContenido() {
        return $this->contenido;
    }

    public function getPrecio() {
        return $this->precio;
    }

    public function getFechaVencimiento() {
        return $this->fechaVencimiento;
    }

    public function getIva() {
        return $this->iva;
    }

    public function getDescuento() {
        return $this->descuento;
    }

    public function getUnidades() {
        return $this->unidades;
    }

    public function setIdProducto($idProducto) {
        $this->idProducto = $idProducto;
    }

    public function setNombre($nombre) {
        $this->nombre = $nombre;
    }

    public function setDescripcion($descripcion) {
        $this->descripcion = $descripcion;
    }

    public function setContenido($contenido) {
        $this->contenido = $contenido;
    }

    public function setPrecio($precio) {
        $this->precio = $precio;
    }

    public function setFechaVencimiento($fechaVencimiento) {
        $this->fechaVencimiento = $fechaVencimiento;
    }

    public function setIva($iva) {
        $this->iva = $iva;
    }

    public function setDescuento($descuento) {
        $this->descuento = $descuento;
    }

    public function setUnidades($unidades) {
        $this->unidades = $unidades;
    }
            
    private function mapearProducto(Producto $producto, array $props) {
        if (array_key_exists('idProducto', $props)) {
            $producto->setIdProducto($props['idProducto']);
        }
         if (array_key_exists('nombre', $props)) {
            $producto->setNombre($props['nombre']);
        }
         if (array_key_exists('descripcion', $props)) {
            $producto->setDescripcion($props['descripcion']);
        }
         if (array_key_exists('precio', $props)) {
            $producto->setPrecio($props['precio']);
        }
         if (array_key_exists('contenido', $props)) {
            $producto->setContenido($props['contenido']);
        }
        if (array_key_exists('iva', $props)) {
            $producto->setIva($props['iva']);
        }
        if (array_key_exists('fechaVencimiento', $props)) {
            $producto->setFechaVencimiento($props['fechaVencimiento']);
        }
        if (array_key_exists('descuento', $props)) {
            $producto->setDescuento($props['descuento']);
        }
        if (array_key_exists('unidades', $props)) {
            $producto->setUnidades($props['unidades']);
        }
 
    }
      
    private function getParametros(Producto $pro){
              
        $parametros = array(
            ':nombre' => $pro->getNombre(),
            ':descripcion' => $pro->getDescripcion(),
            ':contenido' => $pro->getContenido(),
            ':precio' => $pro->getPrecio(),
            ':iva' => $pro->getIva(),
            ':fechaVencimiento' => $pro->getFechaVencimiento(),
            ':descuento' => $pro->getDescuento(),
            ':unidades' => $pro->getUnidades()
        );
        return $parametros;
    }

    
    public function leerProductos() {
        $sql = "SELECT * FROM producto";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $productos = array();
        foreach ($resultado as $fila) {
            $producto = new Producto();
            $this->mapearProducto($producto, $fila);
            $productos[$producto->getIdProducto()] = $producto;
        }
        return $productos;
    }
        
    public function crearProducto(Producto $producto) {
        $sql = "INSERT INTO producto (nombre, descripcion, contenido, precio, iva, fechaVencimiento, descuento, unidades) VALUES (:nombre, :descripcion, :contenido, :precio, :iva, :fechaVencimiento, :descuento, :unidades)";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros($producto));
    }
    public function actualizarProducto(Producto $producto) {
           $sql = "UPDATE producto SET nombre=:nombre, precioVenta=:precioVenta WHERE idProducto=:idProducto";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros($producto));
        
    }
    
    public function leerProductoPorId($idProducto) {
        $sql = "SELECT * FROM producto WHERE idProducto=".$idProducto;
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $producto = NULL;
        foreach ($resultado as $fila) {
            $producto = new Producto();
            $this->mapearProducto($producto, $fila);
            
        }
        return $producto;
    }
    
    public function leerIngresoProducto($idProducto) {
        $sql = "SELECT * FROM ingreso_producto WHERE idProducto=".$idProducto." ORDER BY fechaIngreso DESC";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        
        return $resultado;
    }
    
     public function actualizarUnidades($idProducto, $cantidad) {
           $sql = "UPDATE producto SET unidades=:unidades WHERE idProducto=:idProducto";
        $this->__setSql($sql);
        $this->ejecutar(array(":unidades"=>$cantidad, "idProducto"=>$idProducto));
        
    }
        
}
?>