<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Estante
 *
 * @author JoseCarlos
 */
class Estante extends Modelo{
    
    public function __construct() {
        parent::__construct();
    }
    
    private $idEstante;
    private $nombre;
    private $descripcion;
    
    public function getIdEstante() {
        return $this->idEstante;
    }

    public function getNombre() {
        return $this->nombre;
    }

    public function getDescripcion() {
        return $this->descripcion;
    }

    public function setIdEstante($idEstante) {
        $this->idEstante = $idEstante;
    }

    public function setNombre($nombre) {
        $this->nombre = $nombre;
    }

    public function setDescripcion($descripcion) {
        $this->descripcion = $descripcion;
    }

    private function mapearEstante(Estante $estante, array $props) {
        if (array_key_exists('idEstante', $props)) {
            $estante->setIdEstante($props['idEstante']);
        }
         if (array_key_exists('nombre', $props)) {
            $estante->setNombre($props['nombre']);
        }
         if (array_key_exists('descripcion', $props)) {
            $estante->setDescripcion($props['descripcion']);
        }
    }
      
    private function getParametros(Estante $pro){
              
        $parametros = array(
            ':nombre' => $pro->getNombre(),
            ':descripcion' => $pro->getDescripcion()
        );
        return $parametros;
    }
    
    private function getParametros2(Estante $pro){
              
        $parametros = array(
            ':idEstante' => $pro->getIdEstante(),
            ':nombre' => $pro->getNombre(),
            ':descripcion' => $pro->getDescripcion()
        );
        return $parametros;
    }

    
    public function leerEstantes() {
        $sql = "SELECT * FROM estante";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $estantees = array();
        foreach ($resultado as $fila) {
            $estante = new Estante();
            $this->mapearEstante($estante, $fila);
            $estantees[$estante->getIdEstante()] = $estante;
        }
        return $estantees;
    }
        
    public function crearEstante(Estante $estante) {
        $sql = "INSERT INTO estante (nombre, descripcion) VALUES (:nombre, :descripcion)";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros($estante));
    }
    public function actualizarEstante(Estante $estante) {
           $sql = "UPDATE estante SET nombre=:nombre, descripcion=:descripcion WHERE idEstante=:idEstante";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros2($estante));   
    }
}
