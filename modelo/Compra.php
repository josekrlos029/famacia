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

    private function mapearCompra(Compra $compra, array $props) {
        if (array_key_exists('idCompra', $props)) {
            $compra->setIdCompra($props['idCompra']);
        }
         if (array_key_exists('idProveedor', $props)) {
            $compra->setIdProveedor($props['idProveedor']);
        }
         if (array_key_exists('fecha', $props)) {
            $compra->setFecha($props['fecha']);
        }        
        
    }
      
    private function getParametros(Compra $pro){
              
        $parametros = array(
            ':idProveedor' => $pro->getIdProveedor(),
            ':fecha' => $pro->getFecha()
        );
        return $parametros;
    }

        public function crearCompra(Compra $compra) {
        $sql = "INSERT INTO compra (idProveedor, fecha) VALUES ( :idProveedor, :fecha)";
        $this->__setSql($sql);
        return $this->ejecutar2($this->getParametros($compra));
    }
    
    public function leerCompraPorRangoFecha($inicio,$fin){
        $sql = "SELECT p.nombre, f.idCompra, f.fecha, (SELECT sum( (dp.precio )*dp.cantidad) FROM ingresoproducto dp WHERE dp.idCompra=f.idCompra) as sumaProductos FROM compra f, proveedor p WHERE p.idProveedor = f.idProveedor AND f.fecha BETWEEN '".$inicio."' AND '".$fin."' GROUP BY f.idCompra ORDER BY f.fecha DESC ";
        $this->__setSql($sql);
        return $this->consultar($sql);
        
        }
        
        public function leerCompraPorId($idCompra){
        $sql = "SELECT * FROM compra WHERE idCompra=".$idCompra;
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $compra = NULL;
        foreach ($resultado as $fila) {
            $compra = new Compra();
            $this->mapearCompra($compra, $fila);
            
        }
        return $compra;
        
        }
        
}
