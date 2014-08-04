<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Factura
 *
 * @author JuanMi Martinez
 */
Class Factura extends Modelo{
    
    public function __construct() {
        parent::__construct();
    }
    
    private $idFactura;
    private $idPersona;
    private $fecha;
    private $hora;
    private $formaPago;
        
    public function getIdFactura() {
        return $this->idFactura;
    }

    public function getIdPersona() {
        return $this->idPersona;
    }


    public function getFecha() {
        return $this->fecha;
    }
    
    public function getHora() {
        return $this->hora;
    }
    
   public function setIdFactura($idFactura) {
        $this->idFactura = $idFactura;
    }
    
    public function setIdPersona($idPersona) {
        $this->idPersona = $idPersona;
    }

    public function setFecha($fecha) {
        $this->fecha = $fecha;
    }

    public function setHora($hora) {
        $this->hora = $hora;
    }
    
    public function getFormaPago() {
        return $this->formaPago;
    }

    public function setFormaPago($formaPago) {
        $this->formaPago = $formaPago;
    }

    private function mapearFactura(Factura $factura, array $props) {
        if (array_key_exists('idFactura', $props)) {
            $factura->setIdFactura($props['idFactura']);
        }
         if (array_key_exists('idPersona', $props)) {
            $factura->setIdPersona($props['idPersona']);
        }
         if (array_key_exists('fecha', $props)) {
            $factura->setFecha($props['fecha']);
        }        
        if (array_key_exists('hora', $props)) {
            $factura->setHora($props['hora']);
        }
        if (array_key_exists('formaPago', $props)) {
            $factura->setFormaPago($props['formaPago']);
        }
 
    }
      
    private function getParametros(Factura $pro){
              
        $parametros = array(
            ':idPersona' => $pro->getIdPersona(),
            ':fecha' => $pro->getFecha(),
            ':hora' => $pro->getHora(),
            ':formaPago' => $pro->getFormaPago()
        );
        return $parametros;
    }

        public function crearFactura(Factura $factura) {
        $sql = "INSERT INTO factura (idPersona, fecha, hora, formaPago) VALUES ( :idPersona, :fecha, :hora, :formaPago)";
        $this->__setSql($sql);
        return $this->ejecutar2($this->getParametros($factura));
    }
    
    public function leerFacturaPorRangoFecha($inicio,$fin){
        $sql = "SELECT f.idFactura, f.formaPago, f.hora, f.fecha, (SELECT sum(ds.precio) FROM detalles_servicio ds WHERE ds.idFactura=f.idFactura) as sumaServicios, (SELECT sum(dp.precioVenta*dp.cantidad) FROM detalles_producto dp WHERE dp.idFactura=f.idFactura) as sumaProductos FROM factura f WHERE f.fecha BETWEEN '".$inicio."' AND '".$fin."' GROUP BY f.idFactura ORDER BY f.fecha DESC ";
        $this->__setSql($sql);
        return $this->consultar($sql);
        
        }
        
        public function leerFacturaPorId($idFactura){
        $sql = "SELECT * FROM factura WHERE idFactura=".$idFactura;
        $this->__setSql($sql);
        $resultado = $this->consultar($sql);
        $factura = NULL;
        foreach ($resultado as $fila) {
            $factura = new Factura();
            $this->mapearFactura($factura, $fila);
            
        }
        return $factura;
        
        }
        
}

?>