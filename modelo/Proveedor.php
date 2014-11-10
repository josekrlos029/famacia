<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Proveedor
 *
 * @author JoseCarlos
 */
class Proveedor extends Modelo{
    
    public function __construct() {
        parent::__construct();
    }
    
    private $idProveedor;
    private $nombre;
    private $descripcion;
    
    public function getIdProveedor() {
        return $this->idProveedor;
    }

    public function getNombre() {
        return $this->nombre;
    }

    public function getDescripcion() {
        return $this->descripcion;
    }

    public function setIdProveedor($idProveedor) {
        $this->idProveedor = $idProveedor;
    }

    public function setNombre($nombre) {
        $this->nombre = $nombre;
    }

    public function setDescripcion($descripcion) {
        $this->descripcion = $descripcion;
    }

    private function mapearProveedor(Proveedor $proveedor, array $props) {
        if (array_key_exists('idProveedor', $props)) {
            $proveedor->setIdProveedor($props['idProveedor']);
        }
         if (array_key_exists('nombre', $props)) {
            $proveedor->setNombre($props['nombre']);
        }
         if (array_key_exists('descripcion', $props)) {
            $proveedor->setDescripcion($props['descripcion']);
        }
    }
      
    private function getParametros(Proveedor $pro){
              
        $parametros = array(
            ':nombre' => $pro->getNombre(),
            ':descripcion' => $pro->getDescripcion()
        );
        return $parametros;
    }
    
    private function getParametros2(Proveedor $pro){
              
        $parametros = array(
            ':idProveedor' => $pro->getIdProveedor(),
            ':nombre' => $pro->getNombre(),
            ':descripcion' => $pro->getDescripcion()
        );
        return $parametros;
    }

    
    public function leerProveedores() {
        $sql = "SELECT * FROM proveedor";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $proveedores = array();
        foreach ($resultado as $fila) {
            $proveedor = new Proveedor();
            $this->mapearProveedor($proveedor, $fila);
            $proveedores[$proveedor->getIdProveedor()] = $proveedor;
        }
        return $proveedores;
    }
    
    public function leerProveedorPorId($idProveedor) {
        $sql = "SELECT * FROM proveedor WHERE idProveedor=".$idProveedor;
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $proveedor = NULL;
        foreach ($resultado as $fila) {
            $proveedor = new Proveedor();
            $this->mapearProveedor($proveedor, $fila);
            
        }
        return $proveedor;
    }
        
    public function crearProveedor(Proveedor $proveedor) {
        $sql = "INSERT INTO proveedor (nombre, descripcion) VALUES (:nombre, :descripcion)";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros($proveedor));
    }
    public function actualizarProveedor(Proveedor $proveedor) {
           $sql = "UPDATE proveedor SET nombre=:nombre, descripcion=:descripcion WHERE idProveedor=:idProveedor";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros2($proveedor));   
    }
    
}
