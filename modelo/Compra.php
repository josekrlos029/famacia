<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Compra
 *
 * @author JoseCarlos
 */
class Compra extends Modelo{
    
    private $idCompra;
    private $idProveedor;
    private $fecha;
    
    public function __construct() {
        parent::__construct();
    }
    
    function getIdCompra() {
        return $this->idCompra;
    }

    function getIdProveedor() {
        return $this->idProveedor;
    }

    function getFecha() {
        return $this->fecha;
    }

    function setIdCompra($idCompra) {
        $this->idCompra = $idCompra;
    }

    function setIdProveedor($idProveedor) {
        $this->idProveedor = $idProveedor;
    }

    function setFecha($fecha) {
        $this->fecha = $fecha;
    }


}
