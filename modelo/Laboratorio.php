<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Laboratorio
 *
 * @author JoseCarlos
 */
class Laboratorio extends Modelo{
    
    private $idLaboratorio;
    private $nombre;
    private $descripcion;
    
    public function __construct() {
        parent::__construct();
    }
    
    public function getIdLaboratorio() {
        return $this->idLaboratorio;
    }

    public function getNombre() {
        return $this->nombre;
    }

    public function getDescripcion() {
        return $this->descripcion;
    }

    public function setIdLaboratorio($idLaboratorio) {
        $this->idLaboratorio = $idLaboratorio;
    }

    public function setNombre($nombre) {
        $this->nombre = $nombre;
    }

    public function setDescripcion($descripcion) {
        $this->descripcion = $descripcion;
    }

    private function mapearLaboratorio(Laboratorio $laboratorio, array $props) {
        if (array_key_exists('idLaboratorio', $props)) {
            $laboratorio->setIdLaboratorio($props['idLaboratorio']);
        }
         if (array_key_exists('nombre', $props)) {
            $laboratorio->setNombre($props['nombre']);
        }
         if (array_key_exists('descripcion', $props)) {
            $laboratorio->setDescripcion($props['descripcion']);
        }
    }
      
    private function getParametros(Laboratorio $pro){
              
        $parametros = array(
            ':nombre' => $pro->getNombre(),
            ':descripcion' => $pro->getDescripcion()
        );
        return $parametros;
    }
    
    private function getParametros2(Laboratorio $pro){
              
        $parametros = array(
            ':idLaboratorio' => $pro->getIdLaboratorio(),
            ':nombre' => $pro->getNombre(),
            ':descripcion' => $pro->getDescripcion()
        );
        return $parametros;
    }

    
    public function leerLaboratorios() {
        $sql = "SELECT * FROM laboratorio";
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $laboratorioes = array();
        foreach ($resultado as $fila) {
            $laboratorio = new Laboratorio();
            $this->mapearLaboratorio($laboratorio, $fila);
            $laboratorioes[$laboratorio->getIdLaboratorio()] = $laboratorio;
        }
        return $laboratorioes;
    }
        
    public function leerLaboratorioPorId($idLaboratorio) {
        $sql = "SELECT * FROM laboratorio WHERE idLaboratorio=".$idLaboratorio;
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $laboratorio = NULL;
        foreach ($resultado as $fila) {
            $laboratorio = new Laboratorio();
            $this->mapearLaboratorio($laboratorio, $fila);
            
        }
        return $laboratorio;
    }
    public function crearLaboratorio(Laboratorio $laboratorio) {
        $sql = "INSERT INTO laboratorio (nombre, descripcion) VALUES (:nombre, :descripcion)";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros($laboratorio));
    }
    public function actualizarLaboratorio(Laboratorio $laboratorio) {
           $sql = "UPDATE laboratorio SET nombre=:nombre, descripcion=:descripcion WHERE idLaboratorio=:idLaboratorio";
        $this->__setSql($sql);
        $this->ejecutar($this->getParametros2($laboratorio));   
    }
    
}